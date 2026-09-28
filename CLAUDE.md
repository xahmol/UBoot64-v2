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

**Outputs:** `build/uboot64.crt` (main cartridge), `build/uboot_upd12.prg` (v1→v3) and `build/uboot_upd23.prg` (v2→v3) upgrade tools.

There is no automated test suite; testing is on the real U64 through c64bridge (below).

## Hardware testing via c64bridge

- Test machine: Ultimate 64-II (firmware 3.15a) at `ULTIP1` from the gitignored `.env`; c64bridge backend **`c64u`** points at it (`~/.c64bridge.json`; backend `u2` is DMBoot's C128, don't use it here).
- `make deploy` uploads to `/usb0/Dev/build/` (wput keeps the `build/` prefix). Start with `c64_program run_crt /usb0/Dev/build/uboot64.crt`. When another program (e.g. GEOS) is running, `run_crt` may not take over: follow with `c64_system reset`, which restarts the mounted cartridge.
- Read the screen with `c64_memory read_screen` / `wait_for_text`. UBoot64 uses the lowercase charset, so c64bridge shows letters case-inverted ("mAKE YOUR CHOICE"); match with `caseInsensitive` or the inverted text. Wait for the screen to settle before sending a key (keys sent during a redraw are lost). `c64_input key` takes `F1`..`F8`, `RETURN`, `DOWN`, `LEFT`, `DEL`, `" "` (not `SPACE`); for Y/N prompts send uppercase `Y`/`N` (lowercase `y` gives a different PETSCII code). There is no token for SHIFT-DEL (INST): write the PETSCII code into the keyboard buffer (`c64_memory write $0277 94`, then `$00C6` = count).
- Config and slots are on the U64's SD card (`/sd/DMBCFG.CFG`, `/sd/DMBSLT.CFG`) and can be read and patched over FTP (`curl ftp://$ULTIP1/sd/...`, upload with `curl -T`). `ConfigStruct` offsets: timeon 1, host 2, secondsfromutc 83, verbose 87, colors 88, timeoutidx 99, iec_root_partition 100, host2 101, host3 182 (263 bytes). `SlotStruct` is 1360 bytes (menu at 257, reu_image 420, reu_path 471, command 730, image_a_path 731). Back up a file before patching it, and restore it after a test.
- Test disk: `python3 tests/make_test_d64.py` builds `ubtest.d64` (locked files, invalid type, big block counts). Mount it over the Ultimate REST API: `curl -X PUT "http://$ULTIP1/v1/drives/a:set_mode?mode=1541"`, then `.../v1/drives/a:mount?image=/usb0/Dev/ubtest.d64`. Afterwards restore drive A (the user's is 1581 mode with `/usb0/Geos/gdos64.d81`). A raw directory can be checked in BASIC: `LOAD"$",8`, then `c64_memory save_memory $0801`..(`$2D/$2E` - 1) and decode the BASIC lines.
- The user's config has a default slot (GEOS, REU preload). Its auto-boot timeout was set to off (2026-09-28) so tests don't start GEOS; turn it back on in F5 → F4 when wanted.

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
| `src/uboot_upd12.c` | — | Standalone v1→v2 config upgrade utility |
| `include/ultimate_*.c/h` | 0 | UCI protocol implementation |
| `include/fc3.c/h` | 0 | FC3 cartridge banking control |
| `include/defines.h` | — | All constants, structs, extern globals |

## Key Conventions

- `strncpy` is always followed by explicit null-termination of the last byte
- UCI filenames arrive as ASCII; convert to PETSCII with `AscToPet()` at display boundaries
- REU addresses in `DirMeta.next/prev` are raw 32-bit byte offsets, not CPU pointers
- Slot data lives in REU starting at address 0; directory listing follows after slot data
- UCI transfers are limited to 500 bytes per chunk (`SAVE_BUF_SIZE`) due to 512-byte queue cap

## Pending verification (changes from the DMBoot 128 v5 work, 2026-09-25)

These changes were made while rebuilding DMBoot 128 v5 (https://github.com/xahmol/DMBoot, `main`) and are **not yet tested on real C64 hardware. Test them before releasing a new UBoot64 build**, then remove this section.

1. **`textInput()` overflow fix** (`src/core.c`, callers in `src/slotmenu.c`, `src/time.c`): `size` is now the buffer size (`sizeof`), the maximum length is `size - 1`, and every write is bounds-checked. Before, typing the last allowed character or pressing SHIFT-DEL (insert) on a nearly full string wrote past the buffer (for a slot name into `Slot.file`). `offsetinput` grew from 10 to 12 bytes. To test:
   - slot names up to 30 characters, commands up to 80, NTP host up to 80, UTC offset up to 11 characters;
   - SHIFT-DEL near a full string; RUN/STOP; RETURN;
   - after each edit, check that the slot's program file name is intact.
2. **UCI library completed** against released firmware 3.15a (`include/ultimate_*`, new `include/ultimate_softiec_lib.c/h`, `docs/UCILIB_MANUAL.md` §14-§18). UBoot64 itself calls none of the new functions (bank usage unchanged). The only behaviour change for UBoot64: `uii_load_reu()` / `uii_save_reu()` now ignore a size index above 7. To test: REU preload from a slot still works.
3. **UCI library without `malloc`** (2026-09-26, from DMBoot v5): every command is now built in one shared static 520-byte buffer (`uii_command_buffer()` in `include/ultimate_common_lib.c`) instead of `malloc`/`free`; a command that does not fit is not sent and sets `uii_status` to `99`. `uii_set_time()` uses a local buffer and now reads the firmware's data reply before the status (issue #13: the status was out of step). A full `make clean` build of `uboot64.crt` and both upgraders links, and none of them contains `malloc` any more. To test: everything that talks to the Ultimate: mount A/B from slots and browser (UCI and IEC), REU load, directory listing in UCI mode, config/slot save and load, NTP time sync (should now report "00,OK" for setting the clock), the upgraders.
**Verified on the U64 (firmware 3.15a) via c64bridge, 2026-09-28:** start-up and main menu; UCI listing (`AscToPet`, #4); IEC listing on the SoftIEC drive: header from the reverse-on line (#12), 16-bit free-block count 65535 (#8), cursor navigation through the REU list, changing directories; REU preload of an old slot (GDOS64 + geosram.reu) with `reu_path` written back to the slots file (#6); config screen: three NTP servers, three start-up modes, config file written and read back at 263 bytes; NTP: unresolvable server 1 skipped, server 2 answered, clock set with "00,OK" (#13, item 3) and the correct date (#5/date rewrite); "Show messages + wait"; #7: "IDs needing manual power switching: Yes" with the SoftIEC drive (11) and an SD2IEC (12) on the bus, correct (before, only the last ID checked decided). The start-up list lacks the "SoftIEC:" line because of a firmware GET_DRVINFO bug (docs/UCILIB_MANUAL.md, `uii_parse_deviceinfo`). Second round, same day: #9 (rename saved after a later no-change action), textInput limits (30-character name stops with terminator, SHIFT-DEL on a full string does nothing, program file name intact), #10 (NTP change saved after leaving the colour editor unchanged), #11 (colour undo restores the background on screen and in $D021, NTP change kept), #6 (new REU slot from the UCI browser stores `reu_path`). Third round: #12 and #8 for files with the test disk from `tests/make_test_d64.py` on drive A (locked PRG/SEQ as entries, invalid type as `oth`, header intact, 300/1000 blocks shown). Still to test: the upgraders, mounts from slots and browser. Found: a new REU-only slot gets an empty name by default (the name prompt starts empty), which makes the slot invisible in the menu. Note: `sorted` is never set, so `dir_read()`'s sorted insert (where #18's reorder showed) does not run.

4. **Fix round 2026-09-28 (v3.1.0, GitHub #4-#12, #18)**, full `make clean && make all` builds:
   - #18: slot/directory REU transfers go through `uboot_reu_load()`/`uboot_reu_store()` (`src/core.c`, `__noinline` + barrier; `.asm` checked for `dir_read()`'s sorted insert). Test: IEC and UCI directory listings with sort on, long directories, cursor up/down/page, slot edits saved and reloaded.
   - #6: `Slot.reu_path` is now stored; old slots with an empty `reu_path` load from `image_a_path` and are written back (slots file rewritten once, before the REU load); both upgraders fill `reu_path`. Test: new REU slot from the browser (UCI mode) boots and preloads; an old v3.0.x REU slot boots and afterwards has its path (boot it twice); `uboot_upd23` on a v2 slot file with an REU slot.
   - #8/#12: IEC listing shows 16-bit block counts (file > 255 blocks), locked files (`PRG<`) as entries (not as the disk name), header name/ID correct on 1541/SD2IEC/SoftIEC.
   - #9/#10/#11: slot editor: rename, then an action without changes, then F7: rename saved. Config: change NTP host, open colour editor, leave it unchanged: host saved. Colour editor DEL undoes only colours (border/background restored on screen).
   - #5 + date rewrite: NTP sync sets the right date (host-tested 1990-2069 against Python's datetime).
   - #7: information screen "IDs needing manual power switching" with a non-Ultimate drive on another ID than 8.
   - #4: UCI-mode names and paths display as before (AscToPet now writes into the caller's buffer).
5. **NTP servers and start-up modes from DMBoot v5 (2026-09-28, v3.1.0):** `host2`/`host3` appended to `ConfigStruct` (no version bump; `readconfigfile()` no longer zeroes `cfg`, so tail fields of an old file keep the `mainloop()` defaults); `get_ntp_time()` tries the three servers in order; `cfg.verbose` 0/1/2 = Silent / Show messages / Show messages + wait; NTP off by default for new configs. Verified on the U64 (see above). Still to test: `uboot_upd23` and `uboot_upd12` write `host2`/`host3` (defaults), F5 server editing (STOP keeps a server).
