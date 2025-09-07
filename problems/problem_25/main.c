#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void) {

    int codes[] = {0, 1, 127, 130};
    int n = sizeof(codes) / sizeof(codes[0]);

    srand((unsigned int)time(NULL));

    int status = codes[rand() % n];
    return status;
}
