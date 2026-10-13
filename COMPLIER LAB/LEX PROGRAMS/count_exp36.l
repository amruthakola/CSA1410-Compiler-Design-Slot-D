%{
#include <stdio.h>

int positive = 0;
int negative = 0;
%}

%%
[+]?[0-9]+      { printf("Positive number: %s\n", yytext); positive++; }
-[0-9]+         { printf("Negative number: %s\n", yytext); negative++; }
[ \t\n]+        ;
.               ;
%%

int main()
{
    printf("Enter numbers: ");
    yylex();

    printf("\nPositive numbers count = %d\n", positive);
    printf("Negative numbers count = %d\n", negative);

    return 0;
}

int yywrap()
{
    return 1;
}