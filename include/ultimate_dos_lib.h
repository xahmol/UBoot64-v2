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

#ifndef _ULTIMATE_DOS_LIB_H_
#define _ULTIMATE_DOS_LIB_H_

// prototypes

void uii_get_path(void);               // Read current UCI filesystem path into uii_data
void uii_open_dir(void);               // Open current directory for streaming via uii_get_dir
void uii_get_dir(void);                // Stream directory entries; call uii_readdata per entry
void uii_change_dir(char *directory);  // Change to named directory (or ".." / "/" for root)
void uii_create_dir(char *directory);  // Create a new directory
void uii_change_dir_home(void);        // Navigate to UCI home directory (USB root)
void uii_mount_disk(char id, char *filename);        // Mount disk image on IEC drive id
void uii_unmount_disk(char id);                      // Unmount disk image from IEC drive id
void uii_swap_disk(void);                            // Swap drives A and B
void uii_open_file(char attrib, char *filename);     // Open file; attrib: 0x01=read, 0x06=write
void uii_close_file(void);                           // Close currently open file
void uii_write_file(char *data, unsigned length);    // Write up to DATA_QUEUE_SZ bytes to open file
void uii_read_file(unsigned length);                 // Request up to length bytes from open file
void uii_seek_file(char posL, char posML, char posMH, char posH); // Seek to 4-byte file position
void uii_file_info();                                // Get info on currently open file
void uii_file_stat(char *filename);                  // Get file attributes by name
void uii_delete_file(char *filename);                // Delete named file
void uii_rename_file(char *oldname, char *newname);  // Rename a file
void uii_copy_file(char *source, char *destination); // Copy a file
void uii_get_ramdisk_info(void);                     // Get RAM disk metadata
void uii_loadIntoRamDisk(char id, char *filename, char whatif); // Load file into RAM disk
void uii_saveRamDisk(char id, char *filename);       // Save RAM disk to file
void uii_save_reu(char size);                        // Save REU to file at current path; size index selects REU size
void uii_load_reu(char size);                        // Load REU from file at current path; size index selects REU size
void uii_get_deviceinfo(void);                       // Populate uii_devinfo[] with drive state
char uii_parse_deviceinfo(void);                     // Returns 1 if device info was parsed successfully
char *uii_device_type(char typeval);                 // Return drive type string for typeval
void uii_reboot(void);                               // Reboot the Ultimate device
void uii_get_hwinfo(char device);                    // Get hardware info for device
void uii_enable_drive_a(void);                       // Power on Ultimate emulated drive A
void uii_disable_drive_a(void);                      // Power off Ultimate emulated drive A
void uii_enable_drive_b(void);                       // Power on Ultimate emulated drive B
void uii_disable_drive_b(void);                      // Power off Ultimate emulated drive B
void uii_get_drive_a_power(void);                    // Read drive A power state into uii_data
void uii_get_drive_b_power(void);                    // Read drive B power state into uii_data

#pragma compile("ultimate_dos_lib.c")

#endif
