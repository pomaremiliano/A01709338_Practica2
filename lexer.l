%{
#include <stdio.h> 
#include "y.tab.h"
extern int yylval;
%}

digit [0-9]
letter [a-zA-Z]
id {letter}({letter}|{digit})*
num {digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%

\/\/.*\n {return COMMENT;}
"i" {return INT;}
"f" {return FLOAT;}
"a" {return VAR;}
"b"	{return VAR;}
{num} {yylval = strdup(yytext); return NUM;}
{id} {yylval = strdup(yytext); return ID;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return TIMES;}
"p"	{return PRINT;}
"=" {return ASSIGN;}
[ \t\n] {;}
. {return yytext[0];}

%%

int yywrap() {
	return 1;
}
