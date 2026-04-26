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
// Function to check UII+ status and print error box if applicable
{
  if (!UII_SUCCESS)
  {
    cwin_console_printf(&cw, cfg.colors.text, "\nI/O error in %s.\n", message);
    cwin_console_printf(&cw, cfg.colors.text, "\nStatus: %s\n", uii_status);
    uii_abort();
    errorexit("");
  }
}

void get_slot_from_reu(char number)
// Function to get slot with specified number from REU
// Input: number - slot number to get
{
  unsigned long address;

  if (number > SLOTS - 1)
  {
    return;
  }

  address = number * sizeof(Slot) + SLOT_REU_START;

  reu_load(address, (char *)&Slot, sizeof(Slot));
}

void save_slot_to_reu(char number)
// Function to save slot with specified number to REU
// Input: number - slot number to save
{
  unsigned long address;

  if (number > SLOTS - 1)
  {
    return;
  }

  address = number * sizeof(Slot) + SLOT_REU_START;

  reu_store(address, (char *)&Slot, sizeof(Slot));
}

void write_slotsfile(char verbose)
// Function to write slots file
// Input: verbose - if non-zero, print status messages
{
  long count = SLOT_REU_START;
  long end = SLOT_REU_START + (sizeof(Slot) * SLOTS);
  char save_buffer[SAVE_BUF_SIZE];
  unsigned save_length = SAVE_BUF_SIZE;

  // Go to proper dir
  uii_change_dir(configpath);

  // Delete old config file as I can not (yet) get overwrite to work
  uii_delete_file(slotfilename);

  // Save slots via UCI, one slot at a time due to 512 char limit
  uii_open_file(0x06, slotfilename);

  while (count < end)
  {
    if (verbose)
    {
      if(cfg.verbose)
      {
        cwin_cursor_move(&cw, 0, 8);
        cwin_console_printf(&cw, cfg.colors.text, "Writing slot data at %ld.", count);
      }
      else
      {
        spinning(25, 3, verbosecounter++);
      }
    }
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

void read_slotsfile(unsigned char verbose)
// Function to read slots file
// Input: verbose - if non-zero, print status messages
{
  char x;
  long count = SLOT_REU_START;
  long end = SLOT_REU_START + (sizeof(Slot) * SLOTS);
  unsigned bytesread;

  // Go to proper dir
  uii_change_dir(configpath);

  uii_open_file(0x01, slotfilename);

  // Check if a file already exists, otherwise create new one
  if (strcmp((const char *)uii_status, "00,ok") != 0)
  {
    // Create slot with default values
    memset(&Slot, 0, sizeof(Slot));
    Slot.cfgvs = CFGVERSION;
    strncpy(Slot.padding, "uboot64 x mol", 13); // Padding to make structure size a multiple of 16

    for (x = 0; x < SLOTS; ++x)
    {
      // Debug
      //sprintf(Slot.path, "Path %2u", x);
      //sprintf(Slot.menu, "Menu %2u", x);
      //sprintf(Slot.file, "File %2u", x);
      //sprintf(Slot.cmd, "Cmd %2u", x);
      //sprintf(Slot.reu_image, "REU %2u", x);
      //sprintf(Slot.reu_path, "REUPath %2u", x);
      //Slot.reusize = x;
      //Slot.runboot = x;
      //Slot.device = x;
      //Slot.command = 0;
      //sprintf(Slot.image_a_path, "ImgAPath %2u", x);
      //sprintf(Slot.image_a_file, "ImgAFile %2u", x);
      //Slot.image_a_id = 8;
      //sprintf(Slot.image_b_path, "ImgBPath %2u", x);
      //sprintf(Slot.image_b_file, "ImgBFile %2u", x);
      //Slot.image_b_id = 9;
      // End of debug

      if (verbose)
      {
        if(cfg.verbose)
        {
          cwin_cursor_move(&cw, 0, 8);
          cwin_console_printf(&cw, cfg.colors.text, "Creating slot %2d", x + 1);
        }
        else
        {
          spinning(25, 3, verbosecounter++);
        } 
      }
      save_slot_to_reu(x);
    }
    cwin_fill_rect_raw(&cw, 0, 8, 40, 1, SC_SPACE, cfg.colors.text);
    write_slotsfile(1);
    uii_close_file();
    return;
  }

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
      if (verbose)
      {
        if(cfg.verbose)
        {
          cwin_cursor_move(&cw, 0, 8);
          cwin_console_printf(&cw, cfg.colors.text, "Reading slot data to %ld.", count);
        }
        else
        {
          spinning(25, 3, verbosecounter++);
        }
      }
    }
  }

  uii_close_file();

  get_slot_from_reu(0);

  if (Slot.cfgvs < CFGVERSION)
  {
    cwin_console_printf(&cw, cfg.colors.text, "\nOld configuration file format.");
    cwin_console_printf(&cw, cfg.colors.text, "\nRun upgrade tool first.");
    errorexit("");
  }
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
    if(cfg.verbose)
    {
      cwin_cursor_move(&cw, 0, 8);
      cwin_console_printf(&cw, cfg.colors.text, "No config file found, writing defaults.");
    }
    else
    {
      spinning(25, 3, verbosecounter++);
    }
    writeconfigfile();
    cwin_fill_rect_raw(&cw, 0, 8, 40, 1, SC_SPACE, cfg.colors.text);
    return;
  }

  uii_read_file(sizeof(cfg));
  CheckStatus("reading config");
  uii_readdata();
  uii_accept();

  // Read variables from read data
  memcpy(&cfg, uii_data, sizeof(cfg));

  // Exit if config file version is too old
  if (cfg.version < CFGVERSION)
  {
    cwin_console_printf(&cw, cfg.colors.text, "\nOld configuration file format.");
    cwin_console_printf(&cw, cfg.colors.text, "\nRun upgrade tool first.");
    errorexit("");
  }

  uii_close_file();
}