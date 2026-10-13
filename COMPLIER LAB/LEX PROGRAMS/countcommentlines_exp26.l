%{
#include <stdio.h>

int count = 0;
FILE *out;
%}

%%
"//".*                  { count++; }
"/*"([^*]|\*+[^*/])*\*+"/"   { count++; }
.|\n                    { fputc(yytext[0], out); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    out = fopen("output.c", "w");

    if (out == NULL)
    {
        printf("Unable to create output file\n");
        return 1;
    }

    yyin = fopen("input.c", "r");

    if (yyin == NULL)
    {
        printf("Unable to open input file\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(out);

    printf("Number of comment lines = %d\n", count);
    printf("Comments eliminated successfully.\n");

    return 0;
}