%option noyywrap
%{
#include <stdio.h>
#include <string.h>

int character_count = 0;
int word_count = 0;
int line_count = 0;

int is_comment_line(char *str) {
    return str[0] == '#';
}
%}

%%

[^#]|\n+  { /* Skip comments and count lines */
            if (!is_comment_line(yytext)) {
                character_count += yyleng;
                word_count += (strchr(yytext, ' ') == NULL); // Simple word count
                printf("%s", yytext);
            }
            line_count++;
          }

.|\n        { /* Handle any other character (error handling optional) */ }

%%

int main() {
    yyin = fopen("input.txt", "r");
    if (yyin == NULL) {
        perror("fopen");
        return 1;
    }

    yylex();

    printf("\nLines (excluding comments): %d\n", line_count);
    printf("Words: %d\n", word_count);
    printf("Characters: %d\n", character_count);

    fclose(yyin);
    return 0;
}

