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
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"

// Switching code generation to bank 0 common routine section
#pragma code(code)
#pragma data(data)

void uii_get_path(void)
// Get the current path
// The “Get Path” command will return the current path in the file system, starting from the root. The
// path string is returned as a data packet. The status channel reports “00,OK”, as this command can
// never fail.
{
	char cmd[] = {0x00, DOS_CMD_GET_PATH};
	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// uii_open_dir() and uii_get_dir() are only ever called from filebrowse.c
// (bank 2) in the banked uboot64.crt build, so they are compiled into bank
// 2's own code/data section instead of the shared bank-0 pool there -- see
// project memory project_uci315_compat.md's Step 0. This file is also
// compiled into the separate, non-banked uboot_upd12.prg build, which has
// no bank regions defined at all, hence the guard.
#ifdef UBOOT64_BANKED
#pragma code(bcode2)
#pragma data(bdata2)
#endif

void uii_open_dir(void)
// Open a directory
// The “Open Directory” command will attempt to start reading the current directory. The command will
// not return any data, but it will return status information: “00,OK”, “01,DIRECTORY EMPTY”, or, if
// there was an error: “86,CAN'T READ DIRECTORY”.
{
	char cmd[] = {0x00, DOS_CMD_OPEN_DIR};
	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);
	uii_readstatus();
	uii_accept();
}

void uii_get_dir(void)
// Read a directory
// The “Read Directory” command will return the contents of the directory to the data channel. Each
// entry of the directory is transmitted as a data packet. The format is simple: The first char gives the
// attribute of the directory entry, followed by the file name. The attribute has the following fields:
// Bit 7	Bit 6	Bit 5	Bit 4	Bit 3	Bit 2	Bit 1	Bit 0
// 					ARCHIVE	DIR		VOLUME	SYSTEM	HIDDEN	READONLY
// These fields are taken from the attribute char as it exists in FAT directories, and is reused for other
// non-FAT directories.
// Read this in a loop, and _accept() the data
// in order to get the next packet
//
// Each data packet is 512 bytes each
{
	char cmd[] = {0x00, DOS_CMD_READ_DIR};
	unsigned count = 0;
	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);
}

#ifdef UBOOT64_BANKED
#pragma code(code)
#pragma data(data)
#endif

void uii_change_dir(char *directory)
// Change the current directory
// Input: directory - the new directory to change to
// The ‘Change Directory” command is used to let the DOS enter a sub directory. When the DOS starts, the
// current directory will be the root of the SdCard. The parameter given is the name of the directory to
// enter. Like Windows, Linux and MacOS, the names “.” and “..” have special meaning: current and parent
// directory.
// With this command, it is also possible to enter files that have sub-entries, such as “.D64” files. These
// files are treated as sub file systems, and therefore commands as “File Open” will also work on files
// within.
// This command does never return any data. The status channel will tell whether the operation was
// successful. The two possible responses are: “00,OK”, or “83,NO SUCH DIRECTORY”.
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(strlen(directory) + 2);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_CHANGE_DIR;

	for (x = 0; x < strlen(directory); x++)
		fullcmd[x + 2] = directory[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, strlen(directory) + 2);

	free(fullcmd);

	uii_readstatus();
	uii_accept();
}

void uii_create_dir(char *directory)
// Create a new directory
// Input: directory - the name of the new directory to create
// The “Create Dir” command creates the specified directory in the current path.
// This command does not return any data. The status channel will either read “00,OK” or it will contain
// the appropriate filesystem error message.
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(strlen(directory) + 2);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_CREATE_DIR;

	for (x = 0; x < strlen(directory); x++)
		fullcmd[x + 2] = directory[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, strlen(directory) + 2);

	free(fullcmd);

	uii_readstatus();
	uii_accept();
}

void uii_change_dir_home(void)
// Change to the home directory
// The “Copy Home Path” command changes into the user defined home directory specified in the “Home
// Directory” setting under “User Interface Settings”. If the directory does not exist, the appropriate
// filesystem error message is reported on the status channel.
// The command is executed and then falls through to the “Get Path” command; thus it will return the
// current path which the file browser is at.
{
	char cmd[] = {0x00, DOS_CMD_COPY_HOME_PATH};
	unsigned count = 0;

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);
	uii_readstatus();
	uii_accept();
}

void uii_mount_disk(char id, char *filename)
// Mount a disk image
// Input: id - the ID of the disk to mount
//        filename - the name of the disk image file
// The “Mount Disk” command mounts the disk image specified by the <filename> argument on the
// drive using the IEC-ID specified by the single char argument <id>.
// If there is no drive using the specified id, then the drive last mounted on will be used. If there is no
// such drive, the status channel reports “90,DRIVE NOT PRESENT”.
// If the file denoted by <filename> is not a disk image, the status channel reports “89,NOT A DISK
// IMAGE”.
// On successful mount the status channel reports “00,OK”. This command never returns any data.
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(strlen(filename) + 3);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_MOUNT_DISK;
	fullcmd[2] = id;

	for (x = 0; x < strlen(filename); x++)
		fullcmd[x + 3] = filename[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, strlen(filename) + 3);

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_unmount_disk(char id)
// Unmount a disk image
// Input: id - the ID of the disk to unmount
// The “Umount Disk” command unmounts the disk currently mounted on the drive using the IEC-ID
// specified by the single char argument <id>.
// If there is no drive using the specified id, then the drive last mounted on will be used. If there is no
// such drive, the status channel reports “90,DRIVE NOT PRESENT”.
// On successful unmount the status channel reports “00,OK”. The command is considered successful
// even if no disk was mounted beforehand. This command never returns any data.
{
	char cmd[] = {0x00, DOS_CMD_UMOUNT_DISK, 0x00};

	cmd[2] = id;

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 3);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_open_file(char attrib, char *filename)
// Open a file
// Input: attrib - the file attribute
//        filename - the name of the file to open
//
// Attrib will be:
// 0x01 = Read
// 0x02 = Write
// 0x06 = Create new file
// 0x0E = Create (overwriting an existing file)
//
// Full explanation:
// The “Open File” command takes two arguments: an attribute byte; directly followed by the filename to
// be opened. The attribute char contains flags that tell the file system how, in which mode, to open the
// file. The following table shows which flags are applicable:
// Attribute Value
// 		FA_READ				$01
// 		FA_WRITE			$02
// 		FA_CREATE_NEW		$04
// 		FA_CREATE_ALWAYS	$08
// To open a file in read mode, only just use $01. To open a file in write mode, use $02 if the file you write
// to already exists. This mode will not clear the file. Add $04 if you would like to create a new file to
// write; this mode will clear the file to 0 bytes first. Add $08 if the file you open may overwrite a file that
// already exists. (So, in order to open a file for writing that may always overwrite an existing file, use
// $0E.)
// The filename does not need to be null-terminated, as the length of the command determines the length
// of the file name string.
//
// The command will never return data. Status will either be “00,OK”, or a status message from the file
// system.
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(strlen(filename) + 3);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_OPEN_FILE;
	fullcmd[2] = attrib;

	for (x = 0; x < strlen(filename); x++)
		fullcmd[x + 3] = filename[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, strlen(filename) + 3);

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_close_file(void)
// Close the currently opened file
// The “Close File” command closes the file that was last opened. It does not take any arguments, neither
// will this command return any data. The status channel will read:
// “00,OK” or “84,NO FILE TO CLOSE”
{
	char cmd[] = {0x00, DOS_CMD_CLOSE_FILE};

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_write_file(char *data, unsigned length)
// Write data to the currently opened file
// Input: data - the data to write
//        length - the length of the data
// The “Write Data” command will write to the file that is currently open. If there is no file open, the
// status channel will read “85,NO FILE OPEN”. If the file is not opened for writing, the file system will
// return “ACCESS DENIED” onto the status channel. The command will never return data.
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(length + 4);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_WRITE_DATA;
	fullcmd[2] = 0x00;
	fullcmd[3] = 0x00;

	for (x = 0; x < length; x++)
		fullcmd[x + 4] = data[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, length + 4);

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_read_file(unsigned length)
// Read data from the currently opened file
// Input: length - the number of bytes to read
// The “Read Data” command will start a read transfer from the opened file. If there is no file open, the
// reply will be an empty data packet, and the status channel will read “85,NO FILE OPEN”.
// When something goes wrong, this will be reported through the status channel. When everything is
// okay, the status channel will stay quiet.
// As with _get_dir(), read this in a loop, and _accept() the data
// in order to get the next packet
//
// Each data packet is 512 bytes each
{
	char cmd[] = {0x00, DOS_CMD_READ_DATA, 0x00, 0x00};

	cmd[2] = length & 0xFF;
	cmd[3] = length >> 8;

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 4);
}

void uii_seek_file(char posL, char posML, char posMH, char posH)
// Seek to a position in the currently opened file
// The “File Seek” command places the pointer into the currently opened file at a user-defined position.
// The command takes one argument: a 32 bit value, which is transferred LSB first.
// The command never returns any data. When the seek is successful, status returns “00,OK”, or else a
// message from the file system. If there is no file open, the status channel will read “85,NO FILE OPEN”
// Input: posL - the low char of the position
//        posML - the middle low char of the position
//        posMH - the middle high char of the position
//        posH - the high char of the position
{
	char cmd[] = {0x00, DOS_CMD_FILE_SEEK, posL, posML, posMH, posH};

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 6);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_file_info()
// Get information about the currently open file
// The “File Info” command returns a data packet with information about the currently open file. In fact,
// this command executes a file stat command. The format of the data packet is as follows:
//  DWORD size; /* File size */
//  WORD date; /* Last modified date */
//  WORD time; /* Last modified time */
//  char extension[3];
//  char attrib; /* Attribute */
//  char filename[ ];
// Ultimate DOS Command Summary
// Version 1.2, December 16th, 2017 6
// The status response could either be:
// “00,OK”, “85,NO FILE OPEN”, or “88,NO INFORMATION AVAILABLE”
{
	char cmd[] = {0x00, DOS_CMD_FILE_INFO};

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_file_stat(char *filename)
// Get information about a file
// The “File Info” command returns a data packet with information about a file, specified by the ‘filename’
// parameter. The format of the data packet is the same as for DOS_CMD_FILE_INFO (0x07).
// The status response could either be:
// “00,OK”, or “88,FILE NOT FOUND”
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(strlen(filename) + 2);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_FILE_STAT;

	for (x = 0; x < strlen(filename); x++)
		fullcmd[x + 2] = filename[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, strlen(filename) + 2);

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_delete_file(char *filename)
// Delete a file
// Input: filename - the name of the file to delete
// The “Delete File” command deletes the specified file.
// This command does not return any data. The status channel will either read “00,OK” or it will contain
// the appropriate filesystem error message.
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(strlen(filename) + 2);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_DELETE_FILE;

	for (x = 0; x < strlen(filename); x++)
		fullcmd[x + 2] = filename[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, strlen(filename) + 2);

	free(fullcmd);

	uii_readstatus();
	uii_accept();
}

void uii_rename_file(char *oldname, char *newname)
// Rename a file
// Input: oldname - the current name of the file
//        newname - the new name for the file
// The “Rename File” command renames the specified file.
// This command does not return any data. The status channel will either read “00,OK” or it will contain
// the appropriate filesystem error message.
{
	unsigned x = 0;
	unsigned count = 0;
	char *fullcmd = (char *)malloc(strlen(oldname) + strlen(newname) + 3);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_RENAME_FILE;

	count = 2;

	for (x = 0; x < strlen(oldname); x++)
		fullcmd[count++] = oldname[x];

	fullcmd[count++] = 0x00;

	for (x = 0; x < strlen(newname); x++)
		fullcmd[count++] = newname[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, count);

	free(fullcmd);

	uii_readstatus();
	uii_accept();
}

void uii_copy_file(char *source, char *destination)
// Copy a file
// Input: source - the path of the file to copy
//        destination - the path of the new file
// The “Copy File” command copies the file specified by <source> to the file specified by
// <destination>.
// This command does not return any data. The status channel will either read “00,OK” or it will contain
// the appropriate filesystem error message.
{
	unsigned x = 0;
	unsigned count = 0;
	char *fullcmd = (char *)malloc(strlen(source) + strlen(destination) + 3);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_COPY_FILE;

	count = 2;

	for (x = 0; x < strlen(source); x++)
		fullcmd[count++] = source[x];

	fullcmd[count++] = 0x00;

	for (x = 0; x < strlen(destination); x++)
		fullcmd[count++] = destination[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, count);

	free(fullcmd);

	uii_readstatus();
	uii_accept();
}

void uii_get_ramdisk_info(void)
// Get information about GEOS RAM disks in REU
// Output: RAM disk information: 8 bytes with 2 bytes for drive 8-10: drive ID and type
{
	char cmd[] = {0x00, CTRL_CMD_GET_RAMDISK_INFO};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_loadIntoRamDisk(char id, char *filename, char whatif)
// Load a file into the RAM disk
// Input: id - the ID of the RAM disk
//        filename - the name of the file to load
//        whatif - if enabled load as trial to check for success (correct size and type)
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(strlen(filename) + 3);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_LOAD_INTO_RAMDISK;
	fullcmd[2] = id + (128 * whatif);

	for (x = 0; x < strlen(filename); x++)
		fullcmd[x + 3] = filename[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, strlen(filename) + 3);

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_saveRamDisk(char id, char *filename)
// Save a file from the RAM disk
// Input: id - the ID of the RAM disk
//        filename - the name of the file to save
{
	unsigned x = 0;
	char *fullcmd = (char *)malloc(strlen(filename) + 3);
	if (!fullcmd) return;
	fullcmd[0] = 0x00;
	fullcmd[1] = DOS_CMD_SAVE_RAMDISK;
	fullcmd[2] = id;

	for (x = 0; x < strlen(filename); x++)
		fullcmd[x + 3] = filename[x];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(fullcmd, strlen(filename) + 3);

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_save_reu(char size)
// Save REU memory to REU file
// Input: size - the size of the REU memory to save
// Input: size - the size of the REU to load:
// 					0 = 128 KB
// 					1 = 256 KB
// 					2 = 512 KB
// 					3 = 1 MB
// 					4 = 2 MB
// 					5 = 4 MB
// 					6 = 8 MB
// 					7 = 16 MB
//
// The “Save REU” command can be used to write data to the currently opened file from the REU
// memory.
// The status message is either “00,OK”, “02,REQUEST TRUNCATED”, or a message directly from the file
// system.
// The data that is returned is a more detailed string, indicating the number of bytes written from which
// address, such as: “$008000 BYTES SAVED FROM REU $852000”.
{
	char cmd[] = {0x00, DOS_CMD_SAVE_REU, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x01};
	char sizes[8] = {0x01, 0x03, 0x07, 0x0f, 0x1f, 0x3f, 0x7f, 0xff};

	// Reject invalid size indexes instead of reading past sizes[]
	if (size >= sizeof(sizes))
	{
		return;
	}
	cmd[8] = sizes[size];
	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 10);
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_load_reu(char size)
// Load the REU with the specified size
// Input: size - the size of the REU to load:
// 					0 = 128 KB
// 					1 = 256 KB
// 					2 = 512 KB
// 					3 = 1 MB
// 					4 = 2 MB
// 					5 = 4 MB
// 					6 = 8 MB
// 					7 = 16 MB
//
// The “Load REU” command can be used to read data from the currently opened file into the REU
// memory.
// The status message is either “00,OK”, “02,REQUEST TRUNCATED”, or a message directly from the file
// system.
// The data that is returned is a more detailed string, indicating the number of bytes read at which
// address, such as: “$003000 BYTES LOADED TO REU $126800”
{
	char cmd[] = {0x00, DOS_CMD_LOAD_REU, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0x01};
	char sizes[8] = {0x01, 0x03, 0x07, 0x0f, 0x1f, 0x3f, 0x7f, 0xff};

	// Reject invalid size indexes instead of reading past sizes[]
	if (size >= sizeof(sizes))
	{
		return;
	}
	cmd[8] = sizes[size];

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 10);
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_enable_drive_a(void)
// Enable drive A
{
	char cmd[] = {0x00, CTRL_CMD_ENABLE_DISK_A};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_disable_drive_a(void)
// Disable drive A
{
	char cmd[] = {0x00, CTRL_CMD_DISABLE_DISK_A};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_enable_drive_b(void)
// Enable drive B
{
	char cmd[] = {0x00, CTRL_CMD_ENABLE_DISK_B};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_disable_drive_b(void)
// Disable drive B
{
	char cmd[] = {0x00, CTRL_CMD_DISABLE_DISK_B};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_get_drive_a_power(void)
// Get the power status of drive A
{
	char cmd[] = {0x00, CTRL_CMD_DRIVE_A_POWER};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_get_drive_b_power(void)
// Get the power status of drive B
{
	char cmd[] = {0x00, CTRL_CMD_DRIVE_B_POWER};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_get_deviceinfo(void)
// Get device information
{
	char cmd[] = {0x00, CTRL_CMD_GET_DRVINFO};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

char uii_parse_deviceinfo(void)
// Parse the device information
{
	char devicecount, count, temp;

	// Execute UCI 29 : CTRL_CMD_GET_DRVINFO
	uii_get_deviceinfo();

	// Return with success code = 0 if no success
	if (!UII_SUCCESS)
	{
		return 0;
	}

	// Get number of devices to parse
	devicecount = uii_data[0];
	if (!devicecount)
	{
		return 0;
	}

	// Parse first type
	count = 1;
	temp = uii_data[count++];

	// Parse drive A
	if (temp < 0x0f)
	{
		// Drive A found
		uii_devinfo[0].exist = 1;
		uii_devinfo[0].type = temp;
		uii_devinfo[0].id = uii_data[count++];
		uii_devinfo[0].power = uii_data[count++];
		temp = uii_data[count++];
	}

	// Parse drive B
	if (temp < 0x0f)
	{
		// Drive B found
		uii_devinfo[1].exist = 1;
		uii_devinfo[1].type = temp;
		uii_devinfo[1].id = uii_data[count++];
		uii_devinfo[1].power = uii_data[count++];
		temp = uii_data[count++];
	}

	// Parse SoftIEC
	if (temp == 0x0f)
	{
		// SoftIEC
		uii_devinfo[2].exist = 1;
		uii_devinfo[2].type = temp;
		uii_devinfo[2].id = uii_data[count++];
		uii_devinfo[2].power = uii_data[count++];
		temp = uii_data[count++];
	}

	// Parse soft printer
	if (temp == 0x50)
	{
		// SoftPrinter
		uii_devinfo[3].exist = 1;
		uii_devinfo[3].type = temp;
		uii_devinfo[3].id = uii_data[count++];
		uii_devinfo[3].power = uii_data[count];
	}

	return 1;
}

char *uii_device_type(char typeval)
// Convert device type value to string
{
	switch (typeval)
	{
	case 0x00:
		return "1541";
	case 0x01:
		return "1571";
	case 0x02:
		return "1581";
	case 0x0F:
		return "SoftIEC";
	case 0x50:
		return "Printer";
	default:
		return "";
	}
}

void uii_swap_disk(void)
// Swap the disk mounted on drive A with drive B
// The "Swap Disk" command swaps the disk images mounted on drive A and drive B.
// This command does not return any data.
{
	char cmd[] = {0x00, DOS_CMD_SWAP_DISK, 0x00};

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, 3);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_reboot(void)
// Reboot the C64 via the cartridge
// Triggers a clean C64 reset through the Ultimate control interface.
// This command does not return — the machine resets immediately.
{
	char cmd[] = {0x00, CTRL_CMD_REBOOT};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 2);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

void uii_get_hwinfo(char device)
// Get hardware information from the Ultimate cartridge
// Input: device - 0 = product identification string (e.g. "Ultimate 64", "1541 Ultimate II+")
//                 1 = SID chip configuration (byte 0: count; per SID: addr_lo, addr_hi, bits, rsvd, rsvd)
// Result is returned in uii_data[].
{
	char cmd[] = {0x00, CTRL_CMD_GET_HWINFO, 0x00};

	cmd[2] = device;

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, 3);

	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ===========================================================================
// Additions (DMBoot v5, 2026-09-25): commands of released firmware (3.14 /
// 3.15a, GideonZ/1541ultimate software/filemanager/dos.cc and
// software/io/command_interface/control_target.cc) that had no wrapper yet.
// ===========================================================================

// ---------------------------------------------------------------------------
// Title:       Size of the open file
// Description: Returns the size of the currently open file, taken from the
//              "File Info" reply (first 4 bytes, LSB first).
// Syntax:      unsigned long uii_file_size(void);
// Input:       None (a file must be open)
// Output:      File size in bytes (0 when no file is open, see uii_status)
// ---------------------------------------------------------------------------
unsigned long uii_file_size(void)
{
	unsigned long size;

	uii_file_info();
	if (!UII_SUCCESS)
	{
		return 0;
	}

	size = (unsigned long)(unsigned char)uii_data[0];
	size |= (unsigned long)(unsigned char)uii_data[1] << 8;
	size |= (unsigned long)(unsigned char)uii_data[2] << 16;
	size |= (unsigned long)(unsigned char)uii_data[3] << 24;
	return size;
}

// ---------------------------------------------------------------------------
// Title:       REU address command (internal)
// Description: Sends a "Load REU" or "Save REU" DOS command with an explicit
//              REU address and length (both 32-bit LSB first; the firmware
//              masks the top bytes and truncates at the end of the REU).
// Syntax:      void uii_reu_address_command(char command,
//                                           unsigned long reu_addr,
//                                           unsigned long length);
// Input:       command  - DOS_CMD_LOAD_REU or DOS_CMD_SAVE_REU
//              reu_addr - REU address
//              length   - number of bytes
// Output:      uii_data: text such as "$008000 BYTES LOADED TO REU $852000"
//              uii_status: "00,OK", "02,REQUEST TRUNCATED" or a file
//              system error
// ---------------------------------------------------------------------------
static void uii_reu_address_command(char command, unsigned long reu_addr, unsigned long length)
{
	char cmd[10];

	cmd[0] = 0x00;
	cmd[1] = command;
	cmd[2] = (char)(reu_addr & 0xff);
	cmd[3] = (char)((reu_addr >> 8) & 0xff);
	cmd[4] = (char)((reu_addr >> 16) & 0xff);
	cmd[5] = (char)((reu_addr >> 24) & 0xff);
	cmd[6] = (char)(length & 0xff);
	cmd[7] = (char)((length >> 8) & 0xff);
	cmd[8] = (char)((length >> 16) & 0xff);
	cmd[9] = (char)((length >> 24) & 0xff);

	uii_settarget(TARGET_DOS1);
	uii_sendcommand(cmd, sizeof(cmd));
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ---------------------------------------------------------------------------
// Title:       Load open file into the REU at an address
// Description: Reads length bytes of the open file into the REU starting at
//              reu_addr, without passing through C64/C128 memory. Unlike
//              uii_load_reu(size), which always loads at REU address 0.
// Syntax:      void uii_load_reu_at(unsigned long reu_addr,
//                                   unsigned long length);
// Input:       reu_addr - REU destination address
//              length   - number of bytes to read
// Output:      See uii_reu_address_command
// ---------------------------------------------------------------------------
void uii_load_reu_at(unsigned long reu_addr, unsigned long length)
{
	uii_reu_address_command(DOS_CMD_LOAD_REU, reu_addr, length);
}

// ---------------------------------------------------------------------------
// Title:       Save REU memory from an address to the open file
// Description: Writes length bytes of REU memory starting at reu_addr to the
//              open file, without passing through C64/C128 memory.
// Syntax:      void uii_save_reu_at(unsigned long reu_addr,
//                                   unsigned long length);
// Input:       reu_addr - REU source address
//              length   - number of bytes to write
// Output:      See uii_reu_address_command
// ---------------------------------------------------------------------------
void uii_save_reu_at(unsigned long reu_addr, unsigned long length)
{
	uii_reu_address_command(DOS_CMD_SAVE_REU, reu_addr, length);
}

// ASCII bytes used for matching storage names, independent of any charmap
#define UII_ASC_SLASH	0x2f
#define UII_ASC_B		0x62
#define UII_ASC_D		0x64
#define UII_ASC_S		0x73
#define UII_ASC_U		0x75

// ---------------------------------------------------------------------------
// Title:       Lower case an ASCII character (internal)
// Description: Converts an ASCII upper case letter to lower case.
// Syntax:      char uii_ascii_lower(char c);
// Input:       c - ASCII character
// Output:      Lower case character, others unchanged
// ---------------------------------------------------------------------------
static char uii_ascii_lower(char c)
{
	return (c >= 0x41 && c <= 0x5a) ? (char)(c | 0x20) : c;
}

// ---------------------------------------------------------------------------
// Title:       Scan storage media
// Description: Scans the UCI root directory for storage devices:
//              directories whose name starts with "sd" or "usb" (case
//              insensitive). Fills drives[] with lower case paths such as
//              "/usb0/" (the Ultimate II+ only has USB storage; SD cards
//              exist on other Ultimate models). Leaves the current
//              directory at the root.
// Syntax:      char uii_scan_media(char drives[UII_MAX_DRIVES]
//                                  [UII_DRIVE_PATH_LEN], char *count);
// Input:       drives - array to fill
//              count  - receives the number of drives found
// Output:      1 when the root could be read, 0 on error
// ---------------------------------------------------------------------------
char uii_scan_media(char drives[UII_MAX_DRIVES][UII_DRIVE_PATH_LEN], char *count)
{
	static char root[2] = {UII_ASC_SLASH, 0x00};
	char j;
	char *name;

	*count = 0;

	uii_change_dir(root);
	uii_open_dir();
	if (!UII_SUCCESS)
	{
		return 0;
	}

	uii_get_dir();
	while (uii_isdataavailable())
	{
		uii_readdata();
		uii_accept();

		// Byte 0 is the attribute, bit 4 = directory; name follows
		if (!(uii_data[0] & 0x10) || *count >= UII_MAX_DRIVES)
		{
			continue;
		}
		name = uii_data + 1;

		char n0 = uii_ascii_lower(name[0]);
		char n1 = n0 ? uii_ascii_lower(name[1]) : 0;
		char n2 = n1 ? uii_ascii_lower(name[2]) : 0;
		if (!((n0 == UII_ASC_S && n1 == UII_ASC_D) ||
			  (n0 == UII_ASC_U && n1 == UII_ASC_S && n2 == UII_ASC_B)))
		{
			continue;
		}

		// Build "/name/" within UII_DRIVE_PATH_LEN bytes
		drives[*count][0] = UII_ASC_SLASH;
		for (j = 0; name[j] && j < UII_DRIVE_PATH_LEN - 3; j++)
		{
			drives[*count][j + 1] = uii_ascii_lower(name[j]);
		}
		drives[*count][j + 1] = UII_ASC_SLASH;
		drives[*count][j + 2] = 0;
		(*count)++;
	}
	return 1;
}

// ---------------------------------------------------------------------------
// Title:       Find a path on the storage media
// Description: Tries drives[0..count-1] in order and changes to
//              drive + subpath on the first drive where that directory
//              exists. The full path is copied to result (bounded).
// Syntax:      char uii_find_media_path(char drives[UII_MAX_DRIVES]
//                                       [UII_DRIVE_PATH_LEN], char count,
//                                       const char *subpath, char *result,
//                                       unsigned resultsize);
// Input:       drives     - drive paths from uii_scan_media
//              count      - number of drives
//              subpath    - path below the drive root, e.g. "11/"
//              result     - buffer for the found full path
//              resultsize - size of result in bytes
// Output:      1 when found (current directory is there), 0 when not
//              found or the path does not fit (result is then "")
// ---------------------------------------------------------------------------
char uii_find_media_path(char drives[UII_MAX_DRIVES][UII_DRIVE_PATH_LEN], char count,
						 const char *subpath, char *result, unsigned resultsize)
{
	unsigned sublen = strlen(subpath);

	if (!resultsize)
	{
		return 0;
	}
	result[0] = 0;

	for (char i = 0; i < count; i++)
	{
		unsigned drivelen = strlen(drives[i]);
		if (drivelen + sublen + 1 > resultsize)
		{
			continue;
		}

		memcpy(result, drives[i], drivelen);
		memcpy(result + drivelen, subpath, sublen + 1);
		uii_change_dir(result);
		if (UII_SUCCESS)
		{
			return 1;
		}
	}
	result[0] = 0;
	return 0;
}

// ---------------------------------------------------------------------------
// Title:       Finish tape capture
// Description: Ends a running tape recording (Ultimate tape capture).
// Syntax:      void uii_finish_capture(void);
// Input:       None
// Output:      uii_status
// ---------------------------------------------------------------------------
void uii_finish_capture(void)
{
	char cmd[] = {0x00, CTRL_CMD_FINISH_CAPTURE};

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, sizeof(cmd));
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ---------------------------------------------------------------------------
// Title:       Decode a GCR track
// Description: Lets the Ultimate decode a raw GCR track that is in the REU
//              into sector data, also in the REU.
// Syntax:      void uii_decode_track(char track, char maxsector,
//                                    unsigned long gcr_addr,
//                                    unsigned long bin_addr,
//                                    unsigned tracklength);
// Input:       track       - track number
//              maxsector   - number of sectors expected on the track
//              gcr_addr    - REU address of the GCR data (24 bit)
//              bin_addr    - REU address for the decoded sectors (24 bit)
//              tracklength - length of the GCR data in bytes
// Output:      uii_data[0] = number of sectors found, followed by 2 status
//              bytes per sector; uii_status "00,OK" or errors on track
// ---------------------------------------------------------------------------
void uii_decode_track(char track, char maxsector, unsigned long gcr_addr, unsigned long bin_addr, unsigned tracklength)
{
	char cmd[14];

	cmd[0] = 0x00;
	cmd[1] = CTRL_CMD_DECODE_TRACK;
	cmd[2] = track;
	cmd[3] = maxsector;
	cmd[4] = (char)(gcr_addr & 0xff);
	cmd[5] = (char)((gcr_addr >> 8) & 0xff);
	cmd[6] = (char)((gcr_addr >> 16) & 0xff);
	cmd[7] = 0x00;
	cmd[8] = (char)(bin_addr & 0xff);
	cmd[9] = (char)((bin_addr >> 8) & 0xff);
	cmd[10] = (char)((bin_addr >> 16) & 0xff);
	cmd[11] = 0x00;
	cmd[12] = (char)(tracklength & 0xff);
	cmd[13] = (char)(tracklength >> 8);

	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, sizeof(cmd));
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ---------------------------------------------------------------------------
// Title:       Erase an EasyFlash sector
// Description: Erases (fills with $FF) one EasyFlash sector of the cartridge
//              ROM emulated by the Ultimate: 8 banks of 8 KB, low or high ROM.
// Syntax:      void uii_easyflash_erase(char bank, char baseaddr);
// Input:       bank     - first bank of the sector (bits 3-5 are used)
//              baseaddr - high byte of the ROM address ($80 low ROM,
//                         $A0/$E0 high ROM)
// Output:      uii_status
// ---------------------------------------------------------------------------
void uii_easyflash_erase(char bank, char baseaddr)
{
	char cmd[] = {0x00, CTRL_CMD_EASYFLASH, 0x00, 0x00, 0x00};

	cmd[3] = bank;
	cmd[4] = baseaddr;
	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, sizeof(cmd));
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ---------------------------------------------------------------------------
// Title:       REU preload command (internal)
// Description: Sends the control target "Load REU" / "Save REU" command,
//              which loads or saves the REU preload image configured in the
//              Ultimate's own menu (C64 and Cartridge Settings).
// Syntax:      void uii_reu_preload_command(char command);
// Input:       command - CTRL_CMD_LOAD_REU or CTRL_CMD_SAVE_REU
// Output:      uii_data: 4 bytes result code (LSB first) + message text
//              uii_status: "00,OK", "84,REU NOT ENABLED",
//              "86,REU OFFSET > SIZE. NOT SAVED" or cannot open file
// ---------------------------------------------------------------------------
static void uii_reu_preload_command(char command)
{
	char cmd[] = {0x00, 0x00, 0x00, 0x00, 0x00};

	cmd[1] = command;
	uii_settarget(TARGET_CONTROL);
	uii_sendcommand(cmd, sizeof(cmd));
	uii_readdata();
	uii_readstatus();
	uii_accept();
}

// ---------------------------------------------------------------------------
// Title:       Load the configured REU preload image
// Description: Loads the REU preload image set in the Ultimate menu.
// Syntax:      void uii_load_reu_preload(void);
// Input:       None
// Output:      See uii_reu_preload_command
// ---------------------------------------------------------------------------
void uii_load_reu_preload(void)
{
	uii_reu_preload_command(CTRL_CMD_LOAD_REU);
}

// ---------------------------------------------------------------------------
// Title:       Save the REU to the configured preload image
// Description: Saves the REU to the REU preload image set in the Ultimate
//              menu.
// Syntax:      void uii_save_reu_preload(void);
// Input:       None
// Output:      See uii_reu_preload_command
// ---------------------------------------------------------------------------
void uii_save_reu_preload(void)
{
	uii_reu_preload_command(CTRL_CMD_SAVE_REU);
}

// ---------------------------------------------------------------------------
// Title:       Load settings from a config file
// Description: Firmware 3.15+: loads Ultimate settings from a .cfg text file
//              ("[store]" sections with "item=value" lines, as written by the
//              Ultimate's "Save Settings") and applies them. Only the items
//              present in the file are changed.
// Syntax:      void uii_load_config(const char *filename);
// Input:       filename - full path of the .cfg file; "" uses the firmware
//                         default "/temp/uci_config.cfg"
// Output:      uii_data: parse log of lines that could not be applied
//              uii_status: "00,OK", "88,CANNOT OPEN CONFIG FILE" or
//              "89,CONFIG FILE HAD ERRORS"
// ---------------------------------------------------------------------------
void uii_load_config(const char *filename)
{
	char header[2] = {0x00, CTRL_CMD_LOAD_CONFIG};

	uii_send_with_name(TARGET_CONTROL, header, sizeof(header), filename);
}
