%{
#include<stdio.h>
%}

%%
[0-9]+\.[0-9]+    { printf("Constant: %s\n",yytext); }
[0-9]+            { printf("Constant: %s\n",yytext); }
\'[^']\'           { printf("Constant: %s\n",yytext); }
\"[^\"]*\"         { printf("Constant: %s\n",yytext); }
[ \t\n]+           ;
.                  ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin=fopen("constants.c","r");

    if(yyin==NULL)
    {
        printf("Unable to open constants.c\n");
        return 1;
    }

    printf("Constants in the C program:\n");
    yylex();

    fclose(yyin);
    return 0;
}