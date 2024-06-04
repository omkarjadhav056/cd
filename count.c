#include <stdio.h>
#include <ctype.h>

void countFile(FILE *fp, int *lines, int *tabs, int *spaces, int *words, int *chars) {
    char c;
    int inWord = 0;
    *lines = *tabs = *spaces = *words = *chars = 0;

    while ((c = fgetc(fp)) != EOF) {
        (*chars)++;
        if (c == '\n') {
            (*lines)++;
        } else if (c == '\t') {
            (*tabs)++;
        } else if (c == ' ') {
            (*spaces)++;
        }

        if (isspace(c)) {
            inWord = 0;
        } else if (!inWord) {
            inWord = 1;
            (*words)++;
        }
    }
}

int main() {
    FILE *fp = fopen("input.txt", "r");
    if (fp == NULL) {
        printf("Could not open file.\n");
        return 1;
    }

    int lines, tabs, spaces, words, chars;
    countFile(fp, &lines, &tabs, &spaces, &words, &chars);

    printf("Lines: %d\n", lines);
    printf("Tabs: %d\n", tabs);
    printf("Spaces: %d\n", spaces);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", chars);

    fclose(fp);
    return 0;
}
