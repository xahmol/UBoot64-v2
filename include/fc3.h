#ifndef FC3_H
#define FC3_H

#define fc3	(*(volatile char *)0xdfff)

// Global variables
extern char execute_commands[200];
extern char execute_keys[10];

// Program from an Ultimate path (UCI mode slots): set by the slot boot
// before fc3_exit(), which then copies the program from the REU into C64
// memory after the BASIC cold start. uciprg_dma is written as-is to the
// REU registers $DF02-$DF08: C64 address (2), REU address (3), length (2).
extern char uciprg_go;
extern char uciprg_dma[7];
extern unsigned uciprg_end;
extern char uciprg_link;

// Function prototypes
void fc3_bank(char bank);
void fc3_call(char bank, void (*func)());
void fc3_exit(void);

#pragma compile("fc3.c")

#endif

