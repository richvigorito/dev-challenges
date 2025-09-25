// consumer.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 9000
#define LOG "stream.txt"

int replayPastMessages(const char *filename) {
    FILE *filePointer;
    char buffer[256];
    filePointer = fopen(filename, "r");

    if (filePointer == NULL) {
        perror("Error opening file"); 
        return -1; 
    }

    while (fgets(buffer, sizeof(buffer), filePointer) != NULL) {
        printf("%s", buffer);
    }

    fclose(filePointer);
}

int main() {
    int sock;
    struct sockaddr_in server_addr;
    char buffer[1024];
    int valread;

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


    printf("Replaying past messages...\n");
    replayPastMessages(LOG);

    printf("Waiting for messages...\n");

    // read from broker until connection closes
    while ((valread = read(sock, buffer, sizeof(buffer)-1)) > 0) {
        buffer[valread] = '\0';
        printf("Message: %s", buffer);
        fflush(stdout);
    }

    printf("\nDisconnected from broker\n");
    close(sock);
    return 0;
}
