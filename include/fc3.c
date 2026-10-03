#include "fc3.h"
#include "petscii.h"

// Switching code generation to bank 0 common routine section
#pragma code(fc3code)
#pragma data(fc3data)

char execute_commands[200];
char execute_keys[10];
// Program from an Ultimate path: in bank 0's data (RAM from $0900),
// initialized so they are not in bss. fc3_exit() reads all of them before
// the REU transfer, which may overwrite that RAM; the resident fc3data at
// $C000 has no room for them.
#pragma data(data)
char uciprg_go = 0;
char uciprg_dma[7] = {0};
// The last part of the start, copied to the cassette buffer at $033C and
// run there, so the program may cover all RAM from $0800 up, this routine
// at $C000 and the I/O area included: with $01 = $34 (all RAM) the armed
// REU transfer is started by a write to $FF00, then I/O comes back, the
// end-of-program pointers are set (bytes 14 and 20, patched by
// src/uciprg.c), BASIC is relinked (byte 25: $20 JSR, or $2C BIT as a
// no-op for a program not at $0801) and READY. is printed.
char uciprg_stub[31] = {
    0x78,             // sei
    0xa9, 0x34,       // lda #$34
    0x85, 0x01,       // sta $01        all RAM
    0x8d, 0x00, 0xff, // sta $ff00      start the REU transfer
    0xa9, 0x37,       // lda #$37
    0x85, 0x01,       // sta $01        I/O, BASIC and Kernal back
    0x58,             // cli
    0xa9, 0x00,       // lda #<end      (operand: byte 14)
    0x85, 0x2d,       // sta $2d        VARTAB
    0x85, 0xae,       // sta $ae
    0xa9, 0x00,       // lda #>end      (operand: byte 20)
    0x85, 0x2e,       // sta $2e
    0x85, 0xaf,       // sta $af
    0x20, 0x33, 0xa5, // jsr $a533      LINKPRG (25: or $2c, bit)
    0x4c, 0x74, 0xa4  // jmp $a474      READY.
};
#pragma data(fc3data)
char bootmsg[11] = {13, 'u', 'b', 'o', 'o', 't', '6', '4', '.', 13, 0};

void fc3_bank(char bank)
// Function to switch the active bank of the FC3
// Input: bank - The bank number to switch to
{
    fc3 = bank & 0x40;
}

void fc3_call(char bank, void (*func)())
// Function for FC3 indirect cross bank call
// Input:   bank - The bank number where the function resides
//          func - Pointer to the function to call
{
    fc3 = bank;
    func();
}

void fc3_exit(void)
// Function to exit from FC3 back to BASIC
{
    cwin_put_string(&cw, "Exit routine", cfg.colors.text);
	cwin_cursor_newline(&cw);

    __asm
    {
	    sei			// Stop interrupts

	    // Bank out cartridge
	    lda #$70	// Bitmask to switch cartridge ROM out
	    sta $DFFF	// Set banking register to bank out cart

	    // Modified kernal reset
	    ldx #$FF	// Load stack value	
	    txs			// Move to stack
	    ldx #$05	// Load value for VIC init
	    stx $D016	// VIC init NTSC / PAL check
	    jsr $FDB3	// Init CIA
	    jsr	$FF84	// Prepare IRQ
	
	    // Init memory
	    lda #$00
        tay
fc3exit_loop1:
	    // Wipe first 3 pages
	    sta $0002,Y
        sta $0200,Y
        sta $0300,Y
        iny
        bne fc3exit_loop1

	    // Set Start of Tape Buffer pointer
        ldx #$3c
        ldy #$03
        stx $B2
        sty $B3

	    // Set IO Start address and OS end of memory pointer
        ldx #$00
        ldy #$A0
        stx $C1
        stx $0283
        sty $C2
        sty $0284

	    // Set OS Start of memory and screen memory
        lda #$08
        sta $0282
        lda #$04
        sta $0288

	    // Continue modified kernal reset
	    jsr $FD15	// Init I/O
	    jsr $FF5B	// Init video
	    lda #$00	// Clear start of BASIC area - load 0
	    sta $0800	// Clear first byte
	    sta $0801	// Clear second byte
	    sta $0802	// Clear third byte

	    cli			// Restore interrupts

	    // Modified BASIC cold start
	    jsr $E453	// Initialise BASIC vectors
	    jsr $E3BF	// Set BASIC vectors
	    jsr $E422	// Print start message and init memory pointers
	    ldx #$FB
	    txs


	    // Clear keyboard buffer
	    lda #$00
        sta $C6     // $C6 = KEY_COUNT Number of keys in input buffer

	    // Print commands to execute
	    sec
        jsr $FFF0    // PLOT: C64 Kernal routine at $FFF0
        txa
        pha
        tya
        pha
        ldx #$00
fc3exit_loop2:
        lda execute_commands,x
        beq fc3exit_next1
        jsr $FFD2    // CHROUT: C64 Kernal routine to output character in A
        inx
        bne fc3exit_loop2

fc3exit_next1:
	    ldx #$00
fc3exit_loop3:
	    lda execute_keys,x
        beq fc3exit_next2
        sta $0277,x     // $0277 = KEY_BUF Keyboard buffer
        inc $C6         // $C6 = KEY_COUNT Number of keys in input buffer
        inx
        bne fc3exit_loop3
fc3exit_next2:
        pla
        tay
        pla
        tax
        clc
        jsr $FFF0    // PLOT: C64 Kernal routine at $FFF0

	    // Program from an Ultimate path: the slot boot loaded it into the
	    // REU. Now that BASIC is set up and the commands are on screen and
	    // in the keyboard buffer, arm the REU transfer and finish from the
	    // stub in the cassette buffer (see uciprg_stub), since the program
	    // may overwrite this routine and the I/O area.
	    lda uciprg_go
	    beq fc3exit_noprg
	    ldx #$06
fc3exit_dma:
	    lda uciprg_dma,x
	    sta $DF02,x	// REU: C64 address, REU address, length
	    dex
	    bpl fc3exit_dma
	    lda #$00
	    sta $DF0A	// Both addresses count up
	    ldx #30
fc3exit_stub:
	    lda uciprg_stub,x
	    sta $033C,x
	    dex
	    bpl fc3exit_stub
	    lda #$81	// Execute on a write to $FF00, REU -> C64
	    sta $DF01
	    jmp $033C
fc3exit_noprg:

	    // Print adapted READY prompt.
	    lda #<bootmsg
        ldy #>bootmsg
        jmp $a478       // jump into BASIC
    };
}