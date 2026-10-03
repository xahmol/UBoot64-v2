// UBoot64 v2:
// Boot menu for C64 Ultimate enabled devices
// Written in 2023 (v1), 2026 (v2) by Xander Mol
// https://github.com/xahmol/UBoot64-v2
// https://www.idreamtin8bits.com/
//
// Built-in conversion of old config/slot files (GitHub issue #23).
//
// When the config file found at start-up has an older format (its first
// byte, ConfigStruct.version, is below CFGVERSION), mainloop() calls
// convert_old_files() after REU detection. It asks the user, backs up the
// old files as dmbcfg.v<n>/dmbslt.v<n> (verified by reading them back),
// converts them to the current format and writes the new files, so the
// start continues with them. This replaces the standalone tools
// uboot_upd12 (v1) and uboot_upd23 (v2), whose conversion rules it
// follows step for step.
//
// Bank 3 (cartridge ROM); everything it calls is in bank 0 (RAM). The REU
// holds the old files: the slot area (0 .. SLOTS * sizeof(Slot)) receives
// the converted slots, the old data and the read-back for the verification
// live above it. `Slot` (1360 bytes) is the scratch buffer for file I/O,
// so no extra RAM is needed.
//
// The code can be used freely as long as you retain
// a notice describing original source and author.
//
// THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL,
// BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!

// Includes
#include <c64/charwin.h>
#include <petscii.h> // charmap: string literals in PETSCII, as in the other modules
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "defines.h"
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"
#include "core.h"
#include "fileio.h"
#include "convert.h"

#pragma code(bcode3)
#pragma data(bdata3)

extern int reudetected;

// REU layout during the conversion (above the slot area, which ends at
// SLOTS * sizeof(Slot) = 29088 for format v4; the directory listing buffer
// there isn't in use yet at start-up). Needs a 128 KB REU.
#define CONV_OLDSLOTS 0x8000UL  // old slot file (up to 32 KB: also a converted v4 file)
#define CONV_OLDCFG 0x10000UL   // old config file, up to 512 bytes
#define CONV_VERIFY 0x18000UL   // read-back of a backup, up to 32 KB
#define CONV_MAXREAD 0x8000UL   // largest file accepted

// Old file sizes
#define V1_CFG_SIZE 86
#define V1_SLOT_SIZE 488 // uboot_upd12's OldSlotStruct
#define V2_CFG_SIZE 100
#define V3_CFG_SIZE 263 // 264 with apply_cfg (development builds of 4.0.0, which reported v3.1.0)

// Field offsets in a v1 slot (OldSlotStruct in uboot_upd12.c)
#define V1_PATH 0          // char[100]
#define V1_MENU 100        // char[21]
#define V1_FILE 121        // char[20]
#define V1_CMD 141         // char[80]
#define V1_REU_IMAGE 221   // char[20]
#define V1_FLAGS 241       // reusize, runboot, device, command (then cfgvs)
#define V1_IMAGE_A_PATH 246 // char[100]
#define V1_IMAGE_A_FILE 346 // char[20]
#define V1_IMAGE_A_ID 366
#define V1_IMAGE_B_PATH 367 // char[100]
#define V1_IMAGE_B_FILE 467 // char[20]
#define V1_IMAGE_B_ID 487

static long conv_read_to_reu(char *name, unsigned long addr)
// Read a whole file into the REU.
// Input:  name - file name in configpath
//         addr - REU address
// Output: number of bytes read, -1 if the file can't be opened or read,
//         or is larger than CONV_MAXREAD
{
    unsigned long count = 0;
    unsigned got;
    unsigned bytesread;

    uii_change_dir(configpath);
    uii_open_file(0x01, name);
    if (!UII_SUCCESS)
    {
        return -1;
    }

    // Ask for one byte more than allowed, so an oversized file shows
    do
    {
        got = 0;
        uii_read_file((unsigned)(CONV_MAXREAD + 1 - count));
        while (uii_isdataavailable() || uii_ismoredataavailable())
        {
            bytesread = uii_readdata();
            uii_accept();
            if (count + bytesread > CONV_MAXREAD)
            {
                uii_close_file();
                return -1;
            }
            uboot_reu_store(addr + count, uii_data, bytesread);
            count += bytesread;
            got += bytesread;
        }
    } while (got && count <= CONV_MAXREAD);

    uii_close_file();
    return (long)count;
}

static char conv_write_from_reu(char *name, unsigned long addr, unsigned long length)
// Write length bytes from the REU to a new file (an existing one is
// deleted first), SAVE_BUF_SIZE bytes per UCI command through `Slot`.
// Output: 1 = written, 0 = error (uii_status tells which)
{
    unsigned long pos = 0;
    unsigned chunk;
    char *buffer = (char *)&Slot;

    uii_change_dir(configpath);
    uii_delete_file(name); // Fails when there is no such file: fine
    uii_open_file(0x06, name);
    if (!UII_SUCCESS)
    {
        return 0;
    }
    while (pos < length)
    {
        chunk = (length - pos < SAVE_BUF_SIZE) ? (unsigned)(length - pos) : SAVE_BUF_SIZE;
        uboot_reu_load(addr + pos, buffer, chunk);
        uii_write_file(buffer, chunk);
        if (!UII_SUCCESS)
        {
            uii_close_file();
            return 0;
        }
        pos += chunk;
    }
    uii_close_file();
    return 1;
}

static char conv_backup(char *name, unsigned long addr, unsigned long length)
// Write a backup file and verify it: read it back into CONV_VERIFY and
// compare with the original in the REU.
// Output: 1 = written and identical, 0 = error
{
    unsigned long pos = 0;
    unsigned chunk;
    char *original = (char *)&Slot;
    char *copy = (char *)&Slot + SAVE_BUF_SIZE;

    if (!conv_write_from_reu(name, addr, length))
    {
        return 0;
    }
    if (conv_read_to_reu(name, CONV_VERIFY) != (long)length)
    {
        return 0;
    }
    while (pos < length)
    {
        chunk = (length - pos < SAVE_BUF_SIZE) ? (unsigned)(length - pos) : SAVE_BUF_SIZE;
        uboot_reu_load(addr + pos, original, chunk);
        uboot_reu_load(CONV_VERIFY + pos, copy, chunk);
        if (memcmp(original, copy, chunk) != 0)
        {
            return 0;
        }
        pos += chunk;
    }
    return 1;
}

static void conv_fail(const char *what, char filesunchanged, char version)
// Report a failed step and exit to BASIC.
// Input: what           - the step that failed
//        filesunchanged - 1: before anything new was written
//        version        - old format version (names the backups)
{
    cwin_console_printf(&cw, cfg.colors.error, "\nConversion failed: %s.\nStatus: %s\n", what, uii_status);
    if (filesunchanged)
    {
        cwin_console_printf(&cw, cfg.colors.text, "Your files are unchanged.\n");
    }
    else
    {
        cwin_console_printf(&cw, cfg.colors.text, "The old files are kept as\ndmbcfg.v%u and dmbslt.v%u.\n", version, version);
    }
    uii_abort();
    errorexit("");
}

static void conv_config_v1(void)
// v1 config (86 bytes): [1] timeon, [2..5] seconds from UTC (most
// significant byte first), [6..85] NTP server. Everything else keeps the
// defaults mainloop() set. readconfigfile() copied the v1 bytes over the
// first 86 bytes of cfg, so every field they cover is set again here.
// Rules from uboot_upd12's read_old_configfile().
{
    char *v1 = linebuffer;

    uboot_reu_load(CONV_OLDCFG, v1, V1_CFG_SIZE);
    cfg.timeon = v1[1];
    cfg.secondsfromutc = v1[5] | (((unsigned long)v1[4]) << 8) | (((unsigned long)v1[3]) << 16) | (((unsigned long)v1[2]) << 24);
    memset(cfg.host, 0, MAXHOSTLENGTH);
    memcpy(cfg.host, v1 + 6, V1_CFG_SIZE - 6); // 80 bytes; host is 81
    if (!cfg.host[0])
    {
        strcpy(cfg.host, "time.google.com"); // The default of new configs (mainloop())
    }
}

static void conv_slots_v1(void)
// Convert 18 v1 slots (488 bytes each, at CONV_OLDSLOTS) into the slot
// area, field by field. Rules from uboot_upd12's convert_slot_data().
{
    char x;
    unsigned long src;
    char flags[4];

    for (x = 0; x < SLOTS; x++)
    {
        src = CONV_OLDSLOTS + (unsigned long)x * V1_SLOT_SIZE;

        // Every target field is longer than its v1 field, so the zeroed
        // struct terminates each string
        memset(&Slot, 0, sizeof(Slot));
        uboot_reu_load(src + V1_PATH, Slot.path, 100);
        uboot_reu_load(src + V1_MENU, Slot.menu, 21);
        uboot_reu_load(src + V1_FILE, Slot.file, 20);
        uboot_reu_load(src + V1_CMD, Slot.cmd, 80);
        uboot_reu_load(src + V1_REU_IMAGE, Slot.reu_image, 20);
        uboot_reu_load(src + V1_FLAGS, flags, 4);
        Slot.reusize = flags[0];
        Slot.runboot = flags[1];
        Slot.device = flags[2];
        Slot.command = flags[3];
        uboot_reu_load(src + V1_IMAGE_A_PATH, Slot.image_a_path, 100);
        uboot_reu_load(src + V1_IMAGE_A_FILE, Slot.image_a_file, 20);
        uboot_reu_load(src + V1_IMAGE_A_ID, &Slot.image_a_id, 1);
        uboot_reu_load(src + V1_IMAGE_B_PATH, Slot.image_b_path, 100);
        uboot_reu_load(src + V1_IMAGE_B_FILE, Slot.image_b_file, 20);
        uboot_reu_load(src + V1_IMAGE_B_ID, &Slot.image_b_id, 1);

        // v1 loaded the REU image from image_a_path (GitHub issue #6)
        if (Slot.command & COMMAND_REU)
        {
            strcpy(Slot.reu_path, Slot.image_a_path);
        }
        Slot.cfgvs = CFGVERSION;
        Slot.isdefault = 0;
        Slot.partition = 0;
        strncpy(Slot.padding, "uboot64 x mol", 11); // As read_slotsfile() creates new slots

        save_slot_to_reu(x);
    }
}

static void conv_slots_old(char version)
// v2 and v3 slots (1360 bytes, V3_SLOT_SIZE) into the slot area: the fields
// up to partition are today's; settings (format v4) starts empty. v2 also
// gets its partition byte zeroed (v2 had "uboot64 x mol" filler there) and
// REU slots their reu_path -- the rules of uboot_upd23's
// sanitize_slot_data().
// Input: version - 2 or 3
{
    char x;

    for (x = 0; x < SLOTS; x++)
    {
        memset(&Slot, 0, sizeof(Slot));
        uboot_reu_load(CONV_OLDSLOTS + (unsigned long)x * V3_SLOT_SIZE, (char *)&Slot, V3_SLOT_FIELDS);
        if (version == 2)
        {
            Slot.partition = 0;
            if ((Slot.command & COMMAND_REU) && !Slot.reu_path[0])
            {
                strncpy(Slot.reu_path, Slot.image_a_path, MAXPATHLEN - 1);
                Slot.reu_path[MAXPATHLEN - 1] = 0;
            }
        }
        Slot.cfgvs = CFGVERSION;
        strncpy(Slot.padding, "uboot64 x mol", 11); // As read_slotsfile() creates new slots
        save_slot_to_reu(x);
    }
}

static void conv_slots_current(void)
// A slot file an interrupted earlier run already converted: copy as is
{
    char x;

    for (x = 0; x < SLOTS; x++)
    {
        uboot_reu_load(CONV_OLDSLOTS + (unsigned long)x * sizeof(Slot), (char *)&Slot, sizeof(Slot));
        save_slot_to_reu(x);
    }
}

void convert_old_files(void)
// Convert config and slot files of format v1, v2 or v3 to the current format,
// after asking. Called by mainloop() when cfg.version != CFGVERSION, after
// REU detection. Returns when the new files are written; exits to BASIC
// when the user declines or a step fails.
{
    char version = cfg.version;
    char answer;
    char slotsdone = 0;
    long cfgsize;
    long slotsize;
    unsigned long expectslots;
    char name[12];
    char firstbyte;

    cwin_clear(&cw);
    headertext("Convert old files", 0); // At most 19 characters: the version follows at column 20
    cwin_cursor_move(&cw, 0, 3);

    if (version == 0 || version > CFGVERSION)
    {
        cwin_console_printf(&cw, cfg.colors.text, "The configuration file has format v%u,\nwhich this UBoot64 doesn't know.\n", version);
        errorexit("Update UBoot64, or remove the file.");
    }

    asc2pet_path(linebuffer2, configpath, sizeof(linebuffer2));
    cwin_console_printf(&cw, cfg.colors.text, "The configuration and slot files on\n%s have the old format v%u.\n\n", linebuffer2, version);
    cwin_console_printf(&cw, cfg.colors.text, "Convert them to the current format v%u?\n", CFGVERSION);
    cwin_console_printf(&cw, cfg.colors.text, "The old files are kept as\ndmbcfg.v%u and dmbslt.v%u.\n\n", version, version);
    cwin_console_printf(&cw, cfg.colors.text, "Convert? Y/N ");
    answer = getkey(128);
    cwin_console_printf(&cw, cfg.colors.text, "%c\n", answer);
    if (answer == 78)
    {
        errorexit("Not converted. You are asked again at\nthe next start.");
    }

    if (reudetected < 2)
    {
        conv_fail("needs a REU of 128 KB or more", 1, version);
    }

    // Read both old files into the REU
    cwin_console_printf(&cw, cfg.colors.text, "\nReading the old files.\n");
    cfgsize = conv_read_to_reu(configfilename, CONV_OLDCFG);
    if (cfgsize < (version == 1 ? V1_CFG_SIZE : version == 2 ? V2_CFG_SIZE : V3_CFG_SIZE) || cfgsize > 512)
    {
        conv_fail("reading the configuration file", 1, version);
    }
    slotsize = conv_read_to_reu(slotfilename, CONV_OLDSLOTS);
    expectslots = (version == 1) ? (unsigned long)V1_SLOT_SIZE * SLOTS : (unsigned long)V3_SLOT_SIZE * SLOTS;

    // An earlier, interrupted conversion may have written the new slot
    // file already (the config file is written last): then its first
    // byte is the current version and its size the current one. A v1
    // slot starts with its path, v2/v3 slots with 2/3, never with that
    // byte.
    uboot_reu_load(CONV_OLDSLOTS, &firstbyte, 1);
    if (slotsize == (long)sizeof(Slot) * SLOTS && firstbyte == CFGVERSION)
    {
        slotsdone = 1;
    }
    else if (slotsize != (long)expectslots)
    {
        conv_fail("the slot file has an unexpected size", 1, version);
    }

    // Back up and verify, before anything is changed. A slot file that
    // is already converted isn't backed up again: an earlier run did that.
    cwin_console_printf(&cw, cfg.colors.text, "Backing up the old files.\n");
    sprintf(name, "dmbcfg.v%u", version);
    if (!conv_backup(name, CONV_OLDCFG, cfgsize))
    {
        conv_fail("backing up the configuration file", 1, version);
    }
    if (!slotsdone)
    {
        sprintf(name, "dmbslt.v%u", version);
        if (!conv_backup(name, CONV_OLDSLOTS, slotsize))
        {
            conv_fail("backing up the slot file", 1, version);
        }
    }

    // Convert
    cwin_console_printf(&cw, cfg.colors.text, "Converting.\n");
    if (version == 1)
    {
        conv_config_v1();
    }
    else
    {
        // v2/v3 config: today's layout, possibly without the fields
        // appended since, which keep the defaults mainloop() set
        uboot_reu_load(CONV_OLDCFG, (char *)&cfg, (cfgsize < (long)sizeof(cfg)) ? (unsigned)cfgsize : sizeof(cfg));
    }
    if (slotsdone)
    {
        conv_slots_current();
    }
    else if (version == 1)
    {
        conv_slots_v1();
    }
    else
    {
        conv_slots_old(version);
    }
    cfg.version = CFGVERSION;

    // Write the new files: slots first, config last, so an interrupted
    // run still finds the old config and converts again (see above)
    cwin_console_printf(&cw, cfg.colors.text, "Writing the new files.\n");
    if (!conv_write_from_reu(slotfilename, SLOT_REU_START, (unsigned long)sizeof(Slot) * SLOTS))
    {
        conv_fail("writing the slot file", 0, version);
    }
    uii_change_dir(configpath);
    uii_delete_file(configfilename);
    uii_open_file(0x06, configfilename);
    if (UII_SUCCESS)
    {
        uii_write_file((char *)&cfg, sizeof(cfg));
        answer = UII_SUCCESS;
        uii_close_file();
    }
    else
    {
        answer = 0;
    }
    if (!answer)
    {
        conv_fail("writing the configuration file", 0, version);
    }

    cwin_console_printf(&cw, cfg.colors.ok, "\nConverted to format v%u.\n", CFGVERSION);
    cwin_console_printf(&cw, cfg.colors.text, "Press a key to continue.");
    cwin_getch();

    // Back to the start-up screen mainloop() was drawing
    cwin_clear(&cw);
    headertext("Starting....", 0);
    cwin_cursor_move(&cw, 0, 3);
}
