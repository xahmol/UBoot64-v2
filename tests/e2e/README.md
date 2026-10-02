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
| `config-timeout` | F4 | Auto-boot timeout cycled; F7 saves, the file is checked (`timeoutidx` = 1) |
| `config-timeout` | (restart), F5 | The saved config is read back on the next start |
| | F7 | Quit to BASIC (BASIC start screen) |
