// UBoot64 v2:
// Boot menu for C64 Ultimate enabled devices
// Written in 2023 (v1), 2026 (v2) by Xander Mol
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
// - GenCart64 - cc65 Library for C64 cartridges
//   Joseph Rose, a.k.a. Harry Potter
//   https://sourceforge.net/projects/cc65extra/files/memory%20cfgs/
//   Used for inspiration for building C64 cartridge image with CC65
// - Sidekick64 by frntc
//   https://github.com/frntc/Sidekick64/blob/master/Source/Firmware/C64Side/cart.a
//   Used as inspiration for cartridge init and exit code
// - UUC based on Final Cartridge III by Bart van Leeuwen / bvl1999
//   https://github.com/bvl1999/final_cartridge/blob/master/core/init.s
//   Used for inspiration for building C64 cartridge image with CC65
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
// Bart van Leeuwen: For suggesting the default boot slot with
// configurable auto-boot timeout feature.
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
#include "slotmenu.h"
#include "splash.h"

// Bank 1: slot menu UI — boot menu display, slot selection, slot editing (rename/delete/reorder),
// and boot execution. Cross-bank calls to bank 0 via fc3_call for I/O and config operations.
#pragma code(bcode1)
#pragma data(bdata1)

// Menu slot functions
char menuslotkey(char slotnumber)
// Routine to convert numerical slotnumber to key in menu
// Input: Slotnumber = menu slot number
// Output: Corresponding 0-9, a-z key
{

    if (slotnumber < 10)
    {
        return slotnumber + 48; // Numbers 0-9
    }
    else
    {
        return slotnumber + 87; // Letters a-z
    }
}

char keytomenuslot(char keypress)
// Routine to convert keypress to numerical slotnumber
// Input: keypress = ASCII value of key pressed 0-9 or a-z
// Output: Corresponding menuslotnumber
{

    if (keypress > 64)
    {
        return keypress - 55;
    }
    else
    {
        return keypress - 48;
    }
}

void menuslotnumnerprint(char slotnumber)
// Routine to print the slotnumber key at the start of the menu line
// Input: Slotnumber = menu slot number
{
    sprintf(linebuffer, "  %c ", menuslotkey(slotnumber));
    cwin_putat_string_reverse(&cw, 0, slotnumber + 3, linebuffer, cfg.colors.key);
}

void presentmenuslots()
// Routine to show all 18 menu slots on screen
{
    char x;

    for (x = 0; x < 18; ++x)
    {
        get_slot_from_reu(x);

        menuslotnumnerprint(x);

        if (strlen(Slot.menu) == 0)
        {
            cwin_putat_string(&cw, 5, x + 3, "<EMPTY>", cfg.colors.text);
        }
        else
        {
            sprintf(linebuffer, "%s%s", Slot.menu, (Slot.isdefault == 1) ? " [D]" : "");
            cwin_putat_string(&cw, 5, x + 3, linebuffer, cfg.colors.text);
        }
    }
}

char find_default_slot()
// Routine to find the menu slot marked as default auto-boot target
// Output: slot number 0-17 if found, else 0xFF
{
    char x;

    for (x = 0; x < SLOTS; ++x)
    {
        get_slot_from_reu(x);
        if (Slot.isdefault == 1 && strlen(Slot.menu) != 0)
        {
            return x;
        }
    }
    return 0xFF;
}

char bcdtoseconds(char bcd)
// Routine to convert a CIA TOD seconds register (BCD) to a plain binary value
// Input: bcd = raw value of cia1.tods
// Output: binary seconds 0-59
{
    return ((bcd >> 4) * 10) + (bcd & 0x0F);
}

char validkey(char key)
// Routine to check if a keypress is a valid boot menu choice
// Input: key = ASCII value of key pressed
// Output: 1 if valid choice, else 0
{
    if (key == CH_F1 || key == CH_F2 || key == CH_F3 || key == CH_F5 || key == CH_F7)
    {
        return 1;
    }
    if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
    {
        get_slot_from_reu(keytomenuslot(key));
        if (strlen(Slot.menu) != 0) // Check if menuslot is empty
        {
            return 1;
        }
    }
    return 0;
}

char autobootcountdown()
// Routine to show a standalone auto-boot countdown screen, if a default slot
// and timeout are configured. Any keypress cancels and is discarded (it does
// not act as a menu selection) so the user always lands in the normal menu
// to make their real choice.
// Sets global menuselect and returns 1 if the countdown elapsed with no
// keypress (auto-boot triggered), else returns 0 (menu should be shown).
{
    char defaultslot;
    char seconds;
    char elapsed;
    char remaining;
    char lastshown = 255; // Force first draw

    if (cfg.timeoutidx == 0)
    {
        return 0;
    }

    defaultslot = find_default_slot();
    if (defaultslot == 0xFF)
    {
        return 0;
    }

    seconds = timeoutseconds[cfg.timeoutidx];
    get_slot_from_reu(defaultslot);

    cwin_clear(&cw);
    headertext("Welcome to your C64.", 1);

    cwin_cursor_move(&cw, 0, 3);
    cwin_console_printf(&cw, cfg.colors.text, "Default boot slot:\n%s\n\n", Slot.menu);
    cwin_putat_string(&cw, 0, 8, "Auto-boot in    sec.", cfg.colors.text);
    cwin_putat_string(&cw, 0, 9, "Press any key to open the menu instead.", cfg.colors.text);

    cia1.todt = 0;
    cia1.tods = 0;

    do
    {
        elapsed = bcdtoseconds(cia1.tods);
        remaining = (elapsed >= seconds) ? 0 : seconds - elapsed;

        if (remaining != lastshown)
        {
            sprintf(linebuffer, "%2u", remaining);
            cwin_putat_string(&cw, 13, 8, linebuffer, cfg.colors.text);
            lastshown = remaining;
        }

        if (cwin_checkch() != 0)
        {
            return 0;
        }
    } while (elapsed < seconds);

    // Boot directly rather than synthesizing a fake keypress via menuslotkey():
    // menuslotkey() returns lowercase ASCII for slots 10-17 ('a'-'h'), but
    // main.c's dispatch loop and keytomenuslot() only recognize uppercase
    // ('A'-'H', what a real keypress actually sends) for letter-keyed slots.
    // A synthesized lowercase value matches neither a valid slot-boot key nor
    // any F-key case, so main.c's dispatch loop would fall through and
    // re-enter mainmenu() forever for any default slot at position 10+.
    runbootfrommenu(defaultslot);
    return 1;
}

void mainmenu()
// Draw the main boot menu and block until user selects a valid option
// Sets global menuselect to the key value chosen
{
    char x;
    char key;

    if (autobootcountdown())
    {
        return;
    }

    cwin_clear(&cw);
    headertext("Welcome to your C64.", 1);

    // Print menu slots
    for (x = 0; x < 18; ++x)
    {
        get_slot_from_reu(x);

        if (strlen(Slot.menu) != 0)
        {
            menuslotnumnerprint(x);
            sprintf(linebuffer, "%s%s", Slot.menu, (Slot.isdefault == 1) ? " [D]" : "");
            cwin_putat_string(&cw, 5, x + 3, linebuffer, cfg.colors.text);
        }
    }

    // Print menu options
    cwin_putat_string_reverse(&cw, 0, 21, " F1 ", cfg.colors.key);
    cwin_putat_string(&cw, 5, 21, "Filebrowser", cfg.colors.text);

    cwin_putat_string_reverse(&cw, 20, 21, " F2 ", cfg.colors.key);
    cwin_putat_string(&cw, 25, 21, "Information", cfg.colors.text);

    cwin_putat_string_reverse(&cw, 0, 22, " F3 ", cfg.colors.key);
    cwin_putat_string(&cw, 5, 22, "Edit/Order/Del", cfg.colors.text);

    cwin_putat_string_reverse(&cw, 20, 22, " F5 ", cfg.colors.key);
    cwin_putat_string(&cw, 25, 22, "Configuration", cfg.colors.text);

    cwin_putat_string_reverse(&cw, 0, 23, " F7 ", cfg.colors.key);
    cwin_putat_string(&cw, 5, 23, "Quit to BASIC", cfg.colors.text);

    cwin_putat_string(&cw, 0, 24, "Make your choice.", cfg.colors.text);

    do
    {
        key = cwin_getch();
    } while (!validkey(key));

    menuselect = key;
}

void pickmenuslot()
// Routine to pick a slot to store the chosen dir trace path
{
    char menuslot;
    char key, plusmin;
    char yesno;
    char selected = 0;
    char proceed = 1;

    cwin_clear(&cw);
    headertext("Choose menuslot.",1);
    presentmenuslots();
    cwin_cursor_move(&cw, 0, 21);
    cwin_console_printf(&cw, cfg.colors.text, "Choose slot by pressing key: ");
    do
    {
        key = cwin_getch();
    } while ((key < 48 || key > 57) && (key < 65 || key > 90));
    menuslot = keytomenuslot(key);
    selected = 1;
    get_slot_from_reu(menuslot);
    cwin_console_printf(&cw, cfg.colors.text, "%c", key);

    if (strlen(Slot.menu) != 0)
    {
        cwin_cursor_move(&cw, 0, 22);
        cwin_console_printf(&cw, cfg.colors.text, "Slot not empty. Edit? Y/N ");
        yesno = getkey(128);
        cwin_console_printf(&cw, cfg.colors.text, "%c", yesno);
        if (yesno == 78)
        {
            selected = 0;
        }
    }
    else
    {
        strncpy(Slot.menu, pathfile, MAXMENUNAME - 1);
        Slot.menu[MAXMENUNAME - 1] = 0;
    }
    if (selected == 1)
    {
        cwin_cursor_move(&cw, 0, 22);
        cwin_fill_rect_raw(&cw, 0, 22, 40, 3, SC_SPACE, cfg.colors.text);
        cwin_console_printf(&cw, cfg.colors.text, "Choose name for slot:");

        textInput(0, 24, 40, Slot.menu, MAXMENUNAME, 0);

        cwin_fill_rect_raw(&cw, 0, 23, 40, 2, SC_SPACE, cfg.colors.text);
        cwin_cursor_move(&cw, 0, 23);
        if (reuflag || addmountflag)
        {
            // REU preload and a drive B mount are additive on top of an existing
            // program-launch slot (e.g. "launch this game with a data disk in
            // drive B") and never touch Slot.file/path/runboot/device. A drive A
            // mount replaces the disk the program launch expects to boot from,
            // so it warns and only clears those fields if the slot already had
            // a program configured and the user confirms.
            if (reuflag)
            {
                cwin_console_printf(&cw, cfg.colors.text, "Select REU size (+/-/ENTER):");

                do
                {
                    cwin_cursor_move(&cw, 0, 24);
                    cwin_console_printf(&cw, cfg.colors.text, "REU file size: (%i) %s  ", Slot.reusize, reusizelist[Slot.reusize]);
                    do
                    {
                        plusmin = cwin_getch();
                    } while (plusmin != '+' && plusmin != '-' && plusmin != CH_ENTER);
                    if (plusmin == '+')
                    {
                        Slot.reusize++;
                        if (Slot.reusize > 7)
                        {
                            Slot.reusize = 0;
                        }
                    }
                    if (plusmin == '-')
                    {
                        if (Slot.reusize == 0)
                        {
                            Slot.reusize = 7;
                        }
                        else
                        {
                            Slot.reusize--;
                        }
                    }
                } while (plusmin != CH_ENTER);

                strncpy(Slot.reu_image, imagename, MAXFILENAME - 1);
                Slot.reu_image[MAXFILENAME - 1] = 0;
                Slot.command = Slot.command | COMMAND_REU; // Set REU bit in command flags
            }
            else
            {
                if (addmountflag == 1)
                {
                    if (strlen(Slot.file) != 0)
                    {
                        cwin_console_printf(&cw, cfg.colors.text, "Slot boots a program from drive A.\n");
                        cwin_console_printf(&cw, cfg.colors.text, "Replace with this mount? Y/N ");
                        yesno = getkey(128);
                        cwin_console_printf(&cw, cfg.colors.text, "%c", yesno);
                        if (yesno == 78)
                        {
                            proceed = 0;
                        }
                        else
                        {
                            strcpy(Slot.file, "");
                            strcpy(Slot.path, "");
                            Slot.runboot = 0;
                            Slot.device = 0;
                        }
                    }

                    Slot.image_a_id = imageaid;
                    strncpy(Slot.image_a_path, imageapath, MAXPATHLEN - 1);
                    Slot.image_a_path[MAXPATHLEN - 1] = 0;
                    strncpy(Slot.image_a_file, imageaname, MAXFILENAME - 1);
                    Slot.image_a_file[MAXFILENAME - 1] = 0;
                    Slot.command = Slot.command | COMMAND_IMGA; // Set image A bit in command flags
                }
                else
                {
                    Slot.image_b_id = imagebid;
                    strncpy(Slot.image_b_path, imagebpath, MAXPATHLEN - 1);
                    Slot.image_b_path[MAXPATHLEN - 1] = 0;
                    strncpy(Slot.image_b_file, imagebname, MAXFILENAME - 1);
                    Slot.image_b_file[MAXFILENAME - 1] = 0;
                    Slot.command = Slot.command | COMMAND_IMGB; // Set image B bit in command flags
                }
            }
        }
        else
        {
            if (inside_mount)
            {
                Slot.device = imageaid;
                Slot.image_a_id = imageaid;
                strncpy(Slot.image_a_path, imageapath, MAXPATHLEN - 1);
                Slot.image_a_path[MAXPATHLEN - 1] = 0;
                strncpy(Slot.image_a_file, imageaname, MAXFILENAME - 1);
                Slot.image_a_file[MAXFILENAME - 1] = 0;
                Slot.command = Slot.command | COMMAND_IMGA; // Set image A bit: boot from mounted disk
            }
            else
            {
                Slot.device = pathdevice;
                Slot.partition = currentpartition; // 0 if never switched (pre-3.15 behavior, no CP sent at boot)
            }
            strncpy(Slot.file, pathfile, MAXFILENAME - 1);
            Slot.file[MAXFILENAME - 1] = 0;

            if (runmountflag || fb_uci_mode)
            {
                strcpy(Slot.path, "");
            }
            else
            {
                strncpy(Slot.path, pathconcat(), MAXPATHLEN - 1);
                Slot.path[MAXPATHLEN - 1] = 0;
            }
            Slot.runboot = pathrunboot;
        }

        if (proceed)
        {
            cwin_cursor_move(&cw, 0, 24);

            save_slot_to_reu(menuslot);
            cwin_console_printf(&cw, cfg.colors.text, "Saving. Please wait.          ");
            write_slotsfile(0);
        }
    }
}

void ErrorCheckMmounting()
// Error handling for disk and REU mounting
{

    if (!UII_SUCCESS)
    {
        cwin_console_printf(&cw, cfg.colors.text, "\nError on mounting.\n");
        cwin_console_printf(&cw, cfg.colors.text, "%s\n", uii_status);
        errorexit("");
    }
}

void mountimage(char device, char *path, char *image)
// Mount an image on an Ultimate emulated drive, retrying across USB ports
// if the stored path has moved. Device = IEC ID, path and image are path
// and filename to image to mount.
// The retry loop drives the real uii_mount_disk() call itself (not a
// separate directory-only probe): two prior attempts at a dedicated
// existence check (uii_open_file() misused as a probe, then
// uii_file_stat()) both broke real disk-image mounts on this firmware in
// undocumented ways specific to disk images, so this uses the actual
// mount operation directly instead -- it's side-effect-free on failure
// (nothing mounts unless the right file was found) and its own status is
// specific and reliable: "82,FILE NOT FOUND" means keep hunting other
// ports; anything else ("89,NOT A DISK IMAGE", "90,DRIVE NOT PRESENT",
// etc.) is a real, non-port problem that trying other ports can't fix, so
// it's surfaced immediately via ErrorCheckMmounting() instead of looping
// through ports or showing a misleading "insert stick" prompt.
// A "/usbX/"-shaped prefix (checked structurally: "/usb" + one char +
// "/" -- covers literal "/usb0|1|2/" ports AND the Ultimate firmware's
// own "/usb*/" wildcard alias for "whichever single USB stick is
// present") is retried against the numbered USB ports by swapping the
// prefix in place (no scratch buffer needed, the prefixes share the same
// length); a wildcard prefix never matches a specific port number, so
// none gets excluded and all three are tried.
{
    char origport;
    char x;
    char found = 0;

    for (;;)
    {
        uii_change_dir(path);
        if (UII_SUCCESS)
        {
            uii_mount_disk(device, image);
            if (UII_SUCCESS)
            {
                found = 1;
            }
            else if (strncmp((const char *)uii_status, "82,", 3) != 0)
            {
                ErrorCheckMmounting();
                return;
            }
        }

        if (!found && memcmp(path, storagepaths[1], 4) == 0 && path[5] == '/') // "/usbX/" shape
        {
            origport = 0xFF;
            for (x = 1; x < 4; x++) // storagepaths[1..3] = usb0..2; [0]=sd excluded
            {
                if (memcmp(path, storagepaths[x], 6) == 0)
                {
                    origport = x;
                    break;
                }
            }

            for (x = 1; x < 4 && !found; x++)
            {
                if (x == origport)
                {
                    continue;
                }
                memcpy(path, storagepaths[x], 6); // same-length prefix swap, suffix untouched
                uii_change_dir(path);
                if (UII_SUCCESS)
                {
                    uii_mount_disk(device, image);
                    if (UII_SUCCESS)
                    {
                        cwin_console_printf(&cw, cfg.colors.text, "\nRerouted to %s\n", path);
                        delay(2);
                        found = 1;
                    }
                }
            }
        }

        if (found)
        {
            return;
        }

        cwin_console_printf(&cw, cfg.colors.text, "\nInsert USB stick. Key=retry, F7=BASIC\n");
        if (cwin_getch() == CH_F7)
        {
            errorexit("USB stick not found.");
        }
    }
}

void ToggleDrivePower(char ab, char on)
// Toggle power for the Ultimate drives
// - ab: Drive A = 0, Drive B = 1
// - on: 0 = switch off, 1 = switch on
{
    if (!uii_parse_deviceinfo())
    {
        ErrorCheckMmounting();
    }

    if (uii_devinfo[ab].exist)
    {
        // Drive selected and existing
        cwin_console_printf(&cw, cfg.colors.text, "Drive %s ", (ab) ? "B" : "A");

        if (on)
        {
            if (!uii_devinfo[ab].power)
            {
                // Power on drive A if needed
                if (!ab)
                {
                    uii_enable_drive_a();
                }
                else
                {
                    uii_enable_drive_b();
                }
                cwin_console_printf(&cw, cfg.colors.text, "powered on.\n");
                cwin_console_printf(&cw, cfg.colors.text, "Waiting for drive to be ready.\n");
                delay(2);
            }
            else
            {
                cwin_console_printf(&cw, cfg.colors.text, "already on.\n");
            }
        }

        if (!on)
        {
            if (uii_devinfo[ab].power)
            {
                // Power on drive A if needed
                if (!ab)
                {
                    uii_disable_drive_a();
                }
                else
                {
                    uii_disable_drive_b();
                }
                cwin_console_printf(&cw, cfg.colors.text, "powered off.\n");
            }
            else
            {
                cwin_console_printf(&cw, cfg.colors.text, "already off.\n");
            }
        }
    }

    if (!UII_SUCCESS)
    {
        ErrorCheckMmounting();
    }
}

void runbootfrommenu(char select)
// Function to execute selected boot option choice slot 0-9
// Input: select: chosen menuslot 0-9
{
    get_slot_from_reu(select);

    cwin_clear(&cw);
    cwin_cursor_move(&cw, 0, 0);

    if (Slot.command & COMMAND_IMGA) // Disk image A enabled in this slot
    {
        cwin_console_printf(&cw, cfg.colors.text, "%s on ID %d.\n", Slot.image_a_file, Slot.image_a_id);
        ToggleDrivePower(0, 1);
        mountimage(Slot.image_a_id, Slot.image_a_path, Slot.image_a_file);
        delay(1);
    }
    if (Slot.command & COMMAND_IMGB) // Disk image B enabled in this slot
    {
        cwin_console_printf(&cw, cfg.colors.text, "%s on ID %d.\n", Slot.image_b_file, Slot.image_b_id);
        ToggleDrivePower(1, 1);
        mountimage(Slot.image_b_id, Slot.image_b_path, Slot.image_b_file);
        delay(1);
    }
    if (Slot.command & COMMAND_REU) // REU image preload enabled in this slot
    {
        cwin_console_printf(&cw, cfg.colors.text, "REU file %s", Slot.reu_image);
        load_reu_with_reroute(Slot.image_a_path, Slot.reu_image, Slot.reusize);
        ErrorCheckMmounting();
    }

    // Enter correct directory path on correct device number
    if (Slot.runboot & EXEC_MOUNT)
    {
        // Run from mounted disk
        execute(Slot.file, Slot.image_a_id, Slot.runboot, Slot.cmd);
    }
    else
    {
        // Run from IEC filesystem. Mount/command-only slots have no program
        // file, so there is no path to change into on Slot.device either.
        if (strlen(Slot.file) != 0)
        {
            // Firmware 3.15+: select the recorded SoftIEC partition before
            // changing directory, if this slot was created on one (0 = pre-
            // 3.15 behavior, no CP sent).
            if (Slot.partition)
            {
                iec_select_partition(Slot.device, Slot.partition);
            }
            cmd(Slot.device, Slot.path);
        }
        execute(Slot.file, Slot.device, Slot.runboot, Slot.cmd);
    }
}

char deletemenuslot()
// Routine to delete a chosen menu slot
// Returns 1 if something has been deleted, else 0
{

    char menuslot = 0;
    char changesmade = 0;
    char key;
    char yesno;
    char selected = 0;

    cwin_clear(&cw);
    headertext("Delete menu slots", 1);

    presentmenuslots();

    cwin_cursor_move(&cw, 0, 23);
    cwin_console_printf(&cw, cfg.colors.text, "Choose menu slot to be deleted. ");

    do
    {
        key = cwin_getch();
        if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
        {
            menuslot = keytomenuslot(key);
            selected = 1;
        }
    } while (selected == 0);

    get_slot_from_reu(menuslot);

    cwin_console_printf(&cw, cfg.colors.text, "%c\n", key);

    if (strlen(Slot.menu) != 0)
    {
        cwin_console_printf(&cw, cfg.colors.text, "Are you sure? Y/N ");
        yesno = getkey(128);
        cwin_console_printf(&cw, cfg.colors.text, "%c", yesno);
        if (yesno == 78)
        {
            selected = 0;
        }
    }
    else
    {
        cwin_console_printf(&cw, cfg.colors.text, "Slot is already empty. Press key.");
        getkey(2);
        selected = 0;
    }
    if (selected == 1)
    {
        memset(&Slot, 0, sizeof(Slot));
        save_slot_to_reu(menuslot);
        changesmade = 1;
    }

    return changesmade;
}

char toggledefaultslot()
// Routine to set or clear the menu slot that auto-boots after the configured timeout
// Only one slot may be default at a time; picking the current default clears it.
// Returns 1 if something has been changed, else 0
{
    char menuslot = 0;
    char changesmade = 0;
    char key;
    char selected = 0;
    char x;
    char wasdefault;

    cwin_clear(&cw);
    headertext("Set default slot", 1);

    presentmenuslots();

    cwin_cursor_move(&cw, 0, 21);
    cwin_console_printf(&cw, cfg.colors.text, "Pick a slot for default [D].\n");
    cwin_console_printf(&cw, cfg.colors.text, "Pick [D] again to clear: ");

    do
    {
        key = cwin_getch();
        if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
        {
            menuslot = keytomenuslot(key);
            selected = 1;
        }
    } while (selected == 0);

    get_slot_from_reu(menuslot);

    cwin_console_printf(&cw, cfg.colors.text, "%c\n", key);

    if (strlen(Slot.menu) == 0)
    {
        cwin_console_printf(&cw, cfg.colors.text, "Slot is empty. Press key.");
        getkey(2);
        selected = 0;
    }

    if (selected == 1)
    {
        wasdefault = Slot.isdefault;

        // Clear the default flag on any other slot first, so only one slot is ever default
        for (x = 0; x < SLOTS; ++x)
        {
            if (x == menuslot)
            {
                continue;
            }
            get_slot_from_reu(x);
            if (Slot.isdefault == 1)
            {
                Slot.isdefault = 0;
                save_slot_to_reu(x);
            }
        }

        get_slot_from_reu(menuslot);
        Slot.isdefault = (wasdefault == 1) ? 0 : 1;
        save_slot_to_reu(menuslot);

        cwin_console_printf(&cw, cfg.colors.text, "\nMarked as default: %s\n", (Slot.isdefault) ? "Yes" : "No");
        changesmade = 1;
    }

    return changesmade;
}

char renamemenuslot()
// Routine to rename a chosen menu slot
// Returns 1 if something has been renamed, else 0
{
    char menuslot = 0;
    char changesmade = 0;
    char key;
    char yesno;
    char selected = 0;

    cwin_clear(&cw);
    headertext("Rename menu slots", 1);

    presentmenuslots();

    cwin_cursor_move(&cw, 0, 21);
    cwin_console_printf(&cw, cfg.colors.text, "Choose menu slot to be renamed. ");

    do
    {
        key = cwin_getch();
        if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
        {
            menuslot = keytomenuslot(key);
            selected = 1;
        }
    } while (selected == 0);

    get_slot_from_reu(menuslot);

    cwin_console_printf(&cw, cfg.colors.text, "%c\n", key);

    if (strlen(Slot.menu) != 0)
    {
        cwin_console_printf(&cw, cfg.colors.text, "Are you sure? Y/N ");
        yesno = getkey(128);
        cwin_console_printf(&cw, cfg.colors.text, "%c", yesno);
        if (yesno == 78)
        {
            selected = 0;
        }
    }
    else
    {
        cwin_console_printf(&cw, cfg.colors.text, "Slot is empty. Press key.");
        getkey(2);
        selected = 0;
    }
    if (selected == 1)
    {
        cwin_putat_string(&cw, 0, 23, "Choose name for slot:", cfg.colors.text);
        textInput(0, 24, 31, Slot.menu, 30, 0);
        save_slot_to_reu(menuslot);
        changesmade = 1;
    }

    return changesmade;
}

void printnewmenuslot(char pos, char select, char *name)
// Routine to print menuslot item
// Input: pos = slot position 0-17
//        select = 1 if selected, else 0
{
    char color_key = (select) ? cfg.colors.text_input : cfg.colors.key;
    char color_name = (select) ? cfg.colors.text_input : cfg.colors.text;

    cwin_fill_rect_raw(&cw, 0, pos + 3, 40, 1, SC_SPACE, cfg.colors.text);

    // Key print
    sprintf(linebuffer, " %s%c ", (select) ? "-" : " ", menuslotkey(pos));
    cwin_putat_string_reverse(&cw, 0, pos + 3, linebuffer, color_key);

    // Name print
    if (strlen(Slot.menu) == 0)
    {
        cwin_putat_string(&cw, 5, pos + 3, "<EMPTY>", color_name);
    }
    else
    {
        sprintf(linebuffer, "%s%s", Slot.menu, (Slot.isdefault == 1) ? " [D]" : "");
        cwin_putat_string(&cw, 5, pos + 3, linebuffer, color_name);
    }
}

char reordermenuslot()
// Routine to reorder a chosen menu slot
// Returns 1 if something has been renamed, else 0
{

    char menuslot;
    char newslot;
    char changesmade = 0;
    char key;
    char select = 0;
    char x;
    char maxpos;
    struct SlotStruct BufferSlot;

    do
    {
        cwin_clear(&cw);
        headertext("Re-order menu slots", 1);

        presentmenuslots();

        cwin_putat_string(&cw, 0, 22, "Choose menu slot to be re-ordered.", cfg.colors.text);
        cwin_putat_string(&cw, 0, 23, "Or choose ", cfg.colors.text);
        cwin_putat_string_reverse(&cw, 10, 23, " F7 ", cfg.colors.key);
        cwin_putat_string(&cw, 14, 23, " to return to main menu.", cfg.colors.text);

        do
        {
            key = cwin_getch(); // obtain alphanumeric key
            if (key == CH_F7)
            {
                select = 1;
            }
            else
            {
                if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0-9,a-z
                {
                    get_slot_from_reu(keytomenuslot(key));
                    if (strlen(Slot.menu) != 0) // Check if menslot is empty
                    {
                        select = 1;
                    }
                }
            }
        } while (select == 0);

        if (key != CH_F7)
        {
            cwin_fill_rect_raw(&cw, 0, 22, 40, 2, SC_SPACE, cfg.colors.text);

            menuslot = keytomenuslot(key);
            get_slot_from_reu(menuslot);
            memcpy(&BufferSlot, &Slot, sizeof(Slot)); // Copy selected slot to buffer

            printnewmenuslot(menuslot, 1, Slot.menu);

            cwin_putat_string(&cw, 0, 22, "Move slot up or down by ", cfg.colors.text);
            cwin_putat_string_reverse(&cw, 24, 22, "cursor keys", cfg.colors.key);
            cwin_putat_string(&cw, 35, 22, ".", cfg.colors.text);
            cwin_putat_string_reverse(&cw, 0, 23, "ENTER", cfg.colors.key);
            cwin_putat_string(&cw, 6, 23, "to confirm position, ", cfg.colors.text);
            cwin_putat_string_reverse(&cw, 0, 24, "F7", cfg.colors.key);
            cwin_putat_string(&cw, 3, 24, "to cancel.", cfg.colors.text);

            maxpos = SLOTS - 1;
            newslot = menuslot;

            do
            {

                do
                {
                    key = cwin_getch();
                } while (key != CH_F7 && key != 13 && key != 17 && key != 145);

                switch (key)
                {
                case CH_CURS_DOWN:
                    if (newslot == maxpos)
                    {
                        // Wrap: shift all slots up by one and place selected slot at position 0
                        for (x = 0; x < maxpos; x++)
                        {
                            cwin_cursor_move(&cw, 0, 2);
                            cwin_console_printf(&cw, cfg.colors.text, "Shifting %2u to %2u", maxpos - x - 1, maxpos - x);
                            get_slot_from_reu(maxpos - x - 1);
                            save_slot_to_reu(maxpos - x);
                        }
                        memcpy(&Slot, &BufferSlot, sizeof(Slot));
                        save_slot_to_reu(0);
                        cwin_fill_rect_raw(&cw, 0, 2, 40, 18, SC_SPACE, cfg.colors.text);
                        presentmenuslots();
                        get_slot_from_reu(0);
                        printnewmenuslot(0, 1, Slot.menu);
                        newslot = 0;
                    }
                    else
                    {
                        get_slot_from_reu(newslot + 1);
                        save_slot_to_reu(newslot);
                        printnewmenuslot(newslot++, 0, Slot.menu);
                        memcpy(&Slot, &BufferSlot, sizeof(Slot));
                        save_slot_to_reu(newslot);
                        printnewmenuslot(newslot, 1, Slot.menu);
                    }
                    break;

                case CH_CURS_UP:
                    if (newslot == 0)
                    {
                        // Wrap: shift all slots down by one and place selected slot at last position
                        for (x = 0; x < maxpos; x++)
                        {
                            cwin_cursor_move(&cw, 0, 2);
                            cwin_console_printf(&cw, cfg.colors.text, "Shifting %2u to %2u", x + 1, x);
                            get_slot_from_reu(x + 1);
                            save_slot_to_reu(x);
                        }
                        memcpy(&Slot, &BufferSlot, sizeof(Slot));
                        save_slot_to_reu(maxpos);
                        cwin_fill_rect_raw(&cw, 0, 2, 40, 18, SC_SPACE, cfg.colors.text);
                        presentmenuslots();
                        printnewmenuslot(maxpos, 1, Slot.menu);
                        newslot = maxpos;
                    }
                    else
                    {
                        get_slot_from_reu(newslot - 1);
                        save_slot_to_reu(newslot);
                        printnewmenuslot(newslot--, 0, Slot.menu);
                        memcpy(&Slot, &BufferSlot, sizeof(Slot));
                        save_slot_to_reu(newslot);
                        printnewmenuslot(newslot, 1, Slot.menu);
                    }
                    break;

                default:
                    break;
                }
            } while (key != CH_F7 && key != 13);

            if (key == CH_ENTER)
            {
                changesmade = 1;
            }
            else
            {
                cwin_putat_string(&cw, 0, 24, "Restoring slot data....please wait.", cfg.colors.text);
                read_slotsfile(0);
            }
        }
    } while (key != CH_F7);

    return changesmade;
}

char edituserdefinedcommand()
// Routine to edit user defined command in menuslot
// Choosing an empty slot creates a bare "command-only" slot: prompts for a
// name first, exactly like pickmenuslot() does for a program/mount slot.
// Returns 1 if something has been changed, else 0
{
    char menuslot = 0;
    char changesmade = 0;
    char key;
    char selected = 0;
    char newslotname = 0;

    cwin_clear(&cw);
    headertext("Edit command", 1);

    presentmenuslots();

    cwin_cursor_move(&cw, 0, 21);
    cwin_console_printf(&cw, cfg.colors.text, "Choose menu slot to edit. ");

    do
    {
        key = cwin_getch();
        if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
        {
            menuslot = keytomenuslot(key);
            selected = 1;
        }
    } while (selected == 0);

    get_slot_from_reu(menuslot);

    cwin_console_printf(&cw, cfg.colors.text, "%c\n", key);

    if (strlen(Slot.menu) == 0)
    {
        newslotname = 1;
    }
    if (selected == 1)
    {
        cwin_clear(&cw);
        headertext("Edit command", 1);

        cwin_putat_string(&cw, 0, 3, "Chosen slot:", cfg.colors.text);

        sprintf(linebuffer, "  %c ", menuslotkey(menuslot));
        cwin_putat_string_reverse(&cw, 0, 4, linebuffer, cfg.colors.key);

        if (newslotname)
        {
            cwin_putat_string(&cw, 0, 6, "Choose name for slot:", cfg.colors.text);
            textInput(0, 7, 40, Slot.menu, MAXMENUNAME, 0);
        }

        cwin_putat_string(&cw, 5, 4, Slot.menu, cfg.colors.text);

        cwin_putat_string(&cw, 0, 9, "Enter command (empty=none):", cfg.colors.text);
        textInput(0, 10, 80, Slot.cmd, MAXCOMMAND, 0);

        if (strlen(Slot.cmd) == 0)
        {
            Slot.command &= ~COMMAND_CMD;
        }
        else
        {
            Slot.command |= COMMAND_CMD;
        }

        save_slot_to_reu(menuslot);
        changesmade = 1;
    }

    return changesmade;
}

void editmenuoptions()
// Routine for edit / re-order / delete menu slots
{
    char changesmade = 0;
    char select = 0;
    char key;

    do
    {
        cwin_clear(&cw);
        headertext("Edit/Re-order/Delete", 1);

        presentmenuslots();

        cwin_putat_string_reverse(&cw, 0, 21, " F1 ", cfg.colors.key);
        cwin_putat_string(&cw, 5, 21, "Edit name", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 20, 21, " F2 ", cfg.colors.key);
        cwin_putat_string(&cw, 25, 21, "Edit command", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 40, 21, " F3 ", cfg.colors.key);
        cwin_putat_string(&cw, 45, 21, "Re-order slots", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 60, 21, " F5 ", cfg.colors.key);
        cwin_putat_string(&cw, 65, 21, "Delete slot", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 80, 21, " F7 ", cfg.colors.key);
        cwin_putat_string(&cw, 85, 21, "Quit", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 100, 21, " F6 ", cfg.colors.key);
        cwin_putat_string(&cw, 105, 21, "Default slot", cfg.colors.text);

        select = 0;

        do
        {
            key = cwin_getch();
            if (key == CH_F1 || key == CH_F2 || key == CH_F3 || key == CH_F5 || key == CH_F6 || key == CH_F7)
            {
                select = 1;
            }
        } while (select == 0);

        switch (key)
        {
        case CH_F5:
            changesmade = deletemenuslot();
            break;

        case CH_F1:
            changesmade = renamemenuslot();
            break;

        case CH_F2:
            changesmade = edituserdefinedcommand();
            break;

        case CH_F3:
            changesmade = reordermenuslot();
            break;

        case CH_F6:
            changesmade = toggledefaultslot();
            break;

        default:
            break;
        }

    } while (key != CH_F7);

    if (changesmade == 1)
    {
        cwin_putat_string(&cw, 0, 24, "Saving. Please wait.          ", cfg.colors.text);
        write_slotsfile(0);
    }
}

void information()
// Show version information and credits screen
{
    // Set sprite logo
    spr_show(0, true);     // Enable sprite logo
    spr_move(0, 320, 228); // Set Y position

    // Show splash scree
    show_splash_screen();

    // Clear screen and print info and credits
    cwin_clear(&cw);

    headertext("Info and credits", 1);

    cwin_cursor_move(&cw, 0, 3);

    cwin_console_printf(&cw, cfg.colors.text, "\nUBoot64: Boot menu for Ultimate devices\n\n");
    cwin_console_printf(&cw, cfg.colors.text, "Version: %s\n", VERSION);
    cwin_console_printf(&cw, cfg.colors.text, "Written 2023 (v1), 2026 by Xander Mol.\n\n");
    cwin_console_printf(&cw, cfg.colors.text, "Inspired by/code used of DraBrowse:\n");
    cwin_console_printf(&cw, cfg.colors.text, "DraBrowse is a simple file browser.\n");
    cwin_console_printf(&cw, cfg.colors.text, "Original 2009 by Sascha Bader.\n");
    cwin_console_printf(&cw, cfg.colors.text, "Used version adapted by Dirk Jagdmann.\n\n");
    cwin_console_printf(&cw, cfg.colors.text, "Requires and made possible by:\n\n");
    cwin_console_printf(&cw, cfg.colors.text, "The Ultimate II+ cartridge,\n");
    cwin_console_printf(&cw, cfg.colors.text, "Created by Gideon Zweijtzer.\n\n");

    cwin_console_printf(&cw, cfg.colors.text, "Press a key to continue.");

    getkey(2);

    // Disable sprite again
    spr_show(0, false);
}