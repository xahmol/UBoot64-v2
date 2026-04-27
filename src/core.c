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

const char *value2hex = "0123456789abcdef";
const char *reg_types[] = {"SEQ", "PRG", "URS", "REL", "VRP"};
const char *oth_types[] = {"DEL", "CBM", "DIR", "LNK", "OTH", "HDR"};
char bad_type[4];

char device = 8;
char linebuffer[100];
char linebuffer2[100];
char DOSstatus[40];

/// string descriptions of enum drive_e
const char *drivetype[LAST_DRIVE_E] = {"", "Pi1541", "1540", "1541", "1551", "1570", "1571", "1581", "1001", "2031", "8040", "sd2iec", "cmd", "vice", "u64"}; /// enum drive_e value for each device 0-19.
char devicetype[MAXDEVID + 1];

// Generic functions
void errorexit(const char *msg)
// Function to exit to BASIC on error
{
  cwin_console_printf(&cw, cfg.colors.text, "\n%s\nPress key to exit to BASIC.\n", msg);
  cwin_getch();
  fc3_exit();
}

void delay(char seconds)
// Function to wait for specified number of seconds
// Input: seconds - number of seconds to wait
{
  cia1.tods = 0;
  cia1.todt = 0;
  while (cia1.tods < seconds)
  {
    ;
  }
}

void mid(const char *src, char start, char length, char *dst, char dstlen)
// Function to provide MID$ equivalent
// Input: src - source string
//        start - start position (0 = first character)
//        length - number of characters to copy
//        dst - destination string
//        dstlen - length of destination string
{
  char len = min(dstlen - 1, length);

  strncpy(dst, src + start, len);
  // zero terminate because strncpy() didn't ?
  if (len < length)
    dst[dstlen - 1] = 0;
}

char *pathconcat()
// Function to concatenate the path string array to one path string
{
  char concat[MAXPATHLEN] = "";
  int x;

  if (fb_uci_mode)
  {
    uii_get_path();
    strncpy(concat, uii_data, MAXPATHLEN - 1);
    concat[MAXPATHLEN - 1] = 0; // Ensure zero termination
  }
  else
  {
    if (devicetype[pathdevice] == VICE || devicetype[pathdevice] == U64)
    {
      strcat(concat, "cd:/");
    }
    else
    {
      strcat(concat, "cd//");
    }
    for (x = 0; x < depth; ++x)
    {
      strncat(concat, path[x], MAXPATHLEN - strlen(concat) - 3);
      strcat(concat, "/");
    }
    concat[MAXPATHLEN - 1] = 0; // Ensure zero termination
  }

  return concat;
}

char getkey(char mask)
// Function to wait for key within input validation mask
// Mask values for input validation (adds up for combinations):
// 00000001 =   1 = Numeric
// 00000010 =   2 = Alpha lowercase
// 00000100 =   4 = Alpha uppercase
// 00001000 =   8 = Up and down
// 00010000 =  16 = Left and right
// 00100000 =  32 = Delete and insert
// 01000000 =  64 = Return
// 10000000 = 128 = Y and N
{
  char keychar;

  do
  {
    keychar = cwin_getch();
  } while (!(mask & 1 && keychar > 47 && keychar < 58) && !(mask & 2 && keychar > 31 && keychar < 96) && !(mask & 4 && keychar > 95 && keychar < 128) && !(mask & 16 && (keychar == 29 || keychar == 157)) && !(mask & 8 && (keychar == 17 || keychar == 145)) && !(mask & 32 && (keychar == 20 || keychar == 148)) && !(mask & 64 && keychar == 13) && !(mask & 128 && (keychar == 78 || keychar == 89)));
  return keychar;
}

// Screen output generic routines

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

void spinning(char posx, char posy, char cont)
// Function to draw a spinner at given position
// Input: posx - X position
//        posy - Y position
//        cont - counter to determine spinner position
{
  const char spinner[4] = {0xbe, 0xbc, 0xac, 0xbb};
  cwin_putat_char(&cw, posx, posy, spinner[cont % 4], cfg.colors.text);
}

// Core device IO and IO routines

char iec_present(char id)
// Function to check if a device is present on given IEC device ID
// Input: id - device ID to check
// Output: 0 = no device, 1 = device present
{
  __asm
  {
	  lda id // Load device ID to check
	  ldy #0 // Clear Y register
	  sty $90 // clear status register (STATUS:= $90 Kernal I/O completion status)
	  jsr $FFB1 // set device to listen (LISTEN:= $FFB1)
	  lda #$ff // load secondary address
	  jsr $FF93 // SECOND:= $FF93 - Send secondary address
	  lda $90 // read status register (STATUS:= $90 Kernal I/O completion status)
	  bpl iec_pres_active // we have a device at this id
	  jsr $FFAE // cleanup, UNLSN:= $FFAE
	  lda #0 // indicate we have no device at this id
	  sta accu // Store in return variable
	  rts
iec_pres_active:
	  jsr $FFAE // cleanup, UNLSN:= $FFAE
    lda #1 // we have a device here.
	  sta accu // Store in return variable
    rts
  }
}

char CheckIfUltimateOnID(char id)
// Check if an ultimate device exists for which powertoggle by UCI is not possible
// Input: id - device ID to check
// Output: value with bits:
//    Bit 0: Exists yes or no
//    Bit 1: Powered on yes or no
//    Bit 2: UCI controllable yes or no
{
  char x;
  char checkvalue;

  for (x = 0; x < 4; x++)
  {
    if (uii_devinfo[x].id == id)
    {
      checkvalue = 1;                                     // Set bit 0 if exists
      checkvalue += (uii_devinfo[x].power) ? 2 : 0;       // Set bit 1 if powered
      checkvalue += (uii_devinfo[x].type < 0x0f) ? 4 : 0; // Set bit 2 if UCI controllable
      return checkvalue;
    }
  }
  return 0; // No Ultimate device on ID
}

char CheckActiveIECdevices()
// Check all non drive A and B IEC devices if they are active or not
// Fill iec_devices array: 0 = not active, 1 = non Ult, 2 = Ult
// return 1 if any non Ultimate is active, 0 for none
{
  char anyactive = 0;
  char iecdevice;
  char x, check;

  // Wipe array
  memset(iec_devices, 0, sizeof(iec_devices));

  // First get Ultimate devices
  if (!uii_parse_deviceinfo())
  {
    errorexit("Getting device info fails.");
  }

  // Check IDs 8 to 30
  for (x = 0; x < 23; x++)
  {
    iec_device = (x == 22) ? 4 : x + 8;
    check = (CheckIfUltimateOnID(iec_device));
    if (check)
    {
      if (check > 1)
      {
        iec_devices[x] = check;
        anyactive = (check == 3) ? 1 : 0; // Set anyactive if not UCI controllable and powered
      }
    }
    else
    {
      if (iec_present(iec_device))
      {
        iec_devices[x] = 1;
        anyactive = (x == 0) ? 0 : 1; // Set on one if not ID 8
      }
    }
  }

  return anyactive;
}

char dosCommand(const char lfn, const char drive, const char sec_addr, const char *cmd)
// Send DOS command - extended
// Input: lfn - logical file number to use (15 is recommended)
//        drive - device number to send command to
//        sec_addr - secondary address to use (15 is recommended)
//        cmd - command string to send
// Output: status code returned by device, or -1 on error
{
  // Send DOS command
  // based on version DraCopy 1.0e, then modified.
  // Created 2009 by Sascha Bader.

  int res;
  krnio_setnam(cmd);
  if (!krnio_open(lfn, drive, sec_addr))
  {
    krnio_close(lfn);
    return krnio_status();
  }

  if (lfn != 15)
  {
    krnio_setnam("");
    if (!krnio_open(15, drive, 15))
    {
      krnio_close(lfn);
      krnio_close(15);
      return krnio_pstatus[15];
    }
  }

  DOSstatus[0] = 0;
  res = krnio_read(15, DOSstatus, sizeof(DOSstatus));

  if (lfn != 15)
  {
    krnio_close(15);
  }
  krnio_close(lfn);

  if (!res)
  {
    return krnio_status();
  }

  return (DOSstatus[0] - 48) * 10 + DOSstatus[1] - 48;
}

char cmd(const char device, const char *cmd)
// Set DOS Command - simplified
// Input: device - device number to send command to
//        cmd - command string to send
// Output: status code returned by device, or -1 on error
{
  // Prepare DOS command
  // based on version DraCopy 1.0e, then modified.
  // Created 2009 by Sascha Bader.

  return dosCommand(15, device, 15, cmd);
}

const char *getDeviceType(const char device)
// Function to get device type string for given device number
// Input: device - device number to check
// Output: Pointer to string with device type, or error string
{
  char idx;

  if (device > sizeof(devicetype))
  {
    return "!d";
  }
  idx = cmd(device, "ui");
  if (idx != 73)
  {
    linebuffer2[0] = 'Q';
    linebuffer2[1] = value2hex[idx >> 4];
    linebuffer2[2] = value2hex[idx & 15];
    linebuffer2[3] = 0;
    return linebuffer2;
  }
  for (idx = 1; idx < LAST_DRIVE_E; ++idx)
  {
    if (strstr(DOSstatus, drivetype[idx]))
    {
      devicetype[device] = idx;
      return drivetype[idx];
    }
  }
  return "!n";
}

// Core operations functions

void DoDemoMode()
// Function to power down all drives but the drive on ID 8
{
  char x;

  // Switch of Ultimate drives A and B if not on ID 8
  if (uii_devinfo[0].exist && uii_devinfo[0].power && uii_devinfo[0].id != 8)
  {
    uii_disable_drive_a();
    cwin_console_printf(&cw, cfg.colors.text, "Power off drive A: %s\n", (UII_SUCCESS) ? "Yes" : "No");
  }
  if (uii_devinfo[1].exist && uii_devinfo[1].power && uii_devinfo[1].id != 8)
  {
    uii_disable_drive_b();
    cwin_console_printf(&cw, cfg.colors.text, "Power off drive B: %s\n", (UII_SUCCESS) ? "Yes" : "No");
  }

  // Ask user to disable other drives if needed
  while (CheckActiveIECdevices())
  {
    cwin_put_string(&cw, "Switch off ID ", cfg.colors.text);
    for (x = 1; x < 23; x++)
    {
      if (iec_devices[x] && iec_devices[x] < 4)
      {
        cwin_console_printf(&cw, cfg.colors.text, "%02d ", (x == 22) ? 4 : x + 8);
      }
    }
    cwin_put_string(&cw, "and press key.", cfg.colors.text);
    cwin_cursor_newline(&cw);
    cwin_getch();
  }
  cwin_put_string(&cw, "Success in powering down all drives but ID 8.", cfg.colors.text);
  cwin_cursor_newline(&cw);
}

void execute(char *prg, char device, char boot, char *command)
// Routine to execute or boot chosen file or dir
// Input:
// prg:     Filename
// device:  device number
// boot:    Execute flag
//          bit 0: Mount flag
//          bit 1: Load with ,1
// command: User defined command to be executed before execution.
//          Empty is no command.
{
  unsigned int pos = 2;
  char numberenter = 2;
  char x;

  // Check if demo mode is active
  if (boot & EXEC_DEMO)
  {
    DoDemoMode();
  }

  // First output two enters
  execute_commands[0] = 0x0d;
  execute_commands[1] = 0x0d;

  // Output user defined command if needed
  if (strlen(command) != 0)
  {
    strncpy(execute_commands + pos, command, 80);
    pos += strlen(command);
    execute_commands[pos++] = 0x0d;
    numberenter++;
  }

  // Output load and run commands
  if (boot & EXEC_COMMA1)
  {
    // Load with ,1
    sprintf(execute_commands + pos, "load\"%s\",%i,1%c%c%c%c%crun%c%c", prg, device, 0x0d, 0x0d, 0x0d, 0x0d, 0x0d, 0x0d, 0);
  }
  else
  {
    // Load without ,1
    sprintf(execute_commands + pos, "load\"%s\",%i%c%c%c%c%crun%c%c", prg, device, 0x0d, 0x0d, 0x0d, 0x0d, 0x0d, 0x0d, 0);
  }

  // put CRs in keyboard buffer staging area
  for (x = 0; x < numberenter; x++)
  {
    execute_keys[x] = 0x0d;
  }
  execute_keys[x] = 0;

  // exit, which will execute the BASIC LOAD above
  fc3_exit();
}

signed textInput(char xpos, char ypos, char width, char *str, char size, char validation)
/**
 * input/modify a string.
 * based on version DraCopy 1.0e, then modified.
 * Created 2009 by Sascha Bader.
 * @param[in] xpos screen x where input starts.
 * @param[in] ypos screen y where input starts.
 * @param[in,out] str string that is edited, it can have content and must have at least @p size + 1 bytes. Maximum size     if 255 bytes.
 * @param[in] size maximum length of @p str in bytes.
 * @return -1 if input was aborted.
 * @return >= 0 length of edited string @p str.
 */
// Added input: Validation  =   0   All printable characters allowed
//                          +   1   Numbers allowed only
//                          +   2   Also alphabet allowed (lower and uppercase)
//                          +   4   Also wildcards * and ? allowed
//                          Add numbers to combine or 0 for no validation
//              width:      =   width of input viewport, can be less than size
{
  char c;
  char idx = strlen(str);
  char len;
  char valid = 0;
  char offs = 0;
  char flag = 0;

  while (1)
  {
    // Calculate offset for viewing long string in viewport based on cursor pos
    if (idx + 1 > width)
    {
      offs = idx + 1 - width;
    }
    else
    {
      offs = 0;
    }
    len = strlen(str);

    // Clear viewport
    cwin_cursor_move(&cw, xpos, ypos);
    cwin_fill_rect_raw(&cw, xpos, ypos, width, 1, SC_SPACE, cfg.colors.text_input);

    // Print viweable part of string
    cwin_cursor_move(&cw, xpos, ypos);
    strncpy(linebuffer, str + offs, width - 1);
    linebuffer[width - 1] = 0;
    cwin_console_printf(&cw, cfg.colors.text_input, "%s", linebuffer);

    // Print cursor
    cwin_cursor_move(&cw, xpos + idx - offs, ypos);
    cwin_cursor_show(&cw, 1);

    // Get key for input
    c = cwin_getch();

    switch (c)
    {
    case CH_ESC:
    case CH_STOP:
      cwin_cursor_show(&cw, 0);
      return -1;

    case CH_ENTER:
      idx = strlen(str);
      str[idx] = 0;
      cwin_cursor_show(&cw, 0);
      cwin_cursor_move(&cw, xpos, ypos);
      cwin_fill_rect_raw(&cw, xpos, ypos, width, 1, SC_SPACE, cfg.colors.text_input);
      strncpy(linebuffer, str + offs, width - 1);
      linebuffer[width - 1] = 0;
      cwin_console_printf(&cw, cfg.colors.text_input, "%s", linebuffer);
      return idx;

    case CH_DEL:
      if (idx)
      {
        --idx;
        for (c = idx; 1; ++c)
        {
          char b = str[c + 1];
          str[c] = b;

          if (b == 0)
          {
            break;
          }
        }
      }
      break;

    case CH_INS:
      c = strlen(str);
      if (c < size && c > 0 && idx < c)
      {
        ++c;
        while (c >= idx)
        {
          str[c + 1] = str[c];
          if (c == 0)
          {
            break;
          }
          --c;
        }
        str[idx] = ' ';
      }
      break;

    case CH_CURS_LEFT:
      if (idx)
      {
        --idx;
      }
      break;

    case CH_CURS_RIGHT:
      if (idx < strlen(str) && idx < size)
      {
        ++idx;
      }
      break;

    default:
      valid = 0;

      // No validation apart from check if it isnot a control character
      if (!validation)
      {
        if ((c > 31 && c < 128) || (c > 159 && c < 256))
        {
          valid = 1;
        }
      }
      /// Validation on numbers only
      if ((validation & 1) && c > 47 && c < 58)
      {
        valid = 1;
      }
      // Validation on alphabet only lowercase
      if ((validation & 2) && c > 64 && c < 91)
      {
        valid = 1;
      }
      // Validation on alphabet only uppercase
      if ((validation & 2) && c > 96 && c < 123)
      {
        valid = 1;
      }
      // Validation on wildcards * and ?
      if ((validation & 4) && (c == 42 || c == 63))
      {
        valid = 1;
      }
      if (idx < size && valid)
      {
        flag = str[idx];
        str[idx] = c;
        ++idx;
        if (!flag)
        {
          str[idx] = 0;
        }
        break;
      }
      break;
    }
  }
  return 0;
}
