#ifndef U_TIME__H
#define U_TIME__H

// Functions to set time using NTP server
// Source: https://github.com/MaxPlap/ntp2ultimate

typedef long time_t;

char CheckStatusTime();
char* UNIX_epoch_to_UII_time(time_t epoch);
void get_ntp_time();
void time_main();
void edittimeconfig();

#define NTP_TIMESTAMP_DELTA 2208988800ul //0x83AA7E80

#pragma compile("time.c")

#endif