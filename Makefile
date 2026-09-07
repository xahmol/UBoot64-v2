
# Target
SYS = c64

# Just the usual way to find out if we're
# using cmd.exe to execute make rules.
ifneq ($(shell echo),)
  CMD_EXE = 1
endif

ifdef CMD_EXE
  NULLDEV = nul:
  DEL = -del /f
  RMDIR = rmdir /s /q
  MKDIR = mkdir
else
  NULLDEV = /dev/null
  DEL = $(RM)
  RMDIR = $(RM) -r
  MKDIR = mkdir -p
endif

# Toolchain -- override the path if oscar64 lives elsewhere:
#   make CC=/path/to/oscar64/bin/oscar64
# (plain '=', not '?=' -- CC is a Make built-in with a default of 'cc',
# which is never "unset", so '?=' would silently never take effect)
CC = /home/xahmol/oscar64/bin/oscar64

# Application names
MAIN = uboot64
UPD12 = uboot_upd12
UPD23 = uboot_upd23

# Build versioning
# Major bumped for the v3 slot/config save format (SlotStruct.partition,
# ConfigStruct.iec_root_partition; see CFGVERSION in defines.h and the
# uboot_upd23 migration tool).
VERSION_MAJOR = 3
VERSION_MINOR = 0
VERSION_PATCH = 0
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION = v$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)-$(VERSION_TIMESTAMP)

# Common compile flags
# -dUBOOT64_BANKED marks the banked uboot64.crt build, distinct from the
# plain-.prg uboot_upd12 build below: files shared between both (e.g.
# include/ultimate_time_lib.c) must guard any bank1/bank2 #pragma code/data
# relocation with #ifdef UBOOT64_BANKED, since uboot_upd12.prg has no bank
# regions defined at all and errors ("Section not defined") otherwise.
CFLAGS  = -i=include \
          -tm=$(SYS) \
          -tf=crt16 \
          -cid=3 \
          -csub=1 \
          -cname=$(MAIN) \
          -O2 \
          -dNOFLOAT \
          -dHEAPCHECK \
          -dUBOOT64_BANKED \
          -dVERSION="\"$(VERSION)\""

CFLAGSUPD = -i=include \
            -tm=$(SYS) \
            -O2 \
            -dNOFLOAT \
            -dHEAPCHECK \
            -dVERSION="\"$(VERSION)\""

# Sources
# Oscar64 follows #pragma compile chains internally, but make doesn't know
# about them, so every transitively compiled .c/.h is listed here to trigger
# rebuilds when a header or dependency changes, not just main.c itself.
MAIN_SRCS = src/main.c \
            src/core.c src/core.h \
            src/fileio.c src/fileio.h \
            src/filebrowse.c src/filebrowse.h \
            src/petscii_ascii.c src/petscii_ascii.h \
            src/splash.c src/splash.h \
            src/slotmenu.c src/slotmenu.h \
            src/time.c src/u-time.h \
            include/defines.h \
            include/fc3.c include/fc3.h \
            include/ultimate_common_lib.c include/ultimate_common_lib.h \
            include/ultimate_dos_lib.c include/ultimate_dos_lib.h \
            include/ultimate_network_lib.c include/ultimate_network_lib.h \
            include/ultimate_time_lib.c include/ultimate_time_lib.h

UPD12_SRCS = src/uboot_upd12.c \
             include/defines.h \
             include/ultimate_common_lib.c include/ultimate_common_lib.h \
             include/ultimate_dos_lib.c include/ultimate_dos_lib.h \
             include/ultimate_time_lib.c include/ultimate_time_lib.h

UPD23_SRCS = src/uboot_upd23.c \
             include/defines.h \
             include/ultimate_common_lib.c include/ultimate_common_lib.h \
             include/ultimate_dos_lib.c include/ultimate_dos_lib.h \
             include/ultimate_time_lib.c include/ultimate_time_lib.h

# Ultimate II+ deployment target. Store only the IP in .env (gitignored,
# never committed); everything else is derived here.
-include .env
ULTIP1  ?= <set_ULTIP1_in_.env>
ULTUSB  ?= usb0
ULTPATH  = /$(ULTUSB)/Dev/
ULTFTP1  = ftp://$(ULTIP1)$(ULTPATH)

# ZIP file contents
ZIP = build/$(MAIN)_$(VERSION).zip
README = README.pdf

########################################

.SUFFIXES:
.PHONY: all clean deploy check-deploy docs
all: $(MAIN).crt $(UPD12).prg $(UPD23).prg $(README) $(ZIP)

$(MAIN).crt: $(MAIN_SRCS)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGS) -n -o=build/$(MAIN).crt src/main.c

$(UPD12).prg: $(UPD12_SRCS)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGSUPD) -n -o=build/$(UPD12).prg src/uboot_upd12.c

$(UPD23).prg: $(UPD23_SRCS)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGSUPD) -n -o=build/$(UPD23).prg src/uboot_upd23.c

# Regenerate README.pdf from README.md (requires pandoc + texlive-xetex).
# Install: sudo apt install pandoc texlive-xetex
# Warns and skips (does not fail the build) if pandoc is unavailable, since
# README.pdf is committed to git and only needs regenerating when docs change.
docs: $(README)

$(README): README.md pandoc-defaults.yaml pandoc-header.tex pandoc-wrap-tables.lua
	@if which pandoc >/dev/null 2>&1; then \
		pandoc --defaults=pandoc-defaults.yaml README.md -o $(README); \
	else \
		echo "WARNING: pandoc not found -- $(README) not updated (install: sudo apt install pandoc texlive-xetex)"; \
	fi

# Creating ZIP file for distribution
$(ZIP): $(MAIN).crt $(UPD12).prg $(UPD23).prg $(README)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	zip -j $(ZIP) build/$(MAIN).crt build/$(UPD12).prg build/$(UPD23).prg $(README)

# Cleaning repo of build files
clean:
	$(DEL) build/*.* 2>$(NULLDEV)

# Safety check before deploy: make sure the U2+/U64 is actually reachable
check-deploy:
	@curl -s --connect-timeout 3 $(ULTFTP1)/ >/dev/null 2>&1 || \
		(echo "ERROR: Cannot reach Ultimate device at $(ULTIP1) -- check ULTIP1 in .env" && false)

# To deploy software to UII+ enter make deploy. Obviously the C64 needs to be
# powered on with UII+ and USB drive connected.
deploy: check-deploy $(MAIN).crt $(UPD12).prg $(UPD23).prg
	wput -u build/$(MAIN).crt build/$(UPD12).prg build/$(UPD23).prg $(ULTFTP1)
