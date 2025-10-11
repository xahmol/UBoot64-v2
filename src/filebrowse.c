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
#include <c64/memmap.h>
#include <c64/charwin.h>
#include <c64/cia.h>
#include <c64/vic.h>
#include <c64/types.h>
#include <c64/sprites.h>
#include <c64/reu.h>
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
#include "core.h"
#include "fileio.h"
#include "u-time.h"
#include "slotmenu.h"
#include "filebrowse.h"
#include "petscii_ascii.h"

// Switching code generation to bank 2 common routine section
#pragma code(bcode2)
#pragma data(bdata2)

// Kernal defines for IEC statis detection
#define STATUS 0x90 // Kernal I/O completion status
#define SECOND 0xFF93
#define UNLSN 0xFFAE
#define LISTEN 0xFFB1

#define X(a, b, c) linebuffer[len - 3] == a &&linebuffer[len - 2] == b &&linebuffer[len - 1] == c

#define CBM_T_REG 0x10 /* Bit set for regular files */
#define CBM_T_SEQ 0x10
#define CBM_T_PRG 0x11
#define CBM_T_USR 0x12
#define CBM_T_REL 0x13
#define CBM_T_VRP 0x14 /* Vorpal fast-loadable format */
#define CBM_T_DEL 0x00
#define CBM_T_CBM 0x01    /* 1581 sub-partition */
#define CBM_T_DIR 0x02    /* IDE64 and CMD sub-directory */
#define CBM_T_LNK 0x03    /* IDE64 soft-link */
#define CBM_T_OTHER 0x04  /* File-type not recognized */
#define CBM_T_HEADER 0x05 /* Disk header / title */
#define CBM_T_FREE 100
#define DISK_ID_LEN 5
#define CBM_A_RO 1 /* Read only   */
#define CBM_A_WO 2 /* Write only  */
#define CBM_A_RW 3 /* Read, Write */
#define disk_id_buf linebuffer2

static const char progressBar[4] = {0x65, 0x61, 0x67, SC_SPACE};
static const char progressRev[4] = {0, 0, 1, 1};

// Structs and variables

// Structure for directory meta data
struct DirMeta
{
  unsigned long next; // Address of next element
  unsigned long prev; // Address of previous element
  char type;          // Type
  char length;        // Filename length
  char select;        // Select: 0=not selected, 1=selected
  char size;          // Size in blocks (256 bytes)
  char access;        // Accessed flag
  char stub[5];       // Reserved / not used
};

// Structure for directory element
struct DirElement
{
  char name[MAXFILENAME]; // Entry name
  struct DirMeta meta;    // Meta data
};
extern struct DirElement presentdirelement;

// Structure for active directory for both panes
struct Directory
{
  unsigned long firstelement; // Address of first element
  unsigned long firstprint;   // Address of first element to print
  unsigned long lastprint;    // Address of last element to print
  unsigned long present;      // Address of active element
  char drive;                 // Drive number
  unsigned position;          // Position in directory
  char path[MAXPATHLEN];      // Path
  unsigned free;              // Free blocks on device
  unsigned long address;      // Address in REU for next entry
};
extern struct Directory presentdir;

// Application variables
unsigned long present;  // Present element
unsigned long previous; // Previous element
unsigned long next;     // Next element
char sorted;            // Sorted flag

// Buffers for full paths
char pathbuffer[256];

// Directory reader Functions
void dir_close(char lfn)
// Closse a directory opened for reading
// Input: lfn = logical file number
{
  // Reset channels
  krnio_clrchn();

  // Close file
  krnio_close(lfn);
}

char dir_open(char lfn, unsigned char device)
// Open a directory for reading
// Input: lfn = logical file number
//        device = device number
{
  char status = 0;
  char error = 0;

  // Set name for directory
  krnio_setnam("$");

  status = krnio_open(lfn, device, 0);
  error = krnio_status();

  if (status && error)
  {
    dir_close(lfn);
  }

  // Open the directory
  if (status && !error)
  {
    // Switch input to file
    status = krnio_chkin(lfn);
    error = krnio_status();

    if (status && !error)
    {
      // Skip BASIC load address
      krnio_chrin();
      krnio_chrin();

      error = krnio_status();

      if (error)
      {
        dir_close(lfn);
      }
    }
    else
    {
      dir_close(lfn);
    }
  }

  // Return error code or 0 on succcess
  return error;
}

void dir_get_element(unsigned long address)
// Get directory element from address
// Input: address = address of element
{
  unsigned long workaddress = address;
  reu_load(workaddress, (volatile char *)&presentdirelement.meta, sizeof(presentdirelement.meta));
  workaddress += sizeof(presentdirelement.meta);
  reu_load(workaddress, (volatile char *)presentdirelement.name, presentdirelement.meta.length);
}

void dir_save_element(unsigned long address)
// Save directory element to address
// Input: address = address of element
{
  unsigned long workaddress = address;
  reu_store(workaddress, (volatile char *)&presentdirelement.meta, sizeof(presentdirelement.meta));
  workaddress += sizeof(presentdirelement.meta);
  reu_store(workaddress, (volatile char *)presentdirelement.name, presentdirelement.meta.length);
}

char dir_readentry_iec(struct DirElement *l_dirent)
// Read the next directory entry on IEC file system
// Input: lfn - logical file name of the directory
//        l_dirent - pointer to directory entry struct to fill
// Output: 0 on success, 1 on failure
{
  char b, len;
  char i = 0;

  // check that device is ready
  b = krnio_chrin();
  if (!b)
  {
    // No entry found
    return 1;
  }
  if (krnio_status())
  {
    return 7;
  }

  // Skip second basic link byte
  krnio_chrin();

  // read file size
  l_dirent->meta.size = krnio_chrin();
  l_dirent->meta.size |= (krnio_chrin()) << 8;

  // read line into linebuffer
  memset(linebuffer, 0, sizeof(linebuffer));
  while (1)
  {
    // read byte
    b = krnio_chrin();
    // EOL?
    if (b == 0)
    {
      break;
    }
    // append to linebuffer
    if (i < sizeof(linebuffer))
    {
      linebuffer[i++] = b;
    }
    // return if reading had error
    if (krnio_status())
    {
      krnio_clrchn();
      return 2;
    }
  }

  // handle "B" BLOCKS FREE
  if (linebuffer[0] == 'b')
  {
    l_dirent->meta.type = CBM_T_FREE;
    return 0;
  }

  // check that we have a minimum amount of characters to work with
  if (i < 5)
  {
    return 3;
  }

  // strip whitespace from right part of line
  for (len = i; len > 0; --len)
  {
    b = linebuffer[len];
    if (b == 0 ||
        b == ' ' ||
        b == 0xA0)
    {
      linebuffer[len] = 0;
      continue;
    }
    ++len;
    break;
  }

  // parse file name

  // skip until first "
  for (i = 0; i < sizeof(linebuffer) && linebuffer[i] != '"'; ++i)
  {
    // do nothing
  }

  // copy filename, until " or max size
  b = 0;
  for (++i; i < MAXFILENAME && linebuffer[i] != '"' && b < 16; ++i)
  {
    l_dirent->name[b++] = linebuffer[i];
  }
  l_dirent->name[b] = 0;
  l_dirent->meta.length = b + 1;

  // check file type
  if (X('p', 'r', 'g'))
  {
    l_dirent->meta.type = CBM_T_PRG;
  }
  else if (X('s', 'e', 'q'))
  {
    l_dirent->meta.type = CBM_T_SEQ;
  }
  else if (X('u', 's', 'r'))
  {
    l_dirent->meta.type = CBM_T_USR;
  }
  else if (X('d', 'e', 'l'))
  {
    l_dirent->meta.type = CBM_T_DEL;
  }
  else if (X('r', 'e', 'l'))
  {
    l_dirent->meta.type = CBM_T_REL;
  }
  else if (X('c', 'b', 'm'))
  {
    l_dirent->meta.type = CBM_T_CBM;
  }
  else if (X('d', 'i', 'r'))
  {
    l_dirent->meta.type = CBM_T_DIR;
  }
  else if (X('v', 'r', 'p'))
  {
    l_dirent->meta.type = CBM_T_VRP;
  }
  else if (X('l', 'n', 'k'))
  {
    l_dirent->meta.type = CBM_T_LNK;
  }
  else
  {
    // parse header
    l_dirent->meta.type = CBM_T_HEADER;

    // skip one character which should be "
    if (linebuffer[i] == '"')
    {
      ++i;
    }
    // skip one character which should be space
    if (linebuffer[i] == ' ')
    {
      ++i;
    }

    // copy disk ID
    for (b = 0; b < DISK_ID_LEN; ++b)
    {
      if (linebuffer[i])
      {
        disk_id_buf[b] = linebuffer[i];
      }
      i++;
    }
    disk_id_buf[b] = 0;

    // strip disk name
    for (b = 15; b > 0; --b)
    {
      if (l_dirent->name[b] == 0 ||
          l_dirent->name[b] == ' ' ||
          l_dirent->name[b] == 0xA0)
      {
        l_dirent->name[b] = 0;
        continue;
      }
      break;
    }

    return 0;
  }

  // parse read-only
  l_dirent->meta.access = (linebuffer[i - 4] == 0x3C) ? CBM_A_RO : CBM_A_RW;

  return 0;
}

char dir_readentry_uci(struct DirElement *l_dirent)
// Read the next directory entry on UCI file system
// Input: l_dirent - pointer to directory entry struct to fill
// Output: 0 on success, 1 on failure
{
  // Read dir entries on UCI file system
  char presenttype;
  char len;

  if (!uii_isdataavailable())
  {
    return 1;
  }

  // Reset entry type
  presenttype = 0;

  // Get next dir entry
  uii_readdata();
  uii_accept();

  // Check if entry is a dir by checking if bit 4 of first byte is set
  if (uii_data[0] & 0x10)
  {
    presenttype = CBM_T_DIR;
  }

  // Copy to buffer
  strncpy(linebuffer2, uii_data + 1, MAXFILENAME);
  linebuffer2[MAXFILENAME - 1] = 0;

  // Store entry in original charset
  strncpy(l_dirent->name, linebuffer2, MAXFILENAME);
  l_dirent->name[MAXFILENAME - 1] = 0;

  // Convert to PETSCII
  strcpy(linebuffer, AscToPet(linebuffer2));
  len = strlen(linebuffer);
  l_dirent->meta.length = len + 1;

  // check file type
  if (!presenttype && len > 4)
  {
    if (X('p', 'r', 'g') || X('P', 'R', 'G'))
    {
      presenttype = CBM_T_PRG;
    }
    else if (X('s', 'e', 'q') || X('S', 'E', 'Q'))
    {
      presenttype = CBM_T_SEQ;
    }
    else if (X('u', 's', 'r') || X('U', 'S', 'R'))
    {
      presenttype = CBM_T_USR;
    }
    else if (X('d', 'e', 'l') || X('D', 'E', 'L'))
    {
      presenttype = CBM_T_DEL;
    }
    else if (X('r', 'e', 'l') || X('R', 'E', 'L'))
    {
      presenttype = CBM_T_REL;
    }
    else if (X('c', 'b', 'm') || X('C', 'B', 'M'))
    {
      presenttype = CBM_T_CBM;
    }
    else if (X('d', 'i', 'r') || X('D', 'I', 'R'))
    {
      presenttype = CBM_T_DIR;
    }
    else if (X('v', 'r', 'p') || X('V', 'R', 'P'))
    {
      presenttype = CBM_T_VRP;
    }
    else if (X('l', 'n', 'k') || X('L', 'N', 'K'))
    {
      presenttype = CBM_T_LNK;
    }
  }

  // Set SEQ as default for too long or unrecognised filenames
  if (!presenttype)
  {
    presenttype = CBM_T_SEQ;
  }

  // Set direntry data
  l_dirent->meta.type = presenttype;
  l_dirent->meta.size = 0;
  return 0;
}

char dir_read(char sort)
// Read directory entries to REU memory from specified device
// Output: 1 on success, 0 on failure
{
  char presenttype;
  char datalength;
  char count = 0xff;
  unsigned element;
  struct DirElement bufferdir;
  unsigned long workaddress;
  char inserted;
  char ret;
  char cnt = 0xff;
  char i;
  unsigned long maxreuaddress = (reudetected * 65536) - 1;

  previous = 0;

  // Reset dirdata
  presentdir.address = SLOT_REU_START + (SLOTS * sizeof(Slot));
  present = presentdir.address;

  // Clear directory values
  presentdir.firstelement = 0;
  presentdir.firstprint = 0;
  presentdir.lastprint = 0;
  presentdir.position = 0;
  presentdir.present = 0;

  // Open dir dependend on IEC or UCI mode
  if (!fb_uci_mode)
  {
    strcpy(presentdir.path, "");
    if (dir_open(2, device))
    {
      return 0;
    }
  }
  else
  {
    uii_open_dir();
    if (!UII_SUCCESS)
    {
      uii_abort();
      return 0;
    }
    uii_get_dir();
  }

  // Read entries
  while (1)
  {
    if (!fb_uci_mode)
    {
      ret = dir_readentry_iec(&(presentdirelement));
    }
    else
    {
      ret = dir_readentry_uci(&(presentdirelement));
    }
    if (ret != 0)
    {
      break;
    }

    // print progress bar
    if ((cnt >> 2) >= 40)
    {
      cnt = 0;
      cwin_fill_rect_raw(&cw, 0, 2, 40, 1, SC_SPACE, cfg.colors.text);
    }
    else
    {
      cwin_putat_char_raw(&cw, (cnt >> 2), 2, progressBar[cnt & 3] | (0x80 * progressRev[cnt & 3]), cfg.colors.text);
      ++cnt;
    }

    // Check in IEC mode if path is still empty if dir header is found
    if (!presentdir.path[0] && !fb_uci_mode)
    {
      // initialize directory in IEC mode
      if (presentdirelement.meta.type == CBM_T_HEADER)
      {
        strcpy(presentdir.path, presentdirelement.name);
        presentdir.path[presentdirelement.meta.length] = ',';
        memcpy(&presentdir.path[presentdirelement.meta.length + 1], disk_id_buf, DISK_ID_LEN);
      }
      else
      {
        strcpy(presentdir.path, "Unknown type");
      }
      break;
    }

    // Check if blocks free entry is found
    if (presentdirelement.meta.type == CBM_T_FREE && !fb_uci_mode)
    {
      // blocks free entry
      presentdir.free = presentdirelement.meta.size;
      break;
    }

    // Check if sufficient memory is left
    if (presentdir.address + sizeof(presentdirelement) > maxreuaddress)
    {
      break;
    }

    // Set direntry pointers
    // Is this the first entry?
    if (!previous)
    {
      presentdir.firstelement = present;
      presentdir.firstprint = present;
      presentdirelement.meta.prev = 0;
      previous = present;
      presentdirelement.meta.next = 0;
    }
    // All next entries
    else
    {
      // Does the list need to be sorted?
      if (sort)
      {
        inserted = 0;
        // Find element to insert after
        element = presentdir.firstelement;
        do
        {
          workaddress = element;
          reu_load(workaddress, (volatile char *)&bufferdir.meta, sizeof(bufferdir.meta));
          workaddress += sizeof(bufferdir.meta);
          reu_load(workaddress, (volatile char *)bufferdir.name, bufferdir.meta.length);

          if (strcmp(bufferdir.name, presentdirelement.name) > 0)
          {
            // Insert before the first one?
            if (!bufferdir.meta.prev)
            {
              presentdirelement.meta.prev = 0;
              presentdirelement.meta.next = element;
              bufferdir.meta.prev = present;
              presentdir.firstelement = present;
              presentdir.firstprint = present;
              reu_store(element, (volatile char *)&bufferdir.meta, sizeof(bufferdir.meta));
            }
            else
            // Insert in between
            {
              presentdirelement.meta.prev = bufferdir.meta.prev;
              presentdirelement.meta.next = element;
              bufferdir.meta.prev = present;
              reu_store(element, (volatile char *)&bufferdir.meta, sizeof(bufferdir.meta));
              reu_load(bufferdir.meta.prev, (volatile char *)&bufferdir.meta, sizeof(bufferdir.meta));
              bufferdir.meta.next = present;
              reu_store(bufferdir.meta.prev, (volatile char *)&bufferdir.meta, sizeof(bufferdir.meta));
            }
            inserted = 1;
            break;
          }
          element = bufferdir.meta.next;
        } while (element);

        // Insert at the end
        if (!inserted)
        {
          presentdirelement.meta.prev = previous;                          // Set prev in new entry
          reu_store(previous, (volatile char *)&present, sizeof(present)); // Set next in previous entry
          previous = present;
          presentdirelement.meta.next = 0;
        }
      }
      else
      {
        presentdirelement.meta.prev = previous;                          // Set prev in new entry
        reu_store(previous, (volatile char *)&present, sizeof(present)); // Set next in previous entry
        previous = present;
        presentdirelement.meta.next = 0;
      }
    }

    presentdirelement.meta.select = 0;

    // Set meta data
    reu_store(presentdir.address, (volatile char *)&presentdirelement.meta, sizeof(presentdirelement.meta));
    presentdir.address += sizeof(presentdirelement.meta);

    // Set filename
    reu_store(presentdir.address, (volatile char *)presentdirelement.name, presentdirelement.meta.length);
    presentdir.address += presentdirelement.meta.length;

    // Update present pointer
    present = presentdir.address;
  }

  cwin_fill_rect_raw(&cw, 0, 2, 40, 1, SC_SPACE, cfg.colors.text);

  if (!fb_uci_mode)
  {
    dir_close(2);
  }

  if (presentdir.firstelement)
  {
    present = presentdir.firstelement;
    dir_get_element(present);
  }
  else
  {
    present = 0;
  }
  return 1;
}

// File browser operations functions
const char *fileTypeToStr(char ft)
// Convert file type to string
// Input: ft = file type
{
  if (fb_uci_mode && ft != CBM_T_DIR)
  {
    return "   ";
  }
  if (ft & CBM_T_REG)
  {
    ft &= ~CBM_T_REG;
    if (ft <= 4)
      return reg_types[ft];
  }
  else
  {
    if (ft <= 5)
      return oth_types[ft];
  }
  bad_type[0] = '?';
  bad_type[1] = value2hex[ft >> 4];
  bad_type[2] = value2hex[ft & 15];
  bad_type[3] = 0;
  return bad_type;
}

void CheckMounttype(char *dirname)
// Check if file is mountable image or REU file
// Input: dirname - pointer to filename
{
  char l = strlen(dirname);

  mountflag = 0;

  strcpy(linebuffer, (fb_uci_mode) ? AscToPet((char *)dirname) : dirname);

  if (linebuffer)
  {
    if (l > 4 && linebuffer[l - 4] == '.')
    {
      if ((linebuffer[l - 3] == 'd' || linebuffer[l - 3] == 'D') &&
          (linebuffer[l - 2] == '6') &&
          (linebuffer[l - 1] == '4'))
      {
        mountflag = 1;
      }
      if ((linebuffer[l - 3] == 'g' || linebuffer[l - 3] == 'G') &&
          (linebuffer[l - 2] == '6') &&
          (linebuffer[l - 1] == '4'))
      {
        mountflag = 1;
      }
      else if ((linebuffer[l - 3] == 'd' || linebuffer[l - 3] == 'D') &&
               (linebuffer[l - 2] == '7' || linebuffer[l - 2] == '8') &&
               (linebuffer[l - 1] == '1'))
      {
        mountflag = 1;
      }
      else if ((linebuffer[l - 3] == 'g' || linebuffer[l - 3] == 'G') &&
               (linebuffer[l - 2] == '7' || linebuffer[l - 2] == '8') &&
               (linebuffer[l - 1] == '1'))
      {
        mountflag = 1;
      }
      else if ((linebuffer[l - 3] == 'd' || linebuffer[l - 3] == 'D') &&
               (linebuffer[l - 2] == 'n' || linebuffer[l - 2] == 'N') &&
               (linebuffer[l - 1] == 'p' || linebuffer[l - 1] == 'P') &&
               !fb_uci_mode)
      {
        mountflag = 1;
      }
      else if ((linebuffer[l - 3] == 'r' || linebuffer[l - 3] == 'R') &&
               (linebuffer[l - 2] == 'e' || linebuffer[l - 2] == 'E') &&
               (linebuffer[l - 1] == 'u' || linebuffer[l - 1] == 'U'))
      {
        mountflag = 2;
      }
    }
  }
}

void dir_print_id_and_path()
// Draw the frame for the directory listing
{
  char length;

  cwin_fill_rect_raw(&cw, 0, 3, 25, 22, SC_SPACE, cfg.colors.text);
  cwin_cursor_move(&cw, 0, 3);

  if (fb_uci_mode)
  {
    cwin_console_printf(&cw, cfg.colors.text, "[UCI file system]");
  }
  else
  {
    cwin_console_printf(&cw, cfg.colors.text, "[%02i] %.20s", device, presentdir.path);
    cwin_cursor_move(&cw, 0, 24);
    cwin_console_printf(&cw, cfg.colors.text, "(%s) %u bl. free", drivetype[devicetype[device]], presentdir.free);
  }

  if (trace || fb_uci_mode)
  {
    if (fb_uci_mode)
    {
      uii_get_path();
      strncpy(pathbuffer, AscToPet(uii_data), 255);
    }
    else
    {
      strncpy(linebuffer, pathconcat(), 255);
    }
    pathbuffer[255] = 0; // Ensure null termination

    length = strlen((char *)linebuffer);
    if (length > 24)
    {
      strcpy(linebuffer2, (char *)pathbuffer + length - 24);
    }
    else
    {
      strcpy(linebuffer2, (char *)pathbuffer);
    }
  }
  else
  {
    strcpy(linebuffer2, "No dirtrace active.");
  }
  cwin_putat_string(&cw, 0, 4, linebuffer2, cfg.colors.text);
}

void dir_print_entry(char printpos)
// Print the current directory element at specified position
// Input: printpos = position to print (0-18)
{
  char namebuffer[22];

  if (fb_uci_mode)
  {
    strncpy(namebuffer, AscToPet(presentdirelement.name), 21);
    namebuffer[21] = 0;
    sprintf(linebuffer, "%-21s %s", namebuffer, fileTypeToStr(presentdirelement.meta.type));
  }
  else
  {
    // Prepare name
    strncpy(namebuffer, presentdirelement.name, 16);

    // Get file type to string
    strcpy(linebuffer2, (char *)fileTypeToStr(presentdirelement.meta.type));

    // if blocks are >= 10000 shorten the file type to 2 characters
    if (presentdirelement.meta.size >= 10000 && strlen(presentdirelement.name) == 16)
    {
      linebuffer2[0] = linebuffer2[1];
      linebuffer2[1] = linebuffer2[2];
      linebuffer2[2] = 0;
      namebuffer[15] = 0;
    }
    sprintf(linebuffer, (presentdirelement.meta.size < 10000) ? "%4u %-16s %s" : "%u %-15s %s",
            presentdirelement.meta.size,
            namebuffer,
            linebuffer2);
  }

  if ((printpos == presentdir.position))
  {
    cwin_putat_string_reverse(&cw, 0, printpos + 5, linebuffer, cfg.colors.diritem_select);
  }
  else
  {
    cwin_putat_string(&cw, 0, printpos + 5, linebuffer, cfg.colors.diritem_normal);
  }
}

void dir_draw(unsigned char readdir)
// Draw the dirlisting
// Input: readdir = read directory, flag for 0 = just reprint same dir, 1 = read new dir
{
  char printpos = 0;
  unsigned long element;

  // Print header
  dir_print_id_and_path();

  // Read directory contents
  if (readdir)
  {
    dir_read(sorted);
    presentdir.present = presentdir.firstprint;
  }

  // Print no data if no valid entries in dir are found
  if (!presentdir.firstprint)
  {
    cwin_putat_string(&cw, 0, 5, "Empty directory.", cfg.colors.error);
  }
  // Print entries until area is filled or last item is reached
  else
  {
    // Get direlement
    element = presentdir.firstprint;

    // Loop while area is not full and further direntries are still present
    do
    {
      // Print entry and increase printpos
      dir_get_element(element);
      dir_print_entry(printpos);
      presentdir.lastprint = element;
      if (printpos == presentdir.position)
      {
        presentdir.present = element;
      }
      printpos++;

      // Check if next dir entry is present, if no: break. If yes: update present pointer
      if (!presentdirelement.meta.next)
      {
        break;
      }
      else
      {
        element = presentdirelement.meta.next;
      }

    } while (printpos < 19);
    present = presentdir.present;
  }
}

void browse_menu(void)
{
  char menuy = 3;

  cwin_fill_rect_raw(&cw, 25, 3, 15, 22, SC_SPACE, cfg.colors.text);

  cwin_putat_string(&cw, 26, menuy, " F1 Dir refr.", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, " F3 UCI or IEC", cfg.colors.text);
  if (!fb_uci_mode)
  {
    cwin_putat_string(&cw, 26, ++menuy, "+/- Device", cfg.colors.text);
  }
  cwin_putat_string(&cw, 26, ++menuy, "RET Run/Select", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "DEL Dir up", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "  \x5e Root dir", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "  T Top", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "  E End", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "P/U Page up/do", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "Cur Navigate", cfg.colors.text);
  if (!fb_uci_mode)
  {
    cwin_putat_string(&cw, 26, ++menuy, "  D Dirtrace", cfg.colors.text);
  }
  if (fb_uci_mode)
  {
    cwin_putat_string(&cw, 26, ++menuy, " AB Add mount", cfg.colors.text);
    cwin_putat_string(&cw, 26, ++menuy, "  M Run mount", cfg.colors.text);
  }
  cwin_putat_string(&cw, 26, ++menuy, "  1 ,1 Load", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "  O Demo mode", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, " F7 Quit", cfg.colors.text);

  menuy++;
  if (fb_uci_mode)
  {
    cwin_putat_string(&cw, 26, ++menuy, "UCI mode", cfg.colors.text);
  }
  else
  {
    cwin_putat_string(&cw, 26, ++menuy, "IEC mode", cfg.colors.text);
  }
  if (inside_mount)
  {
    cwin_putat_string(&cw, 26, ++menuy, "Inside mount", cfg.colors.text);
    cwin_cursor_move(&cw, 26, ++menuy);
    cwin_console_printf(&cw, cfg.colors.text, "A at ID %2d", imageaid);
  }

  if (trace == 1)
  {
    cwin_putat_string(&cw, 26, ++menuy, "Trace   ON ", cfg.colors.text);
  }
  else
  {
    cwin_putat_string(&cw, 26, ++menuy, "Trace   OFF", cfg.colors.text);
  }
  if (comma1 == 1)
  {
    cwin_putat_string(&cw, 26, ++menuy, ",1 Load ON ", cfg.colors.text);
  }
  else
  {
    cwin_putat_string(&cw, 26, ++menuy, ",1 Load OFF", cfg.colors.text);
  }
  if (demomode == 1)
  {
    cwin_putat_string(&cw, 26, ++menuy, "Demo    ON ", cfg.colors.text);
  }
  else
  {
    cwin_putat_string(&cw, 26, ++menuy, "Demo    OFF", cfg.colors.text);
  }
}

// int changeDir(const BYTE device, char *dirname)
//{
//   int ret;
//   register BYTE l = strlen(dirname);
//   // char x;
//
//   if (dirname)
//   {
//     CheckMounttype(dirname);
//
//     if (mountflag == 2 && (trace == 1 || fb_uci_mode))
//     {
//       reuflag = 1;
//       StringSafeCopy(imagename, dirname, 19);
//     }
//     if (fb_uci_mode && !inside_mount)
//     {
//       if (mountflag == 1)
//       {
//
//         if (!uii_parse_deviceinfo())
//         {
//           clrscr();
//           printf("Old Ultimate firmware detected.\n\r");
//           errorexit();
//         }
//         // cputsxy(26,21,"DevInfo:");
//         // cwin_cursor_move(&cw, 26,22);
//         // for(x=0;x<7;x++) { cwin_console_printf(&cw,cfg.colors.text,"%2X",uii_data[x]); }
//         // cgetc();
//
//         imageaid = uii_devinfo[0].id;
//         StringSafeCopy(imageaname, dirname, 19);
//         // clearArea(26,21,14,2);
//         // cwin_cursor_move(&cw, 26,21);
//         // cwin_console_printf(&cw,cfg.colors.text,"ID: %d @ %4X",imageaid,&imageaid);
//         // cputsxy(26,22,imageaname);
//         // cgetc();
//
//         if (!uii_devinfo[0].power)
//         {
//           uii_enable_drive_a();
//           // clearArea(26,21,14,2);
//           // cputsxy(26,21,"Power A on:");
//           // cputsxy(26,22,uii_status);
//           // cgetc();
//         }
//
//         uii_mount_disk(imageaid, dirname);
//         // clearArea(26,21,14,2);
//         // cputsxy(26,21,"Mount on A:");
//         // cputsxy(26,22,uii_status);
//         // cgetc();
//
//         // clearArea(26,21,14,2);
//         uii_get_path();
//         StringSafeCopy(imageapath, uii_data, 99);
//         if (!uii_success())
//         {
//           return 1;
//         }
//         trace = 1;
//         inside_mount = 1;
//         fb_uci_mode = 0;
//         depth = 0;
//         refreshDir();
//         updateMenu();
//       }
//       else
//       {
//         uii_change_dir(dirname);
//       }
//     }
//     else
//     {
//       if (mountflag == 1 || (l == 1 && dirname[0] == CH_LARROW) ||
//           devicetype[device] == VICE || devicetype[device] == U64)
//       {
//         sprintf(linebuffer, "cd:%s", dirname);
//       }
//       else
//       {
//         sprintf(linebuffer, "cd/%s/", dirname);
//       }
//     }
//
//     if (trace == 1)
//     {
//       StringSafeCopy(path[depth], dirname, 19);
//     }
//   }
//   else
//   {
//     if (fb_uci_mode)
//     {
//       uii_change_dir("/");
//     }
//     else
//     {
//       strcpy(linebuffer, "cd//");
//     }
//   }
//   if (fb_uci_mode)
//   {
//     ret = (uii_success()) ? 0 : 1;
//   }
//   else
//   {
//     ret = cmd(device, linebuffer);
//   }
//   if (ret == 0)
//   {
//     refreshDir();
//   }
//   return ret;
// }

void browse_updatescreen()
{
  cwin_clear(&cw);
  headertext("Filebrowser", 1);
  browse_menu();
  dir_draw(1);
}

void FindFirstIECDrive()
{
  char i;

  for (i = 0; i < 16; ++i)
  {
    krnio_close(i);
    dir_close(i);
  }

  i = 7;

  CheckActiveIECdevices();
  while (++i < MAXDEVID + 1)
  {
    device = i;
    if (iec_devices[i - 8] && dir_read(sorted))
    {
      getDeviceType(device);
      dir_draw(0);
      break;
    }
    device = 0;
  }
}

void dir_go_down()
// Scroll down in dir of active pane
{
  // Are there dir entries? And is there a next entry?
  if (presentdir.firstelement && presentdirelement.meta.next)
  {
    present = presentdirelement.meta.next;
    dir_get_element(present);
    presentdir.present = present;
    presentdir.position++;

    // Check if next entry is on a next page. If yes, print next page
    if (presentdir.position > 18)
    {
      presentdir.position = 0;
      presentdir.firstprint = present;
      dir_draw(0);
    }
    else
    {
      // Select next entry
      previous = presentdirelement.meta.prev;
      dir_get_element(previous);
      dir_print_entry(presentdir.position - 1);
      dir_get_element(present);
      dir_print_entry(presentdir.position);
    }
  }
}

void dir_go_up()
// Scroll up in dir of active pane
{
  char count;

  // Are there dir entries? And is there a previous entry?
  if (presentdir.firstelement && presentdirelement.meta.prev)
  {
    present = presentdirelement.meta.prev;
    dir_get_element(present);
    presentdir.present = present;

    // Check if previous entry is on a previous page. If yes, print previous page
    if (!presentdir.position)
    {
      presentdir.position = 18;
      for (count = 0; count < 19; count++)
      {
        if (!presentdirelement.meta.prev)
        {
          break;
        }
        present = presentdirelement.meta.prev;
        dir_get_element(present);
        cwin_putat_string(&cw, 0, 2, "Scrolling up...", cfg.colors.text);
      }
      presentdir.firstprint = present;
      cwin_fill_rect_raw(&cw, 0, 2, 40, 1, SC_SPACE, cfg.colors.text);
      dir_draw(0);
    }
    else
    {
      // Select previous entry
      presentdir.position--;
      next = presentdirelement.meta.next;
      dir_get_element(next);
      dir_print_entry(presentdir.position + 1);
      dir_get_element(present);
      dir_print_entry(presentdir.position);
    }
  }
}

void mainLoopBrowse(void)
{
  char key;
  char done = 0;

  sorted = 0;
  trace = 0;
  depth = 0;
  reuflag = 0;
  addmountflag = 0;
  runmountflag = 0;
  mountflag = 0;
  inside_mount = 0;
  fb_uci_mode = 1;
  fb_selection_made = 2;
  comma1 = 1;
  demomode = 0;

  memset(&presentdir, 0, sizeof(presentdir));
  memset(disk_id_buf, 0, DISK_ID_LEN);

  uii_change_dir_home();
  browse_updatescreen();

  do
  {
    present = presentdir.present;
    if (present)
    {
      dir_get_element(present);
    }

    key = cwin_getch();

    switch (key)
    {
    case CH_CURS_DOWN:
      // Curs Down: Scroll down
      dir_go_down();
      break;

    case CH_CURS_UP:
      // Curs Up: Scroll up
      dir_go_up();
      break;

    case 'q':
    case CH_F7:
      trace = 0;
      done = 1;
      break;

    default:
      break;
    }
  } while (!done);
  //  while (1)
  //  {
  //    current = cwd.selected;
  //    pos = cwd.pos;
  //    lastpage = pos / 19;
  //    yoff = pos - (lastpage * 19);
  //    xpos = 0;
  //    ypos = yoff + 5;
  //
  //    switch (cgetc())
  //    {
  //    case '1':
  //      comma1 = !comma1;
  //      updateMenu();
  //      break;
  //
  //    case 'o':
  //      demomode = !demomode;
  //      updateMenu();
  //      break;
  //
  //    case CH_F1:
  //      readDir(device);
  //      showDir();
  //      break;
  //
  //    case CH_F3:
  //      fb_uci_mode = !fb_uci_mode;
  //      updateMenu();
  //      if (!fb_uci_mode)
  //      {
  //        FindFirstIECDrive();
  //        if (!device)
  //        {
  //          clearArea(0, 3, 24, 22);
  //          cwin_cursor_move(&cw, 0, 3);
  //          cputs("No active IEC drives.\n\r");
  //          cputs("Press key.");
  //          cgetc();
  //          fb_uci_mode = 1;
  //          readDir(device);
  //          showDir();
  //        }
  //      }
  //      else
  //      {
  //        readDir(device);
  //        showDir();
  //      }
  //      break;
  //
  //    case '2':
  //    case CH_F2:
  //    case '+':
  //      if (!fb_uci_mode && device)
  //      {
  //        if (++device > MAXDEVID)
  //        {
  //          device = 8;
  //        }
  //        while (!iec_devices[device - 8])
  //        {
  //          if (++device > MAXDEVID)
  //          {
  //            device = 8;
  //          }
  //        }
  //        if (!devicetype[device])
  //        {
  //          getDeviceType(device);
  //        }
  //        memset(&cwd, 0, sizeof(cwd));
  //        showDir();
  //      }
  //      break;
  //
  //    case '-':
  //      if (!fb_uci_mode && device)
  //      {
  //        if (--device < 8)
  //        {
  //          device = MAXDEVID;
  //        }
  //        while (!iec_devices[device - 8])
  //        {
  //          if (--device < 8)
  //          {
  //            device = MAXDEVID;
  //          }
  //        }
  //        if (!devicetype[device])
  //        {
  //          getDeviceType(device);
  //        }
  //        memset(&cwd, 0, sizeof(cwd));
  //        showDir();
  //      }
  //      break;
  //
  //    case 't':
  //    case CH_HOME:
  //      cwd.selected = cwd.firstelement;
  //      cwd.pos = 0;
  //      printDir();
  //      break;
  //
  //    case 'd':
  //      if (!fb_uci_mode)
  //      {
  //        if (trace == 0)
  //        {
  //          trace = 1;
  //          pathdevice = device;
  //          changeDir(device, NULL);
  //        }
  //        else
  //        {
  //          trace = 0;
  //          depth = 0;
  //        }
  //        showDir();
  //        updateMenu();
  //      }
  //      break;
  //
  //    case 'e':
  //      current = cwd.firstelement;
  //      pos = 0;
  //      while (1)
  //      {
  //        if (current->next != NULL)
  //        {
  //          current = current->next;
  //          pos++;
  //        }
  //        else
  //        {
  //          break;
  //        }
  //      }
  //      cwd.selected = current;
  //      cwd.pos = pos;
  //      printDir();
  //      break;
  //
  //    case 'q':
  //    case CH_F7:
  //      trace = 0;
  //      goto done;
  //
  //    case CH_CURS_DOWN:
  //      if (cwd.selected != NULL && current->next != NULL)
  //      {
  //        current = current->next;
  //        cwd.selected = current;
  //        nextpage = (pos + 1) / 19;
  //        cwd.pos++;
  //        if (lastpage != nextpage)
  //        {
  //          cwd.firstprinted = current;
  //          printDir();
  //        }
  //        else
  //        {
  //          current = current->prev;
  //          printElementPriv(xpos, ypos);
  //          yoff++;
  //          xpos = 0;
  //          ypos = yoff + 5;
  //          current = current->next;
  //          printElementPriv(xpos, ypos);
  //        }
  //      }
  //      break;
  //
  //    case CH_CURS_UP:
  //      if (cwd.selected != NULL && current->prev != NULL)
  //      {
  //        current = current->prev;
  //        cwd.selected = current;
  //        nextpage = (pos - 1) / 19;
  //        cwd.pos--;
  //        if (lastpage != nextpage)
  //        {
  //          for (count = 0; count < 19 - 1; count++)
  //          {
  //            if (current->prev != NULL)
  //            {
  //              current = current->prev;
  //            }
  //          }
  //          cwd.firstprinted = current;
  //          printDir();
  //        }
  //        else
  //        {
  //          current = current->next;
  //          printElementPriv(xpos, ypos);
  //          yoff--;
  //          xpos = 0;
  //          ypos = yoff + 5;
  //          current = current->prev;
  //          printElementPriv(xpos, ypos);
  //        }
  //      }
  //      break;
  //
  //    // --- start / enter directory
  //    case CH_ENTER:
  //    case CH_CURS_RIGHT:
  //      // Executable PRG?
  //      if (!fb_uci_mode && cwd.selected && current->dirent.type == CBM_T_PRG)
  //      {
  //        if (trace == 0 && !fb_uci_mode)
  //        {
  //          execute(current->dirent.name, device, comma1 * EXEC_COMMA1 + demomode * EXEC_DEMO, "");
  //        }
  //        else
  //        {
  //          StringSafeCopy(pathfile, current->dirent.name, 19);
  //          pathrunboot = comma1 * EXEC_COMMA1 + demomode * EXEC_DEMO;
  //          fb_selection_made = 1;
  //          goto done;
  //        }
  //      }
  //      // else change dir
  //      if (cwd.selected)
  //      {
  //        if (trace == 1)
  //        {
  //          StringSafeCopy(path[depth++], current->dirent.name, 19);
  //        }
  //        changeDir(device, current->dirent.name);
  //      }
  //      if (reuflag)
  //      {
  //        fb_selection_made = 1;
  //        goto done;
  //      }
  //      break;
  //
  //    // --- leave directory
  //    case CH_CURS_LEFT:
  //    case CH_DEL:
  //      if (inside_mount && !depth)
  //      {
  //        inside_mount = 0;
  //        fb_uci_mode = 1;
  //        trace = 0;
  //        uii_unmount_disk(imageaid);
  //        imageaid = 0;
  //        uii_disable_drive_a();
  //        refreshDir();
  //        updateMenu();
  //      }
  //      else
  //      {
  //        if (trace == 1 && depth)
  //        {
  //          --depth;
  //        }
  //        if (fb_uci_mode)
  //        {
  //          changeDir(0, "..");
  //        }
  //        else
  //        {
  //          changeDir(device, (devicetype[device] == U64) ? ".." : "\xff");
  //        }
  //      }
  //      break;
  //
  //    // Page down
  //    case 'p':
  //      // Check if not already last item? If no, page down
  //      if (current->next != NULL)
  //      {
  //        cwd.selected = 0;
  //        printElementPriv(xpos, ypos);
  //        for (count = 0; count < 19; count++)
  //        {
  //          if (current->next)
  //          {
  //            current = current->next;
  //            cwd.pos++;
  //            cwd.selected = current;
  //            cwd.firstprinted = current;
  //          }
  //        }
  //        pos = cwd.pos;
  //        yoff = pos - (lastpage * 19);
  //        xpos = 0;
  //        ypos = yoff + 5;
  //        printDir();
  //      }
  //      break;
  //
  //    // Page up
  //    case 'u':
  //      // Check if not already first item? If no, page up
  //      if (current->prev != NULL)
  //      {
  //        cwd.selected = 0;
  //        printElementPriv(xpos, ypos);
  //        for (count = 0; count < 19; count++)
  //        {
  //          if (current->prev)
  //          {
  //            current = current->prev;
  //            cwd.pos--;
  //            cwd.selected = current;
  //            cwd.firstprinted = current;
  //          }
  //        }
  //        pos = cwd.pos;
  //        yoff = pos - (lastpage * 19);
  //        xpos = 0;
  //        ypos = yoff + 5;
  //        printDir();
  //      }
  //      break;
  //
  //    case CH_UARROW:
  //      if (trace == 1)
  //      {
  //        depth = 0;
  //      }
  //      changeDir(device, NULL);
  //      break;
  //
  //    case 'a':
  //      if (fb_uci_mode)
  //      {
  //        CheckMounttype(current->dirent.name);
  //        if (mountflag == 1)
  //        {
  //          if (!uii_parse_deviceinfo())
  //          {
  //            clrscr();
  //            printf("Old Ultimate firmware detected.\n\r");
  //            errorexit();
  //          }
  //          addmountflag = 1;
  //          imageaid = uii_devinfo[0].id;
  //          StringSafeCopy(imageaname, current->dirent.name, 19);
  //          uii_get_path();
  //          StringSafeCopy(imageapath, uii_data, 99);
  //          fb_selection_made = 1;
  //          goto done;
  //        }
  //      }
  //      break;
  //
  //    case 'b':
  //      if (fb_uci_mode)
  //      {
  //        CheckMounttype(current->dirent.name);
  //        if (mountflag == 1)
  //        {
  //          if (!uii_parse_deviceinfo())
  //          {
  //            clrscr();
  //            printf("Old Ultimate firmware detected.\n\r");
  //            errorexit();
  //          }
  //          if (uii_devinfo[1].exist)
  //          {
  //            addmountflag = 2;
  //            imagebid = uii_devinfo[1].id;
  //            StringSafeCopy(imagebname, current->dirent.name, 19);
  //            uii_get_path();
  //            StringSafeCopy(imagebpath, uii_data, 99);
  //            fb_selection_made = 1;
  //            goto done;
  //          }
  //        }
  //      }
  //      break;
  //
  //    case 'm':
  //      if (mountflag == 1 && imageaid)
  //      {
  //        runmountflag = 1;
  //        StringSafeCopy(pathfile, current->dirent.name, 19);
  //        pathrunboot = comma1 * EXEC_COMMA1 + demomode * EXEC_DEMO;
  //        fb_selection_made = 1;
  //        goto done;
  //      }
  //    }
  //  }
  //
  // done:;
}