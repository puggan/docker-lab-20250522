#include <arpa/inet.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "quotes.h"

void ignoreRequest(int socketReference)
{
    fcntl(socketReference, F_SETFL, O_NONBLOCK | fcntl(socketReference, F_GETFL, 0));;
    char buffer[1000000];
    while (recv(socketReference, buffer, sizeof(buffer), 0) > 0) {
    }
}

void quoteReply(int socketReference)
{
    const char *message = "HTTP/1.1 200 ok\r\nContent-type: text/plain\r\n\r\n";
    send(socketReference, message, strlen(message), 0);
    struct dirent file = qouteFile();
    chdir("quotes/");
    FILE *fileReference = fopen(file.d_name, "r");
    char content[1000000];
    const size_t length = fread(content, 1, sizeof(content), fileReference);
    send(socketReference, content, length, 0);
    ignoreRequest(socketReference);
    fclose(fileReference);
    close(socketReference);
    chdir("../");
}

int quoteListen(const int port)
{
    int serverRef = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(port);
    bind(serverRef, (struct sockaddr *)&address, sizeof(address));
    if (listen(serverRef, 5) < 0) {
        return 2;
    }
    
    while (true) {
        socklen_t addrlength = sizeof(address);

        quoteReply(accept(serverRef, (struct sockaddr *)&address, &addrlength));
    }

    close(serverRef);
    return 0;
}

int main(const int argc, char *argv[])
{
    long port;
    if (argc < 2) {
        port = 8080;
    } else {
        port = strtol(argv[1], NULL, 10);
    }

    if (port < 0 || 65535 < port) {
        return 1;
    }

    return quoteListen((int)port);
}
