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

### Key Data Structures

#### `SlotStruct` — one boot slot (`include/defines.h`, 18 slots total)

| Field | Type | Size | Purpose |
|-------|------|------|---------|
| `cfgvs` | char | 1 | Config version stamp — must equal `CFGVERSION` (0x02) |
| `path` | char[] | 256 | USB path to the boot file's directory |
| `menu` | char[] | 31 | Display name shown in the boot menu |
| `file` | char[] | 51 | Boot filename |
| `cmd` | char[] | 81 | Optional BASIC/machine code command to execute after boot |
| `reu_image` | char[] | 51 | REU image filename to preload |
| `reu_path` | char[] | 256 | USB path to the REU image |
| `reusize` | char | 1 | REU size index (maps into `reusizelist`) |
| `runboot` | char | 1 | Run/boot mode selector (bitmask of `EXEC_*` flags) |
| `device` | char | 1 | IEC device ID to use for boot (8–30) |
| `command` | char | 1 | Bitmask: `COMMAND_CMD`/`COMMAND_REU`/`COMMAND_IMGA`/`COMMAND_IMGB` |
| `image_a_path` | char[] | 256 | USB path to disk image for drive A |
| `image_a_file` | char[] | 51 | Filename of disk image for drive A |
| `image_a_id` | char | 1 | IEC device ID to mount drive A image on |
| `image_b_path` | char[] | 256 | USB path to disk image for drive B |
| `image_b_file` | char[] | 51 | Filename of disk image for drive B |
| `image_b_id` | char | 1 | IEC device ID to mount drive B image on |
| `padding` | char[] | 13 | Reserved; pads struct to multiple of 16 bytes |

#### `ConfigStruct` — global preferences (`include/defines.h`)

| Field | Type | Purpose |
|-------|------|---------|
| `version` | char | Config file version — must equal `CFGVERSION` (0x02) |
| `timeon` | char | NTP sync enabled: 0=off, 1=on |
| `host` | char[81] | NTP hostname |
| `secondsfromutc` | long | UTC offset in seconds (e.g. 3600 = UTC+1) |
| `verbose` | char | Verbose/debug output level |
| `colors` | ColorPalette | Embedded UI color palette (see below) |

#### `ColorPalette` — UI color scheme (nested inside `ConfigStruct`)

| Field | Purpose |
|-------|---------|
| `background` | Screen background color |
| `border` | Screen border color |
| `header1` | Primary header text color |
| `header2` | Secondary header/title color |
| `text` | Normal body text color |
| `text_input` | User input field color |
| `key` | Highlighted key / shortcut color |
| `diritem_normal` | Directory entry color (unselected) |
| `diritem_select` | Directory entry color (highlighted) |
| `error` | Error message color |
| `ok` | Success/confirmation message color |

#### File browser structs (`src/filebrowse.c`)

Directory entries are stored in REU memory as a doubly-linked list. The `next`/`prev` fields hold raw REU byte addresses (not CPU pointers).

**`DirMeta`** — metadata node:

| Field | Purpose |
|-------|---------|
| `next` | REU address of next entry (0 = end of list) |
| `prev` | REU address of previous entry (0 = start of list) |
| `type` | Entry type (`CBM_T_PRG`, `CBM_T_DIR`, etc.) |
| `length` | Filename byte length (including null) |
| `select` | Selection flag: 0=unselected, 1=selected |
| `size` | Size in 256-byte blocks |
| `access` | Access flags (`CBM_A_RO`/`CBM_A_RW`) |
| `stub[5]` | Reserved for future use |

**`DirElement`** — one directory entry (name + metadata):

| Field | Purpose |
|-------|---------|
| `name[51]` | Null-terminated entry name (ASCII for UCI, PETSCII for IEC) |
| `meta` | Embedded `DirMeta` metadata |

**`Directory`** — state for the active pane:

| Field | Purpose |
|-------|---------|
| `firstelement` | REU address of list head |
| `firstprint` | REU address of first visible entry (scroll position) |
| `lastprint` | REU address of last visible entry on screen |
| `present` | REU address of currently highlighted entry |
| `drive` | Drive number (0=A, 1=B) |
| `position` | Cursor row on screen (0–18) |
| `path[256]` | Current directory path string |
| `free` | Free blocks on device (IEC only) |
| `address` | Next available REU write address for new entries |

#### UCI hardware structs (`include/ultimate_common_lib.h`)

**`UII_READ`** — memory-mapped read registers at `$DF1C`:

| Field | Offset | Purpose |
|-------|--------|---------|
| `status` | +0 | Status/state bits (busy, error, data-available) |
| `id` | +1 | Identity byte — `0xC9` confirms UCI present |
| `respdata` | +2 | Response data FIFO byte |
| `statusdata` | +3 | Status string FIFO byte |

**`UII_WRITE`** — memory-mapped write registers at `$DF1C`:

| Field | Offset | Purpose |
|-------|--------|---------|
| `control` | +0 | Control bits: push command, acknowledge, abort, clear |
| `cmddata` | +1 | Command data byte to send |

**`DevInfo`** — connected drive state (array `uii_devinfo[4]`, indexed by target ID minus 1):

| Field | Purpose |
|-------|---------|
| `exist` | Drive present: 0=absent, 1=present |
| `type` | Drive type code |
| `power` | Drive power state |
| `id` | IEC device ID assigned to this drive |

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
