// UBoot64 v2:
// Boot menu for C64 Ultimate enabled devices
// Written in 2023 (v1), 2026 (v2) by Xander Mol
// https://github.com/xahmol/UBoot64-v2
// https://www.idreamtin8bits.com/
//
// Configuration upgrade utility: migrates v2 slot/config files to v3 format.
//
// v3 adds SlotStruct.partition (firmware 3.15+ SoftIEC partition selection)
// by repurposing one byte of the old padding[12] array. v2's default-slot-
// creation code stamped "uboot64 x mol" across that whole array, so that
// byte holds a watermark character, not a reliable zero, in every existing
// v2 slot file -- this tool explicitly zeroes it and bumps cfgvs/version,
// rather than trusting the old bytes as-is. Unlike uboot_upd12 (v1->v2),
// no field remapping is needed: v2's SlotStruct/ConfigStruct are already
// today's shape byte-for-byte, aside from that one reinterpreted byte and
// one appended ConfigStruct field (which is separately safe to read from a
// shorter old file -- see readconfigfile()'s zero-fill/min-copy pattern in
// fileio.c -- but the shared CFGVERSION gate still needs bumping here).
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
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"
#include "ultimate_time_lib.h"

// Global variables
struct SlotStruct Slot;
struct ConfigStruct cfg;
char configpath[8] = "";
char storagepaths[4][8] = {"/sd/", "/usb0/", "/usb1/", "/usb2/"};
char configfilename[11] = "dmbcfg.cfg";
char slotfilename[11] = "dmbslt.cfg";
int reudetected;
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

char resolve_storage_path(void)
// Scan storagepaths[] in priority order (SD, USB0, USB1, USB2).
// Sets configpath to the first candidate where the config file already
// exists, or -- if none has it -- the first candidate that is simply
// present/mountable, so callers can create fresh files there.
// Output: 2 = existing config found, 1 = no config found but a device is
//         present (configpath set to it), 0 = no device present at all.
{
    char x;
    char firstpresent = 0xFF;

    for (x = 0; x < 4; x++)
    {
        uii_change_dir(storagepaths[x]);
        if (!UII_SUCCESS)
        {
            continue;
        }
        if (firstpresent == 0xFF)
        {
            firstpresent = x;
        }
        uii_open_file(0x01, configfilename);
        if (strcmp((const char *)uii_status, "00,ok") == 0)
        {
            uii_close_file();
            strncpy(configpath, storagepaths[x], 7);
            configpath[7] = 0;
            return 2;
        }
    }

    if (firstpresent != 0xFF)
    {
        strncpy(configpath, storagepaths[firstpresent], 7);
        configpath[7] = 0;
        return 1;
    }
    return 0;
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
// Read a v2 config file directly into the current ConfigStruct shape (v2
// and v3 share the same layout aside from one appended trailing field) and
// bump it to v3. Mirrors fileio.c's readconfigfile() zero-fill/min-copy
// pattern, since the v2 file is one byte shorter than sizeof(cfg).
{
    unsigned bytesread;

    uii_open_file(0x01, configfilename);

    if (strcmp((const char *)uii_status, "00,ok") != 0)
    {
        error("\nNo config file found.");
    }

    memset(&cfg, 0, sizeof(cfg));
    uii_read_file(sizeof(cfg));
    CheckStatus("reading config");
    bytesread = uii_readdata();
    uii_accept();
    memcpy(&cfg, uii_data, min((unsigned)sizeof(cfg), bytesread));

    uii_close_file();

    cfg.version = CFGVERSION;
}

void read_old_slotsfile()
// Read a v2-format slots file directly into the normal slot REU area -- no
// remapping needed, since v2's SlotStruct is already today's shape.
{
    long count = SLOT_REU_START;
    long end = SLOT_REU_START + (sizeof(Slot) * SLOTS);
    unsigned bytesread;
    char ypos;

    // Go to proper dir
    uii_change_dir(configpath);

    uii_open_file(0x01, slotfilename);

    if (strcmp((const char *)uii_status, "00,ok") != 0)
    {
        error("\nNo slots file found.");
    }

    ypos = cw.cy + 1;
    cwin_console_printf(&cw, VCOL_YELLOW, "\nReading %lu to %lu", count, end);

    while (count < end)
    {
        uii_read_file(sizeof(Slot) * SLOTS);

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

void sanitize_slot_data()
// Sanitize each slot already sitting in the normal REU area: v2's default-
// slot-creation code stamped "uboot64 x mol" across the whole padding[12]
// array, so the byte that is now Slot.partition holds a watermark
// character ('u'), not a reliable zero, in every existing v2 slot --
// explicitly zero it and bump cfgvs, regardless of whatever value happens
// to already be there.
{
    char x;
    long address;
    char ypos = cw.cy + 1;

    for (x = 0; x < SLOTS; x++)
    {
        address = (long)x * sizeof(Slot) + SLOT_REU_START;
        reu_load(address, (char *)&Slot, sizeof(Slot));

        cwin_cursor_move(&cw, 0, ypos);
        cwin_console_printf(&cw, VCOL_YELLOW, "Sanitizing slot %u", x);

        Slot.partition = 0;
        Slot.cfgvs = CFGVERSION;

        reu_store(address, (char *)&Slot, sizeof(Slot));
    }
}

// Workaround for an Oscar64 optimizer regression (toolchain commit 3bbffe9,
// "Improve __memmap storage modifier adherence for REU usage", 2026-06-20,
// and its follow-ups): the library's inline reu_count_pages() has its
// volatile-read comparisons of the REU probe byte dead-code-eliminated,
// so it always returns 0 even when a REU is present. Passing the probe byte
// through this __noinline barrier forces the compiler to materialize the
// value at a real call boundary instead of assuming it away.
// See ~/.claude/oscar64.md for the full diagnosis, and src/main.c for the
// original copy of this workaround (this file is a separate standalone
// build, so it needs its own copy rather than sharing main.c's).
__noinline char reu_probe_barrier(char v)
{
    return v;
}

int uboot64_reu_count_pages(void)
{
    volatile char c, d;

    c = 0;
    reu_store(0, &c, 1);
    reu_load(0, &d, 1);

    if (reu_probe_barrier(d) == 0)
    {
        c = 0x47;
        reu_store(0, &c, 1);
        reu_load(0, &d, 1);

        if (reu_probe_barrier(d) == 0x47)
        {
            for (int i = 1; i < 256; i++)
            {
                long l = (long)i << 16;
                c = 0x47;
                reu_store(l, &c, 1);
                c = 0x00;
                reu_store(0, &c, 1);

                reu_load(l, &d, 1);
                if (reu_probe_barrier(d) != 0x47)
                    return i;
            }

            return 256;
        }
    }

    return 0;
}

int main(void)
{
    // Set config default values, in case a fresh one needs writing
    cfg.version = CFGVERSION;
    cfg.timeon = 1;
    cfg.secondsfromutc = 7200;
    cfg.verbose = 1;
    cfg.timeoutidx = 0;
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
    headertext("Update config 2-3", 0);
    cwin_cursor_move(&cw, 0, 3);

    // Is Ultimate Command Interface detected? If no, abort. Sends the
    // firmware 3.15+ unlock sequence up front, so UCI comes up even if it
    // isn't enabled in the Ultimate's own menu.
    if (!uii_wait_for_uci(10))
    {
        error("No Ultimate Command Interface enabled. Enable it in the Ultimate menu, or update to firmware 3.15 or later.");
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
    reudetected = uboot64_reu_count_pages();
    if (reudetected)
    {
        cwin_console_printf(&cw, VCOL_YELLOW, "\nREU detected, size: %d KB\n", reudetected * 64);
    }
    else
    {
        error("No REU detected.");
    }

    // Find where the config/slot files live: SD, USB0, USB1 or USB2, in that
    // priority order -- must match the same resolution the main cartridge
    // uses, or this tool could upgrade a file on a device the cartridge
    // never looks at. Retries the whole scan for up to 5 seconds.
    {
        char storageresult;

        cia1.tods = 0;
        cia1.todt = 0;
        do
        {
            storageresult = resolve_storage_path();
        } while (storageresult == 0 && cia1.tods < 5);
        if (storageresult == 0)
        {
            error("No USB or SD storage found.");
        }
        cwin_console_printf(&cw, VCOL_YELLOW, "\nStorage found: %s\n", configpath);
    }

    // Read old config file and bump to v3.
    cwin_console_printf(&cw, VCOL_YELLOW, "\nReading old config file...");
    read_old_configfile();

    // Write new config file
    cwin_console_printf(&cw, VCOL_YELLOW, "\nWriting new config file...");
    writeconfigfile();

    // Read old slots file directly into the normal slot REU area
    cwin_console_printf(&cw, VCOL_YELLOW, "\nReading old slots file...");
    read_old_slotsfile();

    // Sanitize the partition field and bump cfgvs for every slot
    cwin_cursor_move(&cw, 0, cw.cy + 1);
    cwin_console_printf(&cw, VCOL_YELLOW, "\nSanitizing slot data...");
    sanitize_slot_data();

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
