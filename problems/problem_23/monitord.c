#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
    char *script = "./script.py";
    char *args[] = {script, NULL};

    // Replace this process with script.py
    execvp(script, args);

    // If execvp returns, it failed
    perror("execvp failed");
    return EXIT_FAILURE;
}
