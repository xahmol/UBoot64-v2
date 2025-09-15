/*****************************************************************
Ultimate 64/II+ Command Library - DOS functions

Based on Ultimate II Dos Lib
Scott Hutter, Francesco Sblendorio
https://github.com/xlar54/ultimateii-dos-lib

Based on ultimate_dos-1.2.docx and command interface.docx
https://github.com/markusC64/1541ultimate2/tree/master/doc

Disclaimer:  Because of the nature of DOS commands, use this code
soley at your own risk.

Patches and pull requests are welcome
******************************************************************/

#include <string.h>
#include <petscii.h>
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

		// Write byte by byte to data register
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
		if (((uii_reg_read.status & 48) == 48))
		{
			return 1;
		}
		else
		{
			return 0;
		}
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