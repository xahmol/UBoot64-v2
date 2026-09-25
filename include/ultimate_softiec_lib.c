/*****************************************************************
Ultimate 64/II+ Command Library - SoftIEC target functions
See ultimate_softiec_lib.h and UCILIBMANUAL.md.
******************************************************************/

#include <string.h>
#include <stdlib.h>
#include "ultimate_common_lib.h"
#include "ultimate_softiec_lib.h"

#pragma code(code)
#pragma data(data)

// ---------------------------------------------------------------------------
// Title:       Identify the SoftIEC target
// Description: Asks the SoftIEC target for its identification string, which
//              also tells whether the firmware has this target (3.15+).
// Syntax:      void uii_softiec_identify(void);
// Input:       None
// Output:      uii_data: identification string; uii_status
// ---------------------------------------------------------------------------
void uii_softiec_identify(void)
{
	char cmd[] = {0x00, SOFTIEC_CMD_IDENTIFY};

	uii_settarget(TARGET_SOFTIEC);
	uii_sendcommand(cmd, sizeof(cmd));
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ---------------------------------------------------------------------------
// Title:       SoftIEC load, step 1: set up
// Description: Opens a file on the SoftIEC drive for loading and returns
//              the start address stored in the file. Follow with
//              uii_softiec_load_execute. The load address used is the
//              file's own address when sa is non-zero, else loadaddr.
// Syntax:      unsigned uii_softiec_load_setup(char sa, char verify,
//                                              unsigned loadaddr,
//                                              const char *name);
// Input:       sa       - secondary address (0 = load to loadaddr)
//              verify   - non-zero for verify instead of load
//              loadaddr - load address used when sa is 0
//              name     - file name as for a KERNAL LOAD
// Output:      Start address from the file (0 when not found, see
//              uii_status "62,FILE NOT FOUND")
// ---------------------------------------------------------------------------
unsigned uii_softiec_load_setup(char sa, char verify, unsigned loadaddr, const char *name)
{
	char header[8] = {0x00, SOFTIEC_CMD_LOAD_SU, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

	header[2] = sa;
	header[3] = verify;
	header[4] = (char)(loadaddr & 0xff);
	header[5] = (char)(loadaddr >> 8);
	if (!uii_send_with_name(TARGET_SOFTIEC, header, sizeof(header), name) || !UII_SUCCESS)
	{
		return 0;
	}
	return (unsigned)(unsigned char)uii_data[0] | ((unsigned)(unsigned char)uii_data[1] << 8);
}

// ---------------------------------------------------------------------------
// Title:       SoftIEC load, step 2: execute
// Description: Performs the load (or verify) set up by
//              uii_softiec_load_setup. The firmware writes the data into
//              C64/C128 memory by DMA (C128: 1 MHz only, bank 0) and closes
//              the file.
// Syntax:      unsigned uii_softiec_load_execute(char sa, char verify,
//                                                char *flag);
// Input:       sa     - secondary address as used for the set up
//              verify - non-zero for verify
//              flag   - receives the result flag (UII_SOFTIEC_VERIFY_ERROR
//                       set on a verify error); may be NULL
// Output:      End address + 1 of the loaded data (0 for a verify)
// ---------------------------------------------------------------------------
unsigned uii_softiec_load_execute(char sa, char verify, char *flag)
{
	char cmd[] = {0x00, SOFTIEC_CMD_LOAD_EX, 0x00, 0x00};

	cmd[2] = sa;
	cmd[3] = verify;
	uii_settarget(TARGET_SOFTIEC);
	uii_sendcommand(cmd, sizeof(cmd));
	uii_readdata();
	uii_readstatus();
	uii_accept();

	// The status is binary here: flag byte, then end address (load only)
	if (flag)
	{
		*flag = uii_status[0];
	}
	if (verify)
	{
		return 0;
	}
	return (unsigned)(unsigned char)uii_status[1] | ((unsigned)(unsigned char)uii_status[2] << 8);
}

// ---------------------------------------------------------------------------
// Title:       SoftIEC save
// Description: Saves a memory range to a file on the SoftIEC drive. The
//              firmware reads the data from C64/C128 memory by DMA (C128:
//              1 MHz only, bank 0).
// Syntax:      void uii_softiec_save(char sa, char verify, unsigned start,
//                                    unsigned end, const char *name);
// Input:       sa     - secondary address
//              verify - verify flag
//              start  - first address to save
//              end    - end address (exclusive, as for KERNAL SAVE)
//              name   - file name as for a KERNAL SAVE
// Output:      uii_status: OK or "save error"
// ---------------------------------------------------------------------------
void uii_softiec_save(char sa, char verify, unsigned start, unsigned end, const char *name)
{
	char header[8] = {0x00, SOFTIEC_CMD_SAVE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

	header[2] = verify;     // firmware order: verify flag first, then SA
	header[3] = sa;
	header[4] = (char)(start & 0xff);
	header[5] = (char)(start >> 8);
	header[6] = (char)(end & 0xff);
	header[7] = (char)(end >> 8);
	uii_send_with_name(TARGET_SOFTIEC, header, sizeof(header), name);
}

// ---------------------------------------------------------------------------
// Title:       SoftIEC open
// Description: Opens a channel on the SoftIEC drive, as KERNAL OPEN does.
//              Secondary address 15 is the command channel.
// Syntax:      void uii_softiec_open(char sa, const char *name);
// Input:       sa   - secondary address (channel)
//              name - file name or DOS command
// Output:      uii_status (the firmware returns no status text here)
// ---------------------------------------------------------------------------
void uii_softiec_open(char sa, const char *name)
{
	char header[4] = {0x00, SOFTIEC_CMD_OPEN, 0x00, 0x00};

	header[2] = sa;
	uii_send_with_name(TARGET_SOFTIEC, header, sizeof(header), name);
}

// ---------------------------------------------------------------------------
// Title:       SoftIEC close
// Description: Closes a channel on the SoftIEC drive.
// Syntax:      void uii_softiec_close(char sa);
// Input:       sa - secondary address (channel)
// Output:      uii_status
// ---------------------------------------------------------------------------
void uii_softiec_close(char sa)
{
	char cmd[] = {0x00, SOFTIEC_CMD_CLOSE, 0x00, 0x00};

	cmd[2] = sa;
	uii_settarget(TARGET_SOFTIEC);
	uii_sendcommand(cmd, sizeof(cmd));
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ---------------------------------------------------------------------------
// Title:       SoftIEC write to a channel
// Description: Writes data to an open channel, as KERNAL CHKOUT + CHROUT do.
//              With sa bits 4-7 = UII_SOFTIEC_SA_OPEN the data is a file
//              name to open; with UII_SOFTIEC_SA_CLOSE the channel is closed.
// Syntax:      void uii_softiec_chkout(char sa, const char *data,
//                                      unsigned length);
// Input:       sa     - secondary address (channel)
//              data   - bytes to write (binary allowed)
//              length - number of bytes, at most UII_SOFTIEC_CHKOUT_MAX
// Output:      uii_status (nothing is sent when length is too large)
// ---------------------------------------------------------------------------
void uii_softiec_chkout(char sa, const char *data, unsigned length)
{
	char *fullcmd;

	if (length > UII_SOFTIEC_CHKOUT_MAX)
	{
		return;
	}
	fullcmd = (char *)malloc(length + 4);
	if (!fullcmd)
	{
		return;
	}
	fullcmd[0] = 0x00;
	fullcmd[1] = SOFTIEC_CMD_CHKOUT;
	fullcmd[2] = sa;
	fullcmd[3] = 0x00;
	memcpy(fullcmd + 4, data, length);

	uii_settarget(TARGET_SOFTIEC);
	uii_sendcommand(fullcmd, length + 4);
	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ---------------------------------------------------------------------------
// Title:       SoftIEC read from a channel
// Description: Starts reading from an open channel, as KERNAL CHKIN does.
//              Only sends the command: read the data like after
//              uii_read_file, with uii_readdata()/uii_accept() while
//              uii_isdataavailable() (first block up to 32 bytes, then up
//              to 256 per block).
// Syntax:      void uii_softiec_chkin(char sa);
// Input:       sa - secondary address (channel)
// Output:      None (data follows through the data queue)
// ---------------------------------------------------------------------------
void uii_softiec_chkin(char sa)
{
	char cmd[] = {0x00, SOFTIEC_CMD_CHKIN, 0x00, 0x00};

	cmd[2] = sa;
	uii_settarget(TARGET_SOFTIEC);
	uii_sendcommand(cmd, sizeof(cmd));
}

// ---------------------------------------------------------------------------
// Title:       IEC name to FAT path
// Description: Asks which file on the Ultimate file system an IEC file
//              name would open on a channel, e.g. "//GAMES/:FILE" or a name
//              with a partition prefix. Useful to turn IEC paths into
//              paths for DOS target commands (mount, open).
// Syntax:      void uii_softiec_get_fatname(char channel,
//                                           const char *iecname);
// Input:       channel - secondary address the name would be opened on
//              iecname - IEC file name (PETSCII as sent by the KERNAL)
// Output:      uii_data: full FAT path; uii_status: OK, invalid name,
//              invalid partition or invalid directory
// ---------------------------------------------------------------------------
void uii_softiec_get_fatname(char channel, const char *iecname)
{
	char header[3] = {0x00, SOFTIEC_CMD_GET_FATNAME, 0x00};

	header[2] = channel;
	uii_send_with_name(TARGET_SOFTIEC, header, sizeof(header), iecname);
}

// ---------------------------------------------------------------------------
// Title:       FAT name to IEC name
// Description: Asks how a file name of the Ultimate file system is shown
//              on the IEC side (16 characters, with file type).
// Syntax:      void uii_softiec_get_iecname(const char *fatname);
// Input:       fatname - long file name
// Output:      uii_data[0]: file type code; uii_data + 1: IEC name
// ---------------------------------------------------------------------------
void uii_softiec_get_iecname(const char *fatname)
{
	char header[2] = {0x00, SOFTIEC_CMD_GET_IECNAME};

	uii_send_with_name(TARGET_SOFTIEC, header, sizeof(header), fatname);
}
