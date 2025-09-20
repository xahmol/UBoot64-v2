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
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"
#include "ultimate_time_lib.h"

// Defines
#define OLDSLOT_BUFFER_START (SLOT_REU_START + (sizeof(Slot) * SLOTS))

// Global variables
struct SlotStruct Slot;
struct SlotStruct BufferSlot;
struct ConfigStruct cfg;

struct OldSlotStruct
{
    char path[100];
    char menu[21];
    char file[20];
    char cmd[80];
    char reu_image[20];
    char reusize;
    char runboot;
    char device;
    char command;
    char cfgvs;
    char image_a_path[100];
    char image_a_file[20];
    char image_a_id;
    char image_b_path[100];
    char image_b_file[20];
    char image_b_id;
};
struct OldSlotStruct OldSlot;
char configpath[8] = "/usb*/";
char configfilename[11] = "dmbcfg.cfg";
char slotfilename[11] = "dmbslt.cfg";
char configversion = CFGVERSION;
int reudetected;
char utilbuffer[86];
char linebuffer[100];

// Screen output generic routines
void error(const char *msg)
{
    cwin_console_printf(&cw, VCOL_YELLOW, "\n%s\nPress key to exit to BASIC.\n", msg);
    cwin_getch();
    exit(1);
}

// static char p2smap[] = {0x00, 0x20, 0x00, 0x40, 0x00, 0x60, 0x40, 0x60};
static char p2smap[] = {0x00, 0x00, 0x40, 0x20, 0x80, 0xc0, 0x80, 0x80};
// static char s2pmap[] = {0x40, 0x20, 0x60, 0xa0, 0x40, 0x20, 0x60, 0xa0};
static char s2pmap[] = {0x40, 0x00, 0x20, 0xc0, 0xc0, 0x80, 0xa0, 0x40};

static inline char p2s(char ch)
{
    return ch ^ p2smap[ch >> 5];
}

static inline char s2p(char ch)
{
    return ch ^ s2pmap[ch >> 5];
}

void cwin_putat_string_reverse(CharWin *win, char x, char y, const char *str, char color)
{
    char len = strlen((char *)str);

    if (len > 99)
    {
        len = 99;
    }

    for (char i = 0; i < len; i++)
    {
        linebuffer[i] = p2s(str[i]) | 0x80;
    }

    linebuffer[len] = 0;

    cwin_putat_string_raw(win, x, y, linebuffer, color);
}

void headertext(const char *subtitle, char time)
// Draw header text
// Input: subtitle is text to draw on second line
//        time = 1 to draw time on right side
{
    cwin_fill_rect_raw(&cw, 0, 0, 40, 1, SC_REVSPACE, cfg.colors.header1);
    cwin_fill_rect_raw(&cw, 0, 1, 40, 1, SC_REVSPACE, cfg.colors.header2);
    cwin_putat_string_reverse(&cw, 0, 0, "UBoot64:  Boot Menu for Ultimate devices", cfg.colors.header1);
    cwin_putat_string_reverse(&cw, 0, 1, subtitle, cfg.colors.header2);

    if (time)
    {
        uii_get_time();
        cwin_putat_string_reverse(&cw, 40 - strlen(uii_data), 1, uii_data, cfg.colors.header2);
    }
    else
    {
        cwin_putat_string_reverse(&cw, 40 - strlen(VERSION), 1, VERSION, cfg.colors.header2);
    }
}

// Config file I/O functions
void CheckStatus(const char *message)
// Function to check UII+ status and print error box if applicable
{
    if (!UII_SUCCESS)
    {
        cwin_console_printf(&cw, VCOL_YELLOW, "\nI/O error in %s.\n", message);
        cwin_console_printf(&cw, VCOL_YELLOW, "\nStatus: %s\n", uii_status);
        uii_abort();
        error("");
    }
}

void write_slotsfile()
// Function to write slots file
{
    long count = SLOT_REU_START;
    long end = SLOT_REU_START + (sizeof(Slot) * SLOTS);
    char save_buffer[SAVE_BUF_SIZE];
    unsigned save_length = SAVE_BUF_SIZE;
    char ypos = cw.cy;

    // Go to proper dir
    uii_change_dir(configpath);

    // Delete old config file as I can not (yet) get overwrite to work
    uii_delete_file(slotfilename);

    // Save slots via UCI, one slot at a time due to 512 char limit
    uii_open_file(0x06, slotfilename);

    while (count < end)
    {
        cwin_cursor_move(&cw, 0, ypos);
        cwin_console_printf(&cw, VCOL_YELLOW, "Writing slot data at %lu.", count);
        memset(save_buffer, 0, sizeof(save_buffer));
        if (end - count < SAVE_BUF_SIZE)
        {
            save_length = end - count;
        }
        reu_load(count, save_buffer, save_length);
        uii_write_file(save_buffer, save_length);
        CheckStatus("writing slots");
        count += SAVE_BUF_SIZE;
    }

    uii_close_file();
}

void writeconfigfile()
// Function to write config file
{
    // Delete old config file as I can not (yet) get overwrite to work
    uii_delete_file(configfilename);
    uii_open_file(0x06, configfilename);
    uii_write_file((char *)&cfg, sizeof(cfg));
    CheckStatus("writing config");
    uii_close_file();
}

void read_old_configfile()
// Function to read old config file and update to new format
{
    char x;

    uii_open_file(0x01, configfilename);

    // Write a config file with default values if no file is found
    if (strcmp((const char *)uii_status, "00,ok") != 0)
    {
        error("\nNo config file found.");
        exit(1);
    }

    uii_read_file(sizeof(utilbuffer));
    CheckStatus("reading config");
    uii_readdata();
    uii_accept();

    // Read variables from read data
    cfg.timeon = uii_data[1];

    cfg.secondsfromutc = uii_data[5] | (((unsigned long)uii_data[4]) << 8) | (((unsigned long)uii_data[3]) << 16) | (((unsigned long)uii_data[2]) << 24);

    for (x = 0; x < 80; x++)
    {
        cfg.host[x] = uii_data[6 + x];
    }

    // If no hostname is read due to old config file format, set default
    if (strlen(cfg.host) == 0)
    {
        strcpy(cfg.host, "pool.ntp.org");
    }

    uii_close_file();
}

void read_old_slotsfile()
// Function to read old slots file to buffer REU memory
{
    char x;
    long count = OLDSLOT_BUFFER_START;
    long end = count + (sizeof(OldSlot) * SLOTS);
    unsigned bytesread;
    char ypos;

    // Go to proper dir
    uii_change_dir(configpath);

    uii_open_file(0x01, slotfilename);

    // Check if a file already exists, otherwise create new one
    if (strcmp((const char *)uii_status, "00,ok") != 0)
    {
        error("\nNo slots file found.");
        exit(1);
    }

    ypos = cw.cy + 1;
    cwin_console_printf(&cw, VCOL_YELLOW, "\nReading %lu to %lu", count, end);

    while (count < end)
    {
        uii_read_file(sizeof(OldSlot) * SLOTS);

        while (uii_isdataavailable() || uii_ismoredataavailable())
        {
            bytesread = uii_readdata();
            uii_accept();
            CheckStatus("reading slots");
            reu_store(count, uii_data, bytesread);
            count += bytesread;
            cwin_cursor_move(&cw, 0, ypos);
            cwin_console_printf(&cw, VCOL_YELLOW, "Reading slot data to %lu.", count);
        }
    }

    uii_close_file();

    cwin_cursor_newline(&cw);
}

void convert_slot_data()
// Function to convert old slot data in buffer REU memory to new format in normal REU
{
    char x;
    long destaddr = SLOT_REU_START;
    long srcaddr = OLDSLOT_BUFFER_START;
    char ypos;

    ypos = cw.cy + 1;

    for (x = 0; x < SLOTS; x++)
    {
        // Print status
        cwin_cursor_move(&cw, 0, ypos);
        cwin_console_printf(&cw, VCOL_YELLOW, "Converting slot %u", x);

        // Read old slot data from buffer REU memory
        reu_load(srcaddr, (char *)&OldSlot, sizeof(OldSlot));
        srcaddr += sizeof(OldSlot);

        // Convert old slot data to new slot data
        memset(&Slot, 0, sizeof(Slot));
        Slot.cfgvs = configversion;
        strncpy(Slot.path, OldSlot.path, MAXPATHLEN - 1);
        strncpy(Slot.menu, OldSlot.menu, MAXMENUNAME - 1);
        strncpy(Slot.file, OldSlot.file, MAXFILENAME - 1);
        strncpy(Slot.cmd, OldSlot.cmd, MAXCOMMAND - 1);
        strncpy(Slot.reu_image, OldSlot.reu_image, MAXFILENAME - 1);
        Slot.reusize = OldSlot.reusize;
        Slot.runboot = OldSlot.runboot;
        Slot.device = OldSlot.device;
        Slot.command = OldSlot.command;
        strncpy(Slot.image_a_path, OldSlot.image_a_path, MAXPATHLEN - 1);
        strncpy(Slot.image_a_file, OldSlot.image_a_file, MAXFILENAME - 1);
        Slot.image_a_id = OldSlot.image_a_id;
        strncpy(Slot.image_b_path, OldSlot.image_b_path, MAXPATHLEN - 1);
        strncpy(Slot.image_b_file, OldSlot.image_b_file, MAXFILENAME - 1);
        Slot.image_b_id = OldSlot.image_b_id;
        strncpy(Slot.padding, "uboot64 x mol", 13); // Padding to make structure size a multiple of 16

        // Write new slot data to normal REU memory
        reu_store(destaddr, (char *)&Slot, sizeof(Slot));
        destaddr += sizeof(Slot);
    }
}

int main(void)
{
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
    headertext("Update config 1-2", 0);
    cwin_cursor_move(&cw, 0, 3);

    // Is Ultimate Command Interface detected? If no, abort
    if (!uii_detect())
    {
        error("No Ultimate Command Interface enabled.");
    }
    else
    {
        cwin_put_string(&cw, "Ultimate Command Interface detected.", VCOL_YELLOW);
        cwin_cursor_newline(&cw);

        // Feedback on UCI DOS version
        uii_identify();
        cwin_put_string(&cw, "DOS version: ", VCOL_YELLOW);
        cwin_put_string(&cw, uii_data, VCOL_YELLOW);
        cwin_cursor_newline(&cw);
    }

    // Check presence and size of REU
    reudetected = reu_count_pages();
    if (reudetected)
    {
        cwin_console_printf(&cw, VCOL_YELLOW, "\nREU detected, size: %d KB\n", reudetected * 64);
    }
    else
    {
        error("No REU detected.");
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
        error("USB storage not found.");
    }

    // Read old config file.
    cwin_console_printf(&cw, VCOL_YELLOW, "\nReading old config file...");
    read_old_configfile();

    // Write new config file
    cwin_console_printf(&cw, VCOL_YELLOW, "\nWriting new config file...");
    writeconfigfile();

    // Read old slots file to buffer REU memory
    cwin_console_printf(&cw, VCOL_YELLOW, "\nReading old slots file...");
    read_old_slotsfile();

    // Convert old slot data in buffer REU memory to new format in normal REU
    cwin_cursor_move(&cw, 0, cw.cy + 1);
    cwin_console_printf(&cw, VCOL_YELLOW, "\nConverting slot data...");
    convert_slot_data();

    // Write new slots file
    cwin_cursor_move(&cw, 0, cw.cy + 1);
    cwin_console_printf(&cw, VCOL_YELLOW, "\nWriting new slots file...");
    write_slotsfile();

    // Close
    cwin_cursor_move(&cw, 0, cw.cy + 1);
    cwin_console_printf(&cw, VCOL_YELLOW, "\n\nUpdate completed.\n");
    cwin_console_printf(&cw, VCOL_YELLOW, "Press key to exit to BASIC.\n");
    cwin_getch();

    // Clear screen and exit to BASIC
    cwin_clear(&cw);
    
    return 0;
}
