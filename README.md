# UBoot64 v2

![Logo](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Logo.png?raw=true)

Boot menu for C64 Ultimate enabled devices — v2 (Oscar64 rebuild)

## Contents

[Version history and download](#version-history-and-download)

[Building from source](#building-from-source)

[Instructions](#instructions)

- [Prerequisites](#prerequisites)

- [Installation](#installation)

- [Upgrading from v1](#upgrading-from-v1)

- [First run](#first-run)

- [Add start options via the Filebrowser](#add-start-options-via-the-filebrowser)

- [F1: Filebrowse menu](#f1-filebrowse-menu)

- [F2: Information](#f2-information)

- [F3: Edit / re-order / delete](#f3-edit--re-order--delete)

- [Default boot slot and auto-boot timeout](#default-boot-slot-and-auto-boot-timeout)

- [F5: Configuration](#f5-configuration)

- [F7: Quit to BASIC](#f7-quit-to-basic)

[Credits](#credits)

![Splash](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Splash.png?raw=true)

![Startup](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Startup.png?raw=true)

![Main menu](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Menu.png?raw=true)

## Version history and download
([Back to contents](#contents))

Link to latest build:

[Latest build](https://github.com/xahmol/UBoot64-v2/releases/latest)

Version 2.1.1 - 20260719:

- Configuration and slot files can now live on an SD card as well as USB storage. On startup, UBoot64 looks in this order: SD, USB0, USB1, USB2, and uses the first location where files already exist; a fresh install creates them on the first of those that's actually present, in the same order. Previously only a single USB drive was checked, and an SD-only setup would fail to start.
- The v1-to-v2 upgrade tool (`uboot_upd12.prg`) uses the same search order, so an upgrade always lands on the same device the cartridge will look for it on.

Version 2.1.0 - 20260719:

- Default boot slot with configurable auto-boot timeout. Set a slot as default in the Edit/Re-order/Delete menu (F6), set the timeout in the Configuration menu (F4, Off/1/3/5/10 sec). If configured, the boot menu shows a countdown screen before the normal menu; any keypress cancels it, letting the timeout expire boots the default slot automatically.
- Menu slots can now hold just a disk mount and/or a BASIC command, with no program to launch — useful for "auto-mount a disk on power-on" style slots. Create one via the Filebrowser's **A**/**B** mount actions, or via **F2** (Edit command) on an empty slot in the edit menu.
- Adding a drive A image to a slot that already launches a program now warns first, since it replaces the disk the program expects to boot from.
- Fixed: auto-boot could hang in an endless loop when the default slot was at a letter position (A–H).
- Fixed: startup could fail to detect an installed REU (worked around a code generation issue in the current Oscar64 compiler).
- Fixed: the filebrowser's side status panel could show garbled/misplaced text under certain UCI mode and mount-state combinations (same underlying compiler issue).
- Various other stability and bug fixes.

Version 2.0.1 - 202604230

- Fix for freeze at startup (error in cartridge init code)

Version 2.0.0 - 20260429:

- Complete rebuild using the [Oscar64](https://github.com/drmortalwombat/oscar64) cross-compiler (replaces cc65)
- Directory listings stored in REU memory, enabling:
  - much larger directory support
  - long filename support: maximum filename size now 50
  - long pathname support: maximum pathsize now 255. NB: The maximum is for the complete path, not for every directoryname in the path separately.
- Configurable colour scheme (F5 → F6 in configuration menu)
- Verbose or silent startup option (F5 → F2 in configuration menu)
- Splash screen in Information menu
- Configuration upgrade tool (`uboot_upd12.prg`) included for users upgrading from v1
- Various stability and bug fixes

Version 0.91 - 20230922:

- First public alpha (v1, cc65 build)

## Building from source
([Back to contents](#contents))

### Build tooling

| Tool | Purpose | Install |
| --- | --- | --- |
| [Oscar64](https://github.com/drmortalwombat/oscar64) | C cross-compiler targeting the 6502 | Build from source; see the Oscar64 repo for instructions |
| `zip` | Bundles the release ZIP | `sudo apt install zip` |
| `wput` | FTP upload for `make deploy` | `sudo apt install wput` |
| `curl` | Reachability check before deploy | `sudo apt install curl` |
| `pandoc` | Regenerates `README.pdf` from `README.md` (optional — `make all` warns and skips if absent) | `sudo apt install pandoc texlive-xetex` |

### Deployment configuration

`make deploy` uploads the built cartridge and upgrade tool straight to your Ultimate device over FTP. The device IP is kept out of git in a local `.env` file:

```
# .env  (gitignored, never committed)
ULTIP1 = 192.168.1.xx
```

Optionally override the USB slot (defaults to `usb0`):

```
ULTUSB = usb1
```

### Make targets

| Target | Effect |
| --- | --- |
| `make all` | Builds `uboot64.crt`, `uboot_upd12.prg`, regenerates `README.pdf`, and bundles the release ZIP — all into `build/` |
| `make clean` | Removes everything in `build/` |
| `make docs` | Regenerates `README.pdf` only |
| `make check-deploy` | Pings the configured Ultimate device without deploying |
| `make deploy` | Rebuilds if needed, then uploads `uboot64.crt` and `uboot_upd12.prg` via FTP (requires `.env`) |

## Instructions

### Prerequisites
([Back to contents](#contents))

* UltimateII+ (U2+) cartridge installed on a real C64, or an Ultimate 64 / Commodore 64 Ultimate
* For Gideon's Logic products: Firmware at version 3.4 or higher (to have access to the UCI DRVINFO command — [firmware page](https://ultimate64.com/Firmware))
* For Commodore Ultimate products: Supported starting from initial firmware
* RAM Expansion Unit (REU), minimum 128 KB, needs to be enabled
* Ultimate Command Interface needs to be enabled
* USB storage (up to 3 drives) or an SD card, for the configuration files

### Installation
([Back to contents](#contents))

* Download the ZIP file with the latest build

* In the ZIP file you will find these instructions, a `.crt` file (the cartridge image) and a `uboot_upd12.prg` file (configuration upgrade tool for v1 users). Unzip contents to a temporary location.

* Transfer the `.crt` file to the `/Flash/Carts` directory on your Ultimate device. Either transfer via FTP, or place it on the USB storage, browse to it in the UI filebrowser, press **C= + C** to copy, navigate to `/Flash/Carts` and paste with **C= + V**.

![Ultimate UI](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBooy64%20-%20Ultimate%20UI.png?raw=true)

![Ultimate Flash dir](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Flashdir.png?raw=true)

![Ultimate Carts dir](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20carts%20dir.png?raw=true)

* Select the `.crt` file as the cartridge to start automatically: in the Ultimate UI press **F2**, navigate to **Cartridge and ROM Settings**, press **RETURN** twice to edit the **Cartridge** option, and select **uboot64.crt** from the drop-down.

![Ultimate UI cart settings](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20UI%20cart%20settings.png?raw=true)

![Ultimate UI select cart](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20UI%20set%20cart.png?raw=true)

* In the same **Cartridge and ROM Settings** menu, ensure that RAM Expansion Memory (REU) is enabled. Size does not matter as even the smallest possible size of 128KB will be sufficient.

![Ultimate UI enable REU](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20UI%20set%20REU.png?raw=true)

* In the same **Cartridge and ROM Settings** menu, ensure that the Ultimate Command Interface is enabled.

![Ultimate UI enable UCI](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20UI%20enable%20UCI.png?raw=true)

* Press **STOP** to leave the configuration menu and **RETURN** to confirm saving to flash.

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
* UBoot64 looks for existing configuration files in this order: SD card, then USB0, USB1, USB2. The first one where they're found is used; if none have them, they're created on the first of those that's actually present (same order). The files are `DMBCFG.CFG` (configuration data) and `DMBSLT.CFG` (menu slot data), always at the root of that device.
* On startup a splash screen is shown briefly. Press any key to proceed to the main menu.
* The empty start menu looks like this:

![Empty boot menu on first run](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20menu%20first%20run.png?raw=true)

### Add start options via the Filebrowser

* Start options can be added to menu slots **0–9** and **A–Z** (18 slots total) via the Filebrowser.
* Press **F1** to open the filebrowser:

![File browser in UCI mode](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20filebrowser.png?raw=true)

* The browser starts in **UCI mode** — browsing via the Ultimate Command Interface on the native filesystem of your Ultimate device.
* Press **F3** to switch to **IEC mode** for drives connected to the IEC bus. Use **+** / **-** to select the device number.

![File browser in IEC mode](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20filebrowser%20IEC.png?raw=true)

![File browser status toggles panel in UCI mode](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Toggles%20UCI.png?raw=true)

* Press **F1** to refresh the directory if needed.
* In IEC mode, press **D** to start a **directory trace** from the root, needed to record the full path for a menu slot. The TRACE toggle in the lower right switches to ON.

![Status toggles panel with directory trace enabled](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Toggles%20%20dirtrace.png?raw=true)

* **,1 Load** (toggle with **1**): loads with `LOAD"NAME",8` (off) or `LOAD"NAME",8,1` (on).
* **Demo mode** (toggle with **O**): powers down all drives except ID 8 on start.

* Navigate with **cursor keys** (UP/DOWN in dir, ENTER/RIGHT to enter dir or image, DEL/LEFT to go up).
* From UCI mode, entering a disk image (`.Dxx` extension) mounts it on drive A and switches to IEC mode — "Inside mount" appears in the menu.

![File browser showing inside a mounted disk image](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20FB%20Inside%20Mount.png?raw=true)

![Inside mount indicator in the file browser sidebar](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Toggle%20inside%20mount.png?raw=true)

* Press **ENTER** on a program file to select it for a menu slot. In UCI mode the associated drive A disk image is automatically included.
* Press **A** or **B** on a disk image (`.Dxx`) to select it as the additional image to mount on drive A resp. B when starting from that slot.
* Press **M** on a program file to select it to be run from the disk image already mounted on drive A.
* To add a REU file: navigate to it and press **ENTER**, then select the target slot, choose REU size with **+** / **-**, and confirm with **ENTER**.

![Status toggles panel with directory trace enabled](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Toggles%20%20dirtrace.png?raw=true)

**Note:** The REU file must be in the same filepath as the drive A disk image if one is present.

* After selecting what to place in a slot, you are shown this screen to pick the slot position:

![Pick slot screen to assign the selected item to a menu slot](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Add%20REU.png?raw=true)

* If the slot is already filled, confirmation is requested. Choose **Y** to proceed or **N** to cancel.
* Press **0–9** or **A–Z** to choose the slot, enter a name and press **ENTER**.
* Repeat until all desired slots are filled.
* Important notes:
  * For technical reasons, loose .PRG files in UCI mode can not be added to the start menu. Either add them via the SoftIEC in IEC mode, or use the Ultimate native UI for launching these applications. Reason is that launching a PRG from an UCI path is not supported via the Ultimate Command Interface (yet)
  * If you want to add a program, disk images and a REU image to the same slot, this needs to be done in separate steps for each file or image to add. Just choose the same slot again each time.

#### Mount/command-only slots

A menu slot does not need a program to launch. Pressing **A** or **B** on a disk image without ever selecting a program to run creates a slot that only mounts that disk and then lands at the BASIC `READY.` prompt on boot — the classic "auto-mount a disk on power-on" setup, especially combined with a [default boot slot and timeout](#default-boot-slot-and-auto-boot-timeout).

You can also create a slot that runs only a BASIC command, with no disk mount and no program: in the edit menu (**F3**) press **F2** (Edit command) and pick an **empty** slot — you'll be prompted for a name, then the command.

These combine freely: adding a drive B image or a REU preload to a slot that already launches a program keeps the program intact (useful for programs that expect a second disk or preloaded data). Adding a drive A image to a slot that already launches a program **replaces** the disk the program expects to boot from, so you'll be asked to confirm first — if you just want an extra mount alongside an existing program, add it as drive B instead, or use a fresh slot for a drive-A-only mount.

![Drive A mount conflict warning](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Drive%20A%20warning.png?raw=true)

### F1: Filebrowse menu
([Back to contents](#contents))

The filebrowser is based on and inspired by the DraBrowse program from <https://github.com/doj/dracopy>

![File browser showing directory listing](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20filebrowser.png?raw=true)

#### Key reference

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

#### UCI mode and IEC mode

The file browser opens in **UCI mode** by default. Press **F3** to toggle between modes. The current mode is shown in the lower right of the sidebar.

**UCI mode** browses the native filesystem of the Ultimate device (USB storage) directly via the Ultimate Command Interface. It supports long filenames, full directory paths, and can enter disk images (`.D64`, `.G64`, `.D71`, `.G71`, `.DNP`) as if they were directories.

**IEC mode** reads directories from a physical or emulated IEC bus device (disk drives on the serial bus). Press **+** or **-** to cycle through available active device numbers. In IEC mode, filenames follow CBM conventions and directory listings are read via the KERNAL. File type labels (`PRG`, `SEQ`, `DEL`, `REL`, `CBM`, `DIR`) are shown next to each entry.

#### Directory navigation

Use **CURSOR UP** / **CURSOR DOWN** to move the highlight one entry at a time. Use **P** (page down) and **U** (page up) to jump a full screen at a time. **T** jumps to the first entry in the directory and **E** jumps to the last.

To enter a subdirectory or disk image, press **RETURN** or **CURSOR RIGHT** on it. To go back up to the parent directory, press **DEL** or **CURSOR LEFT**. Press **↑** (the up-arrow key, not cursor up) to jump directly to the root of the current file system.

Press **F1** at any time to re-read and refresh the current directory listing.

#### Directory trace (IEC mode)

Because IEC drives do not report their full path, pressing **D** activates **directory trace** mode: UBoot64 records each directory you navigate into, building the full path from root. The TRACE indicator in the sidebar switches to **ON**. Navigate from the root directory with trace active before selecting a program, so the complete path can be stored in the menu slot.

Without trace active in IEC mode, only the filename is stored; the path will be empty and the program can only be found if it is in the root directory of the drive.

![Status toggles panel with directory trace enabled](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Toggles%20%20dirtrace.png?raw=true)

Press **D** again to turn trace off and reset the recorded path depth.

#### Toggles: ,1 Load and Demo mode

The sidebar shows two additional toggles that affect how a program is launched when selected for a slot.

**,1 Load** (toggle with **1**): controls the BASIC LOAD command used at boot time.
- **OFF**: `LOAD"FILENAME",8` — loads the program to the address in the file header (normal for most games and programs).
- **ON**: `LOAD"FILENAME",8,1` — loads to the absolute address stored in the file. Needed for some utilities and programs that require loading at a fixed memory address.

**Demo mode** (toggle with **O**): when ON, all Ultimate emulated drives except the one on IEC ID 8 are powered off before the program starts. Many demos and some games require only one drive to be active. Enable this toggle when adding demos to ensure reliable playback on systems with multiple emulated drives.

![File browser status toggles panel in UCI mode](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Toggles%20UCI.png?raw=true)

Both toggle states are stored in the menu slot when you confirm the selection.

#### Selecting items for menu slots

After navigating to the desired file or image, use the appropriate key for the type of item:

**Selecting a program to run (RETURN or M):**
- In IEC mode, pressing **RETURN** on a `.PRG` file without trace active runs it immediately (direct launch, no slot storage).
- In IEC mode with trace active, pressing **RETURN** on a `.PRG` stores it in a slot — the recorded path and filename are saved.
- In UCI mode, pressing **RETURN** on a `.PRG` file does nothing unless first a disk image was entered. If a disk image was entered before (sinde mount), the program stores it in a selected slot and also automatically stores that disk image as the drive A image.
- Pressing **M** instead of **RETURN** stores the program to run from the disk image already mounted on drive A (IEC inside-mount mode). Use this when the program must be started from within the mounted disk.

**Entering and using a disk image (RETURN on .Dxx file in UCI mode):**
Pressing **RETURN** on a disk image file in UCI mode mounts it on drive A and switches to IEC mode, showing "Inside mount" in the sidebar. You can then browse the disk contents and press **RETURN** on a program to store both the program and the disk image in a slot.

**Adding an additional drive B image (B):**
In UCI mode, pressing **B** on a disk image (`.Dxx`) stores it as the drive B image for the next slot you choose. This is useful when a program needs two drives simultaneously.

**Adding a drive A image without entering it (A):**
Pressing **A** on a disk image in UCI mode stores it as the drive A image for the next slot, without mounting or entering the image. Use this when you want to add an image to a slot separately from the program selection step.

**Selecting a REU image (RETURN on .REU file):**
Navigate to a `.REU` file and press **RETURN**. You are then prompted to choose the REU size with **+** / **-** before confirming. The REU image is preloaded into REU memory before the program in the slot starts.

After any selection, you are taken to the slot picker screen to choose which of the 18 menu slots (0–9, A–H) the item should be stored in.

#### Limitations in UCI mode

Loose `.PRG` files on the native UCI file system cannot be added to a menu slot for direct launch. The Ultimate Command Interface does not (yet) support launching a program directly from a USB path. Options:
- Use IEC mode via SoftIEC to access the file through a CBM device number.
- Enter a disk image in UCI mode first, then select the program from within the mounted image.
- Use the Ultimate's own UI for running programs directly from USB.

### F2: Information
([Back to contents](#contents))

Shows first the splash screen, and after pressing any key, the information and credits screen. Press any key to return to the main menu.

![Splash](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Splash.png?raw=true)

![Information and credits screen](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Info.png?raw=true)

### F3: Edit / re-order / delete
([Back to contents](#contents))

Rename, re-order, edit commands for, or delete menu slots.

![Edit, re-order and delete slots menu](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Edit%20menu.png?raw=true)

* **F1** — Rename a slot. Choose slot (**0–9** / **A–Z**), enter new name, press **ENTER**.

![Rename slot screen](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20rename.png?raw=true)

* **F2** — Add or edit a user-defined BASIC command to execute before the program starts.

![Edit user-defined BASIC command screen](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20command.png?raw=true)

* **F3** — Re-order slots. Choose slot to move (**0–9** / **A–Z**), highlighted in white. Press **UP** / **DOWN** to move. Confirm with **ENTER**, cancel with **F7**.

![Re-order slots screen](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20reorder.png?raw=true)

* **F5** — Delete a slot. Choose slot (**0–9** / **A–Z**), confirm with **Y** or cancel with **N**.

![Delete slot confirmation screen](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Delete.png?raw=true)

* **F6** — Set or clear the default boot slot. Choose a slot; slots currently marked default are shown with a `[D]` tag in the list. Choosing the slot that already has `[D]` clears it; choosing another slot moves the default there (only one slot can be default at a time). See [Default boot slot and auto-boot timeout](#default-boot-slot-and-auto-boot-timeout).

* **F7** — Return to main menu. Changes are saved at this point.

### Default boot slot and auto-boot timeout
([Back to contents](#contents))

You can mark one menu slot as the default boot target and have it launch automatically after a countdown, without needing to press a key — useful for auto-mounting a disk (or launching a program) on power-on.

![Auto-boot countdown screen](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Autoboot%20countdown.png?raw=true)

* Set the default slot: main menu → **F3** → **F6**, then pick a slot. Slots currently marked default show a `[D]` tag wherever slots are listed.

![Set default boot slot screen](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20Default%20slot.png?raw=true)

* Set the timeout: main menu → **F5** → **F4** to cycle Off / 1 / 3 / 5 / 10 seconds. Default is **Off**, so this has no effect until both a default slot and a timeout are configured.
* When both are set, the boot menu shows a dedicated countdown screen (rather than the full menu) with the default slot's name and remaining seconds. Pressing **any key** cancels the countdown and opens the normal menu — the keypress itself is not treated as a selection. If the countdown reaches zero, the default slot boots automatically, exactly as if you had pressed its key.
* The default slot follows the slot's content through renames and re-ordering. Deleting the slot (or picking it again via **F6**) clears the default marker.
* A default slot does not need to launch a program — see [mount/command-only slots](#add-start-options-via-the-filebrowser) below for the classic "auto-mount a D64 on power-on" use case.

### F5: Configuration
([Back to contents](#contents))

Configure NTP time synchronisation, startup verbosity, and the UI colour scheme.

After pressing **F5**:

![Configuration menu showing NTP time sync and other settings](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20NTP%20menu.png?raw=true)

The screen shows current settings and allows editing:

* **F1** — Toggle NTP time sync on or off. Default: enabled.

* **F2** — Toggle verbose or silent startup. Verbose shows detailed feedback during startup; silent shows only a progress indicator. Default: verbose.

* **F3** — Edit the time offset to UTC in seconds. Automated daylight saving adjustment is not provided; adjust manually when needed. Examples: CET = 3600, CEST = 7200. See <https://www.timeanddate.com/time/zones/> for all offsets (multiply hours by 3600). Default: 0 (UTC).

* **F4** — Cycle the auto-boot timeout: Off, 1, 3, 5, or 10 seconds. Default: Off. See [Default boot slot and auto-boot timeout](#default-boot-slot-and-auto-boot-timeout).

* **F5** — Edit the NTP server hostname. Default: `pool.ntp.org`.

* **F6** — Edit the UI colour scheme. Use **CURSOR UP** / **DOWN** to select a colour element, **CURSOR LEFT** / **RIGHT** to change its colour value (0–15). **DEL** reverts to the saved colours. **F7** returns to the configuration menu. Changes are saved when you exit the configuration menu.

![UI colour scheme editor](https://github.com/xahmol/UBoot64-v2/blob/main/Screenshots/UBoot64%20-%20colour.png?raw=true)

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

Bart van Leeuwen: For suggesting the default boot slot with
configurable auto-boot timeout feature.

Licensed under the GNU General Public License v3.0

The code can be used freely as long as you retain
a notice describing original source and author.

THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL,
BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!
