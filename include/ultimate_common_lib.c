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

#include <string.h>
#include <petscii.h>
#include <c64/cia.h>
#include "ultimate_common_lib.h"

// Switching code generation to bank 0 common routine section
#pragma code(code)
#pragma data(data)

char uii_status[STATUS_QUEUE_SZ + 1];
char uii_data[DATA_QUEUE_SZ + 1];
char temp_string_onechar[2];
unsigned uii_data_index;
unsigned uii_data_len;

char uii_target = TARGET_DOS1;
struct DevInfo uii_devinfo[4];

// Core functions

void uii_logtext(const char *text)
// Log text for debugging
// Input: text - the text to log
// Only activated with DEBUG defined
{
#ifdef DEBUG
	printf("%s", text);
#else
	text = NULL;
#endif
}

void uii_logstatusreg(void)
// Log the status register for debugging
// Only activated with DEBUG defined
{
#ifdef DEBUG
	printf("\nstatus reg %4x = %2x", &uii_reg_read.status, uii_reg_read.status);
#endif
}

char uii_detect(void)
// Detect present of UCI via ID_REG. Value should be $C9
// Output:
//	1 = detected
//	0 = not detected
{
	if (uii_reg_read.id == 0xc9)
	{
		// Reset UCI
		uii_abort();

		// Return 1 for detected = true
		return 1;
	}
	else
	{
		// Return 0 for detected = false
		return 0;
	}
}

void uii_enable(void)
// Send the firmware 3.15+ UCI unlock sequence, per Gideon Zweijtzer.
// Harmless on older firmware: nothing in this codebase else uses $D030-$D03F,
// and if the firmware/bitstream doesn't implement the unlock, the writes are
// simply ignored and uii_detect() keeps failing exactly as it does today.
{
	uci_unlock1 = 0xab;
	uci_unlock2 = 0xcd;
}

char uii_wait_for_uci(char timeout_seconds)
// Wait for Ultimate firmware to boot before issuing any UCI command.
// At cold autostart the C64 starts faster than the Ultimate firmware boots,
// leaving the UCI status register ($DF1C) in an undefined state that causes
// uii_sendcommand() to spin forever. uii_detect() only reads one register
// and never calls uii_sendcommand(), so it is safe to poll here.
// Also sends the firmware 3.15+ unlock sequence up front, so UCI comes up
// even if it was never enabled in the Ultimate's own menu.
// Output:
//	1 = detected
//	0 = not detected, timed out
{
	uii_enable();

	cia1.tods = 0;
	cia1.todt = 0;
	while (!uii_detect() && cia1.tods < timeout_seconds)
	{
		;
	}

	return uii_detect();
}

void uii_add_partition(char index, const char *name, const char *path)
// Add (or, if index is already in use, overwrite) a SoftIEC partition.
// Firmware 3.15+ only. Wire format: $05 $20 <index> "NAME:/path" -- see
// software/io/command_interface/softiec_target.cc's cmd_add_partition()
// in github.com/GideonZ/1541ultimate.
// Input: index - partition number (1-255)
//        name - partition display name
//        path - root path the partition points to
{
	unsigned x = 0;
	unsigned namelen = strlen(name);
	unsigned pathlen = strlen(path);
	char *fullcmd = (char *)malloc(namelen + pathlen + 4);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = SOFTIEC_CMD_ADD_PARTITION;
	fullcmd[2] = index;

	for (x = 0; x < namelen; x++)
		fullcmd[x + 3] = name[x];
	fullcmd[namelen + 3] = ':';
	for (x = 0; x < pathlen; x++)
		fullcmd[x + namelen + 4] = path[x];

	uii_settarget(TARGET_SOFTIEC);
	uii_sendcommand(fullcmd, namelen + pathlen + 4);

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_del_partition(char index)
// Remove a SoftIEC partition. Firmware 3.15+ only. Wire format:
// $05 $21 <index> -- see softiec_target.cc's cmd_del_partition().
// Input: index - partition number to remove
{
	char cmd[] = {0x00, SOFTIEC_CMD_DEL_PARTITION, 0x00};
	cmd[2] = index;

	uii_settarget(TARGET_SOFTIEC);
	uii_sendcommand(cmd, 3);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_getpalette(void)
// Read the current 16-color VIC palette into uii_data[0..47] (16x RGB
// triplets). Firmware test-merge branch only (not yet in a tagged release).
// Wire format: $04 $51 -- see control_target.cc's CTRL_CMD_GET_PALETTE.
{
	char cmd[] = {0x00, CTRL_CMD_GET_PALETTE};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_setpalette(const char *rgb48)
// Replace the entire 16-color VIC palette. Firmware test-merge branch only.
// Wire format: $04 $52 <48 bytes RGB> -- see control_target.cc's
// CTRL_CMD_SET_PALETTE / palette_command.h's decode_palette_set().
// Input: rgb48 - 16x RGB triplets, 48 bytes
{
	char cmd[UCI_PALETTE_BYTES + 2];
	cmd[0] = 0x00;
	cmd[1] = CTRL_CMD_SET_PALETTE;
	memcpy(cmd + 2, rgb48, UCI_PALETTE_BYTES);

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, UCI_PALETTE_BYTES + 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_setpalettecolor(char index, char r, char g, char b)
// Set a single palette color. Firmware test-merge branch only.
// Wire format: $04 $53 <index> <r> <g> <b> -- see control_target.cc's
// CTRL_CMD_SET_PALETTE_COLOR / palette_command.h's decode_palette_color_set().
// Input: index - palette index (0-15), r/g/b - new color
{
	char cmd[] = {0x00, CTRL_CMD_SET_PALETTE_COLOR, 0x00, 0x00, 0x00, 0x00};
	cmd[2] = index;
	cmd[3] = r;
	cmd[4] = g;
	cmd[5] = b;

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 6);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_resetpalette(void)
// Restore the default VIC palette. Firmware test-merge branch only.
// Wire format: $04 $54 -- see control_target.cc's CTRL_CMD_RESET_PALETTE.
{
	char cmd[] = {0x00, CTRL_CMD_RESET_PALETTE};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_settarget(char id)
// Set the target for the next command
// Input: id - the target ID -> 1 = DOS1, 2 = DOS2, 3 = NETWORK, 4 = CONTROL
{
	uii_target = id;
}

void uii_freeze(void)
// Freeze the UCI
{
	char cmd[] = {0x00, 0x05};

	uii_settarget(TARGET_CONTROL);

	uii_sendcommand(cmd, 2);
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_identify(void)
// Identify the UCI
// The “Identify” command sends back an identification string, such as “ULTIMATE-II DOS V1.0”. The
// user software can use this function to query which targets exist, or to obtain version information.
// The status channel will report “00,OK”, as this command cannot fail.
{
	char cmd[] = {0x00, DOS_CMD_IDENTIFY};
	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_echo(void)
// Echo the command
// This command will simply echo the command back as a data packet. The status channel will return
// “00,OK”, as this command cannot fail.
{
	char cmd[] = {0x00, DOS_CMD_ECHO};
	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_getinterfacecount(void)
// Get the number of network interfaces
{
	char tempTarget = uii_target;
	char cmd[] = {0x00, NET_CMD_GET_INTERFACE_COUNT};

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(cmd, 0x02);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;
}

void uii_sendcommand(char *bytes, unsigned count)
// Send a command to the UCI
// Input: bytes - the command bytes to send
//        count - the number of bytes to send
{
	unsigned x = 0;
	char success = 0;

	bytes[0] = uii_target;

	while (success == 0)
	{
		// Wait for idle state
		uii_logtext("\nwaiting for cmd-busy to clear...");
		uii_logstatusreg();

		while (!(((uii_reg_read.status & 32) == 0) && ((uii_reg_read.status & 16) == 0)))
		{
			uii_logtext("\nwaiting...");
			uii_logstatusreg();
		};

		// Write char by char to data register
		uii_logtext("\nwriting command...");
		while (x < count)
			uii_reg_write.cmddata = bytes[x++];

		// Send PUSH_CMD
		uii_logtext("\npushing command...");
		uii_reg_write.control |= 0x01;

		uii_logstatusreg();

		// check ERROR bit.  If set, clear it via ctrl reg, and try again
		if ((uii_reg_read.status & 4) == 4)
		{
			uii_logtext("\nerror was set. trying again");
			uii_reg_write.control |= 0x08;
		}
		else
		{
			uii_logstatusreg();

			// check for cmd busy
			while (((uii_reg_read.status & 32) == 0) && ((uii_reg_read.status & 16) == 16))
			{
				uii_logtext("\nstate is busy");
			}
			success = 1;
		}
	}

	uii_logstatusreg();
	uii_logtext("\ncommand sent");
}

void uii_accept(void)
// Acknowledge the data
{
	uii_logstatusreg();
	uii_logtext("\nsending ack");
	uii_reg_write.control |= 0x02;
	while (!(uii_reg_read.status & 2) == 0)
	{
		uii_logtext("\nwaiting for ack...");
		uii_logstatusreg();
	};
}

char uii_isdataavailable(void)
// Check if data is available
{
	if (((uii_reg_read.status & 128) == 128))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

char uii_ismoredataavailable(void)
// Check if more data is available
{
	if (((uii_reg_read.status & 48) == 48))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

char uii_isstatusdataavailable(void)
// Check if status data is available
{
	if (((uii_reg_read.status & 64) == 64))
		return 1;
	else
		return 0;
}

void uii_abort(void)
// Abort the command
{
	uii_logstatusreg();
	uii_logtext("\nsending abort");
	uii_reg_write.control |= 0x04;
}

unsigned uii_readdata(void)
// Read data from the UCI
{
	unsigned count = 0;
	uii_data[0] = 0;
	uii_logtext("\n\nreading data...");
	uii_logstatusreg();

	// If there is data to read
	while (uii_isdataavailable())
	{
		if (count < DATA_QUEUE_SZ)
		{
			uii_data[count++] = uii_reg_read.respdata;
		}
		else
		{
			// Data buffer full, abort reading
			uii_logtext("\ndata buffer full, aborting read");
			break;
		}
	}
	uii_data[count] = 0;
	return count;
}

unsigned uii_readstatus(void)
// Read status from the UCI
{
	unsigned count = 0;
	uii_status[0] = 0;

	uii_logtext("\n\nreading status...");
	uii_logstatusreg();

	while (uii_isstatusdataavailable())
	{
		if (count < STATUS_QUEUE_SZ)
		{
			uii_status[count++] = uii_reg_read.statusdata;
		}
		else
		{
			// Status buffer full, abort reading
			uii_logtext("\nstatus buffer full, aborting read");
			break;
		}
	}

	uii_status[count] = 0;
	return count;
}