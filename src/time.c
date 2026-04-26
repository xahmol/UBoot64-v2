// UBoot64:
// Boot menu for C64 Ultimate enabled devices
// Written in 2023 by Xander Mol
// https://github.com/xahmol/UBoot64
// https://www.idreamtin8bits.com/
//
// Inspired by and code used from DraBrowse:
// DraBrowse (db*) is a simple file browser.
// Originally created 2009 by Sascha Bader.
// Used version adapted by Dirk Jagdmann (doj)
// https://github.com/doj/dracopy
//
// Most of code and functionality ported from:
// DMBoot 128:
// Device Manager Boot Menu for the Commodore 128
// Written in 2020-2023 by Xander Mol
// https://github.com/xahmol/DMBoot
//
// Additionally uses code from:
// - Ultimate 64/II+ Command Library
//   Scott Hutter, Francesco Sblendorio
//   https://github.com/xlar54/ultimateii-dos-lib
// - GenCart64 - cc65 Library for C64 cartridges
//   Joseph Rose, a.k.a. Harry Potter
//   https://sourceforge.net/projects/cc65extra/files/memory%20cfgs/
//   Used for inspiration for building C64 cartridge image with CC65
// - Sidekick64 by frntc
//   https://github.com/frntc/Sidekick64/blob/master/Source/Firmware/C64Side/cart.a
//   Used as inspiration for cartridge init and exit code
// - UUC based on Final Cartridge III by Bart van Leeuwen / bvl1999
//   https://github.com/bvl1999/final_cartridge/blob/master/core/init.s
//   Used for inspiration for building C64 cartridge image with CC65
// - ntp2ultimate by MaxPlap
//   https://github.com/MaxPlap/ntp2ultimate
//   Time via NTP code
// - EPOCH-to-time-date-converter by sidsingh78
//   https://github.com/sidsingh78/EPOCH-to-time-date-converter/blob/master/epoch_conv.c
// - petcom version 1.00 by Craig Bruce, 18-May-1995
//   Convert from PETSCII to ASCII, or vice-versa.
//   https://codebase64.org/doku.php?id=source_conversion
//
// Requires and made possible by the Ultimate II+ cartridge,
// Created by Gideon Zweijtzer
// https://ultimate64.com/
//
// The code can be used freely as long as you retain
// a notice describing original source and author.
//
// THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL,
// BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!

// Includes
#include <c64/memmap.h>
#include <c64/charwin.h>
#include <c64/cia.h>
#include <c64/vic.h>
#include <c64/types.h>
#include <c64/sprites.h>
#include <c64/reu.h>
#include <petscii.h>
#include <stdio.h>
#include <string.h>
#include <peekpoke.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include "defines.h"
#include "fc3.h"
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"
#include "ultimate_time_lib.h"
#include "ultimate_network_lib.h"
#include "core.h"
#include "fileio.h"
#include "u-time.h"

// Switching code generation to bank 0 common routine section
#pragma code(bcode1)
#pragma data(bdata1)

// Get NTP time functions
char CheckStatusTime()
{
    // Function to check UII+ status

    if (uii_status[0] != '0' || uii_status[1] != '0')
    {
        if (cfg.verbose)
        {
            cwin_console_printf(&cw, 7, "\nError getting time from NTP server.");
            cwin_console_printf(&cw, 7, "\nStatus: %s Data:%s", uii_status, uii_data);
        }
        else
        {
            spinning(25, 3, verbosecounter++);
        }
        return 1;
    }
    return 0;
}

char *UNIX_epoch_to_UII_time(time_t epoch)
{
    // Convert UNIX time epoch to UII readable time format

    static char month_days[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    char ntp_hour, ntp_minute, ntp_second, ntp_day, ntp_month;
    char leap_days = 0;
    char leap_year_ind = 0;
    unsigned temp_days, i;
    unsigned ntp_year, days_since_epoch, day_of_year;
    char settime[6];

    // Adjust for timezone
    epoch += cfg.secondsfromutc;

    // Calculate time
    ntp_second = epoch % 60;
    epoch /= 60;
    ntp_minute = epoch % 60;
    epoch /= 60;
    ntp_hour = epoch % 24;
    epoch /= 24;

    // Calculate date

    // Number of days since epoch
    days_since_epoch = epoch;
    // ball parking year, may not be accurate!
    ntp_year = 1970 + (days_since_epoch / 365);
    // Calculating number of leap days since epoch/1970
    for (i = 1972; i < ntp_year; i += 4)
    {
        if (((i % 4 == 0) && (i % 100 != 0)) || (i % 400 == 0))
            leap_days++;
    }
    // Calculating accurate current year by (days_since_epoch - extra leap days)
    ntp_year = 1970 + ((days_since_epoch - leap_days) / 365);
    day_of_year = ((days_since_epoch - leap_days) % 365) + 1;

    if (((ntp_year % 4 == 0) && (ntp_year % 100 != 0)) || (ntp_year % 400 == 0))
    {
        month_days[1] = 29; // February = 29 days for leap years
        leap_year_ind = 1;  // if current year is leap, set indicator to 1
    }
    else
    {
        month_days[1] = 28;
    } // February = 28 days for non-leap years

    // Calculating current Month
    temp_days = 0;
    for (ntp_month = 0; ntp_month <= 11; ntp_month++)
    {
        if (day_of_year <= temp_days)
            break;
        temp_days = temp_days + month_days[ntp_month];
    }

    // Calculating current Date
    temp_days = temp_days - month_days[ntp_month - 1];
    ntp_day = day_of_year - temp_days;

    // Build UII time
    settime[0] = ntp_year - 1900;
    settime[1] = ntp_month;
    settime[2] = ntp_day;
    settime[3] = ntp_hour;
    settime[4] = ntp_minute;
    settime[5] = ntp_second;

    return settime;
}

void get_ntp_time()
{
    // Function to get time from NTP server and set UII+ time with this

    char attempt = 1;
    char clock;
    char fullcmd[] = {0x00, NET_CMD_SOCKET_WRITE, 0x00,
                      0x1b, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    char socket = 0;
    time_t t;

    if (cfg.verbose)
    {
        cwin_console_printf(&cw, 7, "\nUpdating UII+ time from NTP Server.");
    }
    else
    {
        spinning(25, 3, verbosecounter++);
    }

    uii_get_time();

    if (cfg.verbose)
    {
        cwin_console_printf(&cw, 7, "\nUltimate datetime: %s", uii_data);
        cwin_console_printf(&cw, 7, "\nConnecting to: %s", cfg.host);
    }
    else
    {
        spinning(25, 3, verbosecounter++);
    }

    socket = uii_udpconnect(cfg.host, 123); // https://github.com/markusC64/1541ultimate2/blob/master/software/io/network/network_target.cc
    if (CheckStatusTime())
    {
        uii_socketclose(socket);
        return;
    }

    if (cfg.verbose)
    {
        cwin_console_printf(&cw, 7, "\nSending NTP request");
    }
    else
    {
        spinning(25, 3, verbosecounter++);
    }

    fullcmd[2] = socket;
    uii_settarget(TARGET_NETWORK);
    uii_sendcommand(fullcmd, 51); // 3 + sizeof( ntp_packet ));
    uii_readstatus();
    uii_accept();
    if (CheckStatusTime())
    {
        uii_socketclose(socket);
        return;
    }

    // Do maximum of 4 attempts at receiving data
    do
    {
        // Add delay of a second to avoid time to wait on response being too short
        delay(1);
        // Print attempt number
        if (cfg.verbose)
        {
            cwin_console_printf(&cw, 7, "\nReading result attempt %d", attempt);
        }
        else
        {
            spinning(25, 3, verbosecounter++);
        }

        // Try to read incoming data
        uii_socketread(socket, 50); // 2 + sizeof( ntp_packet ));

        // If data received, end loop. Else do new attempt till counter = 5
        if (UII_SUCCESS)
        {
            attempt = 5;
        }
        else
        {
            attempt++;
        }

    } while (attempt < 5);

    if (CheckStatusTime())
    {
        uii_socketclose(socket);
        return;
    }

    // Convert time received to UCI format
    t = uii_data[37] | (((unsigned long)uii_data[36]) << 8) | (((unsigned long)uii_data[35]) << 16) | (((unsigned long)uii_data[34]) << 24);
    t -= NTP_TIMESTAMP_DELTA;

    // Close socket
    uii_socketclose(socket);

    // Print time received and parse to UII+ format
    if (cfg.verbose)
    {
        cwin_console_printf(&cw, 7, "\nUnix epoch %lu", t);
    }
    else
    {
        spinning(25, 3, verbosecounter++);
    }

    // Set UII+ RTC clock
    uii_set_time(UNIX_epoch_to_UII_time(t));

    if (cfg.verbose)
    {
        cwin_console_printf(&cw, 7, "\nStatus: %s", uii_status);
    }
    else
    {
        spinning(25, 3, verbosecounter++);
    }

    uii_get_time();

    if (cfg.verbose)
    {
        cwin_console_printf(&cw, 7, "\nRTC clock set to %s", uii_data);
    }
    else
    {
        spinning(25, 3, verbosecounter++);
    }
}

void time_main()
{
    if (cfg.timeon == 1)
    {
        get_ntp_time();
    }
}

// Config functions
char getcolor(char option)
// Function to get color from config struct
// Input: option 1-9
{
    switch (option)
    {
    case 1:
        return cfg.colors.header1;
        break;

    case 2:
        return cfg.colors.header2;
        break;

    case 3:
        return cfg.colors.text;
        break;

    case 4:
        return cfg.colors.text_input;
        break;

    case 5:
        return cfg.colors.key;
        break;

    case 6:
        return cfg.colors.diritem_normal;
        break;

    case 7:
        return cfg.colors.diritem_select;
        break;

    case 8:
        return cfg.colors.error;
        break;

    case 9:
        return cfg.colors.ok;
        break;

    case 10:
        return cfg.colors.background;
        break;

    case 11:
        return cfg.colors.border;
        break;

    default:
        return 0;
        break;
    }
}

void pushcolor(char option, char color)
// Function to push color to config struct
// Input: option 1-9
{
    switch (option)
    {
    case 1:
        cfg.colors.header1 = color;
        break;

    case 2:
        cfg.colors.header2 = color;
        break;

    case 3:
        cfg.colors.text = color;
        break;

    case 4:
        cfg.colors.text_input = color;
        break;

    case 5:
        cfg.colors.key = color;
        break;

    case 6:
        cfg.colors.diritem_normal = color;
        break;

    case 7:
        cfg.colors.diritem_select = color;
        break;

    case 8:
        cfg.colors.error = color;
        break;

    case 9:
        cfg.colors.ok = color;
        break;

    case 10:
        cfg.colors.background = color;
        vic.color_back = color;
        break;

    case 11:
        cfg.colors.border = color;
        vic.color_border = color;
        break;

    default:
        break;
    }
}

char editcolors()
// Function to edit colour scheme
// Output: returns 1 if changes made, else 0
{
    char changesmade = 0;
    char key = 0;
    char x;
    char option = 1;
    char color;
    char setting[11][16] = {"Header line 1  ", "Header line 2  ", "Normal text    ", "Text input     ",
                           "Key text       ", "Dir item normal", "Dir item select", "Error text     ", "OK text        ",
                           "Background     ", "Border         "};

    do
    {
        color = getcolor(option);

        cwin_clear(&cw);
        headertext("Edit colour scheme.", 1);

        cwin_cursor_move(&cw, 0, 3);
        cwin_putat_string(&cw, 0, 3, "Current colour scheme:", cfg.colors.text);

        for (x = 0; x < 11; x++)
        {
            sprintf(linebuffer, "%s: %2u", setting[x], getcolor(x + 1));

            if (option == x + 1)
            {
                cwin_putat_string_reverse(&cw, 0, 5 + x, linebuffer, cfg.colors.diritem_select);
            }
            else
            {
                cwin_putat_string(&cw, 0, 5 + x, linebuffer, cfg.colors.diritem_normal);
            }

            cwin_fill_rect_raw(&cw, 30, 5 + x, 4, 1, SC_REVSPACE, getcolor(x + 1));
        }

        cwin_putat_string_reverse(&cw, 0, 18, " CURS UP/DOWN    ", cfg.colors.key);
        cwin_putat_string(&cw, 18, 18, "Move up and down", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 19, " CURS LEFT/RIGHT ", cfg.colors.key);
        cwin_putat_string(&cw, 18, 19, "Incr/Decr colour", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 20, " DEL ", cfg.colors.key);
        cwin_putat_string(&cw, 18, 20, "Undo change", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 21, " F7 ", cfg.colors.key);
        cwin_putat_string(&cw, 18, 21, "Back to main menu", cfg.colors.text);

        do
        {
            key = cwin_getch();
        } while (key != CH_CURS_DOWN && key != CH_CURS_UP && key != CH_CURS_LEFT && key != CH_CURS_RIGHT && key != CH_DEL && key != CH_F7);

        switch (key)
        {
        case CH_CURS_DOWN:
            if (option < 11)
            {
                option++;
            }
            else
            {
                option = 1;
            }
            break;

        case CH_CURS_UP:
            if (option > 1)
            {
                option--;
            }
            else
            {
                option = 11;
            }
            break;

        case CH_CURS_LEFT:
            if (color > 0)
            {
                pushcolor(option, color - 1);
                changesmade = 1;
            }
            break;

        case CH_CURS_RIGHT:
            if (color < 15)
            {
                pushcolor(option, color + 1);
                changesmade = 1;
            }
            break;

        case CH_DEL:
            readconfigfile();
            changesmade = 0;
            break;

        default:
            break;
        }

    } while (key != CH_F7);

    return changesmade;
}

void edittimeconfig()
// Function to edit time and colour scheme configuration
{
    char changesmade = 0;
    char key;
    char offsetinput[10];
    char *ptrend;

    do
    {
        cwin_clear(&cw);
        headertext("Configuration tool.", 1);

        cwin_cursor_move(&cw, 0, 3);
        cwin_console_printf(&cw, cfg.colors.text, "\nCurrent configuration settings:\n\n");
        cwin_console_printf(&cw, cfg.colors.text, "NTP time update settings:\n");
        cwin_console_printf(&cw, cfg.colors.text, "- Update on boot toggle: %s\n", (cfg.timeon == 0) ? "Off" : "On");
        cwin_console_printf(&cw, cfg.colors.text, "- Offset to UTC in seconds: %ld\n", cfg.secondsfromutc);
        {
          char hostbuf[41];
          strncpy(hostbuf, cfg.host, 40);
          hostbuf[40] = 0;
          cwin_console_printf(&cw, cfg.colors.text, "- NTP server hostname:\n%s\n", hostbuf);
        }
        cwin_console_printf(&cw, cfg.colors.text, "\nVerbose or silent startup: %s\n", (cfg.verbose == 0) ? "Silent" : "Verbose");

        cwin_putat_string(&cw, 0, 16, "Make your choice:", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 17, " F1 ", cfg.colors.key);
        cwin_putat_string(&cw, 5, 17, "Toggle time synch on/off", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 18, " F2 ", cfg.colors.key);
        cwin_putat_string(&cw, 5, 18, "Verbose startup on/off", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 19, " F3 ", cfg.colors.key);
        cwin_putat_string(&cw, 5, 19, "Edit time offset to UTC", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 20, " F5 ", cfg.colors.key);
        cwin_putat_string(&cw, 5, 20, "Edit NTP server host", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 21, " F6 ", cfg.colors.key);
        cwin_putat_string(&cw, 5, 21, "Edit colour scheme", cfg.colors.text);

        cwin_putat_string_reverse(&cw, 0, 22, " F7 ", cfg.colors.key);
        cwin_putat_string(&cw, 5, 22, "Back to main menu", cfg.colors.text);

        do
        {
            key = cwin_getch();
        } while (key != CH_F1 && key != CH_F2 && key != CH_F3 && key != CH_F5 && key != CH_F6 && key != CH_F7);

        switch (key)
        {
        case CH_F1:
            cfg.timeon = (cfg.timeon == 0) ? 1 : 0;
            changesmade = 1;
            break;

        case CH_F2:
            cfg.verbose = (cfg.verbose == 0) ? 1 : 0;
            changesmade = 1;
            break;

        case CH_F3:
            sprintf(offsetinput, "%ld", cfg.secondsfromutc);
            cwin_putat_string(&cw, 0, 23, "Input time offset to UTC:", cfg.colors.text);
            textInput(0, 24, 10, offsetinput, 10, 0);
            cfg.secondsfromutc = strtol(offsetinput, &ptrend, 10);
            changesmade = 1;
            break;

        case CH_F5:
            cwin_putat_string(&cw, 0, 23, "Input NTP server hostname:", cfg.colors.text);
            textInput(0, 24, 40, cfg.host, MAXHOSTLENGTH - 1, 0);
            changesmade = 1;
            break;

        case CH_F6:
            changesmade = editcolors();
            break;

        default:
            break;
        }
    } while (key != CH_F7);

    if (changesmade == 1)
    {
        writeconfigfile();
    }
}