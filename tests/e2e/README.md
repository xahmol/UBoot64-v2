# End-to-end test on real hardware

`make e2e` starts `build/uboot64.crt` on one or more real Ultimate
devices, presses keys on the C64 keyboard matrix, reads the text screen
from C64 memory and compares it with the golden screen dumps in
`golden/`. Python 3 standard library only. Modelled on mandelbrot-upic's
`tests/e2e` (Christian Gleissner).

## Requirements

- Ultimate firmware 3.15 or later (keyboard input API
  `POST /v1/machine:input`, `runners:run_crt`, `machine:readmem`) and FTP
  enabled.
- The devices in `.env`, separated by spaces:
  `E2E_DEVICES = 192.168.1.148 192.168.1.195`
- With a network password, set `ULTIMATE_PASSWORD` in the environment.

## Your config is backed up

Each run starts from a fresh first-run state. Before it starts, the run
copies `DMBCFG.CFG` and `DMBSLT.CFG` from every storage device of the
Ultimate (`/SD`, `/USB0`..`/USB3`) to `build/e2e/backup/<host>/` and
deletes them on the device. Afterwards it deletes the files the run
created, writes the backups back, reads them back to verify, and only
then removes the local backup. If a run is interrupted, the backup stays
and the next run refuses to start; `make e2e-restore` puts it back.

## Running

```
make e2e           # compare with the goldens
make e2e-update    # write the captures as the new goldens
make e2e-restore   # restore the backup of an interrupted run
tests/e2e/run_e2e.py --device 192.168.1.148
```

Every capture is written to `build/e2e/<host>/<name>.txt`. On a
mismatch the run prints the rows that differ.

## Test data for the conversion

`old_configs.py` generates synthetic v1, v2 and v3 config/slot sets (a
program slot, a REU slot and a mount slot), so no personal slot data is
in the repository, and checks the converted files. The steps write them
to the storage UBoot64 uses (SD first) and remove them, and the
`.V1`/`.V2`/`.V3` backups, afterwards. Existing files with those backup
names (a real conversion keeps them) are backed up and restored together
with the config and slot files.

## Lost and slow key taps

A tapped key can be lost. Each key step waits for its expected screen;
if it doesn't come and the screen is still exactly as before the tap
(clock row aside), the tap is sent once more. If the screen did change,
the key arrived and the machine is just slow (seen on the Ultimate 64
Elite), so the step waits longer instead of pressing the key twice.

## Timeouts

When an expected screen doesn't come, the failure message says whether
the C64 still runs interrupts (jiffy clock at `$A0`), and gives the Kernal
status (`$90`) and the IEC lines (`$DD00`). Saved as
`build/e2e/<host>/timeout-<time>.bin`: `$0000-$01FF` (zero page, stack),
the CIA 1 and 2 registers (16 bytes each) and `$7F00-$7FFF` (Oscar64's
function locals).

## Golden format

`screen.py`: three 25-line blocks of 40 characters: `[text]` (the
screen as shown with the lower case character set; codes without an
ASCII character map to U+2500 + code), `[reverse]` (`#` = reverse video)
and `[colour]` (colour RAM, one hex digit; `.` for a blank cell, whose
colour isn't visible and depends on the screen before). Dynamic fields are masked as
`~`: the clock in the header (row 1, columns 20-39) on every screen, and
the version and hardware lines on the info screen. The hardware line is
checked against the product name from the REST API instead.

## Steps

| Capture | Keys | Covers |
|---|---|---|
| `menu-empty` | (start) | First start without config: defaults written, both files created |
| `info` | F2, SPACE | Splash screen, then the info screen |
| `edit-empty` | F3 | Edit/re-order/delete with no slots; F7 back |
| `config-defaults` | F5 | Configuration screen with the defaults |
| `config-timeout` | F4, C | Auto-boot timeout cycled and program settings files switched off; F7 saves, the file is checked (`timeoutidx` = 1, `apply_cfg` = 0) |
| `config-timeout` | (restart), F5 | The saved config is read back on the next start |
| `convert-v2-prompt` | (start with a v2 set), N | Built-in conversion (#23) declined: exits to BASIC, files and no backups written |
| `convert-v1-prompt`, `convert-v1-done`, `menu-converted-v1` | (start with a v1 set), Y, SPACE | v1 set converted; every converted field and the backups `DMBCFG.V1`/`DMBSLT.V1` checked byte for byte |
| `convert-v2-done`, `menu-converted-v2` | (start with a v2 set), Y, SPACE | The same for v2, including the colours (the v2 test config has light blue text on purpose) |
| `convert-v3-done`, `menu-converted-v3` | (start with a v3 set), Y, SPACE | The same for v3 (format v4 adds `settings`; v3 keeps its SoftIEC partition) |
| `edit-after-changes`, `menu-after-edit` | F3: F1 0 Y (DEL…, "renamed", RETURN), F6 1, F5 2 Y, F7 | Slot editing on the converted slots: rename, default, delete; checked in the saved slot file |
| | (slot file with a mount-and-run slot), 0 | Boots a generated D64 (`d64.py`, `10 PRINT"E2E BOOT OK"`) from `/<storage>/E2ETEST/` on drive A; expects the program's output. Drive A's mode and image are restored afterwards |
| `browse-d64` | F1, cursor down to `E2ETEST`, RETURN, RETURN, F7 | File browser (UCI mode): enter a folder and a D64 (listed by the firmware), back to the menu |
| | (`E2E.CFG`, `E2E.USR` next to the test D64), 0 | Program settings files (#22): `.cfg` applied, `.usr` fallback, an invalid value shows "Errors in" and changes nothing. Then `OWN.CFG` picked with S in the browser for slot 0 (format v4), which must win over `E2E.CFG`; then S in IEC mode on the SoftIEC drive (`own.cfg` as SEQ, `x` as USR → `x.usr`; skipped when the SoftIEC drive is off; switches on F8 so F3 opens the whole file system, and presses ↑ first, since the drive keeps its directory between starts); then a 40 KB `.prg` added with RETURN in UCI mode and booted from its Ultimate path via the REU, with its `.cfg`; then the baseline file `uboot64/uboot64.cfg` on the config's storage, applied at start-up. The setting is the unused printer's ink density, read back over REST and restored |
| | (v1 config + already converted slots), Y | An interrupted conversion: config converted, slots kept and not backed up again |
| | `uboot_upd12.prg`, `uboot_upd23.prg` | The standalone upgraders on the same v1/v2 sets, same field checks |
| | F7 | Quit to BASIC (BASIC start screen) |

## Screenshots for README.md

`screenshot.py` drives UBoot64 to a screen and saves a frame of the
Ultimate's VIC video stream as `Screenshots/UBoot64 - <name>.png`, in the
style of the existing OBS captures (1920x1080, the frame scaled to 1080
lines, Ultimate 64 default palette). The stream code is Christian
Gleissner's `VicStream` from mandelbrot-upic; on WSL2 it needs the
firewall rules from mandelbrot-upic's `tests/e2e/README.md`.

```
tests/e2e/screenshot.py --device 192.168.1.148 info convert
```

`info` is the F2 screen; `convert` shows the conversion prompt and
result for a synthetic v1 set (the user's files are backed up and
restored). Add a function per new screen.

