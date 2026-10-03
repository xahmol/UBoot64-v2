#ifndef CONVERT__H
#define CONVERT__H

#pragma compile("convert.c")

void convert_old_files(void);
long reu_read_file(char *dir, char *name, unsigned long addr, unsigned long max);

#endif
