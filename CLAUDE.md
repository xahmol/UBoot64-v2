# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.
Full technical documentation is in **[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)**.

## Build Commands

```bash
make all      # Build uboot64.crt, uboot_upd12.prg, and distribution ZIP
make clean    # Remove build artifacts
make deploy   # Deploy to the U64 via FTP (ULTIP1 in the gitignored .env)
```

**Compiler:** Oscar64 at `/home/xahmol/oscar64/bin/oscar64` — single-pass, no linker.
Oscar64 pulls in all source files transitively via `#pragma compile("file.c")` in headers.

**Outputs:** `build/uboot64.crt` (main cartridge), `build/uboot_upd12.prg` (v1→v3) and `build/uboot_upd23.prg` (v2→v3) upgrade tools (the cartridge converts old files itself since v3.1.0, `src/convert.c`; keep both in step with it).

There is no automated test suite; testing is on the real U64 through c64bridge (below).

## Hardware testing via c64bridge

- Test machines (since 2026-10-02), both firmware 3.15a, IPs in the gitignored `.env`:
  - `ULTIP1`: Ultimate 64-II, **SD card only** (`ULTUSB1 = sd`); holds the user's config and slots. c64bridge backend **`c64u`** points at it (`~/.c64bridge.json`; backend `u2` is DMBoot's C128, don't use it here).
  - `ULTIP2`: Ultimate 64 Elite, **USB stick, no SD card** (the stick moved here from the U64-II, with GEOS etc.). Since 2026-10-02 its `/usb0/` has a copy of the user's config and slots from the U64-II (GEOS slot boots there); the old v2 set is kept as `DMBCFG.CFGv2`/`DMBSLT.CFGv2` (a v2 test set for `uboot_upd23`).
- `make deploy` uploads to both, into `<storage>/Dev/build/` (wput keeps the `build/` prefix). Start with `c64_program run_crt /sd/Dev/build/uboot64.crt` (U64-II), or over REST: `POST /v1/runners:run_crt` with the file as body (what the E2E suite does).
- **E2E suite**: `make e2e` on both machines (`tests/e2e/README.md`), about 1 minute per machine, 3 of 3 runs clean on 2026-10-02. It backs up and restores the config and slot files; after an interrupted run use `make e2e-restore`. Run it after every change; add steps for new features. Lessons: `run_crt` returns before the reset, so wait for the old screen to go first (keys sent before that go to the old instance); don't wait for a "stable" screen when a cursor blinks; F2/F4/F6/F8 are chords (`["left_shift", "f1"]`). When another program (e.g. GEOS) is running, `run_crt` may not take over: follow with `c64_system reset`, which restarts the mounted cartridge.
- Read the screen with `c64_memory read_screen` / `wait_for_text`. UBoot64 uses the lowercase charset, so c64bridge shows letters case-inverted ("mAKE YOUR CHOICE"); match with `caseInsensitive` or the inverted text. Wait for the screen to settle before sending a key (keys sent during a redraw are lost). `c64_input key` takes `F1`..`F8`, `RETURN`, `DOWN`, `LEFT`, `DEL`, `" "` (not `SPACE`); for Y/N prompts send uppercase `Y`/`N` (lowercase `y` gives a different PETSCII code). There is no token for SHIFT-DEL (INST): write the PETSCII code into the keyboard buffer (`c64_memory write $0277 94`, then `$00C6` = count).
- Config and slots are on the U64-II's SD card (`/sd/DMBCFG.CFG`, `/sd/DMBSLT.CFG`) and can be read and patched over FTP (`curl ftp://$ULTIP1/sd/...`, upload with `curl -T`). `ConfigStruct` offsets: timeon 1, host 2, secondsfromutc 83, verbose 87, colors 88, timeoutidx 99, iec_root_partition 100, host2 101, host3 182 (263 bytes). `SlotStruct` is 1360 bytes (menu at 257, reu_image 420, reu_path 471, command 730, image_a_path 731). Back up a file before patching it, and restore it after a test.
- Test disk: `python3 tests/make_test_d64.py` builds `ubtest.d64` (locked files, invalid type, big block counts). Mount it over the Ultimate REST API: `curl -X PUT "http://$ULTIP1/v1/drives/a:set_mode?mode=1541"`, then `.../v1/drives/a:mount?image=/usb0/Dev/ubtest.d64` (the stick is on `ULTIP2` now; on the U64-II upload it to `/sd/Dev/`). Afterwards restore drive A (the user's was 1581 mode with `/usb0/Geos/gdos64.d81`; on the U64-II it is an empty 1541 since the stick moved). A raw directory can be checked in BASIC: `LOAD"$",8`, then `c64_memory save_memory $0801`..(`$2D/$2E` - 1) and decode the BASIC lines.
- The user's config has a default slot (GEOS, REU preload). Its auto-boot timeout was set to off (2026-09-28) so tests don't start GEOS; turn it back on in F5 → F4 when wanted.
- Keyboard-matrix input (firmware 3.15+): `c64_input keyboard` with `inputs` such as `["left_shift", "inst_del"]` (SHIFT-DEL/INST), `run_stop`, `restore`, `commodore` and chords, `transition: tap`; replaces the keyboard-buffer workaround above. A tap holds the key about 60 ms: wait about 0.5 s before reading the result.
- `c64_graphics capture_frame` works from WSL2 (mirrored networking plus Hyper-V firewall rules on this PC; close OBS first) for bitmap/colour screens. `c64_system read_menu_screen` reads the Ultimate menu.

## Oscar64 6502 Constraints

- Prefer `unsigned` arithmetic and `char`/`unsigned char` over wider types
- Avoid recursion and function pointers — they disable zero-page/register optimization
- No float (`-dNOFLOAT`); hardware stack is only 256 bytes
- Cross-bank calls use `fc3_call(bank, function)` — see docs/ARCHITECTURE.md §5

## Quick Module Reference

| File | Bank | Role |
|------|------|------|
| `src/main.c` | 0 | Entry point, globals, event loop |
| `src/core.c` | 0 | Utilities, screen, IEC, execution |
| `src/fileio.c` | 0 | Config/slot persistence via REU ↔ UCI |
| `src/petscii_ascii.c` | 0 | ASCII↔PETSCII conversion |
| `src/slotmenu.c` | 1 | Boot menu, slot editing, boot execution |
| `src/time.c` | 1 | NTP sync, colour editor, config UI |
| `src/splash.c` | 1 | Startup splash screen |
| `src/filebrowse.c` | 2 | File browser, REU-backed directory listing |
| `src/convert.c` | 3 | Built-in conversion of v1/v2 config and slot files at start-up (#23) |
| `src/uboot_upd12.c` | — | Standalone v1→v2 config upgrade utility |
| `lib/ultimate-uci-oscar64/` | 0 | UCI library (git submodule, never edit here; manual in its `docs/UCILIB_MANUAL.md`) |
| `include/fc3.c/h` | 0 | FC3 cartridge banking control |
| `include/defines.h` | — | All constants, structs, extern globals |

## Key Conventions

- `strncpy` is always followed by explicit null-termination of the last byte
- UCI filenames arrive as ASCII; convert to PETSCII with `AscToPet()` at display boundaries
- REU addresses in `DirMeta.next/prev` are raw 32-bit byte offsets, not CPU pointers
- Slot data lives in REU starting at address 0; directory listing follows after slot data
- UCI transfers are limited to 500 bytes per chunk (`SAVE_BUF_SIZE`) due to 512-byte queue cap

## Verification status (v3.1.0, branch `v3.1.0-fixes`)

Everything from the DMBoot v5 port and the v3.1.0 fix round was tested on the U64 (firmware 3.15a) via c64bridge on 2026-09-28: the `textInput()` overflow fix, the completed and malloc-free UCI library (mounts, REU preload, UCI listing, config/slot save and load, NTP "00,OK"), GitHub #4-#18, three NTP servers and start-up modes, SoftIEC host paths / root-partition slots / image tracking, NTP server editing (F5 → F5: RUN/STOP keeps a server, also after typing in it; RETURN changes it; only that field is saved), and both upgraders (`uboot_upd23` on a v2 file set, `uboot_upd12` on a v1 file set: config and slots converted, REU slots get `reu_path`, NTP servers 2 and 3 filled, the converted slots boot). Details are in the closed GitHub issues and the git log.

2026-10-02 (branch `uci-submodule`): the ultimate-uci-oscar64 v1.2.0 submodule (hang fix) and `uii_scan_media()` storage detection, tested on the U64-II (SD only) and the U64 Elite (USB only): `make e2e` 3 of 3 clean on both, the user's config found on `/sd/`, file browser in UCI and IEC mode, NTP ("00,ok", clock set), `uboot_upd23` converting the Elite's v2 set on `/usb0/` (then restored), and the converted default slot auto-booting GEOS (mount + REU load). Note: NTP results flash by unless start-up messages are set to "Show messages + wait".

Not yet tested:
- Firmware 3.15b (Christian Gleissner's SoftIEC compatibility builds, GitHub #3).
- An intermittent glitch seen once: right after entering a D64 on the SoftIEC drive, one listing line came through garbled (`1000          PRG`); correct after F1. Not reproduced in 6 further enter/leave rounds (2026-09-28). The garbled text is exactly what the parser makes of the line `1000  "BIG 1000"   PRG` without its opening quote (the name is then taken from after the closing quote), so most likely one byte was lost on the IEC bus, not a parser bug. Watch for it.

- Known, parked (#24, 2026-10-03): on the Ultimate 64 Elite the start right after a built-in conversion (#23) hangs now and then in the IEC scan (`iec_present()`, Kernal LISTEN/SECOND, IRQ off; about 1 in 20 such starts; never in normal starts or on the U64-II). A restart gets past it. Because of it `make e2e` fails on the Elite about 1 run in 7; check the failure is this one (timeout after "Drive B: ... 1581", "IRQ STOPPED") before chasing it.

Remove this section once these are done.
