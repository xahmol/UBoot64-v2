#!/usr/bin/env python3
"""Screenshots of UBoot64 screens for README.md, from real hardware.

Drives UBoot64 on an Ultimate to a screen, takes one frame from the
Ultimate's VIC video stream (ultimate.VicStream, multicast UDP; see
mandelbrot-upic's tests/e2e/README.md for the firewall rules on WSL2) and
writes it like the existing OBS captures in Screenshots/: the 384x272
frame scaled to 1080 lines, centred on a black 1920x1080 image, in the
Ultimate 64's default palette.

Usage:
    tests/e2e/screenshot.py --device 192.168.1.148 info convert

Shots:
    startup  the start-up messages ("Startup")
    info     F2 information screen (with the Hardware line)
    config   F5 configuration screen ("NTP menu")
    browser  F1 file browser, UCI mode ("filebrowser")
    convert  the built-in conversion (#23) of a synthetic v1 set: the
             prompt and the result

The user's config and slot files are backed up first and restored
afterwards, like in the E2E test, so the shots show fresh defaults.
"""

import argparse
import os
import sys
import time

from PIL import Image

import old_configs
from run_e2e import DeviceRun, F2, REPO
from ultimate import UltimateError

SHOTS = os.path.join(REPO, "Screenshots")

# Ultimate 64 default palette (matches the colours of the existing captures)
PALETTE = [
    (0x00, 0x00, 0x00), (0xEF, 0xEF, 0xEF), (0x8D, 0x2F, 0x34), (0x6A, 0xD4, 0xCD),
    (0x98, 0x35, 0xA4), (0x4C, 0xB4, 0x42), (0x2C, 0x29, 0xB1), (0xEF, 0xEF, 0x5D),
    (0x98, 0x4E, 0x20), (0x5B, 0x38, 0x00), (0xD1, 0x67, 0x6D), (0x4A, 0x4A, 0x4A),
    (0x7B, 0x7B, 0x7B), (0x9F, 0xEF, 0x93), (0x6D, 0x6A, 0xEF), (0xB2, 0xB2, 0xB2),
]


def grab(run, name, port=11000):
    """One stable frame from the video stream, saved as Screenshots/UBoot64 - <name>.png."""
    with run.u.video_stream(port) as stream:
        frames = stream.frames(3)
    rows = frames[-1]
    small = Image.new("P", (len(rows[0]), len(rows)))
    small.putpalette([c for rgb in PALETTE for c in rgb])
    small.putdata([p for row in rows for p in row])
    scale = 1080 / small.height
    big = small.convert("RGB").resize((round(small.width * scale), 1080), Image.BILINEAR)
    canvas = Image.new("RGB", (1920, 1080))
    canvas.paste(big, ((1920 - big.width) // 2, 0))
    path = os.path.join(SHOTS, "UBoot64 - %s.png" % name)
    canvas.save(path)
    run.log("saved %s" % os.path.relpath(path, REPO))


def shot_info(run):
    run.start()
    run.keys_until([F2], lambda s: not s.contains("Make your choice.", 24), "the splash screen")
    time.sleep(1.0)
    run.keys(["space"], "Press a key to continue.")
    time.sleep(1.0)
    grab(run, "Info")
    run.keys(["space"], "Make your choice.", row=24)


def shot_startup(run):
    """The start-up messages, held with "Show messages + wait": the fresh
    config gets verbose = 2 (ConfigStruct offset 87), then UBoot64 starts
    again."""
    run.start()
    st = run.first_storage()
    cfg = bytearray(run.u.read_file("/%s/DMBCFG.CFG" % st))
    cfg[87] = 2  # VERBOSE_WAIT
    run.u.write_file("/%s/DMBCFG.CFG" % st, bytes(cfg))
    run.start(until="Press a key to continue.", row=None)
    time.sleep(1.0)
    grab(run, "Startup")
    run.keys(["space"], "Make your choice.", row=24, timeout=20.0)
    cfg[87] = 1
    run.u.write_file("/%s/DMBCFG.CFG" % st, bytes(cfg))


def shot_config(run):
    """F5 configuration screen (with the C line), saved as 'NTP menu'."""
    run.start()
    run.keys(["f5"], "Back to main menu")
    time.sleep(1.0)
    grab(run, "NTP menu")
    run.keys(["f7"], "Make your choice.", row=24)


def shot_browser(run):
    """F1 file browser in UCI mode (side panel with S), saved as 'filebrowser'."""
    run.start()
    run.keys(["f1"], "Filebrowser", row=1, timeout=15.0)
    run.wait_text("[UCI file system]", row=3, timeout=10.0)
    time.sleep(1.5)
    grab(run, "filebrowser")
    run.keys(["f7"], "Make your choice.", row=24, timeout=15.0)


def shot_convert(run):
    if True:
        st = run.first_storage()
        cfg, slots = old_configs.v1_files()
        run.u.write_file("/%s/DMBCFG.CFG" % st, cfg)
        run.u.write_file("/%s/DMBSLT.CFG" % st, slots)
        run.start(until="Convert? Y/N", row=None)
        time.sleep(1.0)
        grab(run, "Convert prompt")
        run.keys_until(["y"], lambda s: s.contains("Convert? Y/N y") or s.contains("Converting."),
                       "the answer Y", timeout=3.0, stable=False)
        run.wait_text("Press a key to continue.", timeout=60.0)
        time.sleep(1.0)
        grab(run, "Convert done")
        run.keys(["space"], "Make your choice.", row=24, timeout=30.0)
        for _, n in run.config_files() + run.config_files(("dmbcfg.v1", "dmbslt.v1")):
            run.u.delete_file("/%s/%s" % (st, n))


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--device", required=True)
    p.add_argument("--crt", default=os.path.join(REPO, "build", "uboot64.crt"))
    p.add_argument("--password", default=os.environ.get("ULTIMATE_PASSWORD"))
    p.add_argument("shots", nargs="+", choices=["startup", "info", "config", "browser", "convert"])
    args = p.parse_args()
    args.update = args.restore = False
    run = DeviceRun(args.device, args)
    # The user's config and slot files are backed up and restored, as in
    # the E2E test: the shots run on fresh defaults
    run.backup()
    try:
        for shot in args.shots:
            {"startup": shot_startup, "info": shot_info, "config": shot_config, "browser": shot_browser,
             "convert": shot_convert}[shot](run)
    except Exception as e:
        run.fail("%s: %s" % (type(e).__name__, e))
    finally:
        run.restore()
    return 1 if run.failures else 0


if __name__ == "__main__":
    sys.exit(main())
