// broker.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/select.h>

#define PORT 9000
#define MAX_CLIENTS 10
#define LOG "stream.txt"

/** 
 * Working off the C solution in week1's challenge this function was added
 * to append messages to a log for streaming/persistance
 */
int writeToFile(const char *filename, const char *content) {
    FILE *filePointer; 
    filePointer = fopen(filename, "a");

    if (filePointer == NULL) {
        perror("Error opening file"); 
        return -1; 
    }

    fprintf(filePointer, "%s", content);
    fclose(filePointer);
    return 0; 
}

int main() {
    int server_fd, new_socket, client_socks[MAX_CLIENTS];
    struct sockaddr_in address;
    fd_set readfds;
    char buffer[1024];
    int max_sd, sd, activity, valread, addrlen = sizeof(address);

    // init client sockets list
    for (int i = 0; i < MAX_CLIENTS; i++) client_socks[i] = 0;

    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    bind(server_fd, (struct sockaddr*)&address, sizeof(address));
    listen(server_fd, 3);

    printf("Broker listening on port %d\n", PORT);

    while (1) {
        FD_ZERO(&readfds);
        FD_SET(server_fd, &readfds);
        max_sd = server_fd;

        for (int i = 0; i < MAX_CLIENTS; i++) {
            sd = client_socks[i];
            if (sd > 0) FD_SET(sd, &readfds);
            if (sd > max_sd) max_sd = sd;
        }

        activity = select(max_sd + 1, &readfds, NULL, NULL, NULL);

        if (FD_ISSET(server_fd, &readfds)) {
            new_socket = accept(server_fd, (struct sockaddr*)&address, (socklen_t*)&addrlen);
            for (int i = 0; i < MAX_CLIENTS; i++) {
                if (client_socks[i] == 0) {
                    client_socks[i] = new_socket;
                    break;
                }
            }
            printf("New connection\n");
        }

        for (int i = 0; i < MAX_CLIENTS; i++) {
            sd = client_socks[i];
            if (FD_ISSET(sd, &readfds)) {
                valread = read(sd, buffer, sizeof(buffer));
                if (valread <= 0) {
                    close(sd);
                    client_socks[i] = 0;
                } else {
                    buffer[valread] = '\0';
                    // fan out to all clients (including other consumers)
                    for (int j = 0; j < MAX_CLIENTS; j++) {
                        if (client_socks[j] > 0 && client_socks[j] != sd) {
                            send(client_socks[j], buffer, valread, 0);
                            writeToFile(LOG, buffer);
                        }
                    }
                }
            }
        }
    }
    return 0;
}
