# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.
Full technical documentation is in **[ARCHITECTURE.md](ARCHITECTURE.md)**.

## Build Commands

```bash
make all      # Build uboot64.crt, uboot_upd12.prg, and distribution ZIP
make clean    # Remove build artifacts
make deploy   # Deploy to Ultimate II+ via FTP (requires ULTHOST in Makefile)
```

**Compiler:** Oscar64 at `/home/xahmol/oscar64/bin/oscar64` — single-pass, no linker.
Oscar64 pulls in all source files transitively via `#pragma compile("file.c")` in headers.

**Outputs:** `build/uboot64.crt` (main cartridge), `build/uboot_upd12.prg` (v1→v2 upgrade tool).

There is no automated test suite; testing requires deploying to hardware.

## Oscar64 6502 Constraints

- Prefer `unsigned` arithmetic and `char`/`unsigned char` over wider types
- Avoid recursion and function pointers — they disable zero-page/register optimization
- No float (`-dNOFLOAT`); hardware stack is only 256 bytes
- Cross-bank calls use `fc3_call(bank, function)` — see ARCHITECTURE.md §5

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

These changes were made while rebuilding DMBoot 128 v5 (https://github.com/xahmol/DMBoot, branch `Oscar64Rebuild`) and are **not yet tested on real C64 hardware. Test them before releasing a new UBoot64 build**, then remove this section.

1. **`textInput()` overflow fix** (`src/core.c`, callers in `src/slotmenu.c`, `src/time.c`): `size` is now the buffer size (`sizeof`), the maximum length is `size - 1`, and every write is bounds-checked. Before, typing the last allowed character or pressing SHIFT-DEL (insert) on a nearly full string wrote past the buffer (for a slot name into `Slot.file`). `offsetinput` grew from 10 to 12 bytes. To test:
   - slot names up to 30 characters, commands up to 80, NTP host up to 80, UTC offset up to 11 characters;
   - SHIFT-DEL near a full string; RUN/STOP; RETURN;
   - after each edit, check that the slot's program file name is intact.
2. **UCI library completed** against released firmware 3.15a (`include/ultimate_*`, new `include/ultimate_softiec_lib.c/h`, `UCILIBMANUAL.md` §14-§18). UBoot64 itself calls none of the new functions (bank usage unchanged). The only behaviour change for UBoot64: `uii_load_reu()` / `uii_save_reu()` now ignore a size index above 7. To test: REU preload from a slot still works.
3. **UCI library without `malloc`** (2026-09-26, from DMBoot v5): every command is now built in one shared static 520-byte buffer (`uii_command_buffer()` in `include/ultimate_common_lib.c`) instead of `malloc`/`free`; a command that does not fit is not sent and sets `uii_status` to `99`. `uii_set_time()` uses a local buffer and now reads the firmware's data reply before the status (issue #13: the status was out of step). A full `make clean` build of `uboot64.crt` and both upgraders links, and none of them contains `malloc` any more. To test: everything that talks to the Ultimate: mount A/B from slots and browser (UCI and IEC), REU load, directory listing in UCI mode, config/slot save and load, NTP time sync (should now report "00,OK" for setting the clock), the upgraders.
