
%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+[+][0-9]+ {
    printf("Addition Result = %d\n", atoi(yytext) + atoi(yytext + yyleng/2));
}

[0-9]+[-][0-9]+ {
    printf("Subtraction operation detected\n");
}

[0-9]+[*][0-9]+ {
    printf("Multiplication operation detected\n");
}

[0-9]+[/][0-9]+ {
    printf("Division operation detected\n");
}

%%

int main()
{
    printf("Enter expression: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

