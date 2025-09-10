#ifndef DEFINES_H_
#define DEFINES_H_

#include "c64/vic.h"

// Color scheme
#define COL_HEADER1 VCOL_GREEN
#define COL_HEADER2 VCOL_LT_GREEN
#define COL_TEXT VCOL_YELLOW
#define COL_TEXT_IMPUT VCOL_WHITE
#define COL_KEY VCOL_CYAN
#define COL_DIRITEM_NORMAL VCOL_WHITE
#define COL_DIRITEM_SELECT VCOL_CYAN
#define COL_ERROR VCOL_RED
#define COL_OK VCOL_GREEN

// Screencodes
#define SC_SPACE 0x20
#define SC_REVSPACE 0xa0

// PETSCII character and control codes
#define CH_CURS_UP 145    // Petscii control code for Cursor Up
#define CH_CURS_DOWN 17   // Petscii control code for Cursor Down
#define CH_CURS_LEFT 157  // Petscii control code for Cursor Left
#define CH_CURS_RIGHT 29  // Petscii control code for Cursor Right
#define CH_PI 222         // Petscii control code for Pi
#define CH_HOME 19        // Petscii control code for Home (HOME)
#define CH_CLEAR 147      // Petscii control code for Clear (SHIFT+HOME)
#define CH_DEL 20         // Petscii control code for delete (DEL)
#define CH_INS 148        // Petscii control code for Insert (SHIFT+DEL)
#define CH_ENTER 13       // Petscii control code for enter (RETURN)
#define CH_STOP 3         // Petscii control code for stop (STOP)
#define CH_RUN 10         // Petscii control code for run (SHIFT+STOP)
#define CH_TAB 9          // Petscii control code for tab (TAB)
#define CH_LIRA 92        // Petscii control code for pound sign
#define CH_ESC 27         // Petscii control code for escape (ESC)
#define CH_FONT_LOWER 14  // Petscii control code for lower case font
#define CH_FONT_UPPER 142 // Petscii control code for upper case font
#define CH_ARROW_UP 94    // Petscii control code for arrow up
#define CH_ARROW_LEFT 95  // Petscii control code for arrow left
#define CH_SPACE 32       // Petscii code and Screencode for space
#define CH_MINUS 45       // Screencode for minus
#define CH_BLACK 144      // Petscii control code for black           CTRL-1
#define CH_WHITE 5        // Petscii control code for white           CTRL-2
#define CH_DRED 28        // Petscii control code for dark red        CTRL-3
#define CH_LCYAN 159      // Petscii control code for light cyan      CTRL-4
#define CH_LPURPLE 156    // Petscii control code for light purple    CTRL-5
#define CH_DGREEN 30      // Petscii control code for dark green      CTRL-6
#define CH_DBLUE 31       // Petscii control code for dark blue       CTRL-7
#define CH_LYELLOW 158    // Petscii control code for light yellow    CTRL-8
#define CH_RVSON 18       // Petscii control code for RVS ON          CTRL-9
#define CH_RVSOFF 146     // Petscii control code for RVS OFF         CTRL-0
#define CH_DPURPLE 129    // Petscii control code for dark purple     C=-1
#define CH_DYELLOW 149    // Petscii control code for dark yellow     C=-2
#define CH_LRED 150       // Petscii control code for light red       C=-3
#define CH_DCYAN 151      // Petscii control code for dark cyan       C=-4
#define CH_DGREY 152      // Petscii control code for dark grey       C=-5
#define CH_LGREEN 153     // Petscii control code for light green     C=-6
#define CH_LBLUE 154      // Petscii control code for light blue      C=-7
#define CH_LGREY 155      // Petscii control code for light grey      C=-8
#define CH_F1 133         // Petscii control code for F1
#define CH_F2 137         // Petscii control code for F2
#define CH_F3 134         // Petscii control code for F3
#define CH_F4 138         // Petscii control code for F4
#define CH_F5 135         // Petscii control code for F5
#define CH_F6 139         // Petscii control code for F6
#define CH_F7 136         // Petscii control code for F7
#define CH_F8 140         // Petscii control code for F8

// Command flag values
#define COMMAND_CMD             0x01
#define COMMAND_REU             0x02
#define COMMAND_IMGA            0x04
#define COMMAND_IMGB            0x08

// Execute flag values
#define EXEC_MOUNT              0x01
#define EXEC_COMMA1             0x02
#define EXEC_DEMO               0x10

// Config version and
#define CFGVERSION              0x02

typedef unsigned char BYTE;

#define OK 0
#define ERROR -1
#define ABORT +1

// Define highest device ID allowed
#define MAXDEVID 30

// Define max length of paths and filenames, plus 1 for zero termination
#define MAXPATHLEN 256
#define MAXFILENAME 51

// Min function
#ifndef min
#define min(a,b) ( (a) < (b) ? (a) : (b) )
#endif

// Global variables
extern char path[8][MAXFILENAME];
extern char pathfile[MAXFILENAME];
extern BYTE pathdevice;
extern BYTE pathrunboot;
extern BYTE depth;
extern BYTE trace;
extern BYTE comma1;
extern BYTE demomode;
extern BYTE commandflag;
extern BYTE mountflag;
extern BYTE reuflag;
extern BYTE addmountflag;
extern BYTE runmountflag;
struct SlotStruct {
    BYTE cfgvs;
    char path[MAXPATHLEN];
    char menu[21];
    char file[MAXFILENAME];
    char cmd[80];
    char reu_image[MAXFILENAME];
    char reu_path[MAXPATHLEN];
    BYTE reusize;
    BYTE runboot;
    BYTE device;
    BYTE command;
    char image_a_path[MAXPATHLEN];
    char image_a_file[MAXFILENAME];
    BYTE image_a_id;
    char image_b_path[MAXPATHLEN];
    char image_b_file[MAXFILENAME];
    BYTE image_b_id;
};
extern struct SlotStruct Slot;
extern struct SlotStruct BufferSlot;
struct ConfigStruct {
    char version;
    char timeon;
    char host[80];
    long secondsfromutc;
};
extern struct ConfigStruct cfg;
extern char imagename[MAXFILENAME];
extern char reufilepath[MAXPATHLEN];
extern char imageaname[MAXFILENAME];
extern char imageapath[MAXPATHLEN];
extern unsigned char imageaid;
extern char imagebname[MAXFILENAME];
extern char imagebpath[MAXPATHLEN];
extern unsigned char imagebid;
extern unsigned char reusize;
extern char reusizelist[8][8];
extern char configfilename[11];
extern char slotfilename[11];
extern unsigned char configversion;
extern unsigned char menuselect;
extern unsigned char fb_selection_made;
extern unsigned char fb_uci_mode;
extern unsigned char inside_mount;
extern char iec_devices[23];
extern char configpath[];

// Import from cartridge back to BASIC code
extern char execute_commands[200];
extern char execute_keys[10];
extern unsigned char iec_device;

// Main screen window
extern CharWin cw;

#endif
