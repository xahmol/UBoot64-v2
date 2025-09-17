#ifndef CORE__H
#define CORE__H

#include "defines.h"

// Function prototypes
void errorexit(const char *msg);
void delay(char seconds);
void mid(const char *src, char start, char length, char *dst, char dstlen);
char *pathconcat();
char getkey(char mask);
void cwin_putat_string_reverse(CharWin *win, char x, char y, const char *str, char color);
void headertext(const char *subtitle, char time);
void spinning(char posx, char posy, char cont);
char iec_present(char id);
char CheckIfUltimateOnID(char id);
char CheckActiveIECdevices();
char cmd(const char device, const char *cmd);
const char *getDeviceType(const char device);
void execute(char *prg, char device, char boot, char *command);
signed textInput(char xpos, char ypos, char width, char *str, char size, char validation);

/// if you change this enum, also change the "drivetype" array in ops.c
enum drive_e {NONE=0, PI1541, D1540, D1541, D1551, D1570, D1571, D1581, D1001, D2031, D8040, SD2IEC, CMD, VICE, U64, LAST_DRIVE_E};

extern char devicetype[];
extern const char* drivetype[];
extern char linebuffer[100];
extern char device;
extern char linebuffer2[100];

extern const char *value2hex;
extern const char *reg_types[];
extern const char *oth_types[];
extern char bad_type[4];

#pragma compile("core.c")

#endif
