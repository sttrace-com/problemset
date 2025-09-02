#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // Check if any argument is -v or --version
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-v") == 0 || strcmp(argv[i], "--version") == 0) {
            printf("v1.3.4\n");
            return 0;
        }
    }

    printf("https://www.youtube.com/watch?v=dQw4w9WgXcQ\n");
    return 0;
}
