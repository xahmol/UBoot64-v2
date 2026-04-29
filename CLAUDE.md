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
