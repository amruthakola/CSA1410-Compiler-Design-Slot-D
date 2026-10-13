%{
#include <stdio.h>
%}

%%
"int"|"float"|"char"|"double"|"if"|"else"|"for"|"while"|"return"|"void" {
    printf("Keyword        : %s\n", yytext);
}

[0-9]+ {
    printf("Constant       : %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Identifier     : %s\n", yytext);
}

"=="|"!="|"<="|">="|"++"|"--" {
    printf("Operator       : %s\n", yytext);
}

"+"|"-"|"*"|"/"|"="|"<"|">" {
    printf("Operator       : %s\n", yytext);
}

"("|")"|"{"|"}"|"["|"]"|","|";" {
    printf("Special Symbol : %s\n", yytext);
}

\"[^\"]*\" {
    printf("String         : %s\n", yytext);
}

[ \t\n]+ {
}

. {
    printf("Unknown        : %s\n", yytext);
}
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

    printf("TOKENS IN THE C PROGRAM\n");
    printf("=======================\n");

    yylex();

    fclose(yyin);
    return 0;
}