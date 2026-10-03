// UBoot64 v2:
// Boot menu for C64 Ultimate enabled devices
// Written in 2023 (v1), 2026 (v2) by Xander Mol
// https://github.com/xahmol/UBoot64-v2
// https://www.idreamtin8bits.com/
//
// Slots that start a program from an Ultimate path (UCI mode, slot flag
// COMMAND_UCIPRG): the file is loaded into the REU here, and fc3_exit()
// (include/fc3.c, resident at $C000) copies it into C64 memory after the
// BASIC cold start, then RUN is typed. Without a drive or the IEC bus, so
// on every Ultimate. Cartridge bank 3, called from runbootfrommenu()
// (bank 1) with fc3_callret().
//
// The code can be used freely as long as you retain
// a notice describing original source and author.
//
// THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL,
// BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!

#include <c64/charwin.h>
#include <petscii.h> // charmap: string literals in PETSCII, as in the other modules
#include <stdio.h>
#include <string.h>
#include "defines.h"
#include "fc3.h"
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"
#include "core.h"
#include "uciprg.h"
#include "convert.h"

#pragma code(bcode3)
#pragma data(bdata3)

extern int reudetected;
void DoDemoMode();


static char uciprg_fail(const char *msg)
// Report why a UCI-mode program can't be started; waits for a key
// Output: 0
{
    cwin_console_printf(&cw, cfg.colors.error, "%s\n", msg);
    cwin_console_printf(&cw, cfg.colors.text, "Status: %s\nPress a key.", uii_status);
    cwin_getch();
    return 0;
}

static char uciprg_stage(void)
// Load the slot's program (Slot.path + Slot.file, an Ultimate path in
// ASCII) into the REU, and set the parameters for fc3_exit(), which copies
// it into C64 memory after the BASIC cold start. Staged in the last 64 KB
// of the REU, so a REU preload image of the slot (loaded before this)
// stays intact unless it fills the whole REU. Loaded at $0801 as a plain
// LOAD would, or at its own address with ",1"; it must not overlap the
// resident exit routine at $C000-$C0FF.
// Output: 1 = staged, 0 = error (reported)
{
    long lsize;
    unsigned long size;
    unsigned long reuaddr;
    unsigned dest;
    unsigned len;
    char header[2];

    if (reudetected < 2)
    {
        return uciprg_fail("Needs a REU of 128 KB or more.");
    }
    reuaddr = ((unsigned long)reudetected << 16) - 0x10000UL;
    if ((Slot.command & COMMAND_REU) && (0x20000UL << Slot.reusize) > reuaddr)
    {
        return uciprg_fail("The REU image fills the REU:\nno room to load the program.");
    }

    // Through the UCI into the REU (reu_read_file(), src/convert.c): a
    // program is at most 64 KB plus its 2-byte load address
    asc2pet_path(linebuffer, Slot.file, sizeof(linebuffer)); // ASCII name
    cwin_console_printf(&cw, cfg.colors.text, "Loading %s.\n", linebuffer);
    lsize = reu_read_file(Slot.path, Slot.file, reuaddr, 0x10001UL);
    if (lsize < 0)
    {
        return uciprg_fail("Program not found or too large.");
    }
    size = (unsigned long)lsize;
    if (size < 3)
    {
        return uciprg_fail("Not a program file (size).");
    }

    uboot_reu_load(reuaddr, header, 2);
    dest = (Slot.runboot & EXEC_COMMA1) ? (header[0] | ((unsigned)header[1] << 8)) : 0x0801;
    len = (unsigned)(size - 2);
    if ((unsigned long)dest + len > 0x10000UL)
    {
        return uciprg_fail("Program doesn't fit in memory.");
    }
    if (dest < 0xc100 && dest + len > 0xc000)
    {
        return uciprg_fail("Program overlaps $C000-$C0FF,\nwhich UBoot64 needs to start it.");
    }

    uciprg_dma[0] = dest & 0xff;
    uciprg_dma[1] = dest >> 8;
    uciprg_dma[2] = (reuaddr + 2) & 0xff;
    uciprg_dma[3] = ((reuaddr + 2) >> 8) & 0xff;
    uciprg_dma[4] = ((reuaddr + 2) >> 16) & 0xff;
    uciprg_dma[5] = len & 0xff;
    uciprg_dma[6] = len >> 8;
    uciprg_end = dest + len;
    uciprg_link = (dest == 0x0801);
    uciprg_go = 1;
    return 1;
}

static void uciprg_execute(void)
// Start the staged program: as execute() for a drive, but instead of
// typing LOAD, fc3_exit() copies the program from the REU; then RUN is
// typed (the slot's own BASIC command first, if any)
{
    unsigned pos = 2;
    char numberenter = 2;
    char x;

    if (Slot.runboot & EXEC_DEMO)
    {
        DoDemoMode();
    }
    execute_commands[0] = 0x0d;
    execute_commands[1] = 0x0d;
    if (Slot.cmd[0])
    {
        strncpy(execute_commands + pos, Slot.cmd, 80);
        pos += strlen(Slot.cmd);
        execute_commands[pos++] = 0x0d;
        numberenter++;
    }
    sprintf(execute_commands + pos, "run%c", 0);
    for (x = 0; x < numberenter; x++)
    {
        execute_keys[x] = 0x0d;
    }
    execute_keys[x] = 0;
    fc3_exit();
}

void uciprg_boot(void)
// Start the slot's program from its Ultimate path. Returns only on an
// error (reported; the caller goes back to the menu).
{
    if (uciprg_stage())
    {
        uciprg_execute();
    }
}
