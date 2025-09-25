// producer.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 9000

int main() {
    int sock;
    struct sockaddr_in server_addr;
    char buffer[1024];

    // create socket
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        perror("socket failed");
        exit(1);
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT);
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");

    // connect to broker
    if (connect(sock, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
        perror("connect failed");
        exit(1);
    }

    printf("Connected to broker at 127.0.0.1:%d\n", PORT);
    printf("Type messages, Ctrl+D to quit\n");

    // read stdin, send lines
    while (fgets(buffer, sizeof(buffer), stdin) != NULL) {
        send(sock, buffer, strlen(buffer), 0);
    }

    close(sock);
    return 0;
}

