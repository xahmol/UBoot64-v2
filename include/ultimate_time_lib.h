/*****************************************************************
Ultimate 64/II+ Command Library - DOS functions

Based on Ultimate II Dos Lib
Scott Hutter, Francesco Sblendorio
https://github.com/xlar54/ultimateii-dos-lib

Based on ultimate_dos-1.2.docx and command interface.docx
https://github.com/markusC64/1541ultimate2/tree/master/doc

Disclaimer:  Because of the nature of DOS commands, use this code
solely at your own risk.

Patches and pull requests are welcome
******************************************************************/

#ifndef _ULTIMATE_TIME_LIB_H_
#define _ULTIMATE_TIME_LIB_H_

// prototypes
void uii_get_time(void);      // Read current time from Ultimate RTC into uii_data
void uii_set_time(char*);     // Set Ultimate RTC time from formatted string

#pragma compile("ultimate_time_lib.c")

#endif
