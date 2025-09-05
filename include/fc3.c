#include "fc3.h"

// Switching code generation to bank 0 common routine section
#pragma code(code)
#pragma data(data)

// Function to switch the active bank of the FC3
// Input: bank - The bank number to switch to
void fc3_bank(char bank)
{
    fc3 = bank;
}

// Function for FC3 indirect cross bank call
// Input:   bank - The bank number where the function resides
//          func - Pointer to the function to call
void fc3_call(char bank, void (*func)())
{
    fc3 = bank;
    func();
}