%{
#include <stdio.h>

int characters = 0;
int lines = 0;
int words = 0;
%}

%%
\n              { lines++; characters++; }
[ \t]+          { characters += yyleng; }
[A-Za-z0-9_]+   { words++; characters += yyleng; }
.               { characters++; }
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

    yylex();

    printf("Number of Characters = %d\n", characters);
    printf("Number of Lines = %d\n", lines);
    printf("Number of Words = %d\n", words);

    fclose(yyin);
    return 0;
}