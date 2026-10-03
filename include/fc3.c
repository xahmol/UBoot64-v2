#include "fc3.h"
#include "petscii.h"

// Switching code generation to bank 0 common routine section
#pragma code(fc3code)
#pragma data(fc3data)

char execute_commands[200];
char execute_keys[10];
// Initialized, so they are in fc3data (resident at $C000), not in bss:
// the copy can overwrite bss
char uciprg_go = 0;
char uciprg_dma[7] = {0};
unsigned uciprg_end = 0;
char uciprg_link = 0;
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
	    // REU; copy it into place now that BASIC is set up and the commands
	    // are on screen and in the keyboard buffer (execute_commands is in
	    // bss, which the copy may overwrite), then set the end-of-program
	    // pointers (and relink a BASIC program) as LOAD does
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
	    lda #$91	// Execute now, REU -> C64
	    sta $DF01
	    lda uciprg_end
	    sta $2D		// VARTAB: end of the program
	    sta $AE
	    lda uciprg_end+1
	    sta $2E
	    sta $AF
	    lda uciprg_link
	    beq fc3exit_noprg
	    jsr $A533	// LINKPRG: relink the BASIC lines
fc3exit_noprg:

	    // Print adapted READY prompt.
	    lda #<bootmsg
        ldy #>bootmsg
        jmp $a478       // jump into BASIC
    };
}