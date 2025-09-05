#ifndef DEFINES_H_
#define DEFINES_H_

// Color scheme
#define DC_COLOR_BG COLOR_BLACK
#define DC_COLOR_BORDER COLOR_BLACK
#define DC_COLOR_TEXT COLOR_YELLOW
#define DC_COLOR_HIGHLIGHT COLOR_WHITE
#define DC_COLOR_DIM COLOR_GREEN
#define DC_COLOR_ERROR COLOR_RED
#define DC_COLOR_WARNING COLOR_VIOLET
#define DC_COLOR_EE COLOR_LIGHTBLUE
#define DC_COLOR_GRAY COLOR_GRAY2
#define DC_COLOR_GRAYBRIGHT COLOR_GRAY3
#define DC_COLOR_WAITKEY COLOR_GREEN
#define DMB_COLOR_SELECT COLOR_CYAN
#define DMB_COLOR_HEADER1 COLOR_GREEN
#define DMB_COLOR_HEADER2 COLOR_LIGHTGREEN

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

// height of sceen
#define SCREENH 25
// bottom row on screen
#define BOTTOM (SCREENH-1)

// height of menu frame
#define MENUH SCREENH
// y position of menu frame
#define MENUY 0

// Define highest device ID allowed
#define MAXDEVID 30

// Spite control addresses
#define VIC_SPR2_X      0xD004
#define VIC_SPR2_Y      0xD005
#define VIC_SPR_HI_X    0xD010
#define VIC_SPR_ENA     0xD015
#define VIC_SPR2_COLOR  0xD029

// Global variables
extern BYTE SCREENW;
extern BYTE DIRW;
extern BYTE MENUX; 
extern char path[8][51];
extern char pathfile[51];
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
    char path[256];
    char menu[21];
    char file[51];
    char cmd[80];
    char reu_image[51];
    char reu_path[256];
    BYTE reusize;
    BYTE runboot;
    BYTE device;
    BYTE command;
    BYTE cfgvs;
    char image_a_path[256];
    char image_a_file[51];
    BYTE image_a_id;
    char image_b_path[256];
    char image_b_file[51];
    BYTE image_b_id;
};
extern struct SlotStruct* Slot;
extern struct SlotStruct* FirstSlot;
extern struct SlotStruct* BufferSlot;
extern long secondsfromutc; 
extern unsigned char timeonflag;
extern char host[80];
extern char imagename[51];
extern char reufilepath[256];
extern char imageaname[51];
extern char imageapath[256];
extern unsigned char imageaid;
extern char imagebname[51];
extern char imagebpath[256];
extern unsigned char imagebid;
extern unsigned char reusize;
extern char reusizelist[8][8];
extern unsigned char utilbuffer[86];
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

#endif
