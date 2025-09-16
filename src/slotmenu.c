// UBoot64:
// Boot menu for C64 Ultimate enabled devices
// Written in 2023 by Xander Mol
// https://github.com/xahmol/UBoot64
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

// Switching code generation to bank 0 common routine section
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
{
    // Routine to show the present menu slots

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
            cwin_putat_string(&cw, 5, x + 3, Slot.menu, cfg.colors.text);
        }
    }
}

void mainmenu()
{
    // Draw main boot menu
    // Returns chosen menu option as char key value

    char x;
    char select;
    char key;

    cwin_clear(&cw);
    headertext("Welcome to your C64.", 1);

    // Print menu slots
    for (x = 0; x < 18; ++x)
    {
        get_slot_from_reu(x);

        if (strlen(Slot.menu) != 0)
        {
            menuslotnumnerprint(x);
            cwin_putat_string(&cw, 5, x + 3, Slot.menu, cfg.colors.text);
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

    select = 0;

    do
    {
        key = cwin_getch();
        if (key == CH_F1 || key == CH_F2 || key == CH_F3 || key == CH_F5 || key == CH_F7)
        {
            select = 1;
        }
        else
        {
            if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
            {
                get_slot_from_reu(keytomenuslot(key));
                if (strlen(Slot.menu) != 0) // Check if menslot is empty
                {
                    select = 1;
                }
            }
        }
    } while (select == 0);
    menuselect = key;
}

// void pickmenuslot()
// {
//     // Routine to pick a slot to store the chosen dir trace path
//
//     char menuslot;
//     char key, plusmin;
//     BYTE yesno;
//     BYTE selected = 0;
//
//     // clrscr();
//     // printf("A ID: %d Imagelen: %3d\n\r",imageaid,strlen(imageaname));
//     // printf("%s\n\r",imageaname);
//     // printf("%s\n\r",imageapath);
//     // printf("File name len: %3d\n\r",strlen(pathfile));
//     // printf("%s\n\r",pathfile);
//     // printf("B ID: %d Imagelen: %3d\n\r",imagebid,strlen(imagebname));
//     // printf("%s\n\r",imagebname);
//     // printf("%s\n\r",imagebpath);
//     // cgetc();
//     // strcpy(linebuffer,"");
//     // textInput(0,24,linebuffer,20);
//     // strcpy(Slot->menu,linebuffer);
//     // cgetc();
//
//     clrscr();
//     headertext("Choose menuslot.");
//     presentmenuslots();
//     gotoxy(0, 21);
//     cputs("Choose slot by pressing key: ");
//     do
//     {
//         key = cgetc();
//     } while ((key < 48 || key > 57) && (key < 65 || key > 90));
//     menuslot = keytomenuslot(key);
//     selected = 1;
//     Slot = FirstSlot + menuslot;
//     cprintf("%c", key);
//
//     if (strlen(Slot->menu) != 0)
//     {
//         gotoxy(0, 22);
//         cprintf("Slot not empty. Edit? Y/N ");
//         yesno = getkey(128);
//         cprintf("%c", yesno);
//         if (yesno == 78)
//         {
//             selected = 0;
//         }
//     }
//     else
//     {
//         StringSafeCopy(Slot->menu, pathfile, 20);
//     }
//     if (selected == 1)
//     {
//         clearArea(0, 22, SCREENW, 3);
//         cputsxy(0, 23, "Choose name for slot:");
//
//         textInput(0, 24, Slot->menu, 20);
//
//         clearArea(0, 23, SCREENW, 2);
//         gotoxy(0, 23);
//         if (reuflag || addmountflag)
//         {
//             if (reuflag)
//             {
//
//                 cputs("Select REU size (+/-/ENTER):");
//
//                 do
//                 {
//                     gotoxy(0, 24);
//                     cprintf("REU file size: (%i) %s  ", Slot->reusize, reusizelist[Slot->reusize]);
//                     do
//                     {
//                         plusmin = cgetc();
//                     } while (plusmin != '+' && plusmin != '-' && plusmin != CH_ENTER);
//                     if (plusmin == '+')
//                     {
//                         Slot->reusize++;
//                         if (Slot->reusize > 7)
//                         {
//                             Slot->reusize = 0;
//                         }
//                     }
//                     if (plusmin == '-')
//                     {
//                         if (Slot->reusize == 0)
//                         {
//                             Slot->reusize = 7;
//                         }
//                         else
//                         {
//                             Slot->reusize--;
//                         }
//                     }
//                 } while (plusmin != CH_ENTER);
//                 StringSafeCopy(Slot->reu_image, imagename, 19);
//                 Slot->command = Slot->command | COMMAND_REU;
//             }
//             else
//             {
//                 if (addmountflag == 1)
//                 {
//                     Slot->image_a_id = imageaid;
//                     strcpy(Slot->image_a_path, imageapath);
//                     strcpy(Slot->image_a_file, imageaname);
//                     Slot->command = Slot->command | COMMAND_IMGA;
//                 }
//                 else
//                 {
//                     Slot->image_b_id = imagebid;
//                     strcpy(Slot->image_b_path, imagebpath);
//                     strcpy(Slot->image_b_file, imagebname);
//                     Slot->command = Slot->command | COMMAND_IMGB;
//                 }
//             }
//         }
//         else
//         {
//             if (inside_mount)
//             {
//                 Slot->device = imageaid;
//                 Slot->image_a_id = imageaid;
//                 strcpy(Slot->image_a_path, imageapath);
//                 strcpy(Slot->image_a_file, imageaname);
//                 Slot->command = Slot->command | COMMAND_IMGA;
//             }
//             else
//             {
//                 Slot->device = pathdevice;
//             }
//             StringSafeCopy(Slot->file, pathfile, 19);
//             if (runmountflag || fb_uci_mode)
//             {
//                 strcpy(Slot->path, "");
//             }
//             else
//             {
//                 StringSafeCopy(Slot->path, pathconcat(), 99);
//             }
//             Slot->runboot = pathrunboot;
//         }
//
//         gotoxy(0, 24);
//         cputs("Saving. Please wait.          ");
//         std_write(slotfilename, 0);
//     }
// }
//
// void ErrorCheckMmounting()
// {
//     // Error handling for disk and REU mounting
//
//     if (!uii_success())
//     {
//         printf("\n\rError on mounting.\n\r");
//         printf("%s\n\r", uii_status);
//         errorexit();
//     }
// }
//
// void mountimage(char device, char *path, char *image)
// {
//     // Mount an imamage on an Ultimate emulated drive
//     // Device = IEC ID, path and image are path and filename to image to mount
//
//     uii_change_dir(path);
//     uii_mount_disk(device, image);
//     ErrorCheckMmounting();
// }
//
// void ToggleDrivePower(char ab, char on)
// {
//     // Toggle power for the Ultimate drives
//     // - ab: Drive A = 0, Drive B = 1
//     // - on: 0 = switch off, 1 = switch on
//
//     if (!uii_parse_deviceinfo())
//     {
//         ErrorCheckMmounting();
//     }
//
//     if (uii_devinfo[ab].exist)
//     {
//         // Drive selected and existing
//         cprintf("Drive %s ", (ab) ? "B" : "A");
//
//         if (on)
//         {
//             if (!uii_devinfo[ab].power)
//             {
//                 // Power on drive A if needed
//                 if (!ab)
//                 {
//                     uii_enable_drive_a();
//                 }
//                 else
//                 {
//                     uii_enable_drive_b();
//                 }
//                 cputs("powered on.\n\r");
//                 cputs("Waiting for drive to be ready.");
//                 delay(2);
//             }
//             else
//             {
//                 cputs("already on.\n\r");
//             }
//         }
//
//         if (!on)
//         {
//             if (uii_devinfo[ab].power)
//             {
//                 // Power on drive A if needed
//                 if (!ab)
//                 {
//                     uii_disable_drive_a();
//                 }
//                 else
//                 {
//                     uii_disable_drive_b();
//                 }
//                 cputs("powered off.\n\r");
//             }
//             else
//             {
//                 cputs("already off.\n\r");
//             }
//         }
//     }
//
//     if (!uii_success())
//     {
//         ErrorCheckMmounting();
//     }
// }
//
// void runbootfrommenu(int select)
// {
//     // Function to execute selected boot option choice slot 0-9
//     // Input: select: chosen menuslot 0-9
//
//     Slot = FirstSlot + select;
//
//     clrscr();
//     gotoxy(0, 0);
//     if (Slot->command & COMMAND_IMGA)
//     {
//         cprintf("%s on ID %d.\n\r", Slot->image_a_file, Slot->image_a_id);
//         ToggleDrivePower(0, 1);
//         mountimage(Slot->image_a_id, Slot->image_a_path, Slot->image_a_file);
//     }
//     if (Slot->command & COMMAND_IMGB)
//     {
//         cprintf("%s on ID %d.\n\r", Slot->image_b_file, Slot->image_b_id);
//         ToggleDrivePower(1, 1);
//         mountimage(Slot->image_b_id, Slot->image_b_path, Slot->image_b_file);
//     }
//     if (Slot->command & COMMAND_REU)
//     {
//         cprintf("REU file %s", Slot->reu_image);
//         uii_change_dir(Slot->image_a_path);
//         uii_open_file(1, Slot->reu_image);
//         uii_load_reu(Slot->reusize);
//         uii_close_file();
//         ErrorCheckMmounting();
//     }
//
//     // Enter correct directory path on correct device number
//     if (Slot->runboot & EXEC_MOUNT)
//     {
//         // Run from mounted disk
//         execute(Slot->file, Slot->image_a_id, Slot->runboot, Slot->cmd);
//     }
//     else
//     {
//         // Run from IEC filesystem
//         cmd(Slot->device, Slot->path);
//         execute(Slot->file, Slot->device, Slot->runboot, Slot->cmd);
//     }
// }
//
// char deletemenuslot()
// {
//     // Routine to delete a chosen menu slot
//     // Returns 1 if something has been deleted, else 0
//
//     int menuslot;
//     int changesmade = 0;
//     char key;
//     BYTE yesno;
//     BYTE selected = 0;
//
//     clrscr();
//     headertext("Delete menu slots");
//
//     presentmenuslots();
//
//     gotoxy(0, 23);
//     cputs("Choose menu slot to be deleted. ");
//
//     do
//     {
//         key = cgetc();
//         if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
//         {
//             menuslot = keytomenuslot(key);
//             selected = 1;
//         }
//     } while (selected == 0);
//
//     Slot = FirstSlot + menuslot;
//
//     cprintf("%c\n\r", key);
//     if (strlen(Slot->menu) != 0)
//     {
//         cprintf("Are you sure? Y/N ");
//         yesno = getkey(128);
//         cprintf("%c", yesno);
//         if (yesno == 78)
//         {
//             selected = 0;
//         }
//     }
//     else
//     {
//         cprintf("Slot is already empty. Press key.");
//         getkey(2);
//         selected = 0;
//     }
//     if (selected == 1)
//     {
//         memset(Slot, 0, SLOTSIZE);
//         changesmade = 1;
//     }
//
//     return changesmade;
// }
//
// char renamemenuslot()
// {
//     // Routine to rename a chosen menu slot
//     // Returns 1 if something has been renamed, else 0
//
//     int menuslot;
//     int changesmade = 0;
//     char key;
//     BYTE yesno;
//     BYTE selected = 0;
//
//     clrscr();
//     headertext("Rename menu slots");
//
//     presentmenuslots();
//
//     gotoxy(0, 21);
//     cputs("Choose menu slot to be renamed. ");
//
//     do
//     {
//         key = cgetc();
//         if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
//         {
//             menuslot = keytomenuslot(key);
//             selected = 1;
//         }
//     } while (selected == 0);
//
//     Slot = FirstSlot + menuslot;
//
//     cprintf("%c\n\r", key);
//     if (strlen(Slot->menu) != 0)
//     {
//         cprintf("Are you sure? Y/N ");
//         yesno = getkey(128);
//         cprintf("%c\n\r", yesno);
//         if (yesno == 78)
//         {
//             selected = 0;
//         }
//     }
//     else
//     {
//         cprintf("Slot is empty. Press key.");
//         getkey(2);
//         selected = 0;
//     }
//     if (selected == 1)
//     {
//         gotoxy(0, 23);
//         cputs("Choose name for slot:");
//         textInput(0, 24, Slot->menu, 20);
//         changesmade = 1;
//     }
//
//     return changesmade;
// }
//
// void printnewmenuslot(int pos, int color, char *name)
// {
//     // Routine to print menuslot item
//     // Input: color for slotnumber
//     // 0 Selectable text color
//     // 1 Selected text color
//
//     int xpos;
//     int ypos;
//
//     xpos = 0;
//     ypos = pos + 3;
//
//     clearArea(xpos, ypos, 40, 1);
//     gotoxy(xpos, ypos);
//     revers(1);
//     if (color == 0)
//     {
//         textcolor(DMB_COLOR_SELECT);
//     }
//     else
//     {
//         textcolor(DC_COLOR_HIGHLIGHT);
//     }
//     cprintf(" %2c ", menuslotkey(pos));
//     revers(0);
//     if (color == 0)
//     {
//         textcolor(DC_COLOR_TEXT);
//     }
//     else
//     {
//         textcolor(DC_COLOR_HIGHLIGHT);
//     }
//     if (strlen(name) == 0)
//     {
//         cputs(" <EMPTY>");
//     }
//     else
//     {
//         cprintf(" %s", name);
//     }
// }
//
// int reordermenuslot()
// {
//     // Routine to reorder a chosen menu slot
//     // Returns 1 if something has been renamed, else 0
//
//     int menuslot;
//     int newslot;
//     int changesmade = 0;
//     char key;
//     BYTE select = 0;
//     int x;
//     int xpos;
//     int ypos;
//     int maxpos;
//     struct SlotStruct *DestSlot;
//
//     BufferSlot = FirstSlot + 18;
//
//     do
//     {
//         clrscr();
//         headertext("Re-order menu slots");
//
//         presentmenuslots();
//
//         cputsxy(0, 22, "Choose menu slot to be re-ordered.");
//         cputsxy(0, 23, "Or choose ");
//         revers(1);
//         textcolor(DMB_COLOR_SELECT);
//         cputs(" F7 ");
//         revers(0);
//         textcolor(DC_COLOR_TEXT);
//         cputs(" to return to main menu.");
//
//         do
//         {
//             key = cgetc(); // obtain alphanumeric key
//             if (key == CH_F7)
//             {
//                 select = 1;
//             }
//             else
//             {
//                 if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0-9,a-z
//                 {
//                     Slot = FirstSlot + keytomenuslot(key);
//                     if (strlen(Slot->menu) != 0) // Check if menslot is empty
//                     {
//                         select = 1;
//                     }
//                 }
//             }
//         } while (select == 0);
//
//         if (key != CH_F7)
//         {
//             clearArea(0, 22, SCREENW, 2);
//
//             menuslot = keytomenuslot(key);
//             Slot = FirstSlot + menuslot;
//             memcpy(BufferSlot, Slot, SLOTSIZE);
//
//             xpos = 0;
//             ypos = menuslot + 3;
//
//             gotoxy(xpos, ypos);
//             revers(1);
//             textcolor(DC_COLOR_HIGHLIGHT);
//             cprintf(" %2c ", menuslotkey(menuslot));
//             revers(0);
//             cprintf(" %s", Slot->menu);
//             gotoxy(0, 22);
//             textcolor(DC_COLOR_TEXT);
//             cputs("Move slot up or down by ");
//             textcolor(DMB_COLOR_SELECT);
//             cputs("cursor keys.\n\r");
//             cputs("ENTER");
//             textcolor(DC_COLOR_TEXT);
//             cputs(" to confirm position, ");
//             textcolor(DMB_COLOR_SELECT);
//             cputs("F7");
//             textcolor(DC_COLOR_TEXT);
//             cputs(" to cancel.");
//
//             maxpos = 17;
//             newslot = menuslot;
//
//             do
//             {
//
//                 do
//                 {
//                     key = cgetc();
//                 } while (key != CH_F7 && key != 13 && key != 17 && key != 145);
//
//                 switch (key)
//                 {
//                 case 17:
//                     // Cursor down
//                     if (newslot == maxpos)
//                     {
//                         for (x = 0; x < 18; x++)
//                         {
//                             Slot = FirstSlot + maxpos - x;
//                             DestSlot = Slot + 1;
//                             memcpy(DestSlot, Slot, SLOTSIZE);
//                         }
//                         Slot = FirstSlot;
//                         memcpy(Slot, BufferSlot, SLOTSIZE);
//                         clearArea(0, 3, SCREENW, 18);
//                         presentmenuslots();
//                         printnewmenuslot(0, 1, Slot->menu);
//                         newslot = 0;
//                     }
//                     else
//                     {
//                         Slot = FirstSlot + newslot + 1;
//                         memcpy(Slot - 1, Slot--, SLOTSIZE);
//                         printnewmenuslot(newslot++, 0, Slot->menu);
//                         memcpy(++Slot, BufferSlot, SLOTSIZE);
//                         printnewmenuslot(newslot, 1, Slot->menu);
//                     }
//                     break;
//
//                 case 145:
//                     if (newslot == 0)
//                     {
//                         for (x = 0; x < 18; x++)
//                         {
//                             Slot = FirstSlot + x + 1;
//                             DestSlot = Slot - 1;
//                             memcpy(DestSlot, Slot, SLOTSIZE);
//                         }
//                         Slot = FirstSlot + maxpos;
//                         memcpy(Slot, BufferSlot, SLOTSIZE);
//                         clearArea(0, 3, SCREENW, 18);
//                         presentmenuslots();
//                         printnewmenuslot(maxpos, 1, Slot->menu);
//                         newslot = maxpos;
//                     }
//                     else
//                     {
//                         Slot = FirstSlot + newslot - 1;
//                         memcpy(Slot + 1, Slot++, SLOTSIZE);
//                         printnewmenuslot(newslot--, 0, Slot->menu);
//                         memcpy(--Slot, BufferSlot, SLOTSIZE);
//                         printnewmenuslot(newslot, 1, Slot->menu);
//                     }
//                     break;
//
//                 default:
//                     break;
//                 }
//             } while (key != CH_F7 && key != 13);
//
//             if (key == 13)
//             {
//                 changesmade = 1;
//             }
//             else
//             {
//                 gotoxy(0, 24);
//                 textcolor(DC_COLOR_TEXT);
//                 cputs("Restoring slot data....please wait.");
//                 std_read(slotfilename, 0);
//             }
//         }
//     } while (key != CH_F7);
//
//     return changesmade;
// }
//
// int edituserdefinedcommand()
// {
//     // Routine to edit user defined command in menuslot
//     // Returns 1 if something has been renamed, else 0
//
//     int menuslot;
//     int changesmade = 0;
//     char key;
//     BYTE selected = 0;
//
//     clrscr();
//     headertext("Edit command");
//
//     presentmenuslots();
//
//     gotoxy(0, 21);
//     cputs("Choose menu slot to edit. ");
//
//     do
//     {
//         key = cgetc();
//         if ((key > 47 && key < 58) || (key > 64 && key < 91)) // If keys 0 - 9 or a - z
//         {
//             menuslot = keytomenuslot(key);
//             selected = 1;
//         }
//     } while (selected == 0);
//
//     Slot = FirstSlot + menuslot;
//
//     cprintf("%c\n\r", key);
//     if (strlen(Slot->menu) == 0)
//     {
//         cprintf("Slot is empty. Press key.");
//         getkey(2);
//         selected = 0;
//     }
//     if (selected == 1)
//     {
//         clrscr();
//         headertext("Edit command");
//
//         gotoxy(0, 3);
//         cputs("Chosen slot:\n\r");
//         revers(1);
//         textcolor(DMB_COLOR_SELECT);
//         cprintf(" %c ", menuslotkey(menuslot));
//         revers(0);
//         textcolor(DC_COLOR_TEXT);
//         cprintf(" %s", Slot->menu);
//
//         cputsxy(0, 6, "Enter command (empty=none):");
//         textInput(0, 7, Slot->cmd, 79);
//         if (strlen(Slot->cmd) == 0)
//         {
//             Slot->command = 0;
//         }
//         else
//         {
//             Slot->command = 1;
//         }
//         changesmade = 1;
//     }
//
//     return changesmade;
// }
//
// void editmenuoptions()
// {
//     // Routine for edit / re-order / delete menu slots
//
//     int changesmade = 0;
//     int select = 0;
//     char key;
//
//     do
//     {
//         clrscr();
//         headertext("Edit/Re-order/Delete");
//
//         presentmenuslots();
//
//         gotoxy(0, 21);
//         revers(1);
//         textcolor(DMB_COLOR_SELECT);
//         cprintf(" F1 ");
//         revers(0);
//         textcolor(DC_COLOR_TEXT);
//         cputs(" Edit name");
//
//         gotoxy(20, 21);
//         revers(1);
//         textcolor(DMB_COLOR_SELECT);
//         cprintf(" F2 ");
//         revers(0);
//         textcolor(DC_COLOR_TEXT);
//         cputs(" Edit command");
//
//         gotoxy(0, 22);
//         revers(1);
//         textcolor(DMB_COLOR_SELECT);
//         cprintf(" F3 ");
//         revers(0);
//         textcolor(DC_COLOR_TEXT);
//         cputs(" Re-order slots");
//
//         gotoxy(20, 22);
//         revers(1);
//         textcolor(DMB_COLOR_SELECT);
//         cprintf(" F5 ");
//         revers(0);
//         textcolor(DC_COLOR_TEXT);
//         cputs(" Delete slot");
//
//         gotoxy(0, 23);
//         revers(1);
//         textcolor(DMB_COLOR_SELECT);
//         cprintf(" F7 ");
//         revers(0);
//         textcolor(DC_COLOR_TEXT);
//         cputs(" Quit");
//
//         select = 0;
//
//         do
//         {
//             key = cgetc();
//             if (key == CH_F1 || key == CH_F2 || key == CH_F3 || key == CH_F5 || key == CH_F7)
//             {
//                 select = 1;
//             }
//         } while (select == 0);
//
//         switch (key)
//         {
//         case CH_F5:
//             changesmade = deletemenuslot();
//             break;
//
//         case CH_F1:
//             changesmade = renamemenuslot();
//             break;
//
//         case CH_F2:
//             changesmade = edituserdefinedcommand();
//             break;
//
//         case CH_F3:
//             changesmade = reordermenuslot();
//             break;
//
//         default:
//             break;
//         }
//
//     } while (key != CH_F7);
//
//     if (changesmade == 1)
//     {
//         gotoxy(0, 24);
//         cputs("Saving. Please wait.          ");
//         std_write(slotfilename, 0);
//     }
// }

void information()
{
    // Routine for version information and credits
    cwin_clear(&cw);

    // Set sprite logo
    spr_show(0, true);     // Enable sprite logo
    spr_move(0, 320, 220); // Set Y position

    headertext("Info and credits", 1);

    cwin_cursor_move(&cw, 0, 3);

    cwin_console_printf(&cw, cfg.colors.text, "\nUBoot64: Boot menu for Ultimate devices\n\n");
    cwin_console_printf(&cw, cfg.colors.text, "Version: %s\n", VERSION);
    cwin_console_printf(&cw, cfg.colors.text, "Written 2023 (v1), 2025 by Xander Mol.\n\n");
    cwin_console_printf(&cw, cfg.colors.text, "Inspired by/code used of DraBrowse:\n");
    cwin_console_printf(&cw, cfg.colors.text, "DraBrowse is a simple file browser.\n");
    cwin_console_printf(&cw, cfg.colors.text, "Original 2009 by Sascha Bader.\n");
    cwin_console_printf(&cw, cfg.colors.text, "Used version adapted by Dirk Jagdmann.\n\n");
    cwin_console_printf(&cw, cfg.colors.text, "Requires and made possible by:\n\n");
    cwin_console_printf(&cw, cfg.colors.text, "The Ultimate II+ cartridge,\n");
    cwin_console_printf(&cw, cfg.colors.text, "Created by Gideon Zweijtzer.\n\n");

    cwin_console_printf(&cw, cfg.colors.text, "Press a key to continue.");

    getkey(2);

    // Disable sprite againb
    spr_show(0, false); // Enable sprite logo
}