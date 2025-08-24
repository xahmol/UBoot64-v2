
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

# Build versioning
VERSION_MAJOR = 2
VERSION_MINOR = 0
VERSION_PATCH = 0
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION = v$(VERSION_MAJOR)$(VERSION_MINOR)-$(VERSION_TIMESTAMP)

# Common compile flags
CFLAGS  = -i=include -tm=$(SYS) -tf=crt -O2 -dNOFLOAT -dHEAPCHECK -dVERSION="\"$(VERSION)\""

# Sources
MAINSRC = src/main.c

# Files to add to disk
#PROGRAM = -write $(MAIN).prg $(MAIN) -write $(GEN).prg $(GEN)
#OVERLAYS = -write $(MAIN)lmc.prg $(MAIN)lmc -write $(MAIN)ovl1.prg $(MAIN)ovl1 -write $(MAIN)ovl2.prg $(MAIN)ovl2 -write $(MAIN)ovl3.prg $(MAIN)ovl3 -write $(MAIN)ovl4.prg $(MAIN)ovl4 -write $(MAIN)ovl5.prg $(MAIN)ovl5 -write $(MAIN)ovl6.prg $(MAIN)ovl6 -write $(GEN)lmc.prg $(GEN)lmc
#ASSETS = -write $(MAIN)petv.prg $(MAIN)petv -write $(VIEW).prg $(VIEW)
#SCREENS = -write $(MAIN)tscr.prg $(MAIN)tscr -write $(MAIN)hsc1.prg $(MAIN)hsc1 -write $(MAIN)hsc2.prg $(MAIN)hsc2 -write $(MAIN)hsc3.prg $(MAIN)hsc3 -write $(MAIN)hsc4.prg $(MAIN)hsc4
#SAMPLESPROJ = -write loveisdrug.proj.prg loveisdrug.proj -write loveisdrug.scrn.prg loveisdrug.scrn -write bcc2024.proj.prg bcc2024.proj -write bcc2024.scrn.prg bcc2024.scrn -write fjaeld24.proj.prg fjaeld24.proj -write fjaeld24.scrn.prg fjaeld24.scrn -write vf7-v2.proj.prg vf7-v2.proj -write vf7-v2.scrn.prg vf7-v2.scrn
#SAMPLESRAW = -write loveisthedrugraw.prg loveisthedrugraw -write fullackraw.prg fullackraw -write moneyislandraw.prg moneyislandraw -write morbosezraw.prg morbosezraw -write arcadevenusraw.prg arcadevenusraw -write drakardemonerraw.prg drakardemonerraw -write greatescaperaw.prg greatescaperaw -write aquamanraw.prg aquamanraw -write umlautraw.prg umlautraw -write vf7-v2raw.prg vf7-v2raw -write vf7-v2-80x50.seq vf7-v2-80x50,s
#SAMPLESOWN = -write ludo.proj.prg ludo.proj -write ludo.scrn.prg ludo.scrn -write ludo.chrs.prg ludo.chrs -write ludo.chra.prg ludo.chra -write careers.proj.prg careers.proj -write careers.scrn.prg careers.scrn -write careers.chrs.prg careers.chrs -write careers.chra.prg careers.chra -write carmscr.proj.prg carmscr.proj -write carmscr.scrn.prg carmscr.scrn -write carmscr.chrs.prg carmscr.chrs -write carmscr.chra.prg carmscr.chra -write roundfont.proj.prg roundfont.proj -write roundfont.scrn.prg roundfont.scrn -write oscardemo.proj.prg oscardemo.proj -write oscardemo.scrn.prg oscardemo.scrn

# Hostname of Ultimate II+ target for deployment. Edit for proper IP and usb number
ULTHOST = ftp://192.168.1.52/usb0/Dev/

# ZIP file contents
#ZIP = $(MAIN)_$(VERSION).zip
#README = README.pdf

########################################

.SUFFIXES:
.PHONY: all clean deploy
all: $(MAIN).crt

$(MAIN).crt: $(MAINSRC)
	$(CC) $(CFLAGS) -n -o=build/$(MAIN).crt $<

# Creating ZIP file for distribution
#$(ZIP):
#	zip -j $(ZIP) build/*.d* $(README)

# Cleaning repo of build files
clean:
	$(DEL) build/*.* 2>$(NULLDEV)

# To deploy software to UII+ enter make deploy. Obviously C128 needs to powered on with UII+ and USB drive connected.
deploy:
	wput -u build/*.crt $(ULTHOST)