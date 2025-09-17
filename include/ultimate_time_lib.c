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
#include "ultimate_common_lib.h"
#include "ultimate_time_lib.h"

// Switching code generation to bank 0 common routine section
#pragma code(code)
#pragma data(data)

void uii_get_time(void)
// Get the current time
// This command returns the current date and time and the status channel will read “00,OK” on success.
// The format is “yyyy/mm/dd hh:mm:ss”.
{
	char cmd[] = {0x00, DOS_CMD_GET_TIME};
	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_set_time(char *data)
// Set the current time
// Input: data - the new time to set.
// Format of the time data char stream:  <Y> <M> <D> <h> <m> <s>
// This command sets the current date and time and the status channel will read “00,OK” on success. The
// year has to be reduced by 1900 in order to fit in a single byte.
// This function may be enabled or disabled by the ultimate settings. In the latter case the status will read
// “98,FUNCTION PROHIBITED”.
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(8);
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_SET_TIME;

	for (x = 0; x < 6; x++)
		fullcmd[x + 2] = data[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, 8);

	free(fullcmd);
	uii_readstatus();
	uii_accept();
}