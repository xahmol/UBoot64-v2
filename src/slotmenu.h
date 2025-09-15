#ifndef SLOTMENU__H
#define SLOTMENU__H

char menuslotkey(char slotnumber);
char keytomenuslot(char keypress);
void presentmenuslots();
void mainmenu();
void pickmenuslot();
char renamemenuslot();
char deletemenuslot();
int edituserdefinedcommand();
void editmenuoptions();
void information();
void runbootfrommenu(int select);

#pragma compile("slotmenu.c")

#endif