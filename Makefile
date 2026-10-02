
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
VERSION_MINOR = 1
VERSION_PATCH = 0
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION = v$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)-$(VERSION_TIMESTAMP)

# Ultimate Command Interface library (git submodule, pinned to a release
# tag): https://github.com/xahmol/ultimate-uci-oscar64. Never edit it here.
UCILIB = lib/ultimate-uci-oscar64
UCILIB_SRCS = $(wildcard $(UCILIB)/include/*.c $(UCILIB)/include/*.h)

# Common compile flags
CFLAGS  = -i=include \
          -i=$(UCILIB)/include \
          -tm=$(SYS) \
          -tf=crt16 \
          -cid=3 \
          -csub=1 \
          -cname=$(MAIN) \
          -O2 \
          -dNOFLOAT \
          -dHEAPCHECK \
          -dVERSION="\"$(VERSION)\""

CFLAGSUPD = -i=include \
            -i=$(UCILIB)/include \
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
            src/convert.c src/convert.h \
            include/defines.h \
            include/fc3.c include/fc3.h \
            $(UCILIB_SRCS)

UPD12_SRCS = src/uboot_upd12.c \
             include/defines.h \
             $(UCILIB_SRCS)

UPD23_SRCS = src/uboot_upd23.c \
             include/defines.h \
             $(UCILIB_SRCS)

# Ultimate deployment targets. Store only the IPs (and storage, when not
# usb0) in .env (gitignored, never committed); everything else is derived
# here. ULTIP2 is optional: make deploy uploads to every device that is set.
#   ULTIP1 = 192.168.1.148
#   ULTUSB1 = sd
#   ULTIP2 = 192.168.1.195
-include .env
ULTIP1  ?= <set_ULTIP1_in_.env>
ULTUSB1 ?= $(or $(ULTUSB),usb0)
ULTUSB2 ?= usb0
ULTFTP1  = ftp://$(ULTIP1)/$(ULTUSB1)/Dev/
ULTFTP2  = $(if $(ULTIP2),ftp://$(ULTIP2)/$(ULTUSB2)/Dev/)
ULTFTPS  = $(ULTFTP1) $(ULTFTP2)

# ZIP file contents
ZIP = build/$(MAIN)_$(VERSION).zip
README = README.pdf

########################################

.SUFFIXES:
.PHONY: all clean deploy check-deploy docs e2e e2e-update e2e-restore
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
	@for u in $(ULTFTPS); do \
		curl -s --connect-timeout 3 $$u >/dev/null 2>&1 || \
		{ echo "ERROR: Cannot reach $$u -- check ULTIP1/ULTIP2 and ULTUSB1/ULTUSB2 in .env"; exit 1; }; \
	done

# make deploy uploads to every configured Ultimate (wput keeps the build/
# prefix, so the files land in <storage>/Dev/build/).
deploy: check-deploy $(MAIN).crt $(UPD12).prg $(UPD23).prg
	@for u in $(ULTFTPS); do \
		wput -u build/$(MAIN).crt build/$(UPD12).prg build/$(UPD23).prg $$u || exit 1; \
	done

# End-to-end test on real Ultimate hardware (tests/e2e/README.md). Runs on
# ULTIP1 and ULTIP2 unless E2E_DEVICES (space separated) is set in .env.
# The run backs up and restores UBoot64's config/slot files on each device.
E2E_DEVICES ?= $(filter-out <set_ULTIP1_in_.env>,$(ULTIP1) $(ULTIP2))
E2E_ARGS = $(foreach d,$(E2E_DEVICES),--device $(d))

e2e: $(MAIN).crt
	@test -n "$(E2E_DEVICES)" || (echo "ERROR: set E2E_DEVICES in .env" && false)
	python3 tests/e2e/run_e2e.py $(E2E_ARGS)

e2e-update: $(MAIN).crt
	@test -n "$(E2E_DEVICES)" || (echo "ERROR: set E2E_DEVICES in .env" && false)
	python3 tests/e2e/run_e2e.py $(E2E_ARGS) --update

e2e-restore:
	@test -n "$(E2E_DEVICES)" || (echo "ERROR: set E2E_DEVICES in .env" && false)
	python3 tests/e2e/run_e2e.py $(E2E_ARGS) --restore
