#ifndef SLOTMENU__H
#define SLOTMENU__H

char menuslotkey(char slotnumber);
char keytomenuslot(char keypress);
void presentmenuslots();
void mainmenu();
void pickmenuslot();
char renamemenuslot();
char deletemenuslot();
char reordermenuslot();
char edituserdefinedcommand();
char toggledefaultslot();
char find_default_slot();
char bcdtoseconds(char bcd);
char validkey(char key);
char autobootcountdown();
void editmenuoptions();
void information();
void runbootfrommenu(char select);
void apply_baseline_settings(void);

#pragma compile("slotmenu.c")

#endif