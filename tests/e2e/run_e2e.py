#!/usr/bin/env python3
"""End-to-end test of uboot64.crt on real Ultimate hardware.

Starts the cartridge over the REST API, presses keys on the C64
keyboard matrix (POST /v1/machine:input, firmware 3.15+), reads the text
screen from C64 memory and compares it with golden screen dumps in
golden/ (see screen.py for the format).

The run starts from a fresh first-run state: it backs up UBoot64's
config and slot files from every storage device of the Ultimate (FTP),
deletes them, runs the steps, then deletes whatever the run created and
restores the backups. The backups are kept in build/e2e/backup/<host>/
until the restore has been verified, so an interrupted run can be
repaired with --restore.

Modelled on mandelbrot-upic's tests/e2e (Christian Gleissner, PR #2):
standard library only, steps as a table, --update writes new goldens.

Usage:
    tests/e2e/run_e2e.py --device 192.168.1.148 [--device ...] [--update]
    tests/e2e/run_e2e.py --device 192.168.1.148 --restore
"""

import argparse
import json
import os
import shutil
import sys
import time

import old_configs
from screen import Screen, diff
from ultimate import Ultimate, UltimateError

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
GOLDEN = os.path.join(HERE, "golden")
OUT = os.path.join(REPO, "build", "e2e")

CONFIG_FILES = ("dmbcfg.cfg", "dmbslt.cfg")
# Backups the built-in conversion writes (src/convert.c)
CONVERT_BACKUPS = ("dmbcfg.v1", "dmbslt.v1", "dmbcfg.v2", "dmbslt.v2")
STORAGES = ("sd", "usb0", "usb1", "usb2", "usb3")

# ConfigStruct offsets (include/defines.h)
CFG_TIMEOUTIDX = 99

# Header row 1, columns 20-39: the clock (or version) on every screen.
CLOCK = (1, 20, 40)

F2 = ["left_shift", "f1"]  # shifted function keys are chords
F4 = ["left_shift", "f3"]


class StepFailed(Exception):
    pass


class DeviceRun:
    def __init__(self, host, args):
        self.u = Ultimate(host, args.password)
        self.host = host
        self.args = args
        self.failures = []
        self.made_backups = False
        self.backup_dir = os.path.join(OUT, "backup", host)
        self.capture_dir = os.path.join(OUT, host)

    # --- Output ---------------------------------------------------------

    def log(self, msg):
        print("[%s] %s" % (self.host, msg), flush=True)

    def fail(self, msg):
        self.log("FAIL " + msg)
        self.failures.append(msg)

    # --- Screen ---------------------------------------------------------

    def screen(self):
        return Screen(self.u.read_memory(0x0400, 1000), self.u.read_memory(0xD800, 1000))

    def wait_for(self, check, what, timeout=15.0, stable=True):
        """Wait until check(screen) holds and, if stable is set, the
        screen is the same on two reads in a row (not for a screen with
        a blinking cursor)."""
        deadline = time.monotonic() + timeout
        last = None
        while time.monotonic() < deadline:
            s = self.screen()
            if check(s):
                if not stable or last is not None and s.codes == last.codes and s.colours == last.colours:
                    return s
                last = s
            else:
                last = None
            time.sleep(0.3)
        raise StepFailed("timed out waiting for %s; screen:\n%s" % (what, self.screen().text()))

    def wait_text(self, text, row=None, timeout=15.0):
        return self.wait_for(lambda s: s.contains(text, row), repr(text), timeout)

    def keys(self, keys, text, row=None, timeout=5.0, retry=True, stable=True):
        """Tap keys, then wait for text on the screen."""
        return self.keys_until(keys, lambda s: s.contains(text, row), repr(text), timeout, retry, stable)

    def keys_until(self, keys, check, what, timeout=5.0, retry=True, stable=True):
        """Tap keys, then wait until check(screen) holds. A tap can be
        lost; when retry is set (only for keys that are harmless to repeat while
        they had no effect), the taps are sent once more."""
        self.u.tap_keys(keys)
        time.sleep(0.5)
        try:
            return self.wait_for(check, what, timeout, stable)
        except StepFailed:
            if not retry:
                raise
            self.log("no effect from %s, tapping again" % (keys,))
            self.u.tap_keys(keys)
            time.sleep(0.5)
            return self.wait_for(check, what, timeout, stable)

    def capture(self, name, s, masks=(CLOCK,)):
        dump = s.dump(masks)
        os.makedirs(self.capture_dir, exist_ok=True)
        with open(os.path.join(self.capture_dir, name + ".txt"), "w", encoding="utf-8") as f:
            f.write(dump)
        golden = os.path.join(GOLDEN, name + ".txt")
        if self.args.update:
            os.makedirs(GOLDEN, exist_ok=True)
            with open(golden, "w", encoding="utf-8") as f:
                f.write(dump)
            self.log("updated golden %s" % name)
            return
        if not os.path.exists(golden):
            self.fail("%s: no golden (run with --update)" % name)
            return
        with open(golden, encoding="utf-8") as f:
            expected = f.read()
        if expected == dump:
            self.log("ok %s" % name)
        else:
            self.fail("%s differs from the golden:\n%s" % (name, "\n".join(diff(expected, dump))))

    # --- Config files ---------------------------------------------------

    def storages(self):
        names = self.u.list_dir("/") or []
        return [n for n in names if n.lower() in STORAGES]

    def config_files(self, names=CONFIG_FILES):
        """[(storage, file name as listed)] of UBoot64's files on the device."""
        found = []
        for st in self.storages():
            for name in self.u.list_dir("/" + st) or []:
                if name.lower() in names:
                    found.append((st, name))
        return found

    def first_storage(self):
        """The storage UBoot64 creates its files on: SD first, then USB."""
        st = self.storages()
        sd = [n for n in st if n.lower() == "sd"]
        return (sd or st)[0]

    def backup(self):
        manifest = os.path.join(self.backup_dir, "manifest.json")
        if os.path.exists(manifest):
            raise StepFailed("a backup from an interrupted run exists in %s; "
                             "run with --restore first" % self.backup_dir)
        os.makedirs(self.backup_dir, exist_ok=True)
        files = self.config_files()
        for st, name in files:
            data = self.u.read_file("/%s/%s" % (st, name))
            with open(os.path.join(self.backup_dir, "%s_%s" % (st, name)), "wb") as f:
                f.write(data)
            self.log("backed up /%s/%s (%d bytes)" % (st, name, len(data)))
        with open(manifest, "w") as f:
            json.dump([list(x) for x in files], f)
        for st, name in files:
            self.u.delete_file("/%s/%s" % (st, name))

    def restore(self):
        manifest = os.path.join(self.backup_dir, "manifest.json")
        if not os.path.exists(manifest):
            self.log("nothing to restore")
            return
        with open(manifest) as f:
            files = [tuple(x) for x in json.load(f)]
        created = self.config_files(CONVERT_BACKUPS) if self.made_backups else []
        for st, name in self.config_files() + created:
            self.u.delete_file("/%s/%s" % (st, name))
        for st, name in files:
            with open(os.path.join(self.backup_dir, "%s_%s" % (st, name)), "rb") as f:
                data = f.read()
            path = "/%s/%s" % (st, name)
            self.u.write_file(path, data)
            if self.u.read_file(path) != data:
                raise StepFailed("restore of %s did not verify; backup kept in %s" % (path, self.backup_dir))
            self.log("restored %s" % path)
        shutil.rmtree(self.backup_dir)

    def read_config(self):
        files = [(st, n) for st, n in self.config_files() if n.lower() == "dmbcfg.cfg"]
        if not files:
            raise StepFailed("no config file on the device")
        return self.u.read_file("/%s/%s" % files[0])

    # --- Steps ----------------------------------------------------------

    def start(self, until="Make your choice.", row=24):
        # Blank the screen first: run_crt returns before the machine has
        # reset, and text still on screen from the previous start (a menu,
        # a prompt) would be taken for the new one, with keys going to the
        # old instance.
        self.u.write_memory(0x0400, b"\x20" * 1000)
        with open(self.args.crt, "rb") as f:
            self.u.run_crt(f.read())
        return self.wait_text(until, row=row, timeout=40.0)

    def convert_steps(self):
        """Built-in conversion of old config/slot files (GitHub #23):
        declined for v2 (files untouched), then accepted for v1 and v2."""
        st = self.first_storage()
        if self.config_files(CONVERT_BACKUPS):
            raise StepFailed("backup files %s already exist; not touching them"
                             % self.config_files(CONVERT_BACKUPS))
        self.made_backups = True  # from here on the restore may remove them

        def put(cfg, slots):
            for _, n in self.config_files():
                self.u.delete_file("/%s/%s" % (st, n))
            self.u.write_file("/%s/DMBCFG.CFG" % st, cfg)
            self.u.write_file("/%s/DMBSLT.CFG" % st, slots)

        def prompt_masks(s):
            # The storage path shifts the rest of its line
            row = next(y for y in range(25) if "have the old format" in s.row(y))
            return [CLOCK, (row, 0, 40)]

        # Declined: exits to BASIC, nothing written
        # (The v2 test config has light blue text, to check that colours
        # carry over: see old_configs.py)
        cfg, slots = old_configs.v2_files()
        put(cfg, slots)
        s = self.start(until="Convert? Y/N", row=None)
        self.capture("convert-v2-prompt", s, prompt_masks(s))
        self.keys_until(["n"], lambda s: s.contains("Not converted."), "'Not converted.'", stable=False)
        if (self.u.read_file("/%s/DMBCFG.CFG" % st) != cfg or self.u.read_file("/%s/DMBSLT.CFG" % st) != slots
                or self.config_files(CONVERT_BACKUPS)):
            self.fail("convert declined: the files were changed")
        else:
            self.log("ok convert declined, files untouched")

        for version, files in ((1, old_configs.v1_files()), (2, old_configs.v2_files())):
            cfg, slots = files
            put(cfg, slots)
            s = self.start(until="Convert? Y/N", row=None)
            if version == 1:
                self.capture("convert-v1-prompt", s, prompt_masks(s))
            # Wait for the echoed answer first (PETSCII 'Y' shows as "y" in
            # the lower case character set): until then a lost tap is
            # harmless to repeat
            self.keys_until(["y"], lambda s: s.contains("Convert? Y/N y") or s.contains("Converting."),
                            "the answer Y", timeout=3.0, stable=False)
            s = self.wait_text("Press a key to continue.", timeout=60.0)
            self.capture("convert-v%d-done" % version, s, prompt_masks(s))
            s = self.keys(["space"], "Make your choice.", row=24, timeout=30.0)
            self.capture("menu-converted-v%d" % version, s)
            new_cfg = self.u.read_file("/%s/DMBCFG.CFG" % st)
            new_slots = self.u.read_file("/%s/DMBSLT.CFG" % st)
            problems = old_configs.check_converted(version, new_cfg, new_slots)
            for name, original in (("DMBCFG.V%d" % version, cfg), ("DMBSLT.V%d" % version, slots)):
                if self.u.read_file("/%s/%s" % (st, name)) != original:
                    problems.append("backup %s differs from the original" % name)
            if problems:
                self.fail("convert v%d:\n  %s" % (version, "\n  ".join(problems)))
            else:
                self.log("ok convert v%d: files and backups checked" % version)
            for _, n in self.config_files(CONVERT_BACKUPS):
                self.u.delete_file("/%s/%s" % (st, n))
        for _, n in self.config_files():
            self.u.delete_file("/%s/%s" % (st, n))

    def run_steps(self):
        # First start: no config or slot files, so defaults are written.
        s = self.start()
        self.capture("menu-empty", s)
        # The FTP listing can lag behind the files UBoot64 just wrote.
        for _ in range(10):
            files = sorted(n.lower() for _, n in self.config_files())
            if files == sorted(CONFIG_FILES):
                break
            time.sleep(1.0)
        else:
            self.fail("first start wrote %s, expected %s" % (files, list(CONFIG_FILES)))

        # F2: splash screen (bitmap), any key, then the info screen.
        self.keys_until([F2], lambda s: not s.contains("Make your choice.", 24), "the splash screen")
        time.sleep(1.0)
        s = self.keys(["space"], "Press a key to continue.")
        version_row = next(y for y in range(25) if s.row(y).startswith("Version: "))
        hardware_row = next(y for y in range(25) if s.row(y).startswith("Hardware: "))
        product = s.row(hardware_row)[10:].rstrip()
        if product.lower() != self.product.lower():
            self.fail("info: hardware %r, the REST API says %r" % (product, self.product))
        self.capture("info", s, [CLOCK, (version_row, 9, 40), (hardware_row, 10, 40)])
        self.keys(["space"], "Make your choice.", row=24)

        # F3 with no slots, and back without changes.
        s = self.keys(["f3"], "Edit/Re-order/Delete", row=1)
        self.capture("edit-empty", s)
        self.keys(["f7"], "Make your choice.", row=24)

        # F5: configuration screen with the defaults.
        s = self.keys(["f5"], "Back to main menu")
        self.capture("config-defaults", s)

        # F4 cycles the auto-boot timeout; F7 saves the config.
        before = self.read_config()
        s = self.keys([F4], "Auto-boot timeout: ", retry=False)
        s = self.wait_for(lambda s: not s.contains("Auto-boot timeout: Off"), "a changed timeout", 5.0)
        self.capture("config-timeout", s)
        self.keys(["f7"], "Make your choice.", row=24, timeout=15.0)
        after = self.read_config()
        if before[CFG_TIMEOUTIDX] != 0 or after[CFG_TIMEOUTIDX] != 1:
            self.fail("timeoutidx in the config file: %d before, %d after (expected 0, 1)"
                      % (before[CFG_TIMEOUTIDX], after[CFG_TIMEOUTIDX]))
        else:
            self.log("ok config file saved (timeoutidx 1)")

        # Second start reads the saved config: same configuration screen.
        self.start()
        s = self.keys(["f5"], "Back to main menu")
        self.capture("config-timeout", s)
        self.keys(["f7"], "Make your choice.", row=24)

        self.convert_steps()

        # F7 on the main menu quits to BASIC (fc3_exit(): BASIC start
        # screen). The kernal's upper case PETSCII letters are screen
        # codes 1-26, shown as a-z by screen.py.
        self.keys(["f7"], "basic bytes free", timeout=10.0, stable=False)
        self.log("ok quit to BASIC")

    def run(self):
        info = self.u.info()
        self.product = info.get("product", "")
        self.log("%s, firmware %s" % (info.get("product"), info.get("firmware_version")))
        if self.args.restore:
            self.restore()
            return
        self.backup()
        try:
            self.run_steps()
        except (StepFailed, UltimateError) as e:
            self.fail(str(e))
        finally:
            try:
                self.restore()
            except (StepFailed, UltimateError) as e:
                self.fail("RESTORE FAILED: %s" % e)
            try:
                self.u.reset()
            except UltimateError:
                pass


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--device", action="append", required=True, help="Ultimate host name or IP (repeatable)")
    p.add_argument("--crt", default=os.path.join(REPO, "build", "uboot64.crt"))
    p.add_argument("--update", action="store_true", help="write the captures as the new goldens")
    p.add_argument("--restore", action="store_true", help="only restore the backup of an interrupted run")
    p.add_argument("--password", default=os.environ.get("ULTIMATE_PASSWORD"))
    args = p.parse_args()

    failed = []
    for host in args.device:
        run = DeviceRun(host, args)
        try:
            run.run()
        except (StepFailed, UltimateError) as e:
            run.fail(str(e))
        if run.failures:
            failed.append(host)

    print()
    for host in args.device:
        print("%-20s %s" % (host, "FAIL" if host in failed else "ok"))
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
