/*****************************************************************
Ultimate 64/II+ Command Library - SoftIEC target functions

Commands of the SoftIEC command target ($05), firmware 3.15 and later.
Wire formats taken from the released firmware (GideonZ/1541ultimate,
v3.15a, software/io/command_interface/softiec_target.cc).

uii_add_partition() (also SoftIEC target) stays in ultimate_common_lib.

CAUTION for load/save: the firmware transfers the data to or from C64/C128
memory itself, by DMA. On a C128 DMA is only reliable while the CPU runs at
1 MHz, and it reaches bank 0 RAM.

Disclaimer:  Because of the nature of DOS commands, use this code
solely at your own risk.
******************************************************************/

#ifndef _ULTIMATE_SOFTIEC_LIB_H_
#define _ULTIMATE_SOFTIEC_LIB_H_

// Maximum number of data bytes in one uii_softiec_chkout call
#define UII_SOFTIEC_CHKOUT_MAX  255

// uii_softiec_load_execute(): bit set in the result flag on a verify error
#define UII_SOFTIEC_VERIFY_ERROR 0x80

// Special secondary address groups for uii_softiec_chkout (bits 4-7)
#define UII_SOFTIEC_SA_OPEN     0xf0    // Data is a file name: open
#define UII_SOFTIEC_SA_CLOSE    0xe0    // Close the channel

void uii_softiec_identify(void);
unsigned uii_softiec_load_setup(char sa, char verify, unsigned loadaddr, const char *name);
unsigned uii_softiec_load_execute(char sa, char verify, char *flag);
void uii_softiec_save(char sa, char verify, unsigned start, unsigned end, const char *name);
void uii_softiec_open(char sa, const char *name);
void uii_softiec_close(char sa);
void uii_softiec_chkout(char sa, const char *data, unsigned length);
void uii_softiec_chkin(char sa);
void uii_softiec_get_fatname(char channel, const char *iecname);
void uii_softiec_get_iecname(const char *fatname);

#pragma compile("ultimate_softiec_lib.c")

#endif
