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
#include <c64/sprites.h>
#include <c64/reu.h>
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
#include "core.h"
#include "fileio.h"
#include "u-time.h"
#include "slotmenu.h"
#include "filebrowse.h"

// Ram area for copied common routines code and common data, plus bss/heap/stack
// Common routine code and data will be copied on startup from ROM bank 0

#pragma region( main, 0x4900, 0x8000, , , { bss, heap, stack } )

// Section and region for FC3 bank zero start code
#pragma section(startcode, 0)
#pragma section(startdata, 0)
#pragma region(start, 0x8060, 0x8200, , 0, { startcode, startdata })

// Section and region for FC3 bank zero banking code to go to $C000 in main RAM
#pragma section(fc3code, 0)
#pragma section(fc3data, 0)
#pragma region(fc3control, 0x8200, 0x8300, , 0, { fc3code, fc3data }, 0xc000 )

// Section and region for FC3 bank zero common routines to be copied to main RAM
#pragma section(code, 0)
#pragma section(data, 0)
#pragma region(bank0, 0x8300, 0xc000, , 0, { code, data }, 0x0900 )

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

// Switching code generation back to the bank 0 common routine section
#pragma code(code)
#pragma data(data)

// Global variables
char path[8][MAXFILENAME];
char pathfile[MAXFILENAME];
char pathdevice;
char pathrunboot;
char depth = 0;
char trace = 0;
char comma1 = 1;
char demomode = 0;
char commandflag = 0;
char reuflag = 0;
char addmountflag = 0;
char runmountflag = 0;
char mountflag = 0;
int reudetected;

struct SlotStruct Slot;
struct SlotStruct BufferSlot;
struct ConfigStruct cfg;

char imagename[MAXFILENAME];
char reufilepath[MAXPATHLEN];
char imageaname[MAXFILENAME] = "";
char imageapath[MAXPATHLEN] = "";
char imageaid = 0;
char imagebname[MAXFILENAME] = "";
char imagebpath[MAXPATHLEN] = "";
char imagebid = 0;
char reusize = 2;
char reusizelist[8][8] = {"128 KB", "256 KB", "512 KB", "1 MB", "2 MB", "4 MB", "8 MB", "16 MB"};
char configpath[8] = "/usb*/";
char configfilename[11] = "dmbcfg.cfg";
char slotfilename[11] = "dmbslt.cfg";
char configversion = CFGVERSION;
char menuselect;
char fb_selection_made = 0;
char fb_uci_mode;
char inside_mount;
char iec_devices[23];
char inside_mount;
char verbosecounter;

// Macro for indirect cross bank call
#define FCALL(f) fcall(__bankof(f), f)

// Placement of sprite in cassette buffer
#define SpriteData ((char *)0x0340)

__noinline void mainloop(void)
// Main loop
{
	char x;
	int key;

	verbosecounter = 0;

	// Set config defauklt values
	cfg.version = CFGVERSION;
	cfg.timeon = 1;
	cfg.secondsfromutc = 7200;
	cfg.verbose = 1;
	cfg.colors.background = VCOL_BLACK;
	cfg.colors.border = VCOL_BLACK;
	cfg.colors.header1 = VCOL_GREEN;
	cfg.colors.header2 = VCOL_LT_GREEN;
	cfg.colors.text = VCOL_YELLOW;
	cfg.colors.text_input = VCOL_WHITE;
	cfg.colors.key = VCOL_CYAN;
	cfg.colors.diritem_normal = VCOL_WHITE;
	cfg.colors.diritem_select = VCOL_CYAN;
	cfg.colors.error = VCOL_RED;
	cfg.colors.ok = VCOL_GREEN;
	strcpy(cfg.host, "pool.ntp.org");

	// Init VIC
	vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
	vic.color_border = VCOL_BLACK;
	vic.color_back = VCOL_BLACK;

	// Prepare output window
	cwin_init(&cw, (char *)0x0400, 0, 0, 40, 25);
	cwin_clear(&cw);

	// Initialize the sprite
	spr_init((char *)0x0400);
	spr_set(0, true, 320, 70, 0x0340 / 64, VCOL_CYAN, false, false, false);

	headertext("Starting....", 0);
	cwin_cursor_move(&cw, 0, 3);

	cwin_put_string(&cw, "Detecting and reading...", cfg.colors.text);

	// Is Ultimate Command Interface detected? If no, abort
	if (!uii_detect())
	{
		cwin_put_string(&cw, "No Ultimate Command Interface enabled.", cfg.colors.text);
		cwin_cursor_newline(&cw);
		cwin_put_string(&cw, "Press key to exit.", cfg.colors.text);
		cwin_cursor_newline(&cw);
		cwin_getch();
		fc3_exit();
	}

	// Wait for USB to be present by looping till dirchange to root successful
	// Times out on 5 secs
	cia1.tods = 0;
	cia1.todt = 0;
	do
	{
		uii_change_dir(configpath);
	} while (!UII_SUCCESS || cia1.tods > 4);
	if (!UII_SUCCESS)
	{
		errorexit("USB storage not found.");
	}

	// Read config file.
	// Need to do this before printing verbose feedback to avoid printing feednack
	// with verbose off if config file sets verbose off.
	// But can't do this before uii_detect() as that needs to be tested before config can be read.
	readconfigfile();

	// Recolor header in case config file has different color scheme
	headertext("Starting....", 0);
	vic.color_border = cfg.colors.border;
	vic.color_back = cfg.colors.background;

	// Therefore we print verbose feedback on UCI detection success only now
	if (cfg.verbose)
	{
		cwin_cursor_move(&cw, 0, 4);
		cwin_put_string(&cw, "Ultimate Command Interface detected.", cfg.colors.text);
		cwin_cursor_newline(&cw);
	}
	else
	{
		spinning(25, 3, verbosecounter++);
	}

	// Feedback on UCI DOS version
	uii_identify();

	if (cfg.verbose)
	{
		cwin_put_string(&cw, "DOS version: ", cfg.colors.text);
		cwin_put_string(&cw, uii_data, cfg.colors.text);
		cwin_cursor_newline(&cw);
	}
	else
	{
		spinning(25, 3, verbosecounter++);
	}

	// Check presence and size of REU
	reudetected = reu_count_pages();
	if (reudetected)
	{
		if (cfg.verbose)
		{
			cwin_console_printf(&cw, cfg.colors.text, "\nREU detected, size: %d KB\n", reudetected * 64);
		}
		else
		{
			spinning(25, 3, verbosecounter++);
		}
	}
	else
	{
		errorexit("No REU detected.");
	}

	// Read slots file
	read_slotsfile(1);

	// Read (and print feedback of) drive configuration
	if (!uii_parse_deviceinfo())
	{
		errorexit("Getting device info fails.");
	}

	if (cfg.verbose)
	{
		cwin_console_printf(&cw, cfg.colors.text, "\nRecognised Ultimate devices:\n");
		if (uii_devinfo[0].exist)
		{
			cwin_console_printf(&cw, cfg.colors.text, "Drive A: ID %2d Pow %s, %s\n", uii_devinfo[0].id, (uii_devinfo[0].power) ? "On" : "Off", uii_device_type(uii_devinfo[0].type));
		}
		if (uii_devinfo[1].exist)
		{
			cwin_console_printf(&cw, cfg.colors.text, "Drive B: ID %2d Pow %s, %s\n", uii_devinfo[1].id, (uii_devinfo[1].power) ? "On" : "Off", uii_device_type(uii_devinfo[1].type));
		}
		if (uii_devinfo[2].exist)
		{
			cwin_console_printf(&cw, cfg.colors.text, "SoftIEC: ID %2d Pow %s\n", uii_devinfo[2].id, (uii_devinfo[2].power) ? "On" : "Off");
		}
		if (uii_devinfo[3].exist)
		{
			cwin_console_printf(&cw, cfg.colors.text, "Printer: ID %2d Pow %s\n", uii_devinfo[3].id, (uii_devinfo[3].power) ? "On" : "Off");
		}
		cwin_console_printf(&cw, cfg.colors.text, "IDs needing manual power switching: %s\n", (CheckActiveIECdevices()) ? "Yes" : "No");
		cwin_console_printf(&cw, cfg.colors.text, "Active IEC IDs: ");
		for (x = 0; x < 23; x++)
		{
			if (iec_devices[x])
			{
				cwin_console_printf(&cw, cfg.colors.text, "%02d ", (x == 22) ? 4 : x + 8);
			}
		}
		cwin_cursor_newline(&cw);
	}
	else
	{
		spinning(25, 3, verbosecounter++);
	}

	// Set time from NTP server
	fc3_call(1, time_main);

	// Uncomment to pause on boot status feedback for debug
	// cwin_getch();

	// Disable sprite logo
	spr_show(0, false);

	do
	{
		fc3_call(1, mainmenu);

		if ((menuselect > 47 && menuselect < 58) || (menuselect > 64 && menuselect < 91))
		// Menuslots 0-9, a-z
		{
			runbootfrommenu(keytomenuslot(menuselect));
		}

		switch (menuselect)
		{
		case CH_F1:
			// Filebrowser
			fc3_call(2, mainLoopBrowse);
			if (fb_selection_made == 1)
			{
				//			pickmenuslot();
			}
			break;

		case CH_F2:
			// Information and credits
			fc3_call(1, information);
			break;

		case CH_F3:
			// Edit / re-order and delete menuslots
			fc3_call(1, editmenuoptions);
			break;

		case CH_F5:
			fc3_call(1, edittimeconfig);
			break;

		default:
			break;
		}
	} while (menuselect != CH_F7);

	// Uncomment to pause on boot status feedback for debug
	// cwin_getch();

	// Exit program
	fc3_exit();
}

// Switching code generation to startup section
#pragma code(startcode)
#pragma data(startdata)

// Start message
const char startmessage[42] = "Starting UBoot64.\r\rCopying core to RAM.\r";

// Logo sprite
const char logo_sprite[64] = {
	0x00, 0x0F, 0x80, 0x00, 0x10, 0x40, 0x00, 0x10, 0x40, 0x00, 0x13, 0x80, 0x00, 0x12, 0x00, 0x00,
	0x3F, 0x00, 0x40, 0xC0, 0xC0, 0xA3, 0x00, 0x30, 0x94, 0x00, 0x18, 0x9A, 0xBA, 0x94, 0x92, 0xA2,
	0xA2, 0x52, 0xBB, 0xA2, 0x22, 0xA8, 0xA1, 0x23, 0xB8, 0xA1, 0x5C, 0x00, 0x22, 0x93, 0x00, 0x22,
	0x88, 0xC0, 0xD4, 0x94, 0x3F, 0x18, 0x93, 0x00, 0x30, 0xA0, 0xC0, 0xC0, 0x40, 0x3F, 0x00, 0x07};

int main(void)
{
	// Enable ROM
	mmap_set(MMAP_ROM);

	// FC3 init code
	__asm
	{
		sei // Disable interrupts
		ldx #$FF				
		txs
		ldx #$05
		sta $D016 // Turn on VIC for PAL / NTSC check
		jsr $FDA3 // Init I/O
		jsr	$FF84 // Prepare IRQ

							// Set Start of Tape Buffer pointer
    	ldx #$3c
    	ldy #$03
    	stx $B2
    	sty $B3

									// Set IO Start address and OS end of memory pointer
    	ldx #$00
    	ldy #$A0
    	stx $C1
    	stx $0283
    	sty $C2
    	sty $0284

													// Set OS Start of memory and screen memory
    	lda #$08
    	sta $0282
    	lda #$04
    	sta $0288

		jsr $FD15 // Init I/O
		jsr $FF5B // Init video
		cli // Restore interrupts

																		// Switch to second charset
		lda	#14
		jsr $FFD2 // Call C64 KERNAL BSOUT

																			// Set colors
		lda #$00 // Load value for black
		sta $D021 // Store as background color (VIC_BG_COLOR0)
		lda #$07 // Load value for yellow
		sta $0286 // Store as foreground color (CHARCOLOR)

			// Print start message
		ldx #$00
fc3init_loop1:       
		lda startmessage,x
    	beq fc3init_next1
		jsr $FFD2 // Call C64 KERNAL BSOUT
    	inx
    	bne fc3init_loop1
fc3init_next1:
	}

	// Copy FC3 control routines code and data to high RAM at $C000
	for (int i = 0; i < 0x100; i++)
	{
		((char *)0xc000)[i] = ((char *)0x8200)[i];
		vic.color_border++; // Border color effect
	}

	// Copy common routines code and data to main RAM
	for (int i = 0; i < 0x3d00; i++)
	{
		((char *)0x0900)[i] = ((char *)0x8300)[i];
		vic.color_border++; // Border color effect
	}

	// Prepare sprite
	for (char i = 0; i < 64; i++)
	{
		((char *)0x0340)[i] = logo_sprite[i];
		vic.color_border++; // Border color effect
	}

	// Go to main loop, which is now copied to main RAM
	mainloop();

	// Program never returns here
	return 0;
}
