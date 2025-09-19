
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
else
  NULLDEV = /dev/null
  DEL = $(RM)
  RMDIR = $(RM) -r
endif

# Tooling paths
CC = /home/xahmol/oscar64/bin/oscar64

# Application names
MAIN = uboot64
UPD12 = uboot_upd12

# Build versioning
VERSION_MAJOR = 2
VERSION_MINOR = 0
VERSION_PATCH = 0
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION = v$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)-$(VERSION_TIMESTAMP)

# Common compile flags
CFLAGS  = -i=include -tm=$(SYS) -tf=crt16 -cid=3 -csub=1 -cname=$(MAIN) -O2 -dNOFLOAT -dHEAPCHECK -dVERSION="\"$(VERSION)\""
CFLAGSUPD  = -i=include -tm=$(SYS) -O2 -dNOFLOAT -dHEAPCHECK -dVERSION="\"$(VERSION)\""

# Sources
MAINSRC = src/main.c
UPD12SRC = src/uboot_upd12.c

# Hostname of Ultimate II+ target for deployment. Edit for proper IP and usb number
ULTHOST = ftp://192.168.1.52/usb0/Dev/

# ZIP file contents
ZIP = $(MAIN)_$(VERSION).zip
README = README.pdf

########################################

.SUFFIXES:
.PHONY: all clean deploy
all: $(MAIN).crt $(UPD12).prg $(ZIP)

$(MAIN).crt: $(MAINSRC)
	$(CC) $(CFLAGS) -n -o=build/$(MAIN).crt $<

$(UPD12).prg: $(UPD12SRC)
	$(CC) $(CFLAGSUPD) -n -o=build/$(UPD12).prg $<

# Creating ZIP file for distribution
$(ZIP):
	zip -j $(ZIP) build/$(MAIN).crt build/$(UPD12).prg $(README)

# Cleaning repo of build files
clean:
	$(DEL) build/*.* 2>$(NULLDEV)

# To deploy software to UII+ enter make deploy. Obviously C128 needs to powered on with UII+ and USB drive connected.
deploy:
	wput -u build/$(MAIN).crt build/$(UPD12).prg $(ULTHOST)