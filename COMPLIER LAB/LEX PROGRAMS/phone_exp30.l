%{
#include <stdio.h>
%}

%%
[6-9][0-9]{9}    { printf("Valid Phone Number\n"); }
.*               { printf("Invalid Phone Number\n"); }
%%

int main()
{
    printf("Enter phone number: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}