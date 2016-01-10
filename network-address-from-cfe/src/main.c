#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <memory.h>
#include <fcntl.h>
#include <sys/stat.h>

#define PROG "network-address-from-cfe"

// ip address is at offset 0x586 in partition 3 (/dev/mtd3) on broadcom inteno box
// this program will run once after upgrade and will then be deleted by the startup
// script. It will simply read the ip address and set the address to cfe address upon 
// first boot. 

int main(void){
	char buffer[0xfff]; 
	memset(buffer, 0, sizeof(buffer)); 

	printf("%s: searching for ip address in nvram..\n", PROG); 

	int file = open("/dev/mtd3", O_RDONLY); 
	if(file < 0) {
		perror(PROG); 
		return 0; 
	}
	int count = read(file, buffer, sizeof(buffer)); 
	if(count <= 0){
		perror(PROG); 
		return 0; 
	}
	close(file); 
	char ipaddr[16] = {0}; 
	if(strncmp(buffer + 0x584, "e=", 2) != 0){
		printf("%s: could not find ip address in flash\n", PROG); 
		return 0; 
	}
	int cc = 0; 
	for(char *ch = buffer + 0x586; *ch != ':' && cc < sizeof(ipaddr); ch++, cc++){
		ipaddr[cc] = *ch; 
	}
	printf("%s: using ip address %s\n", PROG, ipaddr); 
	
	char command[255]; 
	snprintf(command, sizeof(command), "uci set network.lan.ipaddr=%s", ipaddr); 
	system(command); 
	system("uci commit"); 
	system("ubus call network reload"); 
	return 0; 
}
