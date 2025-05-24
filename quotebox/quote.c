#include <dirent.h>
#include <stdio.h>
#include <unistd.h>
#include "quotes.h"

int main(void)
{
    char content[1000000];
    struct dirent file = quoteFile();
    chdir("quotes/");
    FILE *fileReference = fopen(file.d_name, "r");
    size_t length = fread(content, 1, sizeof(content), fileReference);
    fwrite(content, 1, length, stdout);
    fclose(fileReference);
    return 0;
}
