/*****************************************************************
Ultimate 64/II+ Command Library - Core functions
Scott Hutter, Francesco Sblendorio

Based on ultimate_dos-1.2.docx and command interface.docx
https://github.com/markusC64/1541ultimate2/tree/master/doc

Disclaimer:  Because of the nature of DOS commands, use this code
soley at your own risk.

Patches and pull requests are welcome
******************************************************************/

#include <string.h>
#include "ultimate_common_lib.h"

char *id_reg = (char *)ID_REG;
char *cmddatareg = (char *)CMD_DATA_REG;
char *controlreg = (char *)CONTROL_REG;
char *statusreg = (char *)STATUS_REG;
char *respdatareg = (char *)RESP_DATA_REG;
char *statusdatareg = (char *)STATUS_DATA_REG;

char uii_status[STATUS_QUEUE_SZ + 1];
char uii_data[(DATA_QUEUE_SZ * 2) + 1];
char temp_string_onechar[2];
unsigned uii_data_index;
unsigned uii_data_len;

char uii_target = TARGET_DOS1;
struct DevInfo uii_devinfo[4];

// Core functions
char uii_detect(void)
// Detect present of UCI via ID_REG. Value should be $C9
// Output:
//	1 = detected
//	0 = not detected
{
	if (*id_reg == 0xc9)
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

void uii_logtext(char *text)
// Log text to the console
//	Inout: text - the text to log
{
#ifdef DEBUG
	printf("%s", text);
#else
	text = 0; // to eliminate the warning in cc65
#endif
}

void uii_logstatusreg(void)
// Log the status register
{
#ifdef DEBUG
	printf("\nstatus reg %p = %d", statusreg, *statusreg);
#endif
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
	unsigned success = 0;

	bytes[0] = uii_target;

	while (success == 0)
	{
		// Wait for idle state
		uii_logtext("\nwaiting for cmd_busy to clear...");
		uii_logstatusreg();

		while (*statusreg & 0x35)
		{
			uii_logtext("\nwaiting...");
			uii_logstatusreg();
		};

		// Write byte by byte to data register
		uii_logtext("\nwriting command...");
		while (x < count)
			*cmddatareg = bytes[x++];

		// Send PUSH_CMD
		uii_logtext("\npushing command...");
		*controlreg |= 0x01;

		uii_logstatusreg();

		// check ERROR bit.  If set, clear it via ctrl reg, and try again
		if ((*statusreg & 4) == 4)
		{
			uii_logtext("\nerror was set. trying again");
			*controlreg |= 0x08;
		}
		else
		{
			uii_logstatusreg();

			// check for cmd busy
			while (((*statusreg & 32) == 0) && ((*statusreg & 16) == 16))
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
	// Acknowledge the data
	uii_logstatusreg();
	uii_logtext("\nsending ack");
	*controlreg |= 0x02;
	while (!(*statusreg & 2) == 0)
	{
		uii_logtext("\nwaiting for ack...");
		uii_logstatusreg();
	};
}

char uii_isdataavailable(void)
// Check if data is available
{
	if (((*statusreg & 128) == 128))
		return 1;
	else
		return 0;
}

char uii_isstatusdataavailable(void)
// Check if status data is available
{
	if (((*statusreg & 64) == 64))
		return 1;
	else
		return 0;
}

void uii_abort(void)
// Abort the command
{
	// abort the command
	uii_logstatusreg();
	uii_logtext("\nsending abort");
	*controlreg |= 0x04;
}

unsigned uii_readdata(void)
// Read data from the UCI
{
	unsigned count = 0;
	uii_data[0] = 0;
	uii_logtext("\n\nreading data...");
	uii_logstatusreg();

	// If there is data to read
	while (uii_isdataavailable() && count < DATA_QUEUE_SZ * 2)
	{
		uii_data[count++] = *respdatareg;
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

	while (uii_isstatusdataavailable() && count < STATUS_QUEUE_SZ)
	{
		uii_status[count++] = *statusdatareg;
	}

	uii_status[count] = 0;
	return count;
}