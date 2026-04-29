# UCI Library Manual

**Ultimate Command Interface Library for UBoot64 v2**

Based on the Ultimate II Dos Lib by Scott Hutter and Francesco Sblendorio.
Adapted for Oscar64 by Xander Mol.

Original documentation: `ultimate_dos-1.2.docx` and `command interface.docx`
https://github.com/markusC64/1541ultimate2/tree/master/doc

---

## Contents

1. [Overview](#1-overview)
2. [Hardware Registers](#2-hardware-registers)
3. [Global Variables and Buffers](#3-global-variables-and-buffers)
4. [Constants and Defines](#4-constants-and-defines)
5. [Protocol Flow](#5-protocol-flow)
6. [Status Codes and Error Handling](#6-status-codes-and-error-handling)
7. [Core Functions](#7-core-functions) (`ultimate_common_lib`)
8. [DOS Functions — File Operations](#8-dos-functions--file-operations) (`ultimate_dos_lib`)
9. [DOS Functions — Directory Operations](#9-dos-functions--directory-operations) (`ultimate_dos_lib`)
10. [Control Functions — Drive Management](#10-control-functions--drive-management) (`ultimate_dos_lib`)
11. [Control Functions — System](#11-control-functions--system) (`ultimate_dos_lib`)
12. [Time Functions](#12-time-functions) (`ultimate_time_lib`)
13. [Network Functions](#13-network-functions) (`ultimate_network_lib`)
14. [Typical Usage Patterns](#14-typical-usage-patterns)

---

## 1. Overview
([Back to contents](#contents))

The Ultimate Command Interface (UCI) is a memory-mapped hardware interface exposed by the Ultimate II+, Ultimate II+ L, and Ultimate 64 cartridges. It provides the C64 CPU with access to the cartridge's file system, network stack, real-time clock, and drive emulation control, all through a small set of I/O registers at `$DF1C–$DF1F`.

The library is split into four files:

| File | Contents |
|------|----------|
| `include/ultimate_common_lib.h/.c` | Hardware register access, protocol engine, detection |
| `include/ultimate_dos_lib.h/.c` | File I/O, directory navigation, REU transfer, drive control, system info |
| `include/ultimate_time_lib.h/.c` | Real-time clock read/write |
| `include/ultimate_network_lib.h/.c` | TCP/UDP sockets, line-by-line stream reading |

All library files are included in the Oscar64 build via `#pragma compile(...)` directives in their respective headers. No explicit inclusion in the Makefile is needed.

---

## 2. Hardware Registers
([Back to contents](#contents))

The UCI exposes four registers mapped at `$DF1C–$DF1F`. The same two addresses serve different purposes for reads and writes.

### Read Registers (`struct UII_READ` at `$DF1C`)

| Offset | Name | Address | Description |
|--------|------|---------|-------------|
| +0 | `status` | `$DF1C` | Status register — bitmask of current UCI state |
| +1 | `id` | `$DF1D` | Identity register — `$C9` when UCI is present |
| +2 | `respdata` | `$DF1E` | Response data FIFO — read one byte at a time |
| +3 | `statusdata` | `$DF1F` | Status string FIFO — read one byte at a time |

### Write Registers (`struct UII_WRITE` at `$DF1C`)

| Offset | Name | Address | Description |
|--------|------|---------|-------------|
| +0 | `control` | `$DF1C` | Control register — write bits to issue commands |
| +1 | `cmddata` | `$DF1D` | Command data — write bytes to build a command packet |

### Status Register Bit Definitions

| Bit | Mask | Meaning when set |
|-----|------|-----------------|
| 0 | `0x01` | Acknowledge active |
| 1 | `0x02` | Acknowledge cleared (ACK done) |
| 2 | `0x04` | Error flag |
| 4 | `0x10` | Command busy |
| 5 | `0x20` | Command accepted / idle |
| 6 | `0x40` | Status data available in `statusdata` FIFO |
| 7 | `0x80` | Response data available in `respdata` FIFO |

Bits 4 and 5 together indicate state: both clear = idle, bit 5 set only = busy.

### Control Register Bit Definitions

| Bit | Mask | Action when written |
|-----|------|---------------------|
| 0 | `0x01` | `PUSH_CMD` — push the command packet and execute |
| 1 | `0x02` | `ACK` — acknowledge response and release UCI |
| 2 | `0x04` | `ABORT` — abort the current operation |
| 3 | `0x08` | `CLR_ERROR` — clear the error flag |

### Queue Sizes

| Queue | Size | Constant |
|-------|------|----------|
| Command data queue | 512 bytes (actual hardware: 896) | `DATA_QUEUE_SZ` |
| Status string queue | 256 bytes | `STATUS_QUEUE_SZ` |

The `DATA_QUEUE_SZ` constant is set conservatively to 512 to limit RAM usage. The actual UCI hardware queue is 896 bytes. Increase `DATA_QUEUE_SZ` in `ultimate_common_lib.h` if larger transfers are needed (e.g. for networking).

---

## 3. Global Variables and Buffers
([Back to contents](#contents))

All global variables are defined in `ultimate_common_lib.c` and declared `extern` in `ultimate_common_lib.h`.

### `uii_data[]` — Response Data Buffer

```c
char uii_data[DATA_QUEUE_SZ + 1];   // 513 bytes
```

After any command that returns data, `uii_data` holds the raw response bytes. The number of bytes stored is returned by `uii_readdata()`. The buffer is always null-terminated.

**Caution:** `uii_data` is overwritten by every call to `uii_readdata()`. Copy needed values immediately after reading.

### `uii_status[]` — Status String Buffer

```c
char uii_status[STATUS_QUEUE_SZ + 1];   // 257 bytes
```

After every completed command, `uii_status` holds the status string from the UCI. Typical values: `"00,OK"`, `"83,NO SUCH DIRECTORY"`. Use the `UII_SUCCESS` macro to check the status rather than inspecting the string directly.

### `uii_target` — Active Target

```c
char uii_target;   // default: TARGET_DOS1
```

The target that will receive the next command. Set by `uii_settarget()`. Most file and directory functions set this automatically and restore it on return.

### `uii_devinfo[]` — Drive Information Array

```c
struct DevInfo uii_devinfo[4];
```

Populated by `uii_parse_deviceinfo()`. Indices:

| Index | Device |
|-------|--------|
| 0 | Drive A (first emulated 1541/1571/1581) |
| 1 | Drive B (second emulated drive) |
| 2 | SoftIEC device |
| 3 | Soft printer |

### `struct DevInfo` Fields

| Field | Type | Description |
|-------|------|-------------|
| `exist` | char | 0 = not present, 1 = present |
| `type` | char | Drive type: `0x00`=1541, `0x01`=1571, `0x02`=1581, `0x0F`=SoftIEC, `0x50`=Printer |
| `power` | char | 0 = powered off, 1 = powered on |
| `id` | char | IEC bus device ID (typically 8–11) |

### `uii_data_index` / `uii_data_len` — Stream Read Cursors

```c
unsigned uii_data_index;
unsigned uii_data_len;
```

Used internally by the network streaming functions (`uii_tcp_nextchar`, `uii_tcp_nextline`). Reset by `uii_reset_uiidata()` and `uii_tcp_emptybuffer()`.

### `UII_SUCCESS` Macro

```c
#define UII_SUCCESS (uii_status[0] == '0' && uii_status[1] == '0')
```

Returns true (non-zero) when the last command completed with status `"00,..."`. Always check this after any operation that can fail. The first two characters of the status string are the numeric error code; `"00"` means success.

---

## 4. Constants and Defines
([Back to contents](#contents))

### Target IDs

| Constant | Value | Description |
|----------|-------|-------------|
| `TARGET_DOS1` | `0x01` | Drive A file system operations |
| `TARGET_DOS2` | `0x02` | Drive B file system operations |
| `TARGET_NETWORK` | `0x03` | TCP/UDP networking |
| `TARGET_CONTROL` | `0x04` | Drive power, disk mounting, system control |

### DOS Command IDs

| Constant | Value | Description |
|----------|-------|-------------|
| `DOS_CMD_IDENTIFY` | `0x01` | Get firmware identification string |
| `DOS_CMD_OPEN_FILE` | `0x02` | Open a file |
| `DOS_CMD_CLOSE_FILE` | `0x03` | Close the open file |
| `DOS_CMD_READ_DATA` | `0x04` | Read from open file |
| `DOS_CMD_WRITE_DATA` | `0x05` | Write to open file |
| `DOS_CMD_FILE_SEEK` | `0x06` | Seek within open file |
| `DOS_CMD_FILE_INFO` | `0x07` | Get info on currently open file |
| `DOS_CMD_FILE_STAT` | `0x08` | Get info on a named file |
| `DOS_CMD_DELETE_FILE` | `0x09` | Delete a file |
| `DOS_CMD_RENAME_FILE` | `0x0A` | Rename a file |
| `DOS_CMD_COPY_FILE` | `0x0B` | Copy a file |
| `DOS_CMD_CHANGE_DIR` | `0x11` | Change current directory |
| `DOS_CMD_GET_PATH` | `0x12` | Get current directory path |
| `DOS_CMD_OPEN_DIR` | `0x13` | Open current directory for listing |
| `DOS_CMD_READ_DIR` | `0x14` | Read next directory entry |
| `DOS_CMD_CREATE_DIR` | `0x16` | Create a directory |
| `DOS_CMD_COPY_HOME_PATH` | `0x17` | Navigate to home directory |
| `DOS_CMD_LOAD_REU` | `0x21` | Load from file into REU memory |
| `DOS_CMD_SAVE_REU` | `0x22` | Save REU memory to file |
| `DOS_CMD_MOUNT_DISK` | `0x23` | Mount disk image on emulated drive |
| `DOS_CMD_UMOUNT_DISK` | `0x24` | Unmount disk image |
| `DOS_CMD_SWAP_DISK` | `0x25` | Swap drives A and B |
| `DOS_CMD_GET_TIME` | `0x26` | Get RTC time |
| `DOS_CMD_SET_TIME` | `0x27` | Set RTC time |
| `DOS_CMD_LOAD_INTO_RAMDISK` | `0x41` | Load file into GEOS RAM disk |
| `DOS_CMD_SAVE_RAMDISK` | `0x42` | Save GEOS RAM disk to file |
| `DOS_CMD_ECHO` | `0xF0` | Echo command back as data |

### Control Command IDs

| Constant | Value | Description |
|----------|-------|-------------|
| `CTRL_CMD_IDENTIFY` | `0x01` | Identify control target |
| `CTRL_CMD_READ_RTC` | `0x02` | Read real-time clock |
| `CTRL_CMD_REBOOT` | `0x06` | Reboot the C64 |
| `CTRL_CMD_GET_HWINFO` | `0x28` | Get hardware information |
| `CTRL_CMD_GET_DRVINFO` | `0x29` | Get drive information |
| `CTRL_CMD_ENABLE_DISK_A` | `0x30` | Power on emulated drive A |
| `CTRL_CMD_DISABLE_DISK_A` | `0x31` | Power off emulated drive A |
| `CTRL_CMD_ENABLE_DISK_B` | `0x32` | Power on emulated drive B |
| `CTRL_CMD_DISABLE_DISK_B` | `0x33` | Power off emulated drive B |
| `CTRL_CMD_DRIVE_A_POWER` | `0x34` | Read drive A power state |
| `CTRL_CMD_DRIVE_B_POWER` | `0x35` | Read drive B power state |
| `CTRL_CMD_GET_RAMDISK_INFO` | `0x40` | Get GEOS RAM disk information |

### Network Command IDs

| Constant | Value | Description |
|----------|-------|-------------|
| `NET_CMD_GET_IP_ADDRESS` | `0x05` | Get device IP address |
| `NET_CMD_TCP_SOCKET_CONNECT` | `0x07` | Open TCP connection |
| `NET_CMD_UDP_SOCKET_CONNECT` | `0x08` | Open UDP connection |
| `NET_CMD_SOCKET_CLOSE` | `0x09` | Close socket |
| `NET_CMD_SOCKET_READ` | `0x10` | Read from socket |
| `NET_CMD_SOCKET_WRITE` | `0x11` | Write to socket |
| `NET_CMD_TCP_LISTENER_START` | `0x12` | Start TCP listener |
| `NET_CMD_TCP_LISTENER_STOP` | `0x13` | Stop TCP listener |
| `NET_CMD_GET_LISTENER_STATE` | `0x14` | Get listener state |
| `NET_CMD_GET_LISTENER_SOCKET` | `0x15` | Get accepted connection socket ID |

### Listener State Constants

| Constant | Value | Meaning |
|----------|-------|---------|
| `NET_LISTENER_STATE_NOT_LISTENING` | `0x00` | No listener active |
| `NET_LISTENER_STATE_LISTENING` | `0x01` | Listening, no connection yet |
| `NET_LISTENER_STATE_CONNECTED` | `0x02` | Client connected |
| `NET_LISTENER_STATE_BIND_ERROR` | `0x03` | Bind failed |
| `NET_LISTENER_STATE_PORT_IN_USE` | `0x04` | Port already in use |

### File Open Attribute Flags

These flags combine to specify how a file is opened:

| Flag | Value | Meaning |
|------|-------|---------|
| `FA_READ` | `0x01` | Open for reading |
| `FA_WRITE` | `0x02` | Open for writing (file must exist) |
| `FA_CREATE_NEW` | `0x04` | Create new file (clears to 0 bytes) |
| `FA_CREATE_ALWAYS` | `0x08` | Create; overwrite if file exists |

**Common combinations:**

| Value | Meaning |
|-------|---------|
| `0x01` | Read existing file |
| `0x06` | Create new file for writing (`FA_WRITE` \| `FA_CREATE_NEW`) |
| `0x0E` | Write, creating or overwriting (`FA_WRITE` \| `FA_CREATE_NEW` \| `FA_CREATE_ALWAYS`) |

---

## 5. Protocol Flow
([Back to contents](#contents))

Every UCI operation follows the same four-step sequence. High-level functions in the library perform all four steps internally — you do not need to call them manually unless building custom commands.

```
1. uii_sendcommand(cmd, length)
      │  Writes target ID + opcode + arguments to $DF1D
      │  Waits for UCI idle, then sets PUSH_CMD bit in control register
      └─ Retries if error bit is set

2. uii_readdata()              ← call only if command returns data
      │  Polls status register bit 7 (data available)
      │  Drains respdata FIFO into uii_data[]
      └─ Returns number of bytes read

3. uii_readstatus()
      │  Polls status register bit 6 (status data available)
      │  Drains statusdata FIFO into uii_status[]
      └─ Returns number of bytes read

4. uii_accept()
      │  Sets ACK bit in control register
      └─ Waits for acknowledgement to clear
```

**For streaming commands** (`uii_read_file`, `uii_get_dir`): the firmware returns data in multiple packets. After calling the command, drain data in a loop using `uii_isdataavailable()` / `uii_ismoredataavailable()` / `uii_readdata()` / `uii_accept()`:

```c
uii_read_file(length);
while (uii_isdataavailable() || uii_ismoredataavailable())
{
    bytes = uii_readdata();
    uii_accept();
    // process uii_data[0..bytes-1]
}
```

---

## 6. Status Codes and Error Handling
([Back to contents](#contents))

Every command places a null-terminated status string in `uii_status[]` after completion. The format is `"NN,MESSAGE"` where `NN` is a two-digit decimal error code.

### Common Status Strings

| Status | Meaning |
|--------|---------|
| `"00,OK"` | Success |
| `"00,ok"` | Success (alternate casing) |
| `"01,DIRECTORY EMPTY"` | Directory opened but no entries |
| `"02,REQUEST TRUNCATED"` | Transfer shorter than requested (EOF) |
| `"83,NO SUCH DIRECTORY"` | `uii_change_dir` — directory not found |
| `"84,NO FILE TO CLOSE"` | `uii_close_file` — no open file |
| `"85,NO FILE OPEN"` | Read/write called without open file |
| `"86,CAN'T READ DIRECTORY"` | `uii_open_dir` — directory unreadable |
| `"88,NO INFORMATION AVAILABLE"` | `uii_file_info` — no file open |
| `"88,FILE NOT FOUND"` | `uii_file_stat` — named file not found |
| `"89,NOT A DISK IMAGE"` | `uii_mount_disk` — file is not a disk image |
| `"90,DRIVE NOT PRESENT"` | `uii_mount_disk`/`uii_unmount_disk` — drive ID not found |
| `"98,FUNCTION PROHIBITED"` | `uii_set_time` — setting disabled in Ultimate config |
| `"ACCESS DENIED"` | Write to read-only file |

### Checking Success

Always use `UII_SUCCESS` immediately after a command completes:

```c
uii_change_dir(mypath);
if (!UII_SUCCESS)
{
    // handle error: uii_status contains the message
    errorexit("");
}
```

For operations inside a loop (streaming reads), check after each `uii_accept()`:

```c
while (uii_isdataavailable() || uii_ismoredataavailable())
{
    bytesread = uii_readdata();
    uii_accept();
    if (!UII_SUCCESS) { /* handle error */ break; }
    // process bytesread bytes in uii_data[]
}
```

---

## 7. Core Functions
([Back to contents](#contents))

Defined in `ultimate_common_lib.h` / `ultimate_common_lib.c`.

---

### `uii_detect`

```c
char uii_detect(void);
```

**Purpose:** Check whether the UCI hardware is present.

**Returns:** `1` if detected (identity register at `$DF1D` reads `0xC9`), `0` if not present.

**Side effects:** Calls `uii_abort()` to reset the UCI if detected.

**Example:**
```c
if (!uii_detect())
{
    // No Ultimate cartridge present — exit
    fc3_exit();
}
```

---

### `uii_settarget`

```c
void uii_settarget(char id);
```

**Purpose:** Set the target subsystem for subsequent commands.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `id` | Target ID: `TARGET_DOS1` (0x01), `TARGET_DOS2` (0x02), `TARGET_NETWORK` (0x03), `TARGET_CONTROL` (0x04) |

**Notes:** Most high-level functions call `uii_settarget()` automatically. Use this directly only when building custom commands or when switching targets manually. The network functions save and restore `uii_target` around their calls.

---

### `uii_sendcommand`

```c
void uii_sendcommand(char *bytes, unsigned count);
```

**Purpose:** Send a raw command packet to the UCI. The first byte of `bytes` is overwritten with the current `uii_target` value.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `bytes` | Command buffer; `bytes[0]` will be set to `uii_target`, `bytes[1]` is the command opcode, remaining bytes are arguments |
| `count` | Total number of bytes to send, including the target and opcode bytes |

**Notes:** Waits for the UCI to be idle before sending. Retries if the error bit is set. This is the lowest-level send function; all higher-level functions call it internally.

---

### `uii_accept`

```c
void uii_accept(void);
```

**Purpose:** Acknowledge completion of a UCI response and release the UCI for the next command. Must be called after draining all response data and status.

**Notes:** Sets the ACK bit in the control register and waits for the UCI to clear it.

---

### `uii_readdata`

```c
unsigned uii_readdata(void);
```

**Purpose:** Drain the UCI response data FIFO into `uii_data[]`.

**Returns:** Number of bytes read (0 if no data available).

**Notes:** Reads bytes one at a time from `respdata` (`$DF1E`) while the data-available bit (bit 7 of status) is set. Always null-terminates `uii_data`. Stops at `DATA_QUEUE_SZ` bytes; excess data is discarded.

---

### `uii_readstatus`

```c
unsigned uii_readstatus(void);
```

**Purpose:** Drain the UCI status FIFO into `uii_status[]`.

**Returns:** Number of status bytes read.

**Notes:** Reads bytes one at a time from `statusdata` (`$DF1F`) while the status-data-available bit (bit 6) is set. Always null-terminates `uii_status`. After this call, `UII_SUCCESS` is valid.

---

### `uii_isdataavailable`

```c
char uii_isdataavailable(void);
```

**Purpose:** Check whether the UCI data FIFO has bytes to read (status bit 7).

**Returns:** `1` if data is available, `0` if not.

---

### `uii_ismoredataavailable`

```c
char uii_ismoredataavailable(void);
```

**Purpose:** Check whether the UCI has more data in a multi-packet transfer (status bits 4 and 5 both set).

**Returns:** `1` if more packets follow, `0` if this is the last packet.

**Notes:** Used in streaming loops alongside `uii_isdataavailable()`. A transfer is fully complete when both return 0.

---

### `uii_isstatusdataavailable`

```c
char uii_isstatusdataavailable(void);
```

**Purpose:** Check whether the UCI status FIFO has bytes to read (status bit 6).

**Returns:** `1` if status data is available, `0` if not.

---

### `uii_abort`

```c
void uii_abort(void);
```

**Purpose:** Abort the current UCI operation by setting the ABORT bit in the control register.

**Notes:** Does not wait for confirmation. Use when an operation must be cancelled, or to reset the UCI to a known state.

---

### `uii_identify`

```c
void uii_identify(void);
```

**Purpose:** Query the UCI firmware identification string (e.g. `"ULTIMATE-II DOS V1.4"`).

**Data returned:** Null-terminated identification string in `uii_data[]`.

**Status:** Always `"00,OK"`.

---

### `uii_echo`

```c
void uii_echo(void);
```

**Purpose:** Test command — sends the command packet and receives it back as data.

**Data returned:** Echo of the command in `uii_data[]`.

**Status:** Always `"00,OK"`.

---

### `uii_freeze`

```c
void uii_freeze(void);
```

**Purpose:** Trigger a freeze (cartridge button press equivalent) via the control interface.

---

### `uii_getinterfacecount`

```c
void uii_getinterfacecount(void);
```

**Purpose:** Get the number of network interfaces on the Ultimate device.

**Data returned:** Interface count in `uii_data[0]`.

**Notes:** Saves and restores the current target around the network command.

---

## 8. DOS Functions — File Operations
([Back to contents](#contents))

Defined in `ultimate_dos_lib.h` / `ultimate_dos_lib.c`. All file operations act on `TARGET_DOS1` (drive A's file system). To operate on drive B's file system, call `uii_settarget(TARGET_DOS2)` before using these functions.

---

### `uii_open_file`

```c
void uii_open_file(char attrib, char *filename);
```

**Purpose:** Open a file on the current path.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `attrib` | Open mode flags (see §4 for values) |
| `filename` | File name to open (null-terminated) |

**Common `attrib` values:**

| Value | Use |
|-------|-----|
| `0x01` | Read existing file |
| `0x06` | Create new file for writing |
| `0x0E` | Write, creating or overwriting |

**Status:** `"00,OK"` on success, or a filesystem error.

**Notes:** Only one file may be open at a time per target. The filename does not need to be null-terminated inside the UCI packet (length is inferred from command size), but the C string passed must be null-terminated for `strlen()` to work correctly.

---

### `uii_close_file`

```c
void uii_close_file(void);
```

**Purpose:** Close the currently open file.

**Status:** `"00,OK"` or `"84,NO FILE TO CLOSE"`.

---

### `uii_write_file`

```c
void uii_write_file(char *data, unsigned length);
```

**Purpose:** Write `length` bytes from `data` to the currently open file.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `data` | Pointer to the data buffer to write |
| `length` | Number of bytes to write |

**Status:** `"00,OK"`, `"85,NO FILE OPEN"`, or `"ACCESS DENIED"`.

**Caution:** The total command packet size is `length + 4`. The UCI command queue is `DATA_QUEUE_SZ` (512) bytes, so `length` must not exceed `DATA_QUEUE_SZ - 4` = 508 bytes per call. For larger transfers, call in a loop. In practice, `SAVE_BUF_SIZE` (500) is used in this project to provide a safe margin.

---

### `uii_read_file`

```c
void uii_read_file(unsigned length);
```

**Purpose:** Request up to `length` bytes from the currently open file. Does **not** call `uii_readdata()` — you must drain the data in a loop.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `length` | Maximum bytes to read (encoded as 16-bit little-endian in the command) |

**Status:** Set in `uii_status[]` after draining all packets with `uii_readstatus()`.

**Notes:** The firmware returns data in packets of up to 512 bytes each. Use `uii_isdataavailable()` and `uii_ismoredataavailable()` to drain all packets:

```c
uii_read_file(sizeof(buf));
while (uii_isdataavailable() || uii_ismoredataavailable())
{
    bytes = uii_readdata();
    uii_accept();
    // copy uii_data[0..bytes-1] to destination
}
```

---

### `uii_seek_file`

```c
void uii_seek_file(char posL, char posML, char posMH, char posH);
```

**Purpose:** Move the read/write pointer to a specific position in the open file.

**Parameters:** 32-bit file offset, sent LSB first:

| Parameter | Description |
|-----------|-------------|
| `posL` | Bits 7–0 of position |
| `posML` | Bits 15–8 of position |
| `posMH` | Bits 23–16 of position |
| `posH` | Bits 31–24 of position |

**Status:** `"00,OK"`, `"85,NO FILE OPEN"`, or a filesystem error.

**Example — seek to byte 1024:**
```c
uii_seek_file(0x00, 0x04, 0x00, 0x00);
```

---

### `uii_file_info`

```c
void uii_file_info(void);
```

**Purpose:** Get metadata about the currently open file.

**Data returned in `uii_data[]`:**

| Offset | Size | Content |
|--------|------|---------|
| 0 | 4 bytes | File size (32-bit little-endian) |
| 4 | 2 bytes | Last modified date (FAT format) |
| 6 | 2 bytes | Last modified time (FAT format) |
| 8 | 3 bytes | File extension |
| 11 | 1 byte | Attribute flags |
| 12 | variable | Filename (null-terminated) |

**Status:** `"00,OK"`, `"85,NO FILE OPEN"`, or `"88,NO INFORMATION AVAILABLE"`.

---

### `uii_file_stat`

```c
void uii_file_stat(char *filename);
```

**Purpose:** Get metadata about a named file without opening it.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `filename` | Name of the file to query |

**Data returned:** Same format as `uii_file_info()`.

**Status:** `"00,OK"` or `"88,FILE NOT FOUND"`.

---

### `uii_delete_file`

```c
void uii_delete_file(char *filename);
```

**Purpose:** Delete the named file from the current directory.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `filename` | Name of the file to delete |

**Status:** `"00,OK"` or a filesystem error.

**Notes:** Used in this project before `uii_open_file(..., 0x06, ...)` because overwrite mode (`0x0E`) was found to be unreliable on some firmware versions. The safe pattern is delete then create new.

---

### `uii_rename_file`

```c
void uii_rename_file(char *oldname, char *newname);
```

**Purpose:** Rename a file in the current directory.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `oldname` | Current filename |
| `newname` | New filename |

**Status:** `"00,OK"` or a filesystem error.

**Notes:** The two names are sent in a single command packet separated by a null byte.

---

### `uii_copy_file`

```c
void uii_copy_file(char *source, char *destination);
```

**Purpose:** Copy a file to a new name or path.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `source` | Source file path |
| `destination` | Destination file path |

**Status:** `"00,OK"` or a filesystem error.

---

## 9. DOS Functions — Directory Operations
([Back to contents](#contents))

---

### `uii_get_path`

```c
void uii_get_path(void);
```

**Purpose:** Read the current absolute path in the UCI file system.

**Data returned:** Null-terminated path string in `uii_data[]`, e.g. `"/usb0/games"`.

**Status:** Always `"00,OK"`.

---

### `uii_open_dir`

```c
void uii_open_dir(void);
```

**Purpose:** Open the current directory for streaming its contents via `uii_get_dir()`.

**Status:** `"00,OK"`, `"01,DIRECTORY EMPTY"`, or `"86,CAN'T READ DIRECTORY"`.

**Notes:** Must be called before any `uii_get_dir()` calls. Check `UII_SUCCESS` before proceeding.

---

### `uii_get_dir`

```c
void uii_get_dir(void);
```

**Purpose:** Initiate the streaming read of directory entries.

**Notes:** After calling `uii_get_dir()`, read entries one packet at a time in a loop using `uii_isdataavailable()` and `uii_readdata()` + `uii_accept()`. Each packet is one directory entry.

**Entry format in `uii_data[]`:**

| Offset | Content |
|--------|---------|
| 0 | Attribute byte (bit 4 set = directory) |
| 1+ | Entry name (ASCII, null-terminated) |

**Attribute byte bits (FAT-style):**

| Bit | Mask | Meaning |
|-----|------|---------|
| 0 | `0x01` | Read-only |
| 1 | `0x02` | Hidden |
| 2 | `0x04` | System |
| 3 | `0x08` | Volume label |
| 4 | `0x10` | Directory |
| 5 | `0x20` | Archive |

**Example loop:**
```c
uii_open_dir();
if (UII_SUCCESS)
{
    uii_get_dir();
    while (uii_isdataavailable())
    {
        uii_readdata();
        uii_accept();
        // uii_data[0] = attributes, uii_data+1 = name
    }
}
```

---

### `uii_change_dir`

```c
void uii_change_dir(char *directory);
```

**Purpose:** Navigate to a subdirectory, parent directory, or disk image sub-filesystem.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `directory` | Directory name, relative path, `".."` (parent), or `"/"` (root) |

**Status:** `"00,OK"` or `"83,NO SUCH DIRECTORY"`.

**Special values:**

| Value | Effect |
|-------|--------|
| `".."` | Go to parent directory |
| `"/"` | Go to root of current file system |
| `"name.d64"` | Enter disk image as a sub-filesystem |

---

### `uii_change_dir_home`

```c
void uii_change_dir_home(void);
```

**Purpose:** Navigate to the home directory defined in the Ultimate device's User Interface Settings.

**Status:** `"00,OK"` or a filesystem error if the home directory does not exist.

**Notes:** Used at the start of the file browser to begin navigation from a known location.

---

### `uii_create_dir`

```c
void uii_create_dir(char *directory);
```

**Purpose:** Create a new directory in the current path.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `directory` | Name for the new directory |

**Status:** `"00,OK"` or a filesystem error.

---

## 10. Control Functions — Drive Management
([Back to contents](#contents))

These functions target `TARGET_CONTROL` and control the Ultimate's emulated disk drives.

---

### `uii_mount_disk`

```c
void uii_mount_disk(char id, char *filename);
```

**Purpose:** Mount a disk image file on an emulated drive.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `id` | IEC device ID of the target drive (e.g. `8`) |
| `filename` | Name of the disk image file (must be in the current UCI path) |

**Status:** `"00,OK"`, `"89,NOT A DISK IMAGE"`, or `"90,DRIVE NOT PRESENT"`.

**Notes:** `uii_change_dir()` to the correct path before calling. If `id` does not match any drive, the drive most recently mounted is used. Navigate to the image's directory first.

---

### `uii_unmount_disk`

```c
void uii_unmount_disk(char id);
```

**Purpose:** Unmount the disk image from the specified drive.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `id` | IEC device ID of the drive to unmount |

**Status:** `"00,OK"` or `"90,DRIVE NOT PRESENT"`. Success is reported even if no disk was mounted.

---

### `uii_swap_disk`

```c
void uii_swap_disk(void);
```

**Purpose:** Swap the disk images mounted on drives A and B.

**Status:** `"00,OK"`.

---

### `uii_enable_drive_a` / `uii_enable_drive_b`

```c
void uii_enable_drive_a(void);
void uii_enable_drive_b(void);
```

**Purpose:** Power on emulated drive A or B. The drive needs a short time to spin up after power-on.

**Status:** `"00,OK"`.

**Notes:** After enabling, call `delay(2)` to allow the drive to become ready before mounting or accessing it.

---

### `uii_disable_drive_a` / `uii_disable_drive_b`

```c
void uii_disable_drive_a(void);
void uii_disable_drive_b(void);
```

**Purpose:** Power off emulated drive A or B.

**Status:** `"00,OK"`.

---

### `uii_get_drive_a_power` / `uii_get_drive_b_power`

```c
void uii_get_drive_a_power(void);
void uii_get_drive_b_power(void);
```

**Purpose:** Read the current power state of drive A or B.

**Data returned:** `uii_data[0]` — `0` = off, `1` = on.

---

### `uii_get_deviceinfo`

```c
void uii_get_deviceinfo(void);
```

**Purpose:** Retrieve raw drive information from the Ultimate control interface. Parse the result with `uii_parse_deviceinfo()`.

**Data returned:** Raw byte sequence describing connected drives (see `uii_parse_deviceinfo()` for format).

---

### `uii_parse_deviceinfo`

```c
char uii_parse_deviceinfo(void);
```

**Purpose:** Call `uii_get_deviceinfo()` and parse the result into the `uii_devinfo[]` array.

**Returns:** `1` on success, `0` on failure (UCI error or no devices found).

**Populates `uii_devinfo[]`:** See §3 for field descriptions.

**Data format parsed:**

| Offset | Content |
|--------|---------|
| 0 | Device count |
| 1 | Drive A type |
| 2 | Drive A IEC ID |
| 3 | Drive A power state |
| 4 | Drive B type (or next device if no drive B) |
| ... | (continues for each device) |

**Type values:**

| Value | Drive type |
|-------|-----------|
| `0x00` | 1541 |
| `0x01` | 1571 |
| `0x02` | 1581 |
| `0x0F` | SoftIEC |
| `0x50` | Printer |

**Notes:** Types `< 0x0F` are disk drives (A then B). `0x0F` is SoftIEC. `0x50` is soft printer. Any type `>= 0x0F` other than `0x0F` and `0x50` is not parsed.

---

### `uii_device_type`

```c
char *uii_device_type(char typeval);
```

**Purpose:** Convert a drive type byte to a human-readable string.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `typeval` | Type value from `uii_devinfo[n].type` |

**Returns:** Pointer to a string literal: `"1541"`, `"1571"`, `"1581"`, `"SoftIEC"`, `"Printer"`, or `""` for unknown.

---

### `uii_save_reu`

```c
void uii_save_reu(char size);
```

**Purpose:** Save REU memory to the currently open file. The file must already be open for writing with `uii_open_file()`.

**Parameters:**

| `size` | REU size |
|--------|----------|
| 0 | 128 KB |
| 1 | 256 KB |
| 2 | 512 KB |
| 3 | 1 MB |
| 4 | 2 MB |
| 5 | 4 MB |
| 6 | 8 MB |
| 7 | 16 MB |

**Data returned:** Transfer summary string, e.g. `"$008000 BYTES SAVED FROM REU $852000"`.

**Status:** `"00,OK"`, `"02,REQUEST TRUNCATED"` (file smaller than REU), or a filesystem error.

---

### `uii_load_reu`

```c
void uii_load_reu(char size);
```

**Purpose:** Load REU memory from the currently open file.

**Parameters:** Same `size` values as `uii_save_reu()`.

**Data returned:** Transfer summary string, e.g. `"$003000 BYTES LOADED TO REU $126800"`.

**Status:** `"00,OK"`, `"02,REQUEST TRUNCATED"` (file shorter than requested REU size), or a filesystem error.

---

### `uii_get_ramdisk_info`

```c
void uii_get_ramdisk_info(void);
```

**Purpose:** Get information about GEOS RAM disks stored in REU.

**Data returned:** 8 bytes — 2 bytes per drive (IDs 8–11): drive ID and type.

---

### `uii_loadIntoRamDisk`

```c
void uii_loadIntoRamDisk(char id, char *filename, char whatif);
```

**Purpose:** Load a file into a GEOS RAM disk in REU.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `id` | RAM disk ID (drive number, e.g. 8) |
| `filename` | File to load |
| `whatif` | `0` = real load; `1` = trial run (check size/type only, no actual load) |

---

### `uii_saveRamDisk`

```c
void uii_saveRamDisk(char id, char *filename);
```

**Purpose:** Save a GEOS RAM disk from REU to a file.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `id` | RAM disk ID |
| `filename` | Destination filename |

---

## 11. Control Functions — System
([Back to contents](#contents))

---

### `uii_reboot`

```c
void uii_reboot(void);
```

**Purpose:** Trigger a clean C64 reset through the Ultimate control interface.

**Notes:** This function does not return — the machine resets immediately after the command is sent.

---

### `uii_get_hwinfo`

```c
void uii_get_hwinfo(char device);
```

**Purpose:** Retrieve hardware information from the Ultimate cartridge.

**Parameters:**

| `device` | Information returned |
|----------|---------------------|
| `0` | Product identification string (e.g. `"Ultimate 64"`, `"1541 Ultimate II+"`) in `uii_data[]` |
| `1` | SID chip configuration: `uii_data[0]` = count; for each SID: `addr_lo`, `addr_hi`, `bits`, `rsvd`, `rsvd` |

---

## 12. Time Functions
([Back to contents](#contents))

Defined in `ultimate_time_lib.h` / `ultimate_time_lib.c`. Uses `TARGET_DOS1`.

---

### `uii_get_time`

```c
void uii_get_time(void);
```

**Purpose:** Read the current date and time from the Ultimate RTC.

**Data returned:** Null-terminated date/time string in `uii_data[]`, format `"yyyy/mm/dd hh:mm:ss"` (19 characters + null).

**Status:** `"00,OK"`.

**Example:**
```c
uii_get_time();
// uii_data[] now contains e.g. "2026/04/28 19:30:00"
```

---

### `uii_set_time`

```c
void uii_set_time(char *data);
```

**Purpose:** Set the Ultimate RTC to a new date and time.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `data` | 6-byte array: `[Y-1900, M, D, h, m, s]` |

**Data format:**

| Index | Content | Range |
|-------|---------|-------|
| 0 | Year − 1900 | e.g. 126 for 2026 |
| 1 | Month | 1–12 |
| 2 | Day | 1–31 |
| 3 | Hour | 0–23 |
| 4 | Minute | 0–59 |
| 5 | Second | 0–59 |

**Status:** `"00,OK"` or `"98,FUNCTION PROHIBITED"` (if time setting is disabled in Ultimate settings).

---

## 13. Network Functions
([Back to contents](#contents))

Defined in `ultimate_network_lib.h` / `ultimate_network_lib.c`. All network functions use `TARGET_NETWORK` and save/restore the previous `uii_target` around their calls.

---

### `uii_tcpconnect`

```c
char uii_tcpconnect(char *host, unsigned short port);
```

**Purpose:** Open a TCP connection to a remote host.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `host` | Hostname or IP address string |
| `port` | Port number (16-bit) |

**Returns:** Socket ID on success (use for subsequent socket operations). Check `UII_SUCCESS` — on failure the socket ID is invalid.

**Notes:** Port is transmitted little-endian (low byte first).

---

### `uii_udpconnect`

```c
char uii_udpconnect(char *host, unsigned short port);
```

**Purpose:** Open a UDP connection to a remote host.

**Parameters:** Same as `uii_tcpconnect()`.

**Returns:** Socket ID.

---

### `uii_socketclose`

```c
void uii_socketclose(char socketid);
```

**Purpose:** Close an open socket.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `socketid` | Socket ID returned by `uii_tcpconnect()` or `uii_udpconnect()` |

---

### `uii_socketread`

```c
unsigned uii_socketread(char socketid, unsigned short length);
```

**Purpose:** Read up to `length` bytes from a socket into `uii_data[]`.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `socketid` | Socket ID |
| `length` | Maximum bytes to read |

**Returns:** Number of bytes actually available in the firmware's receive buffer (`uii_data[0]` \| `uii_data[1] << 8`). The actual data follows at `uii_data[2]+`.

---

### `uii_socketwrite`

```c
void uii_socketwrite(char socketid, char *data);
```

**Purpose:** Write a null-terminated PETSCII string to a socket without character conversion.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `socketid` | Socket ID |
| `data` | Null-terminated PETSCII string to send |

---

### `uii_socketwrite_ascii`

```c
void uii_socketwrite_ascii(char socketid, char *data);
```

**Purpose:** Write a null-terminated string to a socket with PETSCII-to-ASCII conversion. Lowercase PETSCII letters are converted to ASCII uppercase; uppercase PETSCII letters are converted to ASCII lowercase; PETSCII carriage return (`0x0D`) is converted to ASCII newline (`0x0A`).

---

### `uii_socketwritechar`

```c
void uii_socketwritechar(char socketid, char one_char);
```

**Purpose:** Write a single byte to a socket.

---

### `uii_tcplistenstart`

```c
unsigned uii_tcplistenstart(unsigned short port);
```

**Purpose:** Start a TCP listener on the specified port.

**Returns:** Listener state (a `NET_LISTENER_STATE_*` constant).

---

### `uii_tcplistenstop`

```c
unsigned uii_tcplistenstop(void);
```

**Purpose:** Stop the active TCP listener.

**Returns:** Listener state.

---

### `uii_tcpgetlistenstate`

```c
unsigned uii_tcpgetlistenstate(void);
```

**Purpose:** Poll the current state of the TCP listener.

**Returns:** A `NET_LISTENER_STATE_*` constant.

---

### `uii_tcpgetlistensocket`

```c
char uii_tcpgetlistensocket(void);
```

**Purpose:** Get the socket ID of a newly accepted TCP connection. Call after `uii_tcpgetlistenstate()` returns `NET_LISTENER_STATE_CONNECTED`.

**Returns:** Socket ID of the accepted connection.

---

### `uii_tcp_nextchar`

```c
char uii_tcp_nextchar(char socketid);
```

**Purpose:** Read the next byte from the TCP receive stream, refilling the buffer from the socket as needed.

**Returns:** Next byte, or `0` on end-of-stream.

**Notes:** Maintains internal `uii_data_index` and `uii_data_len` cursors. More efficient than calling `uii_socketread()` per byte for stream processing.

---

### `uii_tcp_nextline`

```c
unsigned uii_tcp_nextline(char socketid, char *result);
```

**Purpose:** Read the next line from the TCP stream (up to `\n`) into `result`.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `socketid` | Socket ID |
| `result` | Buffer to store the line (caller must ensure sufficient size) |

**Returns:** `1` if a line was read, `0` on end-of-stream.

**Notes:** Strips `\r` characters. Returns PETSCII as-is (no case conversion).

---

### `uii_tcp_nextline_ascii`

```c
unsigned uii_tcp_nextline_ascii(char socketid, char *result);
```

**Purpose:** Read the next line with ASCII case conversion applied (uppercase ASCII → lowercase PETSCII and vice versa).

**Returns:** `1` if a line was read, `0` on end-of-stream.

---

### `uii_tcp_emptybuffer`

```c
void uii_tcp_emptybuffer(void);
```

**Purpose:** Reset the `uii_data_index` cursor to 0, discarding any buffered but unread data.

---

### `uii_reset_uiidata`

```c
void uii_reset_uiidata(void);
```

**Purpose:** Zero out `uii_data[]` and `uii_status[]` and reset the stream cursors. Use to ensure a clean state between unrelated operations.

---

## 14. Typical Usage Patterns
([Back to contents](#contents))

### Read a File

```c
uii_change_dir("/usb0/config/");
uii_open_file(0x01, "myfile.cfg");
if (UII_SUCCESS)
{
    uii_read_file(sizeof(buf));
    while (uii_isdataavailable() || uii_ismoredataavailable())
    {
        unsigned n = uii_readdata();
        uii_accept();
        // process n bytes from uii_data[0..n-1]
    }
    uii_close_file();
}
```

### Write a File

```c
uii_change_dir("/usb0/config/");
uii_delete_file("myfile.cfg");           // delete first (overwrite unreliable)
uii_open_file(0x06, "myfile.cfg");       // create new
if (UII_SUCCESS)
{
    uii_write_file((char *)&mydata, sizeof(mydata));
    uii_close_file();
}
```

### Write a Large File in Chunks

```c
long pos = 0;
long end = total_size;
char buf[500];

uii_open_file(0x06, "large.dat");
while (pos < end)
{
    unsigned chunk = (end - pos < 500) ? (end - pos) : 500;
    // fill buf[0..chunk-1] from source
    uii_write_file(buf, chunk);
    pos += chunk;
}
uii_close_file();
```

### Browse a Directory

```c
uii_open_dir();
if (!UII_SUCCESS) { /* error */ }

uii_get_dir();
while (uii_isdataavailable())
{
    uii_readdata();
    uii_accept();
    char attr = uii_data[0];
    char *name = uii_data + 1;
    char is_dir = (attr & 0x10) != 0;
    // process name and is_dir
}
```

### Mount a Disk Image and Wait for Drive Ready

```c
if (!uii_parse_deviceinfo()) { errorexit(""); }
if (!uii_devinfo[0].power)
{
    uii_enable_drive_a();
    delay(2);                 // allow drive to spin up
}
uii_change_dir("/usb0/games/");
uii_mount_disk(uii_devinfo[0].id, "game.d64");
if (!UII_SUCCESS) { errorexit(""); }
```

### Load REU from File

```c
uii_change_dir("/usb0/reu/");
uii_open_file(0x01, "myimage.reu");
if (UII_SUCCESS)
{
    uii_load_reu(2);          // 2 = 512 KB
    uii_close_file();
}
```

### NTP Time Sync via UDP

```c
char socketid;
char ntpbuf[48] = {0};
ntpbuf[0] = 0x1B;            // NTP request: LI=0, VN=3, Mode=3

socketid = uii_udpconnect("pool.ntp.org", 123);
if (UII_SUCCESS)
{
    uii_socketwrite(socketid, ntpbuf);  // send NTP request
    uii_socketread(socketid, 48);       // read NTP response
    // parse uii_data[2..49] for timestamp
    uii_socketclose(socketid);
}
```

### Detect and Print Connected Drives

```c
if (uii_parse_deviceinfo())
{
    char a;
    for (a = 0; a < 4; a++)
    {
        if (uii_devinfo[a].exist)
        {
            // uii_devinfo[a].id    = IEC device ID
            // uii_devinfo[a].type  = drive type
            // uii_devinfo[a].power = 0=off, 1=on
        }
    }
}
```
