%{
#include<stdio.h>
%}

%%
\<[^>]*\>    { printf("%s\n",yytext); }
[ \t\n]+     ;
.            ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin=fopen("sample.html","r");

    if(yyin==NULL)
    {
        printf("Unable to open sample.html\n");
        return 1;
    }

    printf("HTML Tags:\n");
    yylex();

    fclose(yyin);
    return 0;
}