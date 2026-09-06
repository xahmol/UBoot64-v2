/*****************************************************************
Ultimate 64/II+ Command Library - DOS functions

Based on Ultimate II Dos Lib
Scott Hutter, Francesco Sblendorio
https://github.com/xlar54/ultimateii-dos-lib

Based on ultimate_dos-1.2.docx and command interface.docx
https://github.com/markusC64/1541ultimate2/tree/master/doc

Disclaimer:  Because of the nature of DOS commands, use this code
solely at your own risk.

Patches and pull requests are welcome
******************************************************************/

#ifndef _ULTIMATE_COMMON_LIB_H_
#define _ULTIMATE_COMMON_LIB_H_

#include <stdlib.h>
#include <stdio.h>

// Defines for UCI registers
struct UII_READ
// Read only registers
{
	volatile char status;
	volatile char id;
	volatile char respdata;
	volatile char statusdata;
};

struct UII_WRITE
// Write only registers
{
	volatile char control;
	volatile char cmddata;
};

// Mapping the UCI registers
#define uii_reg_read	(*((struct UII_READ *)0xdf1c))
#define uii_reg_write	(*((struct UII_WRITE *)0xdf1c))

// Firmware 3.15+ UCI unlock sequence: enables the UCI I/O mapping from the
// cartridge itself, without needing "Command Interface" turned on beforehand
// in the Ultimate menu. Undocumented in the official Register API PDF as of
// this writing; confirmed directly by Gideon Zweijtzer and verified against
// real Ultimate 64-II hardware (a single write to $D038 alone does not work;
// both writes, in order, are required).
#define uci_unlock1	(*(volatile char *)0xd038)
#define uci_unlock2	(*(volatile char *)0xd036)

// Length of data queues
// The sizes of these queues are important to note, since they define the maximum transfer size per command. 
// The UCI command queue size is 896 bytes ($380), the response data queue is also 896 bytes ($380),
// and the status queue is 256 bytes ($100).
// Buffer size is chosen smaller here to lower memory usage, increase if needed (for example for networking)
#define DATA_QUEUE_SZ 512
#define STATUS_QUEUE_SZ 256

// UCI target IDs
#define TARGET_DOS1 0x01
#define TARGET_DOS2 0x02
#define TARGET_NETWORK 0x03
#define TARGET_CONTROL 0x04
#define TARGET_SOFTIEC 0x05

// UCI SoftIEC target commands (firmware 3.15+)
#define SOFTIEC_CMD_ADD_PARTITION 0x20
#define SOFTIEC_CMD_DEL_PARTITION 0x21

// UCI command IDs
// DOS layer commands
#define DOS_CMD_IDENTIFY 0x01
#define DOS_CMD_OPEN_FILE 0x02
#define DOS_CMD_CLOSE_FILE 0x03
#define DOS_CMD_READ_DATA 0x04
#define DOS_CMD_WRITE_DATA 0x05
#define DOS_CMD_FILE_SEEK 0x06
#define DOS_CMD_FILE_INFO 0x07
#define DOS_CMD_FILE_STAT 0x08
#define DOS_CMD_DELETE_FILE 0x09
#define DOS_CMD_RENAME_FILE 0x0a
#define DOS_CMD_COPY_FILE 0x0b
#define DOS_CMD_CHANGE_DIR 0x11
#define DOS_CMD_GET_PATH 0x12
#define DOS_CMD_OPEN_DIR 0x13
#define DOS_CMD_READ_DIR 0x14
#define DOS_CMD_COPY_UI_PATH 0x15
#define DOS_CMD_CREATE_DIR 0x16
#define DOS_CMD_COPY_HOME_PATH 0x17
#define DOS_CMD_LOAD_REU 0x21
#define DOS_CMD_SAVE_REU 0x22
#define DOS_CMD_MOUNT_DISK 0x23
#define DOS_CMD_UMOUNT_DISK 0x24
#define DOS_CMD_SWAP_DISK 0x25
#define DOS_CMD_GET_TIME 0x26
#define DOS_CMD_SET_TIME 0x27
#define DOS_CMD_LOAD_INTO_RAMDISK 0x41
#define DOS_CMD_SAVE_RAMDISK 0x42
#define DOS_CMD_ECHO 0xf0

// Control layer commands (names match firmware control_target.h)
#define CTRL_CMD_IDENTIFY      0x01
#define CTRL_CMD_READ_RTC      0x02
#define CTRL_CMD_FINISH_CAPTURE 0x03
#define CTRL_CMD_FREEZE        0x05
#define CTRL_CMD_REBOOT        0x06
#define CTRL_CMD_U64_SAVEMEM   0x0F
#define CTRL_CMD_DECODE_TRACK  0x11
#define CTRL_CMD_ENCODE_TRACK  0x12
#define CTRL_CMD_EASYFLASH     0x20
#define CTRL_CMD_GET_HWINFO    0x28
#define CTRL_CMD_GET_DRVINFO   0x29
#define CTRL_CMD_DEVICE_INFO   CTRL_CMD_GET_DRVINFO  // backward-compat alias
#define CTRL_CMD_ENABLE_DISK_A  0x30
#define CTRL_CMD_DISABLE_DISK_A 0x31
#define CTRL_CMD_ENABLE_DISK_B  0x32
#define CTRL_CMD_DISABLE_DISK_B 0x33
#define CTRL_CMD_DRIVE_A_POWER  0x34
#define CTRL_CMD_DRIVE_B_POWER  0x35
#define CTRL_CMD_GET_RAMDISK_INFO 0x40
// Palette commands (firmware test-merge branch as of 2026-09; not yet in a
// tagged release, same status LOAD_CONFIG had before it shipped)
#define CTRL_CMD_GET_PALETTE       0x51
#define CTRL_CMD_SET_PALETTE       0x52
#define CTRL_CMD_SET_PALETTE_COLOR 0x53
#define CTRL_CMD_RESET_PALETTE     0x54
#define UCI_PALETTE_COLORS 16
#define UCI_PALETTE_BYTES (UCI_PALETTE_COLORS * 3)

// Network layer commands
#define NET_CMD_GET_INTERFACE_COUNT 0x02
// NET_CMD_SET_INTERFACE (0x03) intentionally not defined: its handler in
// firmware's network_target.cc is compiled out (#if 0'd), so it currently
// does nothing on real hardware -- not wrapped until firmware re-enables it.
#define NET_CMD_GET_NETADDR 0x04
#define NET_CMD_GET_IP_ADDRESS 0x05
#define NET_CMD_SET_IPADDR 0x06
#define NET_CMD_TCP_SOCKET_CONNECT 0x07
#define NET_CMD_UDP_SOCKET_CONNECT 0x08
#define NET_CMD_SOCKET_CLOSE 0x09
#define NET_CMD_SOCKET_READ 0x10
#define NET_CMD_SOCKET_WRITE 0x11

// Uncomment for debug output
//#define DEBUG

// Macro for checking if last command was successful
#define UII_SUCCESS (uii_status[0] == '0' && uii_status[1] == '0')

// Global variables
extern char uii_status[STATUS_QUEUE_SZ + 1];
extern char uii_data[DATA_QUEUE_SZ  + 1];
extern char temp_string_onechar[2];
extern unsigned uii_data_index;
extern unsigned uii_data_len;
extern char uii_target;
struct DevInfo
{
	// Structure to parse drive info
	char exist;
	// Does it exist? 0 = no 1 = yes
	char type;
	// Type (hex):
	// 00 = 1541
	// 01 - 1571
	// 02 = 1581
	// 0F = SoftIEC
	// 50 = Printer
	char power;
	// Power 0 = off 1 = on
	char id;
	// IEC ID
};
extern struct DevInfo uii_devinfo[4];
// Array of info per device
// 0 = drive A
// 1 = drive B
// 2 = SoftIEC
// 3 = Printerindo

// prototypes
char uii_detect(void);
void uii_enable(void);
char uii_wait_for_uci(char timeout_seconds);
void uii_settarget(char id);
void uii_freeze(void);
void uii_add_partition(char index, const char *name, const char *path);
void uii_del_partition(char index);
void uii_getpalette(void);                                       // fills uii_data[0..47] with 16x RGB triplets
void uii_setpalette(const char *rgb48);                           // rgb48: 16x RGB triplets, 48 bytes
void uii_setpalettecolor(char index, char r, char g, char b);
void uii_resetpalette(void);
void uii_identify(void);
void uii_echo(void);
void uii_getinterfacecount(void);
void uii_sendcommand(char *bytes, unsigned count);
void uii_accept(void);
char uii_isdataavailable(void);
char uii_ismoredataavailable(void);
char uii_isstatusdataavailable(void);
void uii_abort(void);
unsigned uii_readdata(void);
unsigned uii_readstatus(void);

#pragma compile("ultimate_common_lib.c")

#endif
