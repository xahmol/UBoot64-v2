# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

UBoot64-v2 is a **boot menu cartridge for Commodore 64** with Ultimate II+ cartridge support. It is written in C and compiled to a Final Cartridge 3 (FC3) compatible cartridge image using the Oscar64 cross-compiler. The project is an Oscar64 rebuild of the original UBoot64, ported from DMBoot 128.

**Required hardware:** Commodore 64, RAM Expansion Unit (REU, 128 KB minimum), Ultimate II+ cartridge, USB storage.

## Build Commands

```bash
make all      # Build uboot64.crt, uboot_upd12.prg, and distribution ZIP
make clean    # Remove build artifacts
make deploy   # Deploy to Ultimate II+ via FTP (requires configured ULTHOST)
```

**Compiler:** [Oscar64](https://github.com/drmortalwombat/oscar64) — a C/C++ cross-compiler targeting 6502 processors, primarily focused on Commodore systems. Expected at `/home/xahmol/oscar64/bin/oscar64`.

Oscar64 compiles full programs in one pass (no external linker). It supports C with many C++ extensions (namespaces, templates, lambdas, virtual functions). Use `-pp` or `.cpp` extension for C++ mode.

**Outputs:**
- `build/uboot64.crt` — Main bootable cartridge image
- `build/uboot_upd12.prg` — Configuration migration utility (v1→v2 upgrade tool)
- Distribution ZIP with timestamped filename

**Key compiler flags:**

| Flag | Purpose |
|------|---------|
| `-tm=c64` | Target Commodore 64 |
| `-tf=crt16` | 16 KB cartridge format (`$8000–$BFFF`) |
| `-O2` | Optimization level |
| `-dNOFLOAT` | Exclude float support from printf/stdlib |
| `-dHEAPCHECK` | Enable heap integrity checking |
| `-dVERSION=...` | Version string injected at compile time |
| `-i=include` | Include path |
| `-g` | Debug symbols (`.asm`, `.map`, `.lbl` outputs) |

**Oscar64 6502 constraints to keep in mind:**
- Prefer `unsigned` arithmetic — signed is more expensive on 6502
- Prefer `char`/`unsigned char` over wider types wherever possible
- Avoid recursion and function pointers — they disable static call graph analysis and prevent register/zero-page optimization
- Float operations are costly; `-dNOFLOAT` drops them from standard library
- CPU hardware stack is only 256 bytes; Oscar64 uses a separate software data stack

There is no automated test suite; testing is done by deploying to hardware.

## Architecture

### Memory Banking

The cartridge uses FC3 multi-bank architecture. Oscar64 places code/data into banks via `#pragma section` and `#pragma region` directives. Each bank is 16 KB at `$8000–$BFFF`:

| Bank | Contents |
|------|----------|
| 0 | Common routines, startup, cartridge control — copied to RAM (`$0900`) at boot |
| 1 | Slot menu UI and operations |
| 2 | File browser / directory navigation |
| 3 | Reserved |

Cross-bank calls use `fc3_call(bank, function)` / `fc3_callr(bank, function, &result)`. The main loop in `src/main.c` dispatches to banked modules via these wrappers.

### Module Map

| File | Bank | Role |
|------|------|------|
| `src/main.c` | 0 | Entry point, initialization, event loop, banking dispatch |
| `src/core.c` | 0 | Utilities: error display, string ops, device detection |
| `src/fileio.c` | 0 | Config/slot persistence: REU ↔ USB via UCI |
| `src/petscii_ascii.c` | 0 | PETSCII/ASCII conversion |
| `src/slotmenu.c` | 1 | Boot menu, slot selection/editing, menu operations |
| `src/time.c` | 1 | NTP time synchronization |
| `src/filebrowse.c` | 2 | Directory listing, file selection, disk mounting |
| `src/uboot_upd12.c` | — | Standalone upgrade utility (separate binary) |
| `include/ultimate_*` | — | UCI protocol implementation (Ultimate II+ hardware interface) |
| `include/fc3.*` | — | Cartridge banking control |

### Key Data Structures (`include/defines.h`)

**`SlotStruct`** (~128 bytes per slot, 18 slots total): stores a single boot configuration — paths, filenames, device IDs, REU image, disk images A/B, command flags.

**`ConfigStruct`**: global preferences — NTP host, UTC offset, verbose flag, UI color palette.

**`DirMeta`**: doubly-linked list node for directory entries in the file browser.

### Persistence Model

Config and slot data live in REU during a session. On load/save they are transferred USB ↔ REU using the UCI protocol via `src/fileio.c`. The UCI protocol limits transfers to ~500 bytes per operation, so files are read/written in chunks.

- Config file: `/usb*/dmbcfg.cfg`
- Slots file: `/usb*/dmbslt.cfg`

### Startup Flow

```
main() → FC3 init, copy bank 0 to RAM
  → mainloop(): init VIC/screen, detect UCI
  → readconfigfile() / read_slotsfile()
  → uii_parse_deviceinfo() (detect drives)
  → time_main() [Bank 1] (NTP sync)
  → mainmenu() [Bank 1] (interactive boot menu)
```

### User Input (main menu)

| Key | Action |
|-----|--------|
| `0–9`, `a–z` | Boot from numbered/lettered slot |
| `F1` | File browser (Bank 2) |
| `F2` | Information screen |
| `F3` | Edit menu slots (Bank 1) |
| `F5` | Time/NTP config (Bank 1) |
| `F7` | Exit to BASIC |

## Ultimate Command Interface (UCI)

The UCI is the hardware interface exposed by the Ultimate II+/U64 cartridge at memory-mapped I/O registers `$DF1C–$DF1D`. All file, network, and control operations go through it.

**Source:** firmware lives in [GideonZ/1541ultimate](https://github.com/GideonZ/1541ultimate). The C libraries in `include/ultimate_*` are adapted from [xlar54/ultimateii-dos-lib](https://github.com/xlar54/ultimateii-dos-lib) and documented in `ultimate_dos-1.2.docx` / `command interface.docx` in that repo's `doc/` folder.

### Registers

| Register | Address | Direction | Purpose |
|----------|---------|-----------|---------|
| `status` | `$DF1C` | Read | Status/state bits |
| `id` | `$DF1D` | Read | Identity (`$C9` = UCI present) |
| `respdata` | `$DF1E` | Read | Response data byte |
| `statusdata` | `$DF1F` | Read | Status string byte |
| `control` | `$DF1C` | Write | Control bits (push/ack/abort/clear) |
| `cmddata` | `$DF1D` | Write | Command data byte |

**Detection:** `uii_detect()` checks `id == 0xC9`.

### Targets

| ID | Target | Use |
|----|--------|-----|
| `0x01` | `TARGET_DOS1` | Drive A file/dir operations |
| `0x02` | `TARGET_DOS2` | Drive B file/dir operations |
| `0x03` | `TARGET_NETWORK` | TCP/UDP sockets |
| `0x04` | `TARGET_CONTROL` | Drive power, disk mount/unmount, device info |

### Protocol Flow

Every UCI operation follows this pattern:

```c
uii_sendcommand(cmd, len);  // write target + opcode + args to $DF1D, then PUSH_CMD
uii_readdata();             // drain response data into uii_data[]
uii_readstatus();           // drain status string into uii_status[]
uii_accept();               // send ACK to release UCI
```

Success check: `UII_SUCCESS` — true when `uii_status[0]=='0' && uii_status[1]=='0'`.

**Queue limits:** data queue 512 bytes (`DATA_QUEUE_SZ`), status queue 256 bytes (`STATUS_QUEUE_SZ`). This is why `fileio.c` chunks large file transfers.

### Key UCI Functions Used by This Project

| Function | Purpose |
|----------|---------|
| `uii_open_file` / `uii_close_file` | Open/close a file on USB |
| `uii_read_file` / `uii_write_file` | Read/write up to 512 bytes |
| `uii_open_dir` / `uii_get_dir` | Directory listing |
| `uii_change_dir` / `uii_get_path` | Navigate directory tree |
| `uii_load_reu` / `uii_save_reu` | Transfer REU ↔ USB file |
| `uii_mount_disk` / `uii_unmount_disk` | Mount a disk image on drive A/B |
| `uii_parse_deviceinfo` | Detect connected drives and their IEC IDs |

## Development Notes

- **No dynamic allocation**: fixed-size structures (max 18 slots, 256-char paths, 51-char filenames).
- **Character encoding**: filenames from UCI arrive in ASCII; the UI uses PETSCII. Use `petscii_ascii.c` conversion utilities at boundaries.
- **UCI I/O limit**: 512-byte max per transfer — `fileio.c` handles chunking transparently.
- **Debugging symbols**: `build/*.asm`, `*.map`, `*.lbl`, `*.int` are generated alongside the binary and are useful for tracing 6502 addresses.
- **FTP deploy target**: configured via `ULTHOST` in the Makefile (default `ftp://192.168.1.52/usb0/Dev/`).
