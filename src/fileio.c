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

void load_reu_with_reroute(char *path, char *reu_image, char reusize)
// Preload a REU image, retrying across USB ports if the stored path has
// moved. The retry loop drives the real uii_open_file() call itself (not
// a separate directory-only probe): two prior attempts at a dedicated
// existence check (uii_open_file() misused as a probe, then
// uii_file_stat()) both broke real disk-image mounts elsewhere on this
// firmware in undocumented ways, so this uses the actual operation
// directly instead. Unlike disk images (see mountimage()), a plain .REU
// file has no "wrong type" failure mode, so any open failure here is
// treated uniformly as "keep hunting" -- no status-code distinction
// needed. A "/usbX/"-shaped prefix (checked structurally: "/usb" + one
// char + "/" -- covers literal "/usb0|1|2/" ports AND the Ultimate
// firmware's own "/usb*/" wildcard alias for "whichever single USB stick
// is present") is retried against the numbered USB ports by swapping the
// prefix in place (no scratch buffer needed, the prefixes share the same
// length); a wildcard prefix never matches a specific port number, so
// none gets excluded and all three are tried. On total failure, prompts
// to insert the stick and retry, or F7 to abort to BASIC.
{
  char origport;
  char x;
  char found = 0;

  for (;;)
  {
    uii_change_dir(path);
    if (UII_SUCCESS)
    {
      uii_open_file(1, reu_image);
      if (UII_SUCCESS)
      {
        found = 1;
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
          uii_open_file(1, reu_image);
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
      break;
    }

    cwin_console_printf(&cw, cfg.colors.text, "\nInsert USB stick. Key=retry, F7=BASIC\n");
    if (cwin_getch() == CH_F7)
    {
      errorexit("USB stick not found.");
    }
  }

  uii_load_reu(reusize);
  uii_close_file();
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

  // UCI data queue is 512 bytes max; SAVE_BUF_SIZE (500) keeps each write within that limit
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
    Slot.isdefault = 0;
    strncpy(Slot.padding, "uboot64 x mol", 12); // Padding to make structure size a multiple of 16

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

  // UCI returns data in chunks up to DATA_QUEUE_SZ (512); drain until full file is read
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

  {
    unsigned bytesread;

    uii_read_file(sizeof(cfg));
    CheckStatus("reading config");
    bytesread = uii_readdata();
    uii_accept();

    // Read variables from read data. Older config files may be shorter than
    // the current struct (additive fields appended since); zero the struct
    // first and copy only the bytes actually read, so newly added tail
    // fields default to 0 instead of picking up stale bytes left over in
    // uii_data from a previous UCI call.
    memset(&cfg, 0, sizeof(cfg));
    memcpy(&cfg, uii_data, min((unsigned)sizeof(cfg), bytesread));
  }

  // Exit if config file version is too old
  if (cfg.version < CFGVERSION)
  {
    cwin_console_printf(&cw, cfg.colors.text, "\nOld configuration file format.");
    cwin_console_printf(&cw, cfg.colors.text, "\nRun upgrade tool first.");
    errorexit("");
  }

  uii_close_file();
}