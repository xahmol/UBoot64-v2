#ifndef SPLASH__H
#define SPLASH__H

#define SCREEN_RAM (unsigned char*)0x0400
#define COLOR_RAM  (unsigned char*)0xD800

#pragma compile("splash.c")

void show_splash_screen();

#endif