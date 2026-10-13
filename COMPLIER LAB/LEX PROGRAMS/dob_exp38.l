
%{
#include <stdio.h>
%}
%%
[0-9][0-9]"/"[0-9][0-9]"/"[0-9][0-9][0-9][0-9] printf("Valid DOB\n");
.* printf("Invalid DOB\n");
%%
int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

