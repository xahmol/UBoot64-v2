// UBoot64 v2:
// Boot menu for C64 Ultimate enabled devices
// Written in 2023  (v1), 2025 (v2) by Xander Mol
// https://github.com/xahmol/UBoot64-v2
// https://www.idreamtin8bits.com/
//
// Inspired by and code used from DraBrowse:
// DraBrowse (db*) is a simple file browser.
// Originally created 2009 by Sascha Bader.
// Used version adapted by Dirk Jagdmann (doj)
// https://github.com/doj/dracopy
//
// Most of code and functionality ported from:
// DMBoot 128:
// Device Manager Boot Menu for the Commodore 128
// Written in 2020-2023 by Xander Mol
// https://github.com/xahmol/DMBoot
//
// Additionally uses code from:
// - Ultimate 64/II+ Command Library
//   Scott Hutter, Francesco Sblendorio
//   https://github.com/xlar54/ultimateii-dos-lib
// - ntp2ultimate by MaxPlap
//   https://github.com/MaxPlap/ntp2ultimate
//   Time via NTP code
// - EPOCH-to-time-date-converter by sidsingh78
//   https://github.com/sidsingh78/EPOCH-to-time-date-converter/blob/master/epoch_conv.c
// - petcom version 1.00 by Craig Bruce, 18-May-1995
//   Convert from PETSCII to ASCII, or vice-versa.
//   https://codebase64.org/doku.php?id=source_conversion
//
// Requires and made possible by the Ultimate II+ cartridge,
// Created by Gideon Zweijtzer
// https://ultimate64.com/
//
// The code can be used freely as long as you retain
// a notice describing original source and author.
//
// THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL,
// BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!

// Includes
#include <c64/memmap.h>
#include <c64/charwin.h>
#include <c64/cia.h>
#include <c64/vic.h>
#include <c64/types.h>
#include <petscii.h>
#include <stdio.h>
#include <string.h>
#include <peekpoke.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include "defines.h"
#include "fc3.h"
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"
#include "ultimate_time_lib.h"
#include "ultimate_network_lib.h"
#include "u-time.h"

// Ram area for copied common routines code and common data, plus bss/heap/stack
// Common routine code and data will be copied on startup from ROM bank 0

#pragma region( main, 0x4900, 0x8000, , , { bss, heap, stack } )

// Section and region for FC3 bank zero common routines to be copied to main RAM
#pragma section(startcode, 0)
#pragma region(start, 0x8100, 0x8200, , 0, { startcode})

// Section and region for FC3 bank zero common routines to be copied to main RAM
#pragma section(code, 0)
#pragma section(data, 0)
#pragma region(bank0, 0x8200, 0xc000, , 0, { code, data }, 0x0900 )

// Section and region for FC3 bank 1
#pragma section(bcode1, 0)
#pragma section(bdata1, 0)
#pragma region(bank1, 0x8000, 0xc000, , 1, { bcode1, bdata1 } )

// Section and region for FC3 bank 2
#pragma section(bcode2, 0)
#pragma section(bdata2, 0)
#pragma region(bank2, 0x8000, 0xc000, , 2, { bcode2, bdata2 } )

// Section and region for FC3 bank 3
#pragma section(bcode3, 0)
#pragma section(bdata3, 0)
#pragma region(bank3, 0x8000, 0xc000, , 3, { bcode3, bdata3 } )

// Charwin in shared memory section

CharWin cw;

// Now switch code generation to bank 1

#pragma code(bcode1)
#pragma data(bdata1)

// Print into shared charwin

void print1(void)
{
	cwin_put_string(&cw, "This is first bank", 7);
	cwin_cursor_newline(&cw);
}

// Now switch code generation to bank 2

#pragma code(bcode2)
#pragma data(bdata2)

void print2(void)
{
	cwin_put_string(&cw, "This is second bank", 7);
	cwin_cursor_newline(&cw);
}

#pragma code(bcode3)
#pragma data(bdata3)

void print3(void)
{
	cwin_put_string(&cw, "This is third bank", 7);
	cwin_cursor_newline(&cw);
}

// Switching code generation back to the bank 0 common routine section
#pragma code(code)
#pragma data(data)

// Global variables
BYTE SCREENW;
BYTE DIRW;
BYTE MENUX;
char path[8][51];
char pathfile[51];
BYTE pathdevice;
BYTE pathrunboot;
BYTE depth = 0;
BYTE trace = 0;
BYTE comma1 = 1;
BYTE demomode = 0;
BYTE commandflag = 0;
BYTE reuflag = 0;
BYTE addmountflag = 0;
BYTE runmountflag = 0;
BYTE mountflag = 0;

struct SlotStruct *Slot;
struct SlotStruct *FirstSlot;
struct SlotStruct *BufferSlot;
long secondsfromutc = 7200;
char timeonflag = 1;
char host[80] = "pool.ntp.org";
char imagename[51];
char reufilepath[256];
char imageaname[51] = "";
char imageapath[256] = "";
char imageaid = 0;
char imagebname[51] = "";
char imagebpath[256] = "";
char imagebid = 0;
char reusize = 2;
char reusizelist[8][8] = {"128 KB", "256 KB", "512 KB", "1 MB", "2 MB", "4 MB", "8 MB", "16 MB"};
char utilbuffer[86];
char configpath[8] = "/usb*/";
char configfilename[11] = "dmbcfg.cfg";
char slotfilename[11] = "dmbslt.cfg";
char configversion = CFGVERSION;
char menuselect;
char fb_selection_made = 0;
char fb_uci_mode;
char inside_mount;
char iec_devices[23];

// Macro for indirect cross bank call
#define FCALL(f) fcall(__bankof(f), f)

__noinline void mainloop(void)
{
	char x;

	SCREENW = 40; // Set flag for 40 column
	DIRW = 25;
	MENUX = 25;

	// Init VIC
	vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);

	// Prepare output window
	cwin_init(&cw, (char *)0x0400, 0, 0, 40, 25);
	cwin_clear(&cw);

	if (!fb_selection_made)
	{
		// Is Ultimate Command Interface detected? If no, abort
		if (!uii_detect())
		{
			cwin_put_string(&cw, "No Ultimate Command Interface enabled.", 7);
			cwin_cursor_newline(&cw);
			cwin_put_string(&cw, "Press key to exit.", 7);
			cwin_cursor_newline(&cw);
			cwin_getch();
		}
		else
		{
			cwin_put_string(&cw, "Ultimate Command Interface detected.", 7);
			cwin_cursor_newline(&cw);
		}

		// Feedback on UCI DOS version
		uii_identify();
		cwin_put_string(&cw, uii_data, 7);
		cwin_cursor_newline(&cw);

		// Wait for USB to be present by looping till dirchange to root successful
		// Times out on 5 secs
		cia_seconds = 0;
		cia_tensofsec = 0;
		do
		{
			uii_change_dir(configpath);
		} while (!UII_SUCCESS || cia_seconds > 4);
		if (!UII_SUCCESS)
		{
			cwin_put_string(&cw, "USB storage not found.", 7);
			cwin_cursor_newline(&cw);
		}

		fc3_call(1, print1);
		fc3_call(2, print2);
		fc3_call(3, print3);

		cwin_getch();
	}
}

// Switching code generation to startup section
#pragma code(startcode)

int main(void)
{
	// Enable ROM
	mmap_set(MMAP_ROM);

	// Init CIAs (no kernal rom was executed so far)
	cia_init();

	// Copy common routines code and data to main RAM
	for (int i = 0; i < 0x3e00; i++)
		((char *)0x0900)[i] = ((char *)0x8200)[i];

	// Go to main loop, which is now copied to main RAM
	mainloop();

	// Program never returns here
	return 0;
}
