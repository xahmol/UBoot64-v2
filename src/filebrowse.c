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

// Bank 2: file browser — reads IEC or UCI directories into a doubly-linked list stored in REU
// (REU addresses act as pointers: next/prev fields hold the raw REU byte address of each node).
// Handles drive switching, dir navigation, disk image mounting, and slot selection from browse.
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

// Firmware 3.15+ SoftIEC partition list entry (see iec_read_partitions())
#define MAXPARTITIONS_LIST 16
#define PARTITION_PATH_DISPLAY_LEN 40
struct PartitionEntry
{
  char number;
  char path[PARTITION_PATH_DISPLAY_LEN];
};

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

// SoftIEC partition-list browsing state (firmware 3.15+, U64 devices only)
char showing_partitions; // 1 while the virtual partition-list view is displayed
char partition_depth;    // how many real subfolders deep into the current partition

// Buffers for full paths
char pathbuffer[256];

// Directory reader Functions
void dir_close(char lfn)
// Close a directory opened for reading
// Input: lfn = logical file number
{
  // Reset channels
  krnio_clrchn();

  // Close file
  krnio_close(lfn);
}

char dir_open(char lfn, unsigned char device, const char *name)
// Open a directory (or, with name "$=P", a partition listing) for reading
// Input: lfn = logical file number
//        device = device number
//        name = directory name to open, usually "$"
{
  char status = 0;
  char error = 0;

  // Set name for directory
  krnio_setnam(name);

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

  // Return error code or 0 on success
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

  // Read first link byte — zero means end of directory
  b = krnio_chrin();
  if (!b)
  {
    return 1;
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

  // Find stripped length by scanning backwards for last non-whitespace char.
  // Written as a plain while+break to avoid an Oscar64 for/continue miscompilation
  // that zeroes the entire buffer before type detection can run.
  len = i;
  while (len > 0)
  {
    b = linebuffer[len - 1];
    if (b != 0 && b != ' ' && b != 0xA0)
    {
      break;
    }
    len--;
  }

  // parse file name

  // skip until first "
  for (i = 0; i < sizeof(linebuffer) && linebuffer[i] != '"'; ++i)
  {
    // do nothing
  }

  // copy filename, until " or max size (MAXFILENAME-1, leaving room for the
  // null terminator -- was hardcoded to the classic 16-char 1541 disk-name
  // limit, which silently truncated longer real SD-card folder/file names
  // and broke exact-name matching such as the hidden_names[] filter below)
  b = 0;
  for (++i; i < MAXFILENAME && linebuffer[i] != '"' && b < MAXFILENAME - 1; ++i)
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
    for (b = 1; b < 16; ++b)
    {
      if (l_dirent->name[16 - b] == 0 ||
          l_dirent->name[16 - b] == ' ' ||
          l_dirent->name[16 - b] == 0xA0)
      {
        l_dirent->name[16 - b] = 0;
      }
    }
    return 0;
  }

  // parse read-only
  l_dirent->meta.access = (linebuffer[i - 4] == 0x3C) ? CBM_A_RO : CBM_A_RW;

  return 0;
}

char iec_read_partitions(char device, struct PartitionEntry *out, char maxcount)
// Read the list of SoftIEC partitions via the classic "$=P" directory
// listing (firmware 3.15+; see cbmdos_parser.cc's parse_open() and
// iec_channel.cc's read_dir_entry() in github.com/GideonZ/1541ultimate).
// Uppercase P is required: parse_open() does an exact case-sensitive
// buf[2]=='P' check, lowercase 'p' falls through to a normal, empty
// directory listing instead of the partition stream. petscii.h's global
// charmap (included project-wide) inverts letter case in string literals,
// so this needs an identity-charmap override -- see oscar64manual.md's
// "petscii.h charmap is global" section.
// Each entry's quoted "filename" is the partition's root path. The 16-bit
// "size" field is the partition number as-is (NOT times 254): firmware's
// read_dir_entry() (e_partlist branch) sets info.size = part_idx*254, but
// then the SAME block-count conversion applied to every dir entry --
// size=(info.size+253)/254 -- runs on partition entries too and divides
// that *254 straight back out before it ever reaches the wire.
// Input: device - device number
//        out - array to fill with found partitions
//        maxcount - capacity of out
// Output: number of partitions found, 0 on failure
{
  char count = 0;
  char b, i;
  char first = 1;
  unsigned size;

#pragma charmap(97, 97, 26)  // a-z -> a-z (identity)
#pragma charmap(65, 65, 26)  // A-Z -> A-Z (identity)
  static const char partition_open_name[] = "$=P";
#pragma charmap(97, 65, 26)  // restore petscii.h
#pragma charmap(65, 97, 26)

  if (dir_open(2, device, partition_open_name))
  {
    return 0;
  }

  while (count < maxcount)
  {
    // Read first link byte -- zero means end of listing
    b = krnio_chrin();
    if (!b)
    {
      break;
    }
    krnio_chrin(); // skip second link byte

    size = krnio_chrin();
    size |= (krnio_chrin()) << 8;

    // read line into linebuffer, same convention as dir_readentry_iec()
    memset(linebuffer, 0, sizeof(linebuffer));
    i = 0;
    while (1)
    {
      b = krnio_chrin();
      if (b == 0)
      {
        break;
      }
      if (i < sizeof(linebuffer))
      {
        linebuffer[i++] = b;
      }
    }

    // Like any classic "$" listing, setup_partition_read() always emits a
    // fake disk-header line first (not a real partition) -- skip it
    // unconditionally, it's a fixed firmware structural detail, not
    // something to detect heuristically.
    if (first)
    {
      first = 0;
      continue;
    }

    // The listing also always ends with a "BLOCKS FREE." line once
    // read_dir_entry() runs out of partitions -- same sentinel
    // dir_readentry_iec() already checks for real directory listings.
    if (linebuffer[0] == 'b')
    {
      break;
    }

    // skip until first quote, then copy until closing quote or buffer limit
    for (i = 0; i < sizeof(linebuffer) && linebuffer[i] != '"'; ++i)
    {
      ;
    }
    b = 0;
    for (++i; i < sizeof(linebuffer) && linebuffer[i] != '"' && b < PARTITION_PATH_DISPLAY_LEN - 1; ++i)
    {
      out[count].path[b++] = linebuffer[i];
    }
    out[count].path[b] = 0;
    out[count].number = size;
    count++;
  }

  dir_close(2);
  return count;
}

char dir_read_partition_list(char device)
// Populate the REU-backed directory list with a synthetic "virtual
// directory" of the SoftIEC partitions on this device, one per entry, so
// the existing browse/select/draw machinery (dir_draw(), CH_ENTER, cursor
// navigation) works on it unmodified. Each entry's name is the partition's
// root path; its meta.size carries the partition number through selection
// (char is unsigned by default in Oscar64, so 254 fits -- see
// oscar64manual.md's type table).
// Input: device - device number
// Output: 1 if the list was populated (even if empty), 0 if the partition
//         listing itself could not be read
{
  struct PartitionEntry parts[MAXPARTITIONS_LIST];
  char found;
  char idx;
  char namelen;

  presentdir.address = SLOT_REU_START + (SLOTS * sizeof(Slot));
  present = presentdir.address;
  presentdir.firstelement = 0;
  presentdir.firstprint = 0;
  presentdir.lastprint = 0;
  presentdir.position = 0;
  presentdir.present = 0;
  strcpy(presentdir.path, "Partitions");

  found = iec_read_partitions(device, parts, MAXPARTITIONS_LIST);
  if (!found)
  {
    return 0;
  }

  previous = 0;
  for (idx = 0; idx < found; idx++)
  {
    namelen = strlen(parts[idx].path);
    if (namelen >= MAXFILENAME)
    {
      namelen = MAXFILENAME - 1;
    }
    memcpy(presentdirelement.name, parts[idx].path, namelen);
    presentdirelement.name[namelen] = 0;
    presentdirelement.meta.type = CBM_T_DIR;
    presentdirelement.meta.size = parts[idx].number;
    presentdirelement.meta.select = 0;
    presentdirelement.meta.length = namelen + 1;

    if (!previous)
    {
      presentdir.firstelement = present;
      presentdir.firstprint = present;
      presentdirelement.meta.prev = 0;
      previous = present;
      presentdirelement.meta.next = 0;
    }
    else
    {
      presentdirelement.meta.prev = previous;
      reu_store(previous, (volatile char *)&present, sizeof(present));
      previous = present;
      presentdirelement.meta.next = 0;
    }

    reu_store(presentdir.address, (volatile char *)&presentdirelement.meta, sizeof(presentdirelement.meta));
    presentdir.address += sizeof(presentdirelement.meta);
    reu_store(presentdir.address, (volatile char *)presentdirelement.name, presentdirelement.meta.length);
    presentdir.address += presentdirelement.meta.length;
    present = presentdir.address;
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
  unsigned long element;
  unsigned long prevaddr;
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

  // Open dir dependent on IEC or UCI mode
  if (!fb_uci_mode)
  {
    strcpy(presentdir.path, "");
    if (dir_open(2, device, "$"))
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
        unsigned char namelen = strlen(presentdirelement.name);
        presentdir.path[namelen] = ',';
        memcpy(&presentdir.path[namelen + 1], disk_id_buf, DISK_ID_LEN);
        presentdir.path[namelen + 1 + DISK_ID_LEN] = 0;
        presentdir.path[20] = 0; // Ensure path is always null-terminated at max length
      }
      else
      {
        strcpy(presentdir.path, "Unknown type");
      }
      continue; // header is not stored in the listing; keep reading file entries
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

    // Link new entry into the REU-backed list.
    // `present` and `previous` are raw REU byte addresses used as pointers.
    if (!previous)
    {
      // First entry: initialize list head
      presentdir.firstelement = present;
      presentdir.firstprint = present;
      presentdirelement.meta.prev = 0;
      previous = present;
      presentdirelement.meta.next = 0;
    }
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
            prevaddr = bufferdir.meta.prev;
            if (!prevaddr)
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
              presentdirelement.meta.prev = prevaddr;
              presentdirelement.meta.next = element;
              bufferdir.meta.prev = present;
              reu_store(element, (volatile char *)&bufferdir.meta, sizeof(bufferdir.meta));
              reu_load(prevaddr, (volatile char *)&bufferdir.meta, sizeof(bufferdir.meta));
              bufferdir.meta.next = present;
              reu_store(prevaddr, (volatile char *)&bufferdir.meta, sizeof(bufferdir.meta));
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
    cwin_console_printf(&cw, cfg.colors.text, "[%02i] %s", device, presentdir.path);
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
      strncpy(pathbuffer, pathconcat(), 255);
    }
    pathbuffer[255] = 0;

    length = strlen(pathbuffer);
    if (length > 24)
    {
      strcpy(linebuffer2, pathbuffer + length - 24);
    }
    else
    {
      strcpy(linebuffer2, pathbuffer);
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
    namebuffer[16] = 0;

    // Get file type to string
    strcpy(linebuffer2, (char *)fileTypeToStr(presentdirelement.meta.type));

    // if blocks are >= 10000 shorten the file type to 2 characters (name no
    // longer gets clamped to exactly 16 at read time, so use >= instead of
    // == to still catch names that fill or exceed the display column)
    if (presentdirelement.meta.size >= 10000 && strlen(presentdirelement.name) >= 16)
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
  unsigned long nextaddr;

  // Read directory contents
  if (readdir)
  {
    dir_read(sorted);
    presentdir.present = presentdir.firstprint;
  }

  // Print header after dir_read() so it reflects the newly read directory path
  dir_print_id_and_path();

  // Read firstprint into local so the zero-check uses a plain variable
  element = presentdir.firstprint;

  // Print no data if no valid entries in dir are found
  if (!element)
  {
    cwin_putat_string(&cw, 0, 5, "Empty directory.", cfg.colors.error);
  }
  // Print entries until area is filled or last item is reached
  else
  {
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
      nextaddr = presentdirelement.meta.next;
      if (!nextaddr)
      {
        break;
      }
      element = nextaddr;

    } while (printpos < 19);
    present = presentdir.present;
  }
}

#pragma optimize(push)
#pragma optimize(0)
void browse_menu(void)
// Draw the key-reference side panel; also shows current UCI/IEC, trace, comma1, and demo state
{
  char menuy = 3;

  cwin_fill_rect_raw(&cw, 25, 3, 15, 22, SC_SPACE, cfg.colors.text);

  cwin_putat_string(&cw, 26, menuy, " F1 Dir refr.", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, " F3 UCI or IEC", cfg.colors.text);
  if (!fb_uci_mode)
  {
    cwin_putat_string(&cw, 26, ++menuy, " F4 Partitions", cfg.colors.text);
    cwin_putat_string(&cw, 26, ++menuy, "+/- Device", cfg.colors.text);
  }
  cwin_putat_string(&cw, 26, ++menuy, "RET Run/Select", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "DEL Dir up", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "  \x5e Root dir", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "  T Top", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "  E End", cfg.colors.text);
  cwin_putat_string(&cw, 26, ++menuy, "P/U Page do/up", cfg.colors.text);
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
#pragma optimize(pop)

char dir_changedir(char *dirname)
// Navigate into dirname (or "" for root); handles UCI and IEC, disk image mounting, REU selection
// Returns 0 on success, non-zero on failure
{
  char ret;
  char l = strlen(dirname);
  // "Go up one directory" is expressed as one of three sentinels depending
  // on the caller: ".." (U64's old own convention), "\xff" (generic
  // CBM-DOS/CMD/SD2IEC convention), or a lone CH_LARROW byte (selecting a
  // ".." entry from the directory listing). Firmware 3.15+'s rewritten
  // SoftIEC command parser (cbmdos_parser.cc) wants a bare "cd_" for this,
  // not a colon-prefixed name or "..": see retry below.
  char is_updir = (strcmp(dirname, "..") == 0) || (l == 1 && (dirname[0] == CH_LARROW || (unsigned char)dirname[0] == 0xff));

  //sprintf(linebuffer, "Root. %u", l);
  //cwin_putat_string(&cw, 0, 24, linebuffer, cfg.colors.text);
  //cwin_getch();

  if (l)
  {
    CheckMounttype(dirname);

    if (mountflag == 2 && (trace == 1 || fb_uci_mode))
    {
      reuflag = 1;
      strncpy(imagename, dirname, MAXFILENAME);
      imagename[MAXFILENAME - 1] = 0;
      if (fb_uci_mode)
      {
        uii_get_path();
        strncpy(imagebpath, AscToPet(uii_data), MAXPATHLEN);
        imagebpath[MAXPATHLEN - 1] = 0; // Ensure null termination
      }
      else
      {
        strncpy(imageapath, pathconcat(), MAXPATHLEN);
        imageapath[MAXPATHLEN - 1] = 0; // Ensure null termination
      }
    }
    if (fb_uci_mode && !inside_mount)
    {
      if (mountflag == 1)
      {

        if (!uii_parse_deviceinfo())
        {
          cwin_clear(&cw);
          errorexit("Old Ultimate firmware detected.");
        }

        imageaid = uii_devinfo[0].id;
        device = imageaid;
        strncpy(imageaname, dirname, MAXFILENAME);
        imageaname[MAXFILENAME - 1] = 0;

        if (!uii_devinfo[0].power)
        {
          uii_enable_drive_a();
          delay(2);
        }
        getDeviceType(device);

        uii_mount_disk(imageaid, dirname);
        delay(2);

        uii_get_path();
        strncpy(imageapath, uii_data, MAXPATHLEN);
        imageapath[MAXPATHLEN - 1] = 0; // Ensure null termination
        if (!UII_SUCCESS)
        {
          return 1;
        }
        trace = 1;
        inside_mount = 1;
        fb_uci_mode = 0;
        depth = 0;
        dir_draw(1);
        browse_menu();
      }
      else
      {
        uii_change_dir(dirname);
      }
    }
    else
    {
      if (mountflag == 1 || (l == 1 && dirname[0] == CH_LARROW) ||
          devicetype[device] == VICE || devicetype[device] == U64)
      {
        sprintf(linebuffer, "cd:%s", dirname);
      }
      else
      {
        sprintf(linebuffer, "cd/%s/", dirname);
      }
    }
  }
  else
  {
    if (fb_uci_mode)
    {
      uii_change_dir((char *)"/");
    }
    else
    {
      strcpy(linebuffer, "cd//");
    }
  }
  if (fb_uci_mode)
  {
    ret = (UII_SUCCESS) ? 0 : 1;
  }
  else
  {
    ret = cmd(device, linebuffer);

    // Firmware 3.15+ may no longer accept U64's old own "go up" convention.
    // Retry once with the SD2IEC-style bare underscore if today's default
    // failed; stateless (no persistent flag) so older firmware, where the
    // first attempt already succeeds, pays no extra cost.
    if (ret && is_updir && devicetype[device] == U64)
    {
      strcpy(linebuffer, "cd_");
      ret = cmd(device, linebuffer);
    }
  }
  if (ret == 0)
  {
    dir_draw(1);
  }
  return ret;
}

void browse_updatescreen()
// Clear screen, draw header, side menu, and refresh directory listing
{
  cwin_clear(&cw);
  headertext("Filebrowser", 1);
  browse_menu();
  dir_draw(1);
}

void FindFirstIECDrive()
// Scan IEC devices 8-MAXDEVID and open the first active one for directory listing
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
  unsigned long nextaddr;

  // Are there dir entries? And is there a next entry?
  nextaddr = presentdirelement.meta.next;
  if (presentdir.firstelement && nextaddr)
  {
    present = nextaddr;
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
  unsigned long prevaddr;
  char count;

  // Are there dir entries? And is there a previous entry?
  prevaddr = presentdirelement.meta.prev;
  if (presentdir.firstelement && prevaddr)
  {
    present = prevaddr;
    dir_get_element(present);
    presentdir.present = present;

    // Check if previous entry is on a previous page. If yes, print previous page
    if (!presentdir.position)
    {
      presentdir.position = 18;
      for (count = 0; count < 19; count++)
      {
        prevaddr = presentdirelement.meta.prev;
        if (!prevaddr)
        {
          break;
        }
        present = prevaddr;
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

void dir_last_of_page()
// Go to last entry in present page
{
  unsigned long element;
  unsigned long nextaddr;
  unsigned char count;
  unsigned char position = 0;
  unsigned char oldpos = presentdir.position;

  // Are there dir entries?
  if (presentdir.firstelement)
  {
    // Find last of page
    element = presentdir.firstprint;
    dir_get_element(element);
    for (count = 0; count < 18; count++)
    {
      nextaddr = presentdirelement.meta.next;
      if (!nextaddr)
      {
        break;
      }
      position++;
      element = nextaddr;
      dir_get_element(element);
    }

    // Set new variables and print old and new entries in correct colour
    presentdir.position = position;
    dir_get_element(present);
    dir_print_entry(oldpos);
    presentdir.present = element;
    present = element;
    dir_get_element(present);
    dir_print_entry(position);
  }
}

void dir_pagedown()
// Page down in dir of active pane
{
  unsigned long element;
  unsigned long nextaddr;
  unsigned char count;

  // Are there dir entries?
  if (presentdir.firstelement)
  {
    element = presentdir.lastprint;
    dir_get_element(element);

    // Is there a next page?
    nextaddr = presentdirelement.meta.next;
    if (nextaddr)
    {
      dir_get_element(present);
      // Search how long next page is
      for (count = 0; count < 19; count++)
      {
        nextaddr = presentdirelement.meta.next;
        if (!nextaddr)
        {
          break;
        }
        present = nextaddr;
        dir_get_element(present);
      }

      // Set new firstprint and present
      presentdir.firstprint = present;
      presentdir.present = present;
      presentdir.position = 0;

      // Print new page
      dir_draw(0);
    }
    else
    {
      // Go to bottom
      dir_last_of_page();
    }
  }
}

void dir_pageup()
// Page up in dir of active pane
{
  unsigned long prevaddr;
  unsigned char count;

  // Are there dir entries?
  prevaddr = presentdirelement.meta.prev;
  if (presentdir.firstelement && prevaddr)
  {
    // Search how long previous page is
    for (count = 0; count < 19; count++)
    {
      prevaddr = presentdirelement.meta.prev;
      if (!prevaddr)
      {
        break;
      }
      present = prevaddr;
      dir_get_element(present);
    }

    // Set new firstprint and present
    presentdir.firstprint = present;
    presentdir.present = present;
    presentdir.position = 0;

    // Print new page
    dir_draw(0);
  }
}

void dir_top()
// Go to top of dir in active pane
{
  // Are there dir entries?
  if (presentdir.firstelement)
  {
    // Set present to first element and print new page
    present = presentdir.firstelement;
    dir_get_element(present);
    presentdir.present = present;
    presentdir.position = 0;
    presentdir.firstprint = present;
    dir_draw(0);
  }
}

void dir_bottom()
// Go to bottom of dir in active pane
{
  unsigned long nextaddr;
  unsigned long prevaddr;
  unsigned char count; // backward loop counter

  // Are there dir entries? And is there a next dir entry
  nextaddr = presentdirelement.meta.next;
  if (presentdir.firstelement && nextaddr)
  {
    // Check if not already at bottom page
    present = presentdir.lastprint;
    dir_get_element(present);
    nextaddr = presentdirelement.meta.next;
    if (!nextaddr)
    {
      dir_last_of_page();
      return;
    }

    // Find last element
    while (1)
    {
      dir_get_element(present);
      nextaddr = presentdirelement.meta.next;
      if (!nextaddr)
      {
        break;
      }
      present = nextaddr;
    }

    // Go back one page minus one element
    presentdir.present = present;
    presentdir.position = 18;
    for (count = 0; count < 18; count++)
    {
      prevaddr = presentdirelement.meta.prev;
      if (!prevaddr)
      {
        break;
      }
      present = prevaddr;
      dir_get_element(present);
    }
    presentdir.firstprint = present;

    // Print new page
    dir_draw(0);
  }
}

void mainLoopBrowse(void)
// Main file browser event loop — starts in UCI mode; sets fb_selection_made and global path vars on exit
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
    case '1':
      comma1 = !comma1;
      browse_menu();
      break;

    case 'o':
      demomode = !demomode;
      browse_menu();
      break;

    case 'd':
      if (!fb_uci_mode)
      {
        if (trace == 0)
        {
          trace = 1;
          pathdevice = device;
          dir_changedir((char *)"");
        }
        else
        {
          trace = 0;
          depth = 0;
        }
        dir_draw(1);
        browse_menu();
      }
      break;

    // Page down
    case 'p':
      // Check if not already last item? If no, page down
      dir_pagedown();
      break;

    // Page up
    case 'u':
      // Check if not already first item? If no, page up
      dir_pageup();
      break;

    case CH_F1:
      dir_draw(1);
      break;

    case '2':
    case CH_F2:
    case '+':
      if (!fb_uci_mode && device)
      {
        if (++device > MAXDEVID)
        {
          device = 8;
        }
        while (!iec_devices[device - 8])
        {
          if (++device > MAXDEVID)
          {
            device = 8;
          }
        }
        if (!devicetype[device])
        {
          getDeviceType(device);
        }
        showing_partitions = 0;
        partition_depth = 0;
        memset(&presentdir, 0, sizeof(presentdir));
        dir_draw(1);
      }
      break;

    case '-':
      if (!fb_uci_mode && device)
      {
        if (--device < 8)
        {
          device = MAXDEVID;
        }
        while (!iec_devices[device - 8])
        {
          if (--device < 8)
          {
            device = MAXDEVID;
          }
        }
        if (!devicetype[device])
        {
          getDeviceType(device);
        }
        showing_partitions = 0;
        partition_depth = 0;
        memset(&presentdir, 0, sizeof(presentdir));
        dir_draw(1);
      }
      break;

    case CH_F3:
      fb_uci_mode = !fb_uci_mode;
      trace = 0;
      depth = 0;
      if (inside_mount)
      {
        inside_mount = 0;
        uii_unmount_disk(imageaid);
        imageaid = 0;
        uii_disable_drive_a();
        delay(2);
      }
      browse_menu();
      if (!fb_uci_mode)
      {
        FindFirstIECDrive();
        if (!device)
        {
          cwin_fill_rect_raw(&cw, 0, 3, 24, 22, SC_SPACE, cfg.colors.text);
          cwin_cursor_move(&cw, 0, 3);
          cwin_console_printf(&cw, cfg.colors.error, "No active IEC drives.\n\r");
          cwin_console_printf(&cw, cfg.colors.text, "Press key.");
          cwin_getch();
          fb_uci_mode = 1;
          dir_draw(1);
        }
        else if (cfg.iec_root_partition && devicetype[device] == U64 && !currentpartition)
        {
          // Check first whether the reserved partition number is already in
          // use for something other than what we'd set it to -- if so, the
          // user configured it themselves for their own purpose, so leave
          // it alone entirely rather than silently overwriting it.
          struct PartitionEntry parts[MAXPARTITIONS_LIST];
          char found = iec_read_partitions(device, parts, MAXPARTITIONS_LIST);
          char idx;
          char conflict = 0;

          for (idx = 0; idx < found; idx++)
          {
            if (parts[idx].number == RESERVED_ROOT_PARTITION && strcmp(parts[idx].path, "/") != 0)
            {
              conflict = 1;
              break;
            }
          }

          if (conflict)
          {
            cwin_fill_rect_raw(&cw, 0, 3, 24, 22, SC_SPACE, cfg.colors.text);
            cwin_cursor_move(&cw, 0, 3);
            cwin_console_printf(&cw, cfg.colors.error, "Partition %u already in use for\nsomething else -- root partition\nauto-config skipped.\n\r", RESERVED_ROOT_PARTITION);
            cwin_console_printf(&cw, cfg.colors.text, "Press key.");
            cwin_getch();
            dir_draw(1);
          }
          else
          {
            // Auto-provision (or idempotently re-point) a reserved
            // partition at the filesystem root, once per session. Never
            // touches any other partition number, so anything the user
            // configured themselves via the Ultimate's own menu is left
            // untouched.
            uii_add_partition(RESERVED_ROOT_PARTITION, "UBOOT", "/");
            currentpartition = RESERVED_ROOT_PARTITION;
            iec_select_partition(device, currentpartition);
            memset(&presentdir, 0, sizeof(presentdir));
            dir_read(sorted);
            dir_draw(1);
          }
        }
      }
      else
      {
        dir_draw(1);
      }
      break;

    case CH_F4:
      // Show the classic DOS "$=P" partition list (SoftIEC on firmware
      // 3.15+, but also SD2IEC/CMD-HD-style devices which use the same
      // convention) -- only meaningful in IEC mode. Not gated to a specific
      // devicetype: "U64" matched more than just the SoftIEC drive, and
      // devices that don't support partitions simply return none (see the
      // error branch below). Selecting an entry from it (CH_ENTER) switches
      // partition; DEL at a partition's own root returns to this list (see
      // CH_DEL below).
      if (!fb_uci_mode)
      {
        if (dir_read_partition_list(device))
        {
          showing_partitions = 1;
          partition_depth = 0;
          dir_draw(0); // NOT dir_draw(1) -- that would re-run dir_read() and stomp our list
          browse_menu();
        }
        else
        {
          cwin_fill_rect_raw(&cw, 0, 3, 24, 22, SC_SPACE, cfg.colors.text);
          cwin_cursor_move(&cw, 0, 3);
          cwin_console_printf(&cw, cfg.colors.error, "Could not read partition list.\n\r");
          cwin_console_printf(&cw, cfg.colors.text, "Press key.");
          cwin_getch();
          dir_draw(1);
        }
      }
      break;

    case CH_CURS_DOWN:
      // Curs Down: Scroll down
      dir_go_down();
      break;

    case CH_CURS_UP:
      // Curs Up: Scroll up
      dir_go_up();
      break;

    case 't':
    case CH_HOME:
      dir_top();
      break;

    case 'e':
      dir_bottom();
      break;

    case CH_UARROW:
      if (trace == 1)
      {
        depth = 0;
      }
      if (!fb_uci_mode)
      {
        partition_depth = 0;
      }
      dir_changedir((char *)"");
      break;

    case 'a':
      if (fb_uci_mode)
      {
        CheckMounttype(presentdirelement.name);
        if (mountflag == 1)
        {
          if (!uii_parse_deviceinfo())
          {
            cwin_clear(&cw);
            errorexit("Old Ultimate firmware detected.");
          }
          addmountflag = 1;
          imageaid = uii_devinfo[0].id;
          strncpy(imageaname, presentdirelement.name, MAXFILENAME);
          imageaname[MAXFILENAME - 1] = 0;
          uii_get_path();
          strncpy(imageapath, uii_data, MAXPATHLEN);
          imageapath[MAXPATHLEN - 1] = 0;
          fb_selection_made = 1;
          done = 1;
        }
      }
      break;

    case 'b':
      if (fb_uci_mode)
      {
        CheckMounttype(presentdirelement.name);
        if (mountflag == 1)
        {
          if (!uii_parse_deviceinfo())
          {
            cwin_clear(&cw);
            errorexit("Old Ultimate firmware detected.");
          }
          addmountflag = 2;
          imagebid = uii_devinfo[1].id;
          strncpy(imagebname, presentdirelement.name, MAXFILENAME);
          imagebname[MAXFILENAME - 1] = 0;
          uii_get_path();
          strncpy(imagebpath, uii_data, MAXPATHLEN);
          imagebpath[MAXPATHLEN - 1] = 0;
          fb_selection_made = 1;
          done = 1;
        }
      }
      break;

    case 'm':
      if (mountflag == 1 && imageaid)
      {
        runmountflag = 1;
        strncpy(pathfile, presentdirelement.name, MAXFILENAME);
        pathfile[MAXFILENAME - 1] = 0;
        pathrunboot = comma1 * EXEC_COMMA1 + demomode * EXEC_DEMO;
        fb_selection_made = 1;
        done = 1;
      }
      break;

    // --- start / enter directory
    case CH_ENTER:
    case CH_CURS_RIGHT:
      // Selecting an entry from the virtual SoftIEC partition list (F4)?
      if (showing_partitions)
      {
        if (presentdir.firstelement)
        {
          char chosen = presentdirelement.meta.size;
          iec_select_partition(device, chosen);
          currentpartition = chosen;
          showing_partitions = 0;
          partition_depth = 0;
          depth = 0; // discard any stale dirtrace breadcrumb from a different partition
          dir_read(sorted);
          dir_draw(0);
          browse_menu();
        }
        break;
      }
      // Executable PRG?
      if (!fb_uci_mode && presentdir.firstelement && presentdirelement.meta.type == CBM_T_PRG)
      {
        if (trace == 0)
        {
          execute(presentdirelement.name, device, comma1 * EXEC_COMMA1 + demomode * EXEC_DEMO, (char *)"");
        }
        else
        {
          strncpy(pathfile, presentdirelement.name, MAXFILENAME);
          pathfile[MAXFILENAME - 1] = 0;
          pathrunboot = comma1 * EXEC_COMMA1 + demomode * EXEC_DEMO;
          fb_selection_made = 1;
          done = 1;
          break;
        }
      }
      // else change dir
      if (presentdir.firstelement)
      {
        if (trace == 1)
        {
          strncpy(path[depth], presentdirelement.name, MAXFILENAME);
          path[depth][MAXFILENAME - 1] = 0;
          depth++;
        }
        if (!fb_uci_mode)
        {
          partition_depth++;
        }
        dir_changedir(presentdirelement.name);
      }
      if (reuflag)
      {
        fb_selection_made = 1;
        done = 1;
      }
      break;

    // --- leave directory
    case CH_CURS_LEFT:
    case CH_DEL:
      if (showing_partitions)
      {
        // nothing above the partition list
      }
      else if (inside_mount && !depth)
      {
        inside_mount = 0;
        fb_uci_mode = 1;
        trace = 0;
        uii_unmount_disk(imageaid);
        imageaid = 0;
        uii_disable_drive_a();
        delay(2);
        dir_draw(1);
        browse_menu();
      }
      else if (!fb_uci_mode && !inside_mount && !partition_depth)
      {
        // At a partition's own root -- go back to the partition list instead
        // of sending a DOS "go up" command. Not gated to a specific
        // devicetype (see the CH_F4 comment above); a device without
        // partitions just returns none here.
        if (dir_read_partition_list(device))
        {
          showing_partitions = 1;
          dir_draw(0);
          browse_menu();
        }
      }
      else
      {
        if (trace == 1 && depth)
        {
          --depth;
        }
        if (!fb_uci_mode && partition_depth)
        {
          --partition_depth;
        }
        if (fb_uci_mode)
        {
          dir_changedir((char *)"..");
        }
        else
        {
          dir_changedir((devicetype[device] == U64) ? (char *)".." : (char *)"\xff");
        }
      }
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
}