#ifndef FC3_H
#define FC3_H

#define fc3	(*(volatile char *)0xdfff)

// Global variables
extern char execute_commands[200];
extern char execute_keys[10];

// Function prototypes
void fc3_bank(char bank);
void fc3_call(char bank, void (*func)());
void fc3_exit(void);

#pragma compile("fc3.c")

#endif

