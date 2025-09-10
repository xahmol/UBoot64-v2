/*****************************************************************
Ultimate 64/II+ Command Library - DOS functions

Based on Ultimate II Dos Lib
Scott Hutter, Francesco Sblendorio
https://github.com/xlar54/ultimateii-dos-lib

Based on ultimate_dos-1.2.docx and command interface.docx
https://github.com/markusC64/1541ultimate2/tree/master/doc

Disclaimer:  Because of the nature of DOS commands, use this code
soley at your own risk.

Patches and pull requests are welcome
******************************************************************/

#ifndef _ULTIMATE_DOS_LIB_H_
#define _ULTIMATE_DOS_LIB_H_

// prototypes

void uii_get_path(void);
void uii_open_dir(void);
void uii_get_dir(void);
void uii_change_dir(char *directory);
void uii_create_dir(char *directory);
void uii_change_dir_home(void);
void uii_mount_disk(char id, char *filename);
void uii_unmount_disk(char id);
void uii_open_file(char attrib, char *filename);
void uii_close_file(void);
void uii_write_file(char *data, unsigned length);
void uii_read_file(unsigned length);
void uii_seek_file(char posL, char posML, char posMH, char posH);
void uii_file_info();
void uii_file_stat(char *filename);
void uii_delete_file(char *filename);
void uii_rename_file(char *oldname, char *newname);
void uii_copy_file(char *source, char *destination);
void uii_get_ramdisk_info(void);
void uii_loadIntoRamDisk(char id, char *filename, char whatif);
void uii_saveRamDisk(char id, char *filename);
void uii_save_reu(char size);
void uii_load_reu(char size);
void uii_get_deviceinfo(void);
char uii_parse_deviceinfo(void);
char *uii_device_tyoe(char typeval);
void uii_enable_drive_a(void);
void uii_disable_drive_a(void);
void uii_enable_drive_b(void);
void uii_disable_drive_b(void);
void uii_get_drive_a_power(void);
void uii_get_drive_b_power(void);

#pragma compile("ultimate_dos_lib.c")

#endif
