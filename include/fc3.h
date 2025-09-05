#ifndef FC3_H
#define FC3_H

#define fc3	(*(volatile char *)0xdfff)

#pragma compile("fc3.c")

void fc3_bank(char bank);
void fc3_call(char bank, void (*func)());

#endif

