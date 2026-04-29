# UBoot64 v2

![Logo](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Logo.png?raw=true)

Boot menu for C64 Ultimate enabled devices — v2 (Oscar64 rebuild)

## Contents

[Version history and download](#version-history-and-download)

[Instructions](#instructions)

- [Prerequisites](#prerequisites)

- [Installation](#installation)

- [Upgrading from v1](#upgrading-from-v1)

- [First run](#first-run)

- [Add start options via the Filebrowser](#add-start-options-via-the-filebrowser)

- [F1: Filebrowse menu](#f1-filebrowse-menu)

- [F2: Information](#f2-information)

- [F3: Edit / re-order / delete](#f3-edit--re-order--delete)

- [F5: Configuration](#f5-configuration)

- [F7: Quit to BASIC](#f7-quit-to-basic)

[Credits](#credits)

![Startup](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Startup.png?raw=true)

![Main menu](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Menu.png?raw=true)

## Version history and download
([Back to contents](#contents))

Version 2.0.0 - 20260428:

- Complete rebuild using the [Oscar64](https://github.com/drmortalwombat/oscar64) cross-compiler (replaces cc65)
- Directory listings stored in REU memory, enabling much larger directory support
- Configurable colour scheme (F5 → F6 in configuration menu)
- Verbose or silent startup option (F5 → F2 in configuration menu)
- Splash screen on startup
- Configuration upgrade tool (`uboot_upd12.prg`) included for users upgrading from v1
- Various stability and bug fixes

Version 0.91 - 20230922:

- First public alpha (v1, cc65 build)

## Instructions

### Prerequisites
([Back to contents](#contents))

* UltimateII+ (U2+) cartridge installed on a real C64, or an Ultimate 64
* Firmware at version 3.4 or higher (to have access to the UCI DRVINFO command — [firmware page](https://ultimate64.com/Firmware))
* **RAM Expansion Unit (REU), minimum 128 KB** — required for directory listing storage and slot data

### Installation
([Back to contents](#contents))

* Download the ZIP file with the latest build

* In the ZIP file you will find these instructions, a `.crt` file (the cartridge image) and a `uboot_upd12.prg` file (configuration upgrade tool for v1 users). Unzip contents to a temporary location.

* Transfer the `.crt` file to the `/Flash/Carts` directory on your Ultimate device. Either transfer via FTP, or place it on the USB storage, browse to it in the UI filebrowser, press **C= + C** to copy, navigate to `/Flash/Carts` and paste with **C= + V**.

![Ultimate UI](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBooy64%20-%20Ultimate%20UI.png?raw=true)

![Ultimate Flash dir](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Flashdir.png?raw=true)

![Ultimate Carts dir](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20carts%20dir.png?raw=true)

* Select the `.crt` file as the cartridge to start automatically: in the Ultimate UI press **F2**, navigate to **C64 and Cartridge Settings**, press **RETURN** twice to edit the **Cartridge** option, and select **uboot64.crt** from the drop-down. Press **STOP** to leave the configuration menu and **RETURN** to confirm saving to flash.

![Ultimate UI cart settings](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20UI%20cart%20settings.png?raw=true)

![Ultimate UI select cart](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20UI%20set%20cart.png?raw=true)

* Power cycle your device. UBoot64 should now start automatically.

* Stop autostarting by deselecting the cartridge via the same procedure and choosing **None** or another image.

### Upgrading from v1
([Back to contents](#contents))

If you have an existing v1 configuration (slot and config files), you must run the upgrade tool before using v2 for the first time. The slot file format changed between v1 and v2.

* Transfer `uboot_upd12.prg` to your USB storage.
* Run `uboot_upd12.prg` from the Ultimate UI or a BASIC prompt before starting UBoot64 v2.
* The tool reads your existing v1 configuration files and rewrites them in the v2 format.
* After the upgrade tool completes successfully, start UBoot64 v2 normally.

**If you do not run the upgrade tool**, UBoot64 v2 will detect the old format and exit with an error asking you to run the upgrade tool first.

### First run
([Back to contents](#contents))

* At first run, no configuration file is present yet, so UBoot64 creates configuration files with an empty start menu and default settings.
* The configuration files are saved in the root directory of the first USB drive found (path `/usb*/`). The files are `DMBCFG.CFG` (configuration data) and `DMBSLT.CFG` (menu slot data).
* On startup a splash screen is shown briefly. Press any key to proceed to the main menu.
* The empty start menu looks like this:

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20menu%20first%20run.png?raw=true)

### Add start options via the Filebrowser

* Start options can be added to menu slots **0–9** and **A–Z** (18 slots total) via the Filebrowser.
* Press **F1** to open the filebrowser:

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20filebrowser.png?raw=true)

* The browser starts in **UCI mode** — browsing via the Ultimate Command Interface on the native filesystem of your Ultimate device.
* Press **F3** to switch to **IEC mode** for drives connected to the IEC bus. Use **+** / **-** to select the device number.
* Press **F1** to refresh the directory if needed.
* In IEC mode, press **D** to start a **directory trace** from the root, needed to record the full path for a menu slot. The TRACE toggle in the lower right switches to ON.

  ![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Toggles%20UCI.png?raw=true)

* **,1 Load** (toggle with **1**): loads with `LOAD"NAME",8` (off) or `LOAD"NAME",8,1` (on).
* **Demo mode** (toggle with **O**): powers down all drives except ID 8 on start.

* Navigate with **cursor keys** (UP/DOWN in dir, ENTER/RIGHT to enter dir or image, DEL/LEFT to go up).
* From UCI mode, entering a disk image (`.Dxx` extension) mounts it on drive A and switches to IEC mode — "Inside mount" appears in the menu.

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20FB%20Inside%20Mount.png?raw=true)

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Toggle%20inside%20mount.png?raw=true)

* Press **ENTER** on a program file to select it for a menu slot. In UCI mode the associated drive A disk image is automatically included.
* Press **A** or **B** on a disk image (`.Dxx`) to select it as the additional image to mount on drive A resp. B when starting from that slot.
* Press **M** on a program file to select it to be run from the disk image already mounted on drive A.
* To add a REU file: navigate to it and press **ENTER**, then select the target slot, choose REU size with **+** / **-**, and confirm with **ENTER**.

**Note:** The REU file must be in the same filepath as the drive A disk image if one is present.

* After selecting what to place in a slot, you are shown this screen to pick the slot position:

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Pick%20slot.png.png?raw=true)

* If the slot is already filled, confirmation is requested. Choose **Y** to proceed or **N** to cancel.
* Press **0–9** or **A–Z** to choose the slot, enter a name and press **ENTER**.
* Repeat until all desired slots are filled.

### F1: Filebrowse menu
([Back to contents](#contents))

The filebrowser is based on and inspired by the DraBrowse program from <https://github.com/doj/dracopy>

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20filebrowser.png?raw=tru)

| Key | Function |
| --- | -------- |
| **F1** | Read / refresh directory |
| **F3** | Toggle between UCI and IEC modes |
| **+** | Increase device number (IEC mode only) |
| **-** | Decrease device number (IEC mode only) |
| **RETURN** | Enter directory / run selected program (IEC mode) / select for slot |
| **CURSOR RIGHT** | Enter directory |
| **DEL** | Go to parent directory |
| **CURSOR LEFT** | Go to parent directory |
| **↑** | Go to root directory |
| **T** | Go to the first item in the directory |
| **E** | Go to the last item in the directory |
| **P** | Page down in the directory |
| **U** | Page up in the directory |
| **Cursor keys** | Navigate in the directory |
| **D** | Toggle Dirtrace (IEC mode only): traces directory movements from root |
| **A** | Select highlighted image (`.Dxx`) to be mounted on drive A |
| **B** | Select highlighted image (`.Dxx`) to be mounted on drive B |
| **M** | Select highlighted program to run from the disk image on drive A |
| **1** | Toggle ,1 load |
| **O** | Toggle demo mode |
| **Q** or **F7** | Quit to main menu |

### F2: Information
([Back to contents](#contents))

Shows the information and credits screen. Press any key to return to the main menu.

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Info.png?raw=true)

### F3: Edit / re-order / delete
([Back to contents](#contents))

Rename, re-order, edit commands for, or delete menu slots.

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Edit%20menu.png?raw=true)

* **F1** — Rename a slot. Choose slot (**0–9** / **A–Z**), enter new name, press **ENTER**.

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20rename.png?raw=true)

* **F2** — Add or edit a user-defined BASIC command to execute before the program starts.

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20command.png?raw=true)

* **F3** — Re-order slots. Choose slot to move (**0–9** / **A–Z**), highlighted in white. Press **UP** / **DOWN** to move. Confirm with **ENTER**, cancel with **F7**.

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20reorder.png?raw=true)

* **F5** — Delete a slot. Choose slot (**0–9** / **A–Z**), confirm with **Y** or cancel with **N**.

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20Delete.png?raw=true)

* **F7** — Return to main menu. Changes are saved at this point.

### F5: Configuration
([Back to contents](#contents))

Configure NTP time synchronisation, startup verbosity, and the UI colour scheme.

After pressing **F5**:

![](https://github.com/xahmol/UBoot64/blob/main/Screenshots/UBoot64%20-%20NTP%20menu.png?raw=true)

The screen shows current settings and allows editing:

* **F1** — Toggle NTP time sync on or off. Default: enabled.

* **F2** — Toggle verbose or silent startup. Verbose shows detailed feedback during startup; silent shows only a progress indicator. Default: verbose.

* **F3** — Edit the time offset to UTC in seconds. Automated daylight saving adjustment is not provided; adjust manually when needed. Examples: CET = 3600, CEST = 7200. See <https://www.timeanddate.com/time/zones/> for all offsets (multiply hours by 3600). Default: 0 (UTC).

* **F5** — Edit the NTP server hostname. Default: `pool.ntp.org`.

* **F6** — Edit the UI colour scheme. Use **CURSOR UP** / **DOWN** to select a colour element, **CURSOR LEFT** / **RIGHT** to change its colour value (0–15). **DEL** reverts to the saved colours. **F7** returns to the configuration menu. Changes are saved when you exit the configuration menu.

* **F7** — Return to main menu. Changes are saved.

### F7: Quit to BASIC
([Back to contents](#contents))

Exit the boot menu to the BASIC Ready prompt. Memory is erased on exit.

## Credits

### UBoot64 v2

Boot menu for C64 Ultimate enabled devices

Written in 2023 (v1), 2026 (v2) by Xander Mol
https://github.com/xahmol/UBoot64-v2
https://www.idreamtin8bits.com/

Inspired by and code used from DraBrowse:
DraBrowse (db*) is a simple file browser.
Originally created 2009 by Sascha Bader.
Used version adapted by Dirk Jagdmann (doj)
https://github.com/doj/dracopy

Most of code and functionality ported from:
DMBoot 128:
Device Manager Boot Menu for the Commodore 128
Written in 2020-2023 by Xander Mol
https://github.com/xahmol/DMBoot

Built using:
- Oscar64 cross-compiler by drmortalwombat
  https://github.com/drmortalwombat/oscar64

Additionally uses code from:
- Ultimate 64/II+ Command Library
  Scott Hutter, Francesco Sblendorio
  https://github.com/xlar54/ultimateii-dos-lib
- ntp2ultimate by MaxPlap
  https://github.com/MaxPlap/ntp2ultimate
  Time via NTP code
- EPOCH-to-time-date-converter by sidsingh78
  https://github.com/sidsingh78/EPOCH-to-time-date-converter/blob/master/epoch_conv.c
- petcom version 1.00 by Craig Bruce, 18-May-1995
  Convert from PETSCII to ASCII, or vice-versa.
  https://codebase64.org/doku.php?id=source_conversion

Requires and made possible by the Ultimate II+ cartridge,
Created by Gideon Zweijtzer
https://ultimate64.com/

Licensed under the GNU General Public License v3.0

The code can be used freely as long as you retain
a notice describing original source and author.

THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL,
BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!
