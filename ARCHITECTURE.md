# UBoot64 v2 — Architecture and Technical Reference

Written in 2023 (v1), 2026 (v2) by Xander Mol
https://github.com/xahmol/UBoot64-v2

---

## Contents

1. [Project Overview](#1-project-overview)
2. [Build System](#2-build-system)
3. [Final Cartridge 3 Format](#3-final-cartridge-3-format)
4. [Memory Layout](#4-memory-layout)
5. [Banking Architecture](#5-banking-architecture)
6. [REU Usage](#6-reu-usage)
7. [Ultimate Command Interface (UCI)](#7-ultimate-command-interface-uci)
8. [Data Structures](#8-data-structures)
9. [Module Map and Function Reference](#9-module-map-and-function-reference)
10. [Startup Flow](#10-startup-flow)
11. [Key Design Considerations](#11-key-design-considerations)
12. [Oscar64 Compiler Quirks and Workarounds](#12-oscar64-compiler-quirks-and-workarounds)
13. [Porting from cc65 (v1) to Oscar64 (v2)](#13-porting-from-cc65-v1-to-oscar64-v2)

---

## 1. Project Overview
([Back to contents](#contents))

UBoot64 v2 is a boot menu cartridge for the Commodore 64 built around the Ultimate II+/U64 cartridge ecosystem. It presents an interactive menu of up to 18 configurable boot slots, each of which can launch a program file (via IEC or UCI), mount disk images on emulated drives, and preload a REU file — all without user intervention at boot time.

**Required hardware:**
- Commodore 64 (PAL or NTSC)
- Ultimate II+ or Ultimate 64 cartridge, firmware 3.4 or higher
- RAM Expansion Unit (REU), minimum 128 KB
- USB storage attached to the Ultimate device

**v2 vs v1:** v2 is a complete rewrite using the Oscar64 C/C++ cross-compiler for 6502, replacing the cc65 toolchain used in v1. The new compiler enables a single-pass compilation model, significantly better optimization, and native support for the FC3 multi-bank cartridge format without external linker scripts.

---

## 2. Build System
([Back to contents](#contents))

**Compiler:** Oscar64 — https://github.com/drmortalwombat/oscar64  
Expected at: `/home/xahmol/oscar64/bin/oscar64`

Oscar64 compiles a full program in one pass (no external linker). It supports C with many C++ extensions (namespaces, templates, lambdas, virtual functions). All source files are pulled in transitively via `#pragma compile("file.c")` directives in their corresponding headers.

**Build commands:**

```bash
make all      # Build uboot64.crt, uboot_upd12.prg, and distribution ZIP
make clean    # Remove build artifacts from build/
make deploy   # Deploy via FTP to Ultimate II+ (requires ULTHOST in Makefile)
```

**Outputs:**

| File | Description |
|------|-------------|
| `build/uboot64.crt` | Main bootable FC3-format cartridge image |
| `build/uboot_upd12.prg` | Standalone v1→v2 configuration upgrade utility |
| `uboot64_vX.Y.Z-YYYYMMDD-HHMM.zip` | Distribution ZIP with CRT, PRG, and README |

**Key compiler flags:**

| Flag | Purpose |
|------|---------|
| `-tm=c64` | Target Commodore 64 |
| `-tf=crt16` | 16 KB cartridge ROM format |
| `-cid=3` | Cartridge ID 3 = Final Cartridge 3 compatible |
| `-csub=1` | Cartridge sub-type 1 |
| `-cname=uboot64` | Cartridge name string embedded in ROM header |
| `-O2` | Optimization level 2 |
| `-dNOFLOAT` | Exclude float support from printf/stdlib |
| `-dHEAPCHECK` | Enable heap integrity checking (debug aid) |
| `-dVERSION="..."` | Version string injected at compile time |
| `-i=include` | Additional include search path |
| `-n` | Suppress non-error output |
| `-g` | Debug symbols (`.asm`, `.map`, `.lbl`, `.int` outputs) |

**Version scheme:** `vMAJOR.MINOR.PATCH-YYYYMMDD-HHMM`, e.g. `v2.0.0-20260428-1800`

**Oscar64 6502 constraints:**
- Prefer `unsigned` arithmetic — signed operations require more cycles on 6502
- Prefer `char`/`unsigned char` over wider integer types wherever possible
- Avoid recursion and function pointers — they disable static call graph analysis, preventing register and zero-page variable optimization
- Float operations are costly; `-dNOFLOAT` removes them from standard library
- The CPU hardware stack is only 256 bytes; Oscar64 uses a separate software data stack in RAM for C function call frames

**Debug artifacts:**  
`build/*.asm`, `*.map`, `*.lbl`, `*.int` are generated alongside the binary and are useful for tracing 6502 addresses back to C source lines.

---

## 3. Final Cartridge 3 Format
([Back to contents](#contents))

### Overview

The Final Cartridge 3 (FC3) is a 64 KB ROM cartridge for the Commodore 64, organized as 4 banks of 16 KB each. It uses a non-standard banking scheme with the ROM visible at `$8000–$BFFF` (ROML at `$8000–$9FFF`, ROMH at `$A000–$BFFF`).

### Bank Switching

Bank switching is performed by writing to the memory-mapped register at `$DFFF`. The lower 2 bits select the active bank (0–3). This is the `FC3` macro in `include/fc3.h`:

```c
#define FC3 (*(volatile char *)0xdfff)
```

Writing to `$DFFF` selects which 16 KB bank appears at `$8000–$BFFF`.

### ROM Header

The CRT file format embeds a standard cartridge header. Oscar64 generates this header from the `-tf=crt16`, `-cid=3`, `-csub=1`, and `-cname=uboot64` flags. The CRT format places:
- `EXROM = 1, GAME = 1` — cartridge is visible; the 16 KB ROM bank appears at `$8000–$BFFF`

### Cross-Bank Calls

Because code in different banks cannot call each other directly (only one bank is visible at a time), Oscar64's `fc3.c`/`fc3.h` provide a small trampoline that lives in RAM (copied from bank 0 at boot):

```c
void fc3_call(char bank, void (*func)());
```

This saves the current bank, switches to the target bank, calls the function, then restores the original bank. A variant `fc3_callr` passes a return value back.

The banking control code (`fc3control` section, `$8200–$8300` in ROM, mapped to `$C000` in RAM) is copied to `$C000` at startup and stays resident throughout the session.

### Cartridge Boot Sequence

At power-on or reset the C64 ROM detects the cartridge by checking `$8004–$8008` for the magic bytes `CBM80`. The FC3 ROM at bank 0 provides these bytes in the standard cartridge header. Control then passes to the cold start vector at `$8000` (the `start` region, `$8060–$8200` in ROM).

---

## 4. Memory Layout
([Back to contents](#contents))

### RAM ($0000–$7FFF and $8000–$BFFF when banking active)

| Address range | Size | Contents |
|--------------|------|----------|
| `$0000–$00FF` | 256 B | Zero page — used by C64 KERNAL and Oscar64 variables/registers |
| `$0100–$01FF` | 256 B | CPU hardware stack |
| `$0200–$02FF` | 256 B | C64 KERNAL workspace |
| `$0300–$033F` | 64 B | KERNAL indirect vectors |
| `$0340–$037F` | 64 B | Cassette buffer — repurposed for sprite data (`SpriteData`) |
| `$0380–$08FF` | ~1.5 KB | Available RAM (KERNAL workspace tail) |
| `$0900–$7FFF` | ~28.5 KB | **Bank 0 common routines** (copied from ROM at boot) + BSS/heap/stack |
| `$0400–$07E7` | 1000 B | Screen RAM (40×25 characters) |
| `$D800–$DBE7` | 1000 B | Colour RAM (40×25 colour nybbles, I/O region) |

### Oscar64 RAM Regions

Defined in `src/main.c` via `#pragma region`:

| Region | RAM address | ROM source | Contents |
|--------|------------|------------|----------|
| `main` | `$4900–$7FFF` | — | BSS, heap, stack (Oscar64 runtime) |
| `start` | `$8060–$8200` | Bank 0 ROM | FC3 cold-start entry, startup message, sprite data |
| `fc3control` | `$8200–$8300` → `$C000` | Bank 0 ROM | Banking trampoline, `fc3_call` implementation |
| `bank0` | `$8300–$C000` → `$0900` | Bank 0 ROM | Common code+data: core.c, fileio.c, petscii_ascii.c, main.c (mainloop) |

**Note:** The `→` notation means the code is stored in ROM at the left address but copied to RAM and executed from the right address.

### ROM Banks ($8000–$BFFF, 16 KB each)

| Bank | ROM address | Contents |
|------|------------|----------|
| 0 | `$8000–$BFFF` | Cold start, banking control, common routines (bank0 region) |
| 1 | `$8000–$BFFF` | Slot menu UI, NTP/config, colour editor, splash screen |
| 2 | `$8000–$BFFF` | File browser, directory listing engine |
| 3 | `$8000–$BFFF` | Reserved (empty) |

### Global Variables in RAM (bank 0 / `$0900` region)

All program global variables are declared in `src/main.c` and reside in the bank 0 data section (copied to `$0900+` at boot). Key globals:

| Variable | Type | Purpose |
|----------|------|---------|
| `path[8][MAXFILENAME]` | char[8][51] | Directory trace path segments |
| `pathfile[MAXFILENAME]` | char[51] | Selected filename |
| `pathdevice` | char | IEC device number of selected file |
| `pathrunboot` | char | Run/boot flags for selected file |
| `depth` | char | Current directory trace depth |
| `trace` | char | Directory trace active flag |
| `comma1` | char | ,1 load flag |
| `demomode` | char | Demo mode flag |
| `reuflag` | char | REU file selection flag |
| `addmountflag` | char | Add-mount-image flag (1=drive A, 2=drive B) |
| `runmountflag` | char | Run-from-mount flag |
| `mountflag` | char | Mountable image detected flag (1=disk, 2=REU) |
| `reudetected` | int | Detected REU size in 64 KB units |
| `Slot` | SlotStruct | Active slot data (working buffer) |
| `BufferSlot` | SlotStruct | Slot copy buffer for reorder operations |
| `cfg` | ConfigStruct | Global configuration |
| `imagename` | char[51] | REU image filename |
| `imageaname/imageapath` | char[] | Drive A disk image name and path |
| `imagebname/imagebpath` | char[] | Drive B disk image name and path |
| `imageaid/imagebid` | char | IEC IDs for drives A and B |
| `execute_commands[200]` | char[] | BASIC commands to stuff into keyboard buffer on exit |
| `execute_keys[10]` | char[] | Enter keypresses to stuff into keyboard buffer |
| `cw` | CharWin | Main screen character window (Oscar64 windowing) |

---

## 5. Banking Architecture
([Back to contents](#contents))

### Section Directives

Oscar64 uses `#pragma code(section)` and `#pragma data(section)` to direct subsequent code and data into named sections. Sections are grouped into regions with specific ROM bank numbers and optional RAM relocation targets.

```c
// Bank 0 — common routines, runs from RAM at $0900
#pragma code(code)
#pragma data(data)

// Bank 1 — slot menu UI
#pragma code(bcode1)
#pragma data(bdata1)

// Bank 2 — file browser
#pragma code(bcode2)
#pragma data(bdata2)
```

Every source file declares its bank at the top with these pragmas. The compiler ensures all code and data for that file are linked into the correct ROM bank.

### Cross-Bank Call Mechanism

```c
// Switch to bank 1 and call mainmenu()
fc3_call(1, mainmenu);

// Switch to bank 2 and call mainLoopBrowse()
fc3_call(2, mainLoopBrowse);
```

`fc3_call` is in the `fc3control` section, which resides at `$C000` in RAM throughout the session. It:
1. Writes the target bank number to `$DFFF`
2. Performs a JSR to the function address (valid in the target bank's ROM space)
3. On return, restores the previous bank number at `$DFFF`

Bank 0 code runs from RAM (`$0900+`) and is always accessible regardless of which ROM bank is selected, so no `fc3_call` wrapper is needed for cross-module calls within bank 0.

### Which Bank Calls Which

| Caller bank | Called function | Target bank | Mechanism |
|-------------|----------------|-------------|-----------|
| Bank 0 (mainloop) | `mainmenu()` | Bank 1 | `fc3_call(1, mainmenu)` |
| Bank 0 (mainloop) | `runbootfrommenu()` | Bank 1 | direct (runs from RAM) |
| Bank 0 (mainloop) | `mainLoopBrowse()` | Bank 2 | `fc3_call(2, mainLoopBrowse)` |
| Bank 0 (mainloop) | `pickmenuslot()` | Bank 1 | `fc3_call(1, pickmenuslot)` |
| Bank 0 (mainloop) | `information()` | Bank 1 | `fc3_call(1, information)` |
| Bank 0 (mainloop) | `editmenuoptions()` | Bank 1 | `fc3_call(1, editmenuoptions)` |
| Bank 0 (mainloop) | `edittimeconfig()` | Bank 1 | `fc3_call(1, edittimeconfig)` |
| Bank 1 (slotmenu) | `show_splash_screen()` | Bank 1 | direct (same bank) |
| Bank 1 (slotmenu) | `write_slotsfile()` | Bank 0 | direct (bank 0 runs from RAM) |
| Bank 1 (slotmenu) | `get/save_slot_to_reu()` | Bank 0 | direct (bank 0 runs from RAM) |
| Bank 2 (filebrowse) | `pathconcat()` | Bank 0 | direct (bank 0 runs from RAM) |
| Bank 2 (filebrowse) | `errorexit()` | Bank 0 | direct (bank 0 runs from RAM) |

---

## 6. REU Usage
([Back to contents](#contents))

### Hardware

The RAM Expansion Unit (REU) provides additional memory beyond the C64's 64 KB address space. It is accessed via DMA registers at `$DF00–$DF0A`. Oscar64 provides `reu_load()` and `reu_store()` for transparent DMA transfers between main RAM and REU memory.

The minimum required REU size is 128 KB (2 × 64 KB). The `reudetected` global stores the detected size in 64 KB units (e.g. `reudetected = 2` for 128 KB, `reudetected = 16` for 1 MB).

### REU Address Map

REU memory is divided into two logical zones:

| Zone | REU address range | Size | Contents |
|------|--------------------|------|----------|
| Slot data | `0` – `SLOTS × sizeof(SlotStruct) - 1` | ~24.5 KB | 18 boot slot records |
| Directory listing | `SLOTS × sizeof(SlotStruct)` onwards | Remaining REU | REU-backed doubly-linked list of directory entries |

`SLOT_REU_START = 0` is the base address. `sizeof(SlotStruct)` ≈ 1360 bytes, so 18 slots occupy approximately 24,480 bytes (24 KB) at the start of REU.

### Slot Data in REU

Each of the 18 `SlotStruct` records is stored sequentially in REU starting at address 0. Access functions in `src/fileio.c`:

- `get_slot_from_reu(n)` — DMA loads slot `n` from REU into the `Slot` global
- `save_slot_to_reu(n)` — DMA stores the `Slot` global into slot `n` in REU

The address formula: `address = n × sizeof(SlotStruct) + SLOT_REU_START`

### Directory Listing in REU

`src/filebrowse.c` uses REU as a heap for a doubly-linked list of `DirElement` records. The list starts after the slot data at address `SLOT_REU_START + SLOTS × sizeof(Slot)`.

Each `DirElement` consists of a `DirMeta` header (16 bytes) followed by the filename string. The `next` and `prev` fields in `DirMeta` are raw REU byte addresses, used as 32-bit pointers within REU space.

Navigation is by DMA: `dir_get_element(address)` loads the element at a given REU address into the `presentdirelement` global, which is then used for display or comparison.

The maximum REU address is tracked to avoid overflow:
```c
unsigned long maxreuaddress = (reudetected * 65536) - 1;
```

### Slot File Persistence

Slot and config data are persisted to USB as binary files via UCI:
- **Config file:** `/usb*/dmbcfg.cfg` — serialized `ConfigStruct`
- **Slots file:** `/usb*/dmbslt.cfg` — serialized 18 × `SlotStruct`

Because the UCI data queue is limited to 512 bytes per transfer, large structures are written in `SAVE_BUF_SIZE` (500 byte) chunks in `write_slotsfile()`, draining via `uii_write_file()` in a loop.

---

## 7. Ultimate Command Interface (UCI)
([Back to contents](#contents))

The UCI is the hardware interface exposed by the Ultimate II+/U64 cartridge at memory-mapped I/O registers `$DF1C–$DF1F`. All file, network, and control operations go through it.

**Source:** firmware lives in [GideonZ/1541ultimate](https://github.com/GideonZ/1541ultimate). The C libraries in `include/ultimate_*` are adapted from [xlar54/ultimateii-dos-lib](https://github.com/xlar54/ultimateii-dos-lib).

### Registers

| Register | Address | Direction | Purpose |
|----------|---------|-----------|---------|
| `status` | `$DF1C` | Read | Status/state bits (busy, error, data-available) |
| `id` | `$DF1D` | Read | Identity — `$C9` confirms UCI present |
| `respdata` | `$DF1E` | Read | Response data FIFO byte |
| `statusdata` | `$DF1F` | Read | Status string FIFO byte |
| `control` | `$DF1C` | Write | Control bits: push command, acknowledge, abort, clear |
| `cmddata` | `$DF1D` | Write | Command data byte to send |

**Detection:** `uii_detect()` checks `id == 0xC9`.

### Targets

| ID | Constant | Use |
|----|----------|-----|
| `0x01` | `TARGET_DOS1` | Drive A file/directory operations |
| `0x02` | `TARGET_DOS2` | Drive B file/directory operations |
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

### Key UCI Functions Used

| Function | Target | Purpose |
|----------|--------|---------|
| `uii_detect()` | — | Check if UCI hardware is present |
| `uii_open_file(attrib, name)` | DOS1 | Open file (0x01=read, 0x06=write) |
| `uii_close_file()` | DOS1 | Close currently open file |
| `uii_read_file(len)` | DOS1 | Request up to `len` bytes from open file |
| `uii_write_file(data, len)` | DOS1 | Write up to 500 bytes to open file |
| `uii_delete_file(name)` | DOS1 | Delete named file |
| `uii_open_dir()` | DOS1 | Open current directory for streaming |
| `uii_get_dir()` | DOS1 | Stream directory entries |
| `uii_change_dir(path)` | DOS1 | Navigate to directory |
| `uii_change_dir_home()` | DOS1 | Navigate to USB root |
| `uii_get_path()` | DOS1 | Read current path into `uii_data` |
| `uii_load_reu(size)` | DOS1 | Load REU image from open file |
| `uii_save_reu(size)` | DOS1 | Save REU image to open file |
| `uii_mount_disk(id, name)` | CONTROL | Mount disk image on IEC drive |
| `uii_unmount_disk(id)` | CONTROL | Unmount disk image from IEC drive |
| `uii_parse_deviceinfo()` | CONTROL | Detect connected drives, populate `uii_devinfo[]` |
| `uii_enable_drive_a/b()` | CONTROL | Power on emulated drive A/B |
| `uii_disable_drive_a/b()` | CONTROL | Power off emulated drive A/B |
| `uii_get_time()` | TIME | Read RTC time into `uii_data` |
| `uii_set_time(str)` | TIME | Set RTC time from formatted string |
| `uii_tcpconnect(host, port)` | NETWORK | Open TCP socket for NTP |

---

## 8. Data Structures
([Back to contents](#contents))

All fixed-size structures — no dynamic allocation. Maximum 18 slots, 256-char paths, 51-char filenames.

### `SlotStruct` — one boot slot (`include/defines.h`)

~1360 bytes per slot, 18 slots total, stored in REU.

| Field | Type | Size | Purpose |
|-------|------|------|---------|
| `cfgvs` | char | 1 | Config version stamp — must equal `CFGVERSION` (0x02) |
| `path` | char[256] | 256 | USB directory path for the boot file |
| `menu` | char[31] | 31 | Display name in the boot menu |
| `file` | char[51] | 51 | Boot filename |
| `cmd` | char[81] | 81 | Optional BASIC command to execute before boot |
| `reu_image` | char[51] | 51 | REU image filename to preload |
| `reu_path` | char[256] | 256 | USB path to the REU image |
| `reusize` | char | 1 | REU size index (0–7, maps into `reusizelist`) |
| `runboot` | char | 1 | Bitmask of `EXEC_*` flags for boot mode |
| `device` | char | 1 | IEC device ID for boot (8–30) |
| `command` | char | 1 | Bitmask: `COMMAND_CMD`/`COMMAND_REU`/`COMMAND_IMGA`/`COMMAND_IMGB` |
| `image_a_path` | char[256] | 256 | USB path to drive A disk image |
| `image_a_file` | char[51] | 51 | Drive A disk image filename |
| `image_a_id` | char | 1 | IEC device ID for drive A image |
| `image_b_path` | char[256] | 256 | USB path to drive B disk image |
| `image_b_file` | char[51] | 51 | Drive B disk image filename |
| `image_b_id` | char | 1 | IEC device ID for drive B image |
| `padding` | char[13] | 13 | Reserved; pads struct size to multiple of 16 |

**Command flags (`command` field bitmask):**

| Flag | Value | Meaning |
|------|-------|---------|
| `COMMAND_CMD` | 0x01 | Execute user-defined BASIC command before boot |
| `COMMAND_REU` | 0x02 | Preload REU image |
| `COMMAND_IMGA` | 0x04 | Mount drive A disk image |
| `COMMAND_IMGB` | 0x08 | Mount drive B disk image |

**Execute flags (`runboot` field bitmask):**

| Flag | Value | Meaning |
|------|-------|---------|
| `EXEC_MOUNT` | 0x01 | Run from mounted disk (not IEC filesystem) |
| `EXEC_COMMA1` | 0x02 | Load with `,1` (absolute load) |
| `EXEC_DEMO` | 0x10 | Demo mode (power down non-essential drives) |

### `ConfigStruct` — global preferences (`include/defines.h`)

| Field | Type | Purpose |
|-------|------|---------|
| `version` | char | Config file version — must equal `CFGVERSION` (0x02) |
| `timeon` | char | NTP sync enabled: 0=off, 1=on |
| `host` | char[81] | NTP server hostname |
| `secondsfromutc` | long | UTC offset in seconds (e.g. 3600 = UTC+1) |
| `verbose` | char | Verbose startup: 0=silent (spinner), 1=verbose |
| `colors` | ColorPalette | Embedded UI colour palette |

### `ColorPalette` — UI colour scheme (nested in `ConfigStruct`)

| Field | UI element |
|-------|-----------|
| `background` | Screen background |
| `border` | Screen border |
| `header1` | Primary header row |
| `header2` | Secondary header row |
| `text` | Normal body text |
| `text_input` | User input fields |
| `key` | Key/shortcut highlights |
| `diritem_normal` | Directory entry (unselected) |
| `diritem_select` | Directory entry (highlighted) |
| `error` | Error messages |
| `ok` | Success/confirmation messages |

### `DirMeta` / `DirElement` / `Directory` (`src/filebrowse.c`)

These structures are local to `filebrowse.c`. `next`/`prev` fields are raw REU byte addresses (32-bit), not CPU pointers.

**`DirMeta`** — metadata node (16 bytes):

| Field | Purpose |
|-------|---------|
| `next` | REU address of next entry (0 = end of list) |
| `prev` | REU address of previous entry (0 = start) |
| `type` | Entry type: `CBM_T_PRG`, `CBM_T_DIR`, `CBM_T_FREE`, etc. |
| `length` | Filename length in bytes (including null) |
| `select` | Selection flag: 0=unselected, 1=selected |
| `size` | Size in 256-byte blocks (IEC only) |
| `access` | Access flags: `CBM_A_RO`=1, `CBM_A_RW`=3 |
| `stub[5]` | Reserved |

**`DirElement`** — one directory entry:

| Field | Purpose |
|-------|---------|
| `name[51]` | Entry name (ASCII for UCI, PETSCII for IEC) |
| `meta` | Embedded `DirMeta` |

**`Directory`** — active pane state:

| Field | Purpose |
|-------|---------|
| `firstelement` | REU address of list head |
| `firstprint` | REU address of first visible entry (scroll position) |
| `lastprint` | REU address of last visible entry on screen |
| `present` | REU address of currently highlighted entry |
| `drive` | Drive number (0=A, 1=B) |
| `position` | Cursor row (0–18) |
| `path[256]` | Current directory path string |
| `free` | Free blocks on device (IEC only) |
| `address` | Next available REU write address |

### UCI Hardware Structs (`include/ultimate_common_lib.h`)

**`UII_READ`** — read registers at `$DF1C`:

| Field | Offset | Purpose |
|-------|--------|---------|
| `status` | +0 | Status bits (busy, error, data-available) |
| `id` | +1 | Identity byte — `0xC9` = UCI present |
| `respdata` | +2 | Response data FIFO byte |
| `statusdata` | +3 | Status string FIFO byte |

**`UII_WRITE`** — write registers at `$DF1C`:

| Field | Offset | Purpose |
|-------|--------|---------|
| `control` | +0 | Control bits: push, acknowledge, abort, clear |
| `cmddata` | +1 | Command byte to send |

**`DevInfo`** — drive state (array `uii_devinfo[4]`, indexed by target ID − 1):

| Field | Purpose |
|-------|---------|
| `exist` | 0=absent, 1=present |
| `type` | Drive type code |
| `power` | Power state |
| `id` | IEC device ID |

---

## 9. Module Map and Function Reference
([Back to contents](#contents))

### Bank 0 — Common routines (run from RAM at `$0900+`)

#### `src/main.c` — Entry point, global variables, main event loop

| Function | Description |
|----------|-------------|
| `int main(void)` | Cartridge entry point (startcode section). Initialises C64 hardware, copies bank 0 to RAM, calls `mainloop()` |
| `void mainloop(void)` | Main application loop. Initialises VIC/screen/UCI, loads config/slots, dispatches to banked modules via `fc3_call` |

#### `src/core.c` — Utilities: screen, string ops, device detection, execution

| Function | Description |
|----------|-------------|
| `void errorexit(const char *msg)` | Display error message and exit to BASIC |
| `void delay(char seconds)` | Wait for specified seconds using CIA1 time-of-day clock |
| `void mid(const char *src, char start, char length, char *dst, char dstlen)` | MID$-style substring copy |
| `char *pathconcat()` | Concatenate `path[]` array to a single path string; uses `uii_get_path()` in UCI mode |
| `char getkey(char mask)` | Wait for keypress; mask controls which key groups are accepted |
| `void cwin_putat_string_reverse(CharWin *, char x, char y, const char *str, char color)` | Print string in reverse video at screen position |
| `void headertext(const char *subtitle, char time)` | Draw two-line header with title and optional time display |
| `void spinning(char posx, char posy, char cont)` | Draw animated spinner for silent-mode progress indication |
| `char iec_present(char id)` | Test if IEC device `id` responds |
| `char CheckIfUltimateOnID(char id)` | Test if IEC device `id` is an Ultimate emulated drive |
| `char CheckActiveIECdevices()` | Scan IEC bus, populate `iec_devices[]` with active device flags |
| `char dosCommand(char lfn, char drive, char sec_addr, const char *cmd)` | Send DOS command string to an IEC device |
| `char cmd(char device, const char *cmd)` | Send directory change command to IEC device |
| `const char *getDeviceType(char device)` | Detect and return device type string for IEC device |
| `void DoDemoMode()` | Power down all Ultimate emulated drives not on ID 8 |
| `void execute(char *prg, char device, char boot, char *command)` | Build BASIC LOAD+RUN command sequence in keyboard buffer and exit to BASIC |
| `signed textInput(char xpos, char y, char width, char *str, char size, char val)` | Interactive in-place text input field |

#### `src/fileio.c` — Config/slot persistence: REU ↔ USB via UCI

| Function | Description |
|----------|-------------|
| `void CheckStatus(const char *message)` | Check UCI status; call `errorexit()` on failure |
| `void get_slot_from_reu(char number)` | DMA load slot `n` from REU into `Slot` global |
| `void save_slot_to_reu(char number)` | DMA store `Slot` global to slot `n` in REU |
| `void write_slotsfile(char verbose)` | Write all 18 slots from REU to `dmbslt.cfg` via UCI in 500-byte chunks |
| `void read_slotsfile(char verbose)` | Read `dmbslt.cfg` via UCI into REU; create default file if absent; version-check |
| `void writeconfigfile()` | Write `ConfigStruct` to `dmbcfg.cfg` via UCI |
| `void readconfigfile()` | Read `dmbcfg.cfg` via UCI into `cfg`; create defaults if absent; version-check |

#### `src/petscii_ascii.c` — Character set conversion

| Function | Description |
|----------|-------------|
| `char *AscToPet(char *ascii)` | Convert ASCII string to PETSCII in-place; returns pointer to result |

---

### Bank 1 — Slot menu UI (`bcode1`/`bdata1`)

#### `src/slotmenu.c` — Boot menu, slot editing, boot execution

| Function | Description |
|----------|-------------|
| `char menuslotkey(char slotnumber)` | Convert slot number (0–17) to display key character ('0'–'9', 'a'–'h') |
| `char keytomenuslot(char keypress)` | Convert keypress character to slot number |
| `void menuslotnumnerprint(char slotnumber)` | Print slot key label in reverse video at menu position |
| `void presentmenuslots()` | Render all 18 slot entries on screen |
| `void mainmenu()` | Draw boot menu; block until valid key pressed; set `menuselect` |
| `void pickmenuslot()` | Prompt user to choose a slot for saving a filebrowser selection |
| `void ErrorCheckMmounting()` | Check UCI status after mount operations; call `errorexit()` on failure |
| `void mountimage(char device, char *path, char *image)` | Change UCI directory and mount named disk image on IEC device |
| `void ToggleDrivePower(char ab, char on)` | Power Ultimate emulated drive A or B on or off |
| `void runbootfrommenu(char select)` | Execute the boot sequence for slot `select`: mount images, load REU, execute program |
| `char deletemenuslot()` | Interactive: choose and delete a slot; returns 1 if deleted |
| `char renamemenuslot()` | Interactive: choose and rename a slot; returns 1 if changed |
| `void printnewmenuslot(char pos, char select, char *name)` | Render a single slot entry (selected or normal style) during reorder |
| `char reordermenuslot()` | Interactive: reorder slots with cursor keys; circular wrap; returns 1 if changed |
| `char edituserdefinedcommand()` | Interactive: edit the BASIC command field of a slot; returns 1 if changed |
| `void editmenuoptions()` | Top-level edit menu dispatcher (F1 rename, F2 command, F3 reorder, F5 delete) |
| `void information()` | Show credits/info screen with sprite logo |

#### `src/time.c` — NTP time sync, colour scheme editor, configuration UI

| Function | Description |
|----------|-------------|
| `char CheckStatusTime()` | Check UCI network status after NTP operations |
| `char *UNIX_epoch_to_UII_time(time_t epoch)` | Convert Unix timestamp to Ultimate RTC time string format |
| `void get_ntp_time()` | Open UDP socket, send NTP request, receive response, parse and set RTC |
| `void time_main()` | Entry point for NTP sync at boot; calls `get_ntp_time()` if `cfg.timeon` |
| `char getcolor(char option)` | Return the current colour value for colour scheme element `option` (1–11) |
| `void pushcolor(char option, char color)` | Set colour scheme element `option` to `color` in `cfg.colors` |
| `char editcolors()` | Interactive colour scheme editor; returns 1 if changes made |
| `void edittimeconfig()` | Top-level configuration menu (F1 NTP toggle, F2 verbose, F3 offset, F5 host, F6 colours) |

#### `src/splash.c` — Startup splash screen

| Function | Description |
|----------|-------------|
| `void show_splash_screen()` | Switch to uppercase charset, display 40×25 splash from ROM data, wait up to 2 seconds for keypress, restore lowercase charset and black colours |

---

### Bank 2 — File browser (`bcode2`/`bdata2`)

#### `src/filebrowse.c` — Directory listing, file selection, disk mounting

| Function | Description |
|----------|-------------|
| `void dir_close(char lfn)` | Close an IEC directory channel |
| `char dir_open(char lfn, char device)` | Open IEC directory for reading; skip BASIC load address bytes |
| `void dir_get_element(unsigned long addr)` | DMA load `DirElement` from REU address into `presentdirelement` |
| `void dir_save_element(unsigned long addr)` | DMA store `presentdirelement` to REU address |
| `char dir_readentry_iec(DirElement *)` | Read next IEC directory entry from KERNAL channel; parse CBM type from line |
| `char dir_readentry_uci(DirElement *)` | Read next UCI directory entry from UCI stream; detect type from extension |
| `char dir_read(char sort)` | Read all directory entries into REU linked list; optional insertion sort |
| `const char *fileTypeToStr(char ft)` | Convert CBM file type code to 3-character display string |
| `void CheckMounttype(char *dirname)` | Set `mountflag` based on file extension (.d64/.g64/.d71/.g71/.reu etc.) |
| `void dir_print_id_and_path()` | Render directory header: device ID, disk name/path, trace path |
| `void dir_print_entry(char printpos)` | Render one directory entry line at screen row `printpos` |
| `void dir_draw(char readdir)` | Full directory redraw; optionally re-read directory first |
| `void browse_menu(void)` | Draw key-reference side panel and status toggles |
| `char dir_changedir(char *dirname)` | Navigate into directory or disk image; handles UCI/IEC/mount cases |
| `void browse_updatescreen()` | Clear and fully redraw browser screen |
| `void FindFirstIECDrive()` | Scan IEC bus for first active drive and open its directory |
| `void dir_go_down()` | Scroll cursor down one entry; page if at bottom of screen |
| `void dir_go_up()` | Scroll cursor up one entry; page if at top of screen |
| `void dir_last_of_page()` | Move cursor to last entry on current screen page |
| `void dir_pagedown()` | Advance one full page of entries |
| `void dir_pageup()` | Go back one full page of entries |
| `void dir_top()` | Jump to first entry in directory |
| `void dir_bottom()` | Jump to last entry in directory |
| `void mainLoopBrowse(void)` | Main file browser event loop; starts in UCI mode; exits with `fb_selection_made` set |

---

### Standalone binary — `src/uboot_upd12.c`

Compiled separately as `uboot_upd12.prg`. A standalone C64 PRG (not a cartridge) that migrates v1 configuration files to the v2 format.

| Function | Description |
|----------|-------------|
| `void error(const char *msg)` | Display error and halt |
| `void cwin_putat_string_reverse(...)` | Local copy — same as core.c version |
| `void headertext(const char *subtitle, char time)` | Local copy — same as core.c version |
| `void CheckStatus(const char *message)` | Local copy — UCI status check |
| `void write_slotsfile()` | Write converted slots to v2 format `dmbslt.cfg` |
| `void writeconfigfile()` | Write converted config to v2 format `dmbcfg.cfg` |
| `void read_old_configfile()` | Read v1 `dmbcfg.cfg` into old struct |
| `void read_old_slotsfile()` | Read v1 `dmbslt.cfg` into array of old slot structs |
| `void convert_slot_data()` | Convert each slot from v1 format to v2 `SlotStruct` layout |
| `int main(void)` | Top-level: read v1 files, convert, write v2 files |

---

## 10. Startup Flow
([Back to contents](#contents))

```
main()  [startcode, bank 0 ROM $8060]
  │  C64 hardware init (CIA, VIC, KERNAL via inline ASM)
  │  Copy fc3control ($8200–$8300) → RAM $C000
  │  Copy bank0 ($8300–$C000) → RAM $0900
  └─► mainloop()  [code section, runs from RAM $0900+]
        │  Init VIC, screen (cwin_init), sprite
        │  fc3_call(1, show_splash_screen)   [bank 1]
        │  uii_detect() — abort if no UCI
        │  Wait for USB ready (uii_change_dir loop with CIA timeout)
        │  readconfigfile()                  [bank 0]
        │  Apply colour scheme, set verbose mode
        │  uii_identify(), print firmware info
        │  read_slotsfile()                  [bank 0]
        │  uii_parse_deviceinfo() — detect drives
        │  fc3_call(1, time_main)            [bank 1] — NTP sync if enabled
        └─► do/while loop:
              fc3_call(1, mainmenu)          [bank 1]
              ├─ slot key → runbootfrommenu() [bank 1 func, called from bank 0]
              ├─ F1 → fc3_call(2, mainLoopBrowse) [bank 2]
              │         └─ if selection: fc3_call(1, pickmenuslot) [bank 1]
              ├─ F2 → fc3_call(1, information) [bank 1]
              ├─ F3 → fc3_call(1, editmenuoptions) [bank 1]
              ├─ F5 → fc3_call(1, edittimeconfig) [bank 1]
              └─ F7 → fc3_exit() → return to BASIC
```

---

## 11. Key Design Considerations
([Back to contents](#contents))

### No Dynamic Allocation

All data structures are fixed-size. The maximum is bounded at compile time:
- 18 slots × ~1360 bytes = ~24.5 KB in REU
- Directory listing grows dynamically within REU but is bounded by detected REU size
- All string buffers have explicit maximum sizes with `MAXPATHLEN` (256), `MAXFILENAME` (51), `MAXCOMMAND` (81), `MAXMENUNAME` (31), `MAXHOSTLENGTH` (81)

### Character Encoding Boundary

Filenames from UCI arrive in ASCII. The UI uses PETSCII. The conversion point is always at the UCI boundary:
- `AscToPet()` in `src/petscii_ascii.c` converts ASCII → PETSCII for display
- Raw ASCII names are stored in `DirElement.name` for use when passing back to UCI
- IEC drives deliver PETSCII natively; no conversion needed

### strncpy Safety Convention

All `strncpy` calls are immediately followed by explicit null-termination of the last byte:
```c
strncpy(dest, src, MAXLEN - 1);
dest[MAXLEN - 1] = 0;
```
This guards against the case where `src` fills the entire buffer without a null.

### Keyboard Stuffing for Program Execution

Program execution does not use a BASIC interpreter call. Instead, `execute()` in `core.c` builds a string of BASIC commands (LOAD, RUN) and ENTER keypresses into `execute_commands[200]`, then calls `fc3_exit()`. The FC3 exit routine leaves the keyboard buffer primed with these commands, which BASIC then executes naturally at the READY prompt.

### IEC vs UCI Mode

The file browser supports two distinct modes selected by `fb_uci_mode`:
- **UCI mode** (`fb_uci_mode = 1`): browses the Ultimate's native USB filesystem via UCI. No device numbers. Full path available via `uii_get_path()`. Entering a disk image auto-mounts it.
- **IEC mode** (`fb_uci_mode = 0`): reads from a standard CBM IEC drive. Requires directory trace (`D` key) to reconstruct path. Device numbers used.

Mode is toggled with **F3** and switches back automatically when exiting a mounted disk image.

### REU as a Pointer-Based Heap

The file browser uses REU addresses as if they were 32-bit pointers into a flat memory space. The `next` and `prev` fields of `DirMeta` hold raw REU byte addresses. Navigation is always via DMA: to follow a link, call `dir_get_element(meta.next)` which DMA-loads the target element into `presentdirelement`.

This pattern avoids CPU-address space exhaustion for large directories while keeping the code structure similar to a standard linked list.

### Verbose vs Silent Startup

The `cfg.verbose` flag controls startup feedback:
- `verbose = 1`: each startup step prints a text line describing what is happening
- `verbose = 0`: a single `spinning()` animation plays at position (25, 3) while the same steps proceed silently

The config file is read before printing any verbose feedback so that the user's preference takes effect for the very first feedback line.

### Sprite Logo

The sprite is defined in `main.c` as `logo_sprite[64]` in the startcode ROM section, copied to `SpriteData` at `$0340` (the cassette buffer area, repurposed) on startup. It is displayed briefly during the information screen and disabled immediately before the main menu loop begins.

---

## 12. Oscar64 Compiler Quirks and Workarounds
([Back to contents](#contents))

This section documents every known Oscar64 limitation, miscompilation, or non-obvious requirement encountered during development of UBoot64 v2, along with the applied workaround and the location in the source code where it appears.

---

### 12.1 `for`/`continue` Miscompilation — Buffer Zeroing

**Bug:** In certain patterns involving a `for` loop with a `continue` statement, Oscar64's optimiser incorrectly zeroes the contents of a buffer that is referenced inside the loop body before `continue` fires. The result is that subsequent code reading from that buffer sees all-zero data.

**Trigger pattern:**

```c
// BROKEN — Oscar64 zeroes linebuffer before X() can read it
for (len = i; len > 0; len--)
{
    b = linebuffer[len - 1];
    if (b != 0 && b != ' ' && b != 0xA0)
        continue;  // <-- triggers miscompilation
    // ...
}
```

**Symptom:** The IEC directory entry type detection in `dir_readentry_iec()` always fell through to `CBM_T_HEADER` regardless of the actual file extension, because `linebuffer` was all-zero when the type-detection code ran.

**Workaround:** Replace the `for`/`continue` with a `while`/`break`:

```c
// CORRECT — plain while+break avoids the miscompilation
len = i;
while (len > 0)
{
    b = linebuffer[len - 1];
    if (b != 0 && b != ' ' && b != 0xA0)
        break;
    len--;
}
```

**Location:** `src/filebrowse.c`, `dir_readentry_iec()`, around line 294.

---

### 12.2 `__noinline` Required to Control Section Placement of Large Functions

**Quirk:** When Oscar64 inlines a function, the inlined code is placed into the section active at the call site, not the section declared at the function's definition. For `mainloop()`, which must reside in the bank 0 `code` section (copied to RAM at `$0900`), being inlined into `main()` would place it in the `startcode` section (ROM at `$8060`), where it would be unreachable after the bank copy.

**Workaround:** Mark `mainloop()` with `__noinline` to force Oscar64 to always emit it as a separate function in the section where it is defined:

```c
__noinline void mainloop(void)
// Main loop
```

**Why `mainloop()` specifically:** It is the largest function in the project and the natural inlining candidate when called only once from `main()`. All other functions are called from multiple call sites and are not inlined.

**Location:** `src/main.c`, line 160.

---

### 12.3 `volatile char *` Required for All `reu_load` / `reu_store` Calls

**Quirk:** Oscar64's optimiser treats regular pointer arguments as pointing to stable memory. Since REU DMA operates outside the CPU's view of memory, the compiler does not know that a `reu_store` writes data that a subsequent `reu_load` from the same address will read back. Without `volatile`, the optimiser can legally cache values across DMA calls or eliminate what it considers redundant reads.

**Workaround:** Cast all buffer arguments to `(volatile char *)` at every `reu_load` / `reu_store` call site:

```c
reu_load(workaddress, (volatile char *)&presentdirelement.meta,
         sizeof(presentdirelement.meta));
reu_store(previous, (volatile char *)&present, sizeof(present));
```

This suppresses the optimisation and forces the compiler to re-read or re-write the pointed-to memory around every DMA call.

**Location:** `src/filebrowse.c`, all `reu_load` / `reu_store` call sites (~12 occurrences).

---

### 12.4 `volatile` Required on All Memory-Mapped I/O Struct Fields

**Quirk:** The UCI hardware registers are memory-mapped at `$DF1C–$DF1F`. If the struct fields are not declared `volatile`, Oscar64 may cache a register read in a CPU register and reuse the cached value on subsequent reads, missing hardware state changes that occur between C statements.

**Workaround:** All fields in `UII_READ` and `UII_WRITE` are declared `volatile`:

```c
struct UII_READ {
    volatile char status;
    volatile char id;
    volatile char respdata;
    volatile char statusdata;
};

struct UII_WRITE {
    volatile char control;
    volatile char cmddata;
};
```

The bank-switching register at `$DFFF` (the `fc3` macro in `include/fc3.h`) is likewise declared volatile:

```c
#define fc3 (*(volatile char *)0xdfff)
```

**Location:** `include/ultimate_common_lib.h` (UCI registers), `include/fc3.h` (banking register).

---

### 12.5 Inline Assembly Required for KERNAL Calls with Non-Standard Register Conventions

**Quirk:** Several C64 KERNAL routines use register conventions that Oscar64's C calling convention cannot express, or require precise stack state that a normal C call would disturb. These routines cannot be called from C without inline `__asm` blocks.

**Cases in this project:**

**IEC bus presence detection** (`iec_present()`, `src/core.c`):  
Uses LISTEN (`$FFB1`), SECOND (`$FF93`), and UNLSN (`$FFAE`) with the device ID in the accumulator and reads the KERNAL status register at `$0090`. The result is returned by writing directly to the `accu` pseudo-register (Oscar64's inline-assembly return value variable):

```c
__asm
{
    lda id
    ldy #0
    sty $90         // clear KERNAL status register
    jsr $FFB1       // LISTEN
    lda #$ff
    jsr $FF93       // SECOND
    lda $90         // read status
    bpl iec_pres_active
    jsr $FFAE       // UNLSN
    lda #0
    sta accu
    rts
iec_pres_active:
    jsr $FFAE
    lda #1
    sta accu
    rts
}
```

**C64 hardware initialisation** (`main()`, `src/main.c`):  
The full KERNAL init sequence (init I/O, prepare IRQ, set memory pointers, init video) must be called via `jsr` with specific preconditions — register values, stack pointer, and zero-page pointers — that cannot be set up by Oscar64's C preamble:

```c
__asm
{
    sei
    ldx #$FF
    txs
    jsr $FDA3   // Init I/O
    jsr $FF84   // Prepare IRQ
    // ... set memory pointers ...
    jsr $FD15   // Init I/O (second pass)
    jsr $FF5B   // Init video
    cli
}
```

**Charset switching** (`main()`, `splash.c`):  
Switching between uppercase and lowercase character sets requires calling KERNAL BSOUT (`$FFD2`) with a control code in the accumulator. Oscar64 has no intrinsic for BSOUT:

```c
// Switch to lowercase charset
__asm { lda #14; jsr $FFD2 }

// Switch to uppercase charset
__asm { lda #142; jsr $FFD2 }
```

**Locations:** `src/core.c` (`iec_present()`), `src/main.c` (`main()` startup block), `src/splash.c` (`show_splash_screen()`).

---

### 12.6 `#pragma code`/`#pragma data` Must Precede All Definitions in a File

**Quirk:** Oscar64 processes section pragmas as they are encountered during the single compilation pass. Any variable or function definition that appears before the section pragma is placed into whatever section was active at that point — typically the default BSS or code section, not the intended bank.

**Rule:** Every source file that targets a specific bank must place its `#pragma code(...)` and `#pragma data(...)` directives immediately after the `#include` block, before any `struct`, `static`, variable, or function definition:

```c
// Correct ordering
#include "defines.h"
#include "slotmenu.h"

#pragma code(bcode1)   // All subsequent code → bank 1 ROM
#pragma data(bdata1)   // All subsequent data → bank 1 ROM

char menuslotkey(char slotnumber) { ... }
```

**Special case — `CharWin cw` in `main.c`:** The global `cw` is declared intentionally *before* `#pragma code(code)` so that it lands in the default BSS section (part of the `main` RAM region at `$4900+`) rather than in the bank0 section copied from ROM. This keeps `cw` permanently in RAM and accessible from all banks without occupying space in the bank0 ROM image:

```c
// Regions defined first...
#pragma region(bank0, 0x8300, 0xc000, , 0, { code, data }, 0x0900)

CharWin cw;   // <-- placed in BSS (main region), NOT in bank0

#pragma code(code)    // Only after cw declaration
#pragma data(data)
```

**Location:** `src/main.c` lines 104–110; all other `src/*.c` files for the section ordering rule.

---

### 12.7 `petscii_ascii.c` Must Be in Bank 2, Not Bank 0

**Quirk / design constraint:** `AscToPet()` is only ever called from `src/filebrowse.c` (bank 2). Placing `petscii_ascii.c` in bank 0 (the natural home for shared utilities) would make the 256-byte `ascToPetTable` lookup table and the conversion function consume space in the bank 0 ROM image, which is already under pressure from core utilities, fileio, and the FC3 banking trampoline. A bank 0 placement would also require that each call from bank 2 code goes through RAM (which is fine for bank 0 code), but wastes ROM budget unnecessarily.

**Workaround:** `petscii_ascii.c` declares itself as bank 2:

```c
#pragma code(bcode2)
#pragma data(bdata2)
```

This co-locates the function with its only caller, eliminates any cross-bank call concern, and conserves bank 0 ROM space.

**Consequence:** Code in bank 0 or bank 1 cannot directly call `AscToPet()`. If a future feature needs PETSCII conversion from bank 1, a separate small wrapper or a move to bank 0 would be required.

**Location:** `src/petscii_ascii.c` lines 57–59.

---

### 12.8 `unsigned long` Struct Members Must Be Loaded to a Local Variable Before Conditionals

**Bug:** Oscar64 generates incorrect code when an `unsigned long` struct member is used directly as a boolean condition or in a comparison inside an `if` statement or loop. The most common failure mode is that the check always evaluates as zero (false), regardless of the actual value stored in the struct — which causes navigation through the REU-backed directory list to silently fail.

**Trigger patterns (all broken):**

```c
// BROKEN — direct struct member in if condition
if (!presentdir.firstprint) { ... }
if (presentdir.firstelement && presentdirelement.meta.next) { ... }

// BROKEN — direct struct member in for/while condition
while (presentdirelement.meta.next) { ... }
```

**Workaround:** Always copy the `unsigned long` struct member to a local variable first, then use the local in the condition:

```c
// CORRECT — load to local, then check
unsigned long element;
element = presentdir.firstprint;
if (!element) { ... }

unsigned long nextaddr;
nextaddr = presentdirelement.meta.next;
if (presentdir.firstelement && nextaddr) { ... }
```

The explicit comment in `dir_draw()` documents the root cause:

```c
// Read firstprint into local so the zero-check uses a plain variable
element = presentdir.firstprint;
if (!element)
```

**Where this applies:** Every function in `filebrowse.c` that tests whether a REU list pointer is null before following it. All `unsigned long` values from `DirMeta.next`, `DirMeta.prev`, `Directory.firstprint`, `Directory.firstelement`, `Directory.lastprint`, and `Directory.present` are always loaded into a named local before any boolean check.

**Affected locations** (`src/filebrowse.c`):

| Function | Local variable | Struct member tested |
|----------|---------------|----------------------|
| `dir_draw()` | `element` | `presentdir.firstprint` |
| `dir_draw()` | `nextaddr` | `presentdirelement.meta.next` |
| `dir_go_down()` | `nextaddr` | `presentdirelement.meta.next` |
| `dir_go_up()` | `prevaddr` | `presentdirelement.meta.prev` |
| `dir_last_of_page()` | `nextaddr` | `presentdirelement.meta.next` |
| `dir_pagedown()` | `nextaddr` | `presentdirelement.meta.next` (×2) |
| `dir_pageup()` | `prevaddr` | `presentdirelement.meta.prev` (×2) |
| `dir_bottom()` | `nextaddr` | `presentdirelement.meta.next` (×3) |
| `dir_bottom()` | `prevaddr` | `presentdirelement.meta.prev` |

**Rule for new code:** Never write `if (some_struct.long_field)`, `if (!some_struct.long_field)`, or `while (some_struct.long_field)` when the field is `unsigned long`. Always use an intermediate local.

---

### 12.9 `printf`/`sprintf` Does Not Support the Precision Field

**Limitation:** Oscar64's `printf`/`sprintf` implementation does not support the `.precision` format field. Both the fixed form `"%.16s"` (truncate string to 16 characters) and the dynamic form `"%.*s"` (precision from argument) are silently ignored or produce incorrect output.

This is separate from the `-dNOFLOAT` flag removing float support — even with floats enabled, string precision (`%.Ns`) does not work.

**Broken patterns:**

```c
// BROKEN — %.16s truncation silently ignored
sprintf(buf, "%-16.16s", longname);

// BROKEN — dynamic precision also not supported
cwin_console_printf(&cw, color, "%.*s", width - 1, str + offs);

// BROKEN — %.40s to cap hostname display
cwin_console_printf(&cw, color, "%.40s", cfg.host);
```

**Workaround:** Pre-truncate the string into a fixed-size local buffer using `strncpy` with an explicit null termination, then pass the buffer to `printf`/`sprintf` with a plain `%s`:

```c
// CORRECT — manual truncation before %s
char namebuffer[17];
strncpy(namebuffer, presentdirelement.name, 16);
namebuffer[16] = 0;
sprintf(linebuffer, "%-16s", namebuffer);     // safe: buffer is already bounded
```

For display of fields that must be length-limited at the point of printing, use a scoped temporary buffer:

```c
// CORRECT — scoped buffer for hostname display (time.c)
{
    char hostbuf[41];
    strncpy(hostbuf, cfg.host, 40);
    hostbuf[40] = 0;
    cwin_console_printf(&cw, color, "- NTP server hostname:\n%s\n", hostbuf);
}
```

For windowed text input where the visible slice width varies at runtime, copy the relevant slice into `linebuffer` first:

```c
// CORRECT — slide-window copy, then print as plain %s (core.c textInput)
strncpy(linebuffer, str + offs, width - 1);
linebuffer[width - 1] = 0;
cwin_console_printf(&cw, color, "%s", linebuffer);
```

**Affected locations:**

| File | Function | Workaround applied |
|------|----------|--------------------|
| `src/filebrowse.c` | `dir_print_entry()` | `strncpy(namebuffer, name, 16); namebuffer[16]=0` before `"%-16s"` |
| `src/filebrowse.c` | `dir_print_entry()` | `strncpy(namebuffer, name, 21); namebuffer[21]=0` before `"%-21s"` |
| `src/time.c` | `edittimeconfig()` | Scoped `hostbuf[41]` + `strncpy` before printing hostname |
| `src/core.c` | `textInput()` | `strncpy(linebuffer, str+offs, width-1); linebuffer[width-1]=0` before `"%s"` |

**Rule for new code:** Never use `%.Ns` or `%.*s` in any format string. Always truncate the source string manually before passing it to `sprintf`, `printf`, or `cwin_console_printf`.

---

### 12.10 Summary Table

| # | Category | File(s) | Workaround |
|---|----------|---------|-----------|
| 12.1 | Miscompilation: `for`/`continue` zeroes buffer | `filebrowse.c` | Replace with `while`/`break` |
| 12.2 | Inlining moves code to wrong ROM section | `main.c` | `__noinline` on `mainloop()` |
| 12.3 | Optimiser elides DMA reads/writes | `filebrowse.c` | `(volatile char *)` cast on all `reu_load`/`reu_store` args |
| 12.4 | Optimiser caches memory-mapped I/O reads | `ultimate_common_lib.h`, `fc3.h` | `volatile` on all register fields |
| 12.5 | KERNAL call register conventions | `core.c`, `main.c`, `splash.c` | `__asm { ... }` inline blocks |
| 12.6 | Section pragma must precede all definitions | All `src/*.c` | Strict include-then-pragma-then-code ordering; `cw` declared before pragma deliberately |
| 12.7 | Bank 0 ROM space budget | `petscii_ascii.c` | Placed in bank 2 alongside its only caller |
| 12.8 | `unsigned long` struct members in conditionals | `filebrowse.c` | Load to local variable before any `if`/loop check |
| 12.9 | `printf`/`sprintf` precision specifier not supported | All files | Pre-truncate with `strncpy` + explicit null, then use `%s` |

---

## 13. Porting from cc65 (v1) to Oscar64 (v2)
([Back to contents](#contents))

This section catalogues every major category of source change required to migrate UBoot64 from the cc65 toolchain (v1) to Oscar64 (v2). Each category includes a concrete before/after example drawn from the actual v1 and v2 source.

---

### 13.1 Build System: Linker Script → In-Source Pragmas

**cc65 (v1):** The build used two separate tools — `cl65` (compiler) and `ld65` (linker) — plus a linker configuration file (`.cfg`) that named all memory segments (`CODE`, `RODATA`, `DATA`, `BSS`, `CODE1`, `CODE2`, `CODE3`, etc.) and mapped them to FC3 ROM banks. Each source file declared which segment to use via `#pragma code-name` and `#pragma rodata-name`.

**Oscar64 (v2):** A single compiler pass produces the complete cartridge image. Memory layout is declared entirely in source via `#pragma section` and `#pragma region` in `main.c`. No linker script exists.

```c
// v1 cc65 — pragma uses string segment names from .cfg file
#pragma code-name  ("CODE2");
#pragma rodata-name("RODATA2");

// v2 Oscar64 — pragma uses section names defined by region directives
#pragma code(bcode1)
#pragma data(bdata1)
```

The `#pragma compile("file.c")` mechanism in Oscar64 headers replaces the explicit list of source files passed to the cc65 compiler/linker on the command line.

---

### 13.2 Banking: `bankrun()`/`bankout()` → `fc3_call()`/`fc3_exit()`

**cc65 (v1):** Each bank had a single predefined entry point. Cross-bank calls were only possible to those entry points via `bankrun(N)`. The function called on the other bank had no parameters and no return value. `bankout()` exited the cartridge to BASIC.

**Oscar64 (v2):** Any function in any bank can be called directly by name via `fc3_call(bank, function)`. Parameters and return values are passed through shared RAM globals. `fc3_exit()` exits to BASIC.

```c
// v1 cc65 — jump to bank 1's fixed entry point, no function specified
bankrun(1);

// v2 Oscar64 — call a specific named function in bank 1
fc3_call(1, mainLoopBrowse);
fc3_call(1, pickmenuslot);   // any function can be a cross-bank target
```

---

### 13.3 Screen I/O: `conio.h` → CharWin Library

**cc65 (v1):** Screen output used the cc65 `<conio.h>` library, which provides cursor positioning, colour setting, and character output functions that write directly to the C64 screen RAM. These are procedural calls with global implicit state (current colour, cursor position).

**Oscar64 (v2):** Screen output uses Oscar64's `<c64/charwin.h>` CharWin library, which wraps a `CharWin` struct describing a window region. All output functions take a `CharWin*` and a colour argument explicitly.

| cc65 function | Oscar64 equivalent |
|---------------|--------------------|
| `cgetc()` | `cwin_getch()` |
| `cprintf(fmt, ...)` | `cwin_console_printf(&cw, color, fmt, ...)` |
| `cputs(str)` | `cwin_put_string(&cw, str, color)` |
| `cputsxy(x, y, str)` | `cwin_putat_string(&cw, x, y, str, color)` |
| `gotoxy(x, y)` | `cwin_cursor_move(&cw, x, y)` |
| `textcolor(c)` | (pass `color` per-call) |
| `revers(1)` / `revers(0)` | `cwin_putat_string_reverse(...)` |
| `clrscr()` | `cwin_clear(&cw)` |
| `bgcolor(c)` / `bordercolor(c)` | `vic.color_back = c` / `vic.color_border = c` |

```c
// v1 cc65
textcolor(DMB_COLOR_HEADER1);
revers(1);
gotoxy(0, 0);
cprintf("UBoot64:  Boot Menu for Ultimate devices");
revers(0);

// v2 Oscar64
cwin_putat_string_reverse(&cw, 0, 0,
    "UBoot64:  Boot Menu for Ultimate devices",
    cfg.colors.header1);
```

A one-time `cwin_init(&cw, (char *)0x0400, 0, 0, 40, 25)` call replaces cc65's implicit screen initialisation. The `cw` global must be initialised before any CharWin call.

---

### 13.4 Type Names: `BYTE`/`int` → `char`/`unsigned char`

**cc65 (v1):** Used the cc65 `BYTE` typedef (equivalent to `unsigned char`) pervasively, and used `int` for loop counters and function return values where a smaller type would suffice.

**Oscar64 (v2):** Uses `char` and `unsigned char` directly. All loop counters, flags, and small return values are `char` or `unsigned char`. Using `int` (16-bit) or larger types on a 6502 costs significantly more cycles; Oscar64 optimises better when narrow types are used.

```c
// v1 cc65
BYTE pathdevice;
BYTE depth = 0;
int keytomenuslot(char keypress)  { ... }
for (int x = 0; x < 18; ++x)     { ... }

// v2 Oscar64
char pathdevice;
char depth = 0;
char keytomenuslot(char keypress) { ... }
for (char x = 0; x < 18; ++x)    { ... }
```

`size_t` (used for string lengths in `mid()`) was replaced with `char` since no string in this project exceeds 256 bytes.

---

### 13.5 Standard Headers: cc65-Specific → Oscar64-Specific

**cc65 (v1)** used these cc65-only C64 headers:

| cc65 header | Purpose |
|-------------|---------|
| `<cbm.h>` | CBM file I/O, device functions |
| `<conio.h>` | Screen I/O (see §13.3) |
| `<device.h>` | `getcurrentdevice()` |
| `<c64.h>` | C64 hardware registers (VIC, CIA, SID structs) |
| `<errno.h>` | Error codes |

**Oscar64 (v2)** uses these Oscar64 C64 headers:

| Oscar64 header | Purpose |
|----------------|---------|
| `<c64/vic.h>` | VIC-II registers (`vic.color_back`, `vic.color_border`, `vic_setmode()`) |
| `<c64/cia.h>` | CIA registers (`cia1.tods`, `cia1.todt`) |
| `<c64/charwin.h>` | CharWin screen library |
| `<c64/memmap.h>` | Memory banking (`mmap_set(MMAP_ROM)`) |
| `<c64/types.h>` | C64 type aliases |
| `<c64/sprites.h>` | Sprite control (`spr_init`, `spr_set`, `spr_show`) |
| `<c64/reu.h>` | REU DMA (`reu_load`, `reu_store`) |
| `<c64/kernalio.h>` | KERNAL I/O (`krnio_open`, `krnio_chkin`, `krnio_chrin`, `krnio_close`) |

`<stdio.h>`, `<string.h>`, `<stdlib.h>`, `<ctype.h>`, and `<time.h>` remain but with reduced functionality — most notably no float in printf (see §13.10), and no `malloc`/`free` (see §13.6).

---

### 13.6 Memory Management: Dynamic Heap → REU-Backed Fixed Storage

**cc65 (v1):** All 18 slot records were allocated as a contiguous heap block at startup and accessed via a moving pointer:

```c
// v1 cc65 — dynamic allocation in RAM
FirstSlot = calloc(19, SLOTSIZE);   // allocate 18 slots in RAM heap
if (!FirstSlot) { errorexit(); }

// Traverse slots via pointer arithmetic
Slot = FirstSlot;
for (x = 0; x < 18; ++x) {
    uii_write_file((unsigned char *)Slot, SLOTSIZE);
    Slot++;                         // advance to next slot
}
free(FirstSlot);                    // release on exit
```

**Oscar64 (v2):** No `malloc`/`free`. All slot data lives in REU. A single global `Slot` struct acts as a working buffer. Access is via explicit DMA:

```c
// v2 Oscar64 — fixed storage in REU, single working buffer
get_slot_from_reu(x);              // DMA load slot x into global Slot
// ... work with Slot ...
save_slot_to_reu(x);               // DMA store Slot back to REU
```

This change was driven by two factors: Oscar64 does not generate efficient heap code for 6502, and the expanded slot struct (256-byte path fields) made 18 × ~1360 bytes too large to fit in the 64 KB C64 address space alongside the program itself.

---

### 13.7 Directory Listing: CPU Pointer Linked List → REU Address Linked List

**cc65 (v1):** Directory entries were a standard C linked list in RAM. `next` and `prev` were genuine CPU pointers. Traversal was pointer dereference:

```c
// v1 cc65 — standard CPU pointer linked list in RAM
struct DirElement {
    struct cbm_dirent dirent;
    struct DirElement *next;    // CPU pointer
    struct DirElement *prev;    // CPU pointer
};
struct DirElement *allocDir() {
    return (struct DirElement *)malloc(sizeof(struct DirElement));
}
// Traverse: current = current->next;
```

**Oscar64 (v2):** Directory entries are stored in REU. `next` and `prev` hold raw REU byte addresses. Traversal requires a DMA load:

```c
// v2 Oscar64 — REU address linked list
struct DirMeta {
    unsigned long next;   // REU byte address of next entry
    unsigned long prev;   // REU byte address of previous entry
    ...
};
// Traverse: dir_get_element(presentdirelement.meta.next);
//           — this performs a DMA reu_load into presentdirelement
```

This change lifted the practical directory size limit from a few hundred entries (constrained by RAM) to many thousands (constrained only by REU size), at the cost of requiring a DMA round-trip per entry access.

---

### 13.8 UCI Success Check: `uii_success()` → `UII_SUCCESS`

**cc65 (v1):** Success was checked by calling a function:

```c
// v1 cc65
if (!uii_success()) { errorexit(); }
```

**Oscar64 (v2):** Success is a preprocessor macro that directly inspects the status buffer:

```c
// v2 Oscar64
if (!UII_SUCCESS) { errorexit(""); }
// expands to: uii_status[0]=='0' && uii_status[1]=='0'
```

All call sites must be updated. The macro form avoids a function call overhead and is more readable at the call site.

---

### 13.9 Hardware Register Access: `<c64.h>` Structs → Oscar64 Named Structs

**cc65 (v1):** Used cc65's `<c64.h>` register names (CIA time-of-day, VIC colours):

```c
// v1 cc65
cia_seconds   = 0;          // CIA1 TOD seconds register
cia_tensofsec = 0;          // CIA1 TOD tenths register
while (cia_seconds < seconds) { ; }

VIC.bgcolor0    = COLOR_BLACK;
VIC.bordercolor = COLOR_BLACK;
```

**Oscar64 (v2):** Uses Oscar64's typed structs from `<c64/cia.h>` and `<c64/vic.h>`:

```c
// v2 Oscar64
cia1.tods = 0;              // CIA1 TOD seconds
cia1.todt = 0;              // CIA1 TOD tenths
while (cia1.tods < seconds) { ; }

vic.color_back   = VCOL_BLACK;
vic.color_border = VCOL_BLACK;
```

---

### 13.10 Printf Newline Convention and Float Support

**cc65 (v1):** Used `\n\r` (newline + carriage return) in all `printf`/`cprintf` format strings, as required by the cc65 PETSCII output routines. Full `printf` including floating-point and precision specifiers was available.

**Oscar64 (v2):** `cwin_console_printf()` requires only `\n`; the CharWin library handles cursor advancement. Float support is disabled project-wide by the `-dNOFLOAT` compiler flag. Precision specifiers (`%.Ns`) are not supported (see §12.9).

```c
// v1 cc65
printf("\n\rI/O error in %s.\n\r", message);
printf("Writing slot data at %ld.\n\r", count);

// v2 Oscar64
cwin_console_printf(&cw, cfg.colors.text,
    "\nI/O error in %s.\n", message);
cwin_console_printf(&cw, cfg.colors.text,
    "Writing slot data at %ld.", count);
```

All `\n\r` sequences are reduced to `\n`. The colour argument is added to every call. `printf()` is replaced by `cwin_console_printf()` throughout.

---

### 13.11 String Safety: Custom Helper → `strncpy` + Explicit Null

**cc65 (v1):** Used a project-local `StringSafeCopy()` helper that performed a bounds-checked copy:

```c
// v1 cc65
void StringSafeCopy(char *dest, char *src, unsigned char maxlen) {
    strncpy(dest, src, maxlen - 1);
    dest[maxlen - 1] = 0;
}
StringSafeCopy(concat, uii_data, 99);
```

**Oscar64 (v2):** Uses the standard `strncpy` + explicit null pattern directly at each call site (the helper was removed):

```c
// v2 Oscar64
strncpy(concat, uii_data, MAXPATHLEN - 1);
concat[MAXPATHLEN - 1] = 0;
```

The `MAXPATHLEN`, `MAXFILENAME`, etc. constants make the size explicit and consistent without a helper function.

---

### 13.12 Inline Assembly Syntax

**cc65 (v1):** Used GNU-style `__asm__` strings or separate `.s` assembly source files:

```c
// v1 cc65 — inline assembly as a string
__asm__("lda #14\n jsr $FFD2");
```

**Oscar64 (v2):** Uses Oscar64's block `__asm { }` syntax with native assembler mnemonics:

```c
// v2 Oscar64 — block inline assembly
__asm
{
    lda #14
    jsr $FFD2
}
```

Oscar64 `__asm` blocks can reference C local variables by name and use `accu` as the implicit accumulator output register (see §12.5).

---

### 13.13 Slot File I/O: Per-Slot Writes → Chunked REU Transfer

**cc65 (v1):** Slots were small enough (short path strings) to write individually, one per `uii_write_file()` call:

```c
// v1 cc65 — one UCI write per slot
for (x = 0; x < 18; ++x) {
    uii_write_file((unsigned char *)Slot, SLOTSIZE);  // ~128 bytes each
    Slot++;
}
```

**Oscar64 (v2):** Slots expanded to ~1360 bytes each (256-byte path fields), making the total 18 × 1360 ≈ 24 KB. This exceeds the UCI queue limit many times over. Instead, the entire REU slot zone is chunked through a 500-byte buffer:

```c
// v2 Oscar64 — chunked transfer from REU through UCI
while (count < end) {
    reu_load(count, save_buffer, save_length);   // DMA from REU to buffer
    uii_write_file(save_buffer, save_length);    // UCI write ≤ 500 bytes
    count += SAVE_BUF_SIZE;
}
```

The chunk size (`SAVE_BUF_SIZE = 500`) is chosen to stay safely below the UCI data queue limit of 512 bytes.

---

### 13.14 Summary of Porting Changes

| Category | cc65 (v1) | Oscar64 (v2) |
|----------|-----------|--------------|
| Build | `cl65` + `ld65` + `.cfg` linker script | Single `oscar64` pass, pragmas in source |
| Banking | `bankrun(N)` / `bankout()` | `fc3_call(bank, fn)` / `fc3_exit()` |
| Bank section pragma | `#pragma code-name("CODE2")` | `#pragma code(bcode1)` |
| Screen I/O | `conio.h`: `cprintf`, `gotoxy`, `textcolor` | CharWin: `cwin_console_printf`, `cwin_cursor_move` |
| Key input | `cgetc()` | `cwin_getch()` |
| Type `BYTE` | `typedef unsigned char BYTE` | `char` / `unsigned char` directly |
| Slot storage | `calloc()` in RAM heap, pointer arithmetic | REU via `get/save_slot_from/to_reu()` |
| Directory list | `struct DirElement *next` CPU pointers in RAM | `unsigned long next` REU addresses, DMA traversal |
| UCI success | `uii_success()` function | `UII_SUCCESS` macro |
| CIA time-of-day | `cia_seconds`, `cia_tensofsec` | `cia1.tods`, `cia1.todt` |
| VIC registers | `VIC.bgcolor0`, `VIC.bordercolor` | `vic.color_back`, `vic.color_border` |
| Newline | `"\n\r"` | `"\n"` |
| Float/precision printf | Full `printf` with `%.Nf` etc. | No float (`-dNOFLOAT`), no precision field |
| String safety | `StringSafeCopy()` helper | `strncpy()` + `[n]=0` at each call site |
| Inline ASM | `__asm__("...")` string syntax | `__asm { ... }` block syntax |
| Slot file write | Per-slot `uii_write_file(Slot, SLOTSIZE)` | Chunked 500-byte REU→buffer→UCI loop |
