#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "quotes.h"

struct dirent quoteFile()
{
    struct dirent selectedFile;

    DIR *directory;
    directory = opendir("quotes/");
    if (!directory) {
        return selectedFile;
    }

    srand(time(NULL));

    int index = 0;
    struct dirent *file;
    while ((file = readdir(directory)) != NULL) {
        if (file->d_type == DT_DIR) {
            continue;
        }
        if (rand() % (index + 1) == 0) {
            selectedFile = *file;
        }
        index++;
    }

    return selectedFile;
}
