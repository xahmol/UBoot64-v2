/*****************************************************************
Ultimate 64/II+ Command Library _ Network functions
Scott Hutter, Francesco Sblendorio

Based on ultimate_dos-1.2.docx and command interface.docx
https://github.com/markusC64/1541ultimate2/tree/master/doc

Disclaimer:  Because of the nature of DOS commands, use this code
soley at your own risk.

Patches and pull requests are welcome
******************************************************************/

#ifndef _ULTIMATE_NETWORK_LIB_H_
#define _ULTIMATE_NETWORK_LIB_H_

// prototypes
char uii_tcpconnect(char *host, unsigned short port);
char uii_udpconnect(char *host, unsigned short port);
void uii_socketclose(char socketid);
unsigned uii_socketread(char socketid, unsigned short length);
void uii_socketwrite(char socketid, char *data);
void uii_socketwritechar(char socketid, char one_char);
void uii_socketwrite_ascii(char socketid, char *data);
unsigned uii_tcplistenstart(unsigned short port);
unsigned uii_tcplistenstop(void);
unsigned uii_tcpgetlistenstate(void);
char uii_tcpgetlistensocket(void);
char uii_tcp_nextchar(char socketid);
unsigned uii_tcp_nextline(char socketid, char *);
unsigned uii_tcp_nextline_ascii(char socketid, char *);
void uii_tcp_emptybuffer(void);
void uii_reset_uiidata(void);

#pragma compile("ultimate_network_lib.c")

#endif
