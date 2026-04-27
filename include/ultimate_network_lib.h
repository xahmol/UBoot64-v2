/*****************************************************************
Ultimate 64/II+ Command Library - DOS functions

Based on Ultimate II Dos Lib
Scott Hutter, Francesco Sblendorio
https://github.com/xlar54/ultimateii-dos-lib

Based on ultimate_dos-1.2.docx and command interface.docx
https://github.com/markusC64/1541ultimate2/tree/master/doc

Disclaimer:  Because of the nature of DOS commands, use this code
solely at your own risk.

Patches and pull requests are welcome
******************************************************************/

#ifndef _ULTIMATE_NETWORK_LIB_H_
#define _ULTIMATE_NETWORK_LIB_H_

// prototypes
char uii_tcpconnect(char *host, unsigned short port); // Open TCP socket; returns socket id
char uii_udpconnect(char *host, unsigned short port); // Open UDP socket; returns socket id
void uii_socketclose(char socketid);                  // Close socket by id
unsigned uii_socketread(char socketid, unsigned short length); // Read up to length bytes into uii_data
void uii_socketwrite(char socketid, char *data);      // Write null-terminated PETSCII string to socket
void uii_socketwritechar(char socketid, char one_char); // Write single byte to socket
void uii_socketwrite_ascii(char socketid, char *data);  // Write null-terminated ASCII string to socket
unsigned uii_tcplistenstart(unsigned short port);     // Start TCP listener on port; returns socket id
unsigned uii_tcplistenstop(void);                     // Stop TCP listener
unsigned uii_tcpgetlistenstate(void);                 // Get listener state (NET_LISTENER_STATE_*)
char uii_tcpgetlistensocket(void);                    // Get socket id of accepted connection
char uii_tcp_nextchar(char socketid);                 // Read next byte from socket receive buffer
unsigned uii_tcp_nextline(char socketid, char *);     // Read next line from socket into buffer (PETSCII)
unsigned uii_tcp_nextline_ascii(char socketid, char *); // Read next line from socket into buffer (ASCII)
void uii_tcp_emptybuffer(void);                       // Discard remaining data in UCI receive buffer
void uii_reset_uiidata(void);                         // Reset uii_data index and length counters

#pragma compile("ultimate_network_lib.c")

#endif
