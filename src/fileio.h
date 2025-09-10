#ifndef FILEIO__H
#define FILEIO__H

#include "defines.h"

void std_write(char * filename,unsigned char verbose);
void std_read(char * filename,unsigned char verbose);
void writeconfigfile();
void readconfigfile();

#pragma compile("fileio.c")

#endif