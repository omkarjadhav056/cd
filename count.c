%option noyywrap
%{
#include <stdio.h>

int line_count = 0;
int tab_count = 0;
int space_count = 0;
int word_count = 0;
int character_count = 0;
%}

%%

[\t]         { tab_count++; character_count++; }
[ ]+          { space_count += yyleng; character_count += yyleng; }
\n            { line_count++; character_count++; }
[a-zA-Z]+    { word_count++; character_count += yyleng; }
.             { character_count++; }

%%

int main() {
    yyin = fopen("input.txt", "r");
    if (yyin == NULL) {
        perror("fopen");
        return 1;
    }

    yylex();

    printf("\nLines: %d\n", line_count);
    printf("Tabs: %d\n", tab_count);
    printf("Spaces: %d\n", space_count);
    printf("Words: %d\n", word_count);
    printf("Characters: %d\n", character_count);

    fclose(yyin);
    return 0;
}
