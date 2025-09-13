#ifndef FILEIO__H
#define FILEIO__H

#include "defines.h"

void get_slot_from_reu(char number);
void save_slot_to_reu(char number);
void write_slotsfile(char verbose);
void read_slotsfile(unsigned char verbose);
void writeconfigfile();
void readconfigfile();

#pragma compile("fileio.c")

#endif