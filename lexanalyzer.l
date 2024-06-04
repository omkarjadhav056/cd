%option noyywrap
%{
#include <stdio.h>
#include <string.h>
%}

%%
[ \t\n]+ ; 

"//"(.*) ; 
"/*"([^*]|"*"+[^*/])*"*"+"/" ; 

[0-9]+ { printf("Integer: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* {
    if (strlen(yytext) <= 32) {
        printf("Identifier: %s\n", yytext);
    } else {
        printf("Identifier (Truncated): %.32s\n", yytext);
    }
}
[+\-*/=<>] { printf("Operator: %s\n", yytext); }
\"([^\\\"]|\\.)*\" { printf("String Literal: %s\n", yytext); }
. ; 

%%

int main() {
    yylex();
    return 0;
}


how to run;

1. flex file_name.l
2. gcc lex.yy.c
3. ./a.exe
