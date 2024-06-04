%option noyywrap
%{
#include <stdio.h>
int vowel_count = 0;
%}

%%
[aeiouAEIOU][a-zA-Z]+   { vowel_count++; printf("%s%d", yytext, vowel_count); }
[a-zA-Z]+              { printf("%s", yytext); }
\n                     { printf("\n"); }
.                      ; // Ignore other characters

%%

int main() {
    yylex();
    printf("\nTotal words read: %d\n", vowel_count);
    return 0;
}
