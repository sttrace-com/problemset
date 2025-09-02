#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_help() {
    printf("Usage:\n");
    printf("  fileutil create <filename>\n");
    printf("  fileutil write <filename> <text>\n");
    printf("  fileutil truncate <filename> <n_lines>\n");
    printf("  fileutil --help\n");
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        print_help();
        return 1;
    }

    if (strcmp(argv[1], "--help") == 0) {
        print_help();
        return 0;
    }

    if (strcmp(argv[1], "create") == 0) {
        if (argc < 3) {
            fprintf(stderr, "Missing filename\n");
            return 1;
        }
        FILE *f = fopen(argv[2], "w");
        if (!f) {
            perror("fopen");
            return 1;
        }
        fclose(f);
        printf("File '%s' created.\n", argv[2]);
        return 0;
    }

    if (strcmp(argv[1], "write") == 0) {
        if (argc < 4) {
            fprintf(stderr, "Missing arguments\n");
            return 1;
        }
        FILE *f = fopen(argv[2], "a");
        if (!f) {
            perror("fopen");
            return 1;
        }
        fprintf(f, "%s\n", argv[3]);
        fclose(f);
        printf("Wrote to '%s'.\n", argv[2]);
        return 0;
    }

    if (strcmp(argv[1], "truncate") == 0) {
        if (argc < 4) {
            fprintf(stderr, "Missing arguments\n");
            return 1;
        }
        char *filename = argv[2];
        int n = atoi(argv[3]);

        FILE *f = fopen(filename, "r");
        if (!f) {
            perror("fopen");
            return 1;
        }

        // Count total lines
        int lines = 0;
        int ch;
        while ((ch = fgetc(f)) != EOF) {
            if (ch == '\n') lines++;
        }
        rewind(f);

        // Write all but last n lines to temp file
        FILE *tmp = fopen("tmpfile.txt", "w");
        if (!tmp) {
            perror("fopen tmpfile");
            fclose(f);
            return 1;
        }

        int keep = lines - n;
        int count = 0;
        char buffer[1024];
        while (fgets(buffer, sizeof(buffer), f)) {
            if (count++ < keep) {
                fputs(buffer, tmp);
            }
        }

        fclose(f);
        fclose(tmp);

        // Replace original file
        if (remove(filename) != 0) {
            perror("remove");
            return 1;
        }
        if (rename("tmpfile.txt", filename) != 0) {
            perror("rename");
            return 1;
        }

        printf("Removed last %d lines from '%s'.\n", n, filename);
        return 0;
    }

    // Unknown command
    print_help();
    return 1;
}
