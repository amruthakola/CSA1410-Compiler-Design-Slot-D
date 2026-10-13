%{
#include<stdio.h>
int macro_count=0;
int header_count=0;
%}

%%
^[ \t]*#include[ \t]*[<"][^>"]+[>"]   {header_count++;}
^[ \t]*#define[ \t]+[a-zA-Z_][a-zA-Z0-9_]* {macro_count++;}
.|\n ;
%%

int yywrap()
{
return 1;
}

int main()
{
yyin=fopen("macro.c","r");

if(yyin==NULL)
{
printf("Unable to open macro.c\n");
return 1;
}

yylex();

printf("Number of Macros defined = %d\n",macro_count);
printf("Number of Header files included = %d\n",header_count);

fclose(yyin);
return 0;
}