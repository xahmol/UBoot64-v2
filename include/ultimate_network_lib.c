/*****************************************************************
Ultimate 64/II+ Command Library - Network functions
Scott Hutter, Francesco Sblendorio

Based on ultimate_dos-1.2.docx and command interface.docx
https://github.com/markusC64/1541ultimate2/tree/master/doc

Disclaimer:  Because of the nature of DOS commands, use this code
soley at your own risk.

Patches and pull requests are welcome
******************************************************************/
#include <string.h>
#include "ultimate_common_lib.h"
#include "ultimate_network_lib.h"

// Switching code generation to bank 0 common routine section
#pragma code(code)
#pragma data(data)

// Network functions
void uii_getipaddress(void)
// Get IP address
{
	char tempTarget = uii_target;
	char cmd[] = {0x00, NET_CMD_GET_IP_ADDRESS, 0x00}; // interface 0 (theres only one)

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(cmd, 0x03);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;
}

char uii_connect(char *host, unsigned short port, char cmd)
// Connect to a host (TCP or UDP)
// Input: host - the hostname or IP address to connect to
//        port - the port number to connect to
//        cmd - the command to use (NET_CMD_TCP_SOCKET_CONNECT or NET_CMD_UDP_SOCKET_CONNECT)
// Output: the socket ID on success. Status code in uii_status.
{
	char tempTarget = uii_target;
	unsigned x = 0;
	char *fullcmd = (char *)malloc(4 + strlen(host) + 1);
	fullcmd[0] = 0x00;
	fullcmd[1] = cmd;
	fullcmd[2] = port & 0xff;
	fullcmd[3] = (port >> 8) & 0xff;

	for (x = 0; x < strlen(host); x++)
		fullcmd[x + 4] = host[x];

	fullcmd[4 + strlen(host)] = 0x00;

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(fullcmd, 4 + strlen(host) + 1);

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;

	uii_data_index = 0;
	uii_data_len = 0;
	return uii_data[0];
}

char uii_tcpconnect(char *host, unsigned short port)
// Connect to a TCP host
// Input: host - the hostname or IP address to connect to
//        port - the port number to connect to
// Output: the socket ID on success. Status code in uii_status.
{
	return uii_connect(host, port, NET_CMD_TCP_SOCKET_CONNECT);
}

char uii_udpconnect(char *host, unsigned short port)
// Connect to a UDP host
// Input: host - the hostname or IP address to connect to
//        port - the port number to connect to
// Output: the socket ID on success. Status code in uii_status.
{
	return uii_connect(host, port, NET_CMD_UDP_SOCKET_CONNECT);
}

void uii_socketclose(char socketid)
// Close a socket
// Input: socketid - the ID of the socket to close
{
	char tempTarget = uii_target;
	char cmd[] = {0x00, NET_CMD_SOCKET_CLOSE, 0x00};
	cmd[2] = socketid;

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(cmd, 0x03);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;
}

unsigned uii_socketread(char socketid, unsigned short length)
// Read data from a socket
// Input: socketid - the ID of the socket to read from
//        length - the number of bytes to read
// Output: the number of bytes read
{
	char tempTarget = uii_target;
	char cmd[] = {0x00, NET_CMD_SOCKET_READ, 0x00, 0x00, 0x00};

	cmd[2] = socketid;
	cmd[3] = length & 0xff;
	cmd[4] = (length >> 8) & 0xff;

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(cmd, 0x05);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;
	return uii_data[0] | (uii_data[1] << 8);
}

unsigned uii_tcplistenstart(unsigned short port)
// Start a TCP listener on a port
// Input: port - the port number to listen on
// Output: listener state
{
	char tempTarget = uii_target;
	char cmd[] = {0x00, NET_CMD_TCP_LISTENER_START, 0x00, 0x00};
	cmd[2] = port & 0xff;
	cmd[3] = (port >> 8) & 0xff;

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(cmd, 0x04);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;
	return uii_data[0] | (uii_data[1] << 8);
}

unsigned uii_tcplistenstop()
// Stop the TCP listener
// Output: listener state
{
	char tempTarget = uii_target;
	char cmd[] = {0x00, NET_CMD_TCP_LISTENER_STOP};

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(cmd, 0x02);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;
	return uii_data[0] | (uii_data[1] << 8);
}

unsigned uii_tcpgetlistenstate()
// Get the current state of the TCP listener
// Output: listener state
{
	char tempTarget = uii_target;
	char cmd[] = {0x00, NET_CMD_GET_LISTENER_STATE};

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(cmd, 0x02);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;
	return uii_data[0] | (uii_data[1] << 8);
}

char uii_tcpgetlistensocket()
// Get the socket ID of the TCP listener
// Output: the socket ID on success. Status code in uii_status.
{
	char tempTarget = uii_target;
	char cmd[] = {0x00, NET_CMD_GET_LISTENER_SOCKET};

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(cmd, 0x02);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;
	return uii_data[0] | (uii_data[1] << 8);
}

void uii_socketwrite_convert_parameter(char socketid, char *data, unsigned ascii)
// Convert parameters for socket write
// Input: socketid - the ID of the socket to write to
//        data - the data to write
//        ascii - whether to convert to ASCII
{
	char tempTarget = uii_target;
	unsigned x;
	char c;
	char *fullcmd = (char *)malloc(3 + strlen(data));
	fullcmd[0] = 0x00;
	fullcmd[1] = NET_CMD_SOCKET_WRITE;
	fullcmd[2] = socketid;

	for (x = 0; x < strlen(data); x++)
	{
		c = data[x];
		if (ascii)
		{
			if ((c >= 97 && c <= 122) || (c >= 193 && c <= 218))
				c &= 95;
			else if (c >= 65 && c <= 90)
				c |= 32;
			else if (c == 13)
				c = 10;
		}
		fullcmd[x + 3] = c;
	}

	fullcmd[3 + strlen(data) + 1] = 0;

	uii_settarget(TARGET_NETWORK);
	uii_sendcommand(fullcmd, 3 + strlen(data));

	free(fullcmd);

	uii_readdata();
	uii_readstatus();
	uii_accept();

	uii_target = tempTarget;

	uii_data_index = 0;
	uii_data_len = 0;
}

void uii_socketwritechar(char socketid, char one_char)
// Write a single character to a socket
// Input: socketid - the ID of the socket to write to
//        one_char - the character to write
{
	temp_string_onechar[0] = one_char;
	temp_string_onechar[1] = 0;

	uii_socketwrite(socketid, temp_string_onechar);
}

void uii_socketwrite(char socketid, char *data)
// Write data to a socket
// Input: socketid - the ID of the socket to write to
//        data - the data to write
{
	uii_socketwrite_convert_parameter(socketid, data, 0);
}

void uii_socketwrite_ascii(char socketid, char *data)
// Write ASCII data to a socket
// Input: socketid - the ID of the socket to write to
//        data - the data to write
{
	uii_socketwrite_convert_parameter(socketid, data, 1);
}

char uii_tcp_nextchar(char socketid)
// Get the next character from the TCP stream
// Input: socketid - the ID of the socket to read from
// Output: the next character read from the TCP stream
{
	char result;
	if (uii_data_index < uii_data_len)
	{
		result = uii_data[uii_data_index + 2];
		uii_data_index++;
	}
	else
	{
		do
		{
			uii_data_len = uii_socketread(socketid, DATA_QUEUE_SZ - 4);
			if (uii_data_len == 0)
				return 0; // EOF
		} while (uii_data_len == -1);
		result = uii_data[2];
		uii_data_index = 1;
	}
	return result;
}

unsigned uii_tcp_nextline_convert_parameter(char socketid, char *result, unsigned swapCase)
// Get the next line from the TCP stream with option to swap case
// Input: socketid - the ID of the socket to read from
//        result - the buffer to store the line
//        swapCase - whether to swap the case of the characters
// Output: 1 if a line was read, 0 if EOF
{
	unsigned c, count = 0;
	*result = 0;
	while ((c = uii_tcp_nextchar(socketid)) != 0 && c != 0x0A)
	{
		if (c == 0x0D)
		{
			continue;
		}
		else if (swapCase)
		{
			if ((c >= 97 && c <= 122) || (c >= 193 && c <= 218))
				c &= 95;
			else if (c >= 65 && c <= 90)
				c |= 32;
		}
		result[count++] = c;
	}
	result[count] = 0;
	return c != 0 || count > 0;
}

unsigned uii_tcp_nextline(char socketid, char *result)
// Get the next line from the TCP stream
// Input: socketid - the ID of the socket to read from
//        result - the buffer to store the line
// Output: 1 if a line was read, 0 if EOF
{
	return uii_tcp_nextline_convert_parameter(socketid, result, 0);
}

unsigned uii_tcp_nextline_ascii(char socketid, char *result)
{
	return uii_tcp_nextline_convert_parameter(socketid, result, 1);
}

void uii_reset_uiidata()
// Reset the UI data
{
	uii_data_len = 0;
	uii_data_index = 0;
	memset(uii_data, 0, DATA_QUEUE_SZ * 2);
	memset(uii_status, 0, STATUS_QUEUE_SZ);
}

void uii_tcp_emptybuffer()
// Empty the TCP buffer
{
	uii_data_index = 0;
}
