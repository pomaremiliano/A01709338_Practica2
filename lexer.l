%{
#include <stdio.h> 
#include "y.tab.h"
%}

%%

"floatdcl"	{ return FLOATDCL; }
"intdcl"  	{ return INTDCL; }
"print"   	{ return PRINT; }
"+"       	{ return PLUS; }
"assign"  	{ return ASSIGN; }
"//"       	{ return COMMENT; }  

[a-zA-Z_][a-zA-Z0-9_]*  { yylval = strcat(yytext); return ID; }  
[0-9]+               	{ yylval = strcat(yytext); return INUM; } 
[0-9]+\.[0-9]+       	{ yylval = strcat(yytext); return FNUM; } 

[ \t\n]+	{ /* Ignore whitespace */ }

.       	{ printf("Unexpected character: %s\n", yytext); }

%%

int yywrap() {
	return 1;
}
