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
#include <c64/charwin.h>
#include <c64/cia.h>
#include <c64/vic.h>
#include <c64/types.h>
#include <c64/kernalio.h>
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
#include "core.h"

// Switching code generation to bank 0 common routine section
#pragma code(code)
#pragma data(data)

// Config file I/O functions
void CheckStatus(const char *message)
{
  // Function to check UII+ status and print error box if applicable

  if (!UII_SUCCESS)
  {
    cwin_console_printf(&cw, 7, "\nI/O error in %s.\n", message);
    cwin_console_printf(&cw, 7, "\nStatus: %s\n", uii_status);
    uii_abort();
    errorexit();
  }
}

// void std_write(char *filename, unsigned char verbose)
// {
//   unsigned char x;
// 
//   // Go to proper dir
//   uii_change_dir(UCI_CFG_LOC);
// 
//   // Delete old config file as I can not (yet) get overwrite to work
//   uii_delete_file(filename);
// 
//   // Save slots via UCI, one slot at a time due to 512 byte limit
//   uii_open_file(0x06, filename);
// 
//   Slot = FirstSlot;
// 
//   for (x = 0; x < 18; ++x)
//   {
//     if (verbose)
//     {
//       gotoxy(0, 5);
//       cprintf("Writing slot %2d  ", x + 1, Slot);
//     }
//     uii_write_file((unsigned char *)Slot, SLOTSIZE);
//     CheckStatus("writing slots");
//     Slot++;
//   }
// 
//   uii_close_file();
// }
// 
// void std_read(char *filename, unsigned char verbose)
// {
//   // Function to read config file
//   // Input: file_name is the name of the config file
// 
//   unsigned char x;
//   char *readaddress;
// 
//   // Go to proper dir
//   uii_change_dir(UCI_CFG_LOC);
// 
//   Slot = FirstSlot;
//   readaddress = (char *)FirstSlot;
// 
//   uii_open_file(0x01, filename);
// 
//   // Check if a file already exists, otherwise create new one
//   if (strcmp((const char *)uii_status, "00,ok") != 0)
//   {
//     for (x = 0; x < 18; ++x)
//     {
//       if (verbose)
//       {
//         gotoxy(0, 5);
//         cprintf("Creating slot %2d", x + 1);
//       }
//       // sprintf(Slot->menu,"Debug %2d",x);
//       strcpy(Slot->menu, "");
//       strcpy(Slot->path, "");
//       strcpy(Slot->file, "");
//       strcpy(Slot->cmd, "");
//       strcpy(Slot->reu_image, "");
//       Slot->device = 0;
//       Slot->runboot = 0;
//       Slot->command = 0;
//       Slot->cfgvs = CFGVERSION;
//       strcpy(Slot->image_a_path, "");
//       strcpy(Slot->image_a_file, "");
//       Slot->image_a_id = 0;
//       strcpy(Slot->image_b_path, "");
//       strcpy(Slot->image_b_file, "");
//       Slot->image_b_id = 0;
//       Slot++;
//     }
//     std_write(filename, 1);
//     uii_close_file();
//     return;
//   }
// 
//   uii_read_file(SLOTSIZE * 18);
// 
//   while (uii_isdataavailable())
//   {
//     if (verbose)
//     {
//       gotoxy(0, 5);
//       cprintf("Reading slots: %4X", readaddress);
//     }
// 
//     while (uii_isdataavailable())
//     {
//       POKE(readaddress++, *respdatareg);
//     }
//     uii_accept();
//     CheckStatus("reading slots");
//   }
// 
//   uii_close_file();
// 
//   Slot = FirstSlot;
//   if (Slot->cfgvs < CFGVERSION)
//   {
//     printf("\nOld configuration file format.");
//     printf("\nRun upgrade tool first.");
//     printf("\nPress key to exit.\n");
//     errorexit();
//   }
// }

void writeconfigfile()
// Function to write config file
{
  // Delete old config file as I can not (yet) get overwrite to work
  uii_delete_file(configfilename);
  uii_open_file(0x06, configfilename);
  uii_write_file((char*)&cfg, sizeof(cfg));
  CheckStatus("writing config");
  uii_close_file();
}

void readconfigfile()
// Function to read config file
{
  // Go to proper dir
  uii_change_dir(configpath);

  // Open config file
  uii_open_file(0x01, configfilename);

  // Write a config file with default values if no file is found
  if (strcmp((const char *)uii_status, "00,ok") != 0)
  {
    cwin_console_printf(&cw, 7, "\nNo config file found, writing defaults.");
    writeconfigfile();
    return;
  }

  uii_read_file(sizeof(cfg));
  CheckStatus("eading config");
  uii_readdata();
  uii_accept();

  // Read variables from read data
  memcpy(&cfg, uii_data, sizeof(cfg));

  // Exit if config file version is too old
  if (cfg.version < CFGVERSION)
  {
    cwin_console_printf(&cw, 7, "\nOld configuration file format.");
    cwin_console_printf(&cw, 7, "\nRun upgrade tool first.");
    cwin_console_printf(&cw, 7, "\nPress key to exit.\n");
    errorexit();
  }

  uii_close_file();
}