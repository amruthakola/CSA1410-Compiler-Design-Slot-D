%{
#include <stdio.h>
int line = 1;
%}

%%
\n      { printf("\n%4d ", ++line); }
.       { printf("%s", yytext); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("program.c", "r");

    if (yyin == NULL)
    {
        printf("Unable to open program.c\n");
        return 1;
    }

    printf("%4d ", line);
    yylex();

    fclose(yyin);
    return 0;
}