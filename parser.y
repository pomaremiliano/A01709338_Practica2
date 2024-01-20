%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern char *yytext;
extern int yylex();
void yyerror (const char *s);
%}

%token COMMENT INT FLOAT VAR NUM ID PLUS MINUS TIMES PRINT ASSIGN

%%
program: 
   	| program statement
   	;

statement: 
	COMMENT { printf("comment\n"); }
	| FLOAT { printf("float\n"); }
	| INT { printf("int\n"); }
	| VAR { printf("var\n"); }
	| ID { printf("id\n"); }
	| PLUS { printf("plus\n"); }
	| MINUS { printf("minus\n"); }
	| TIMES { printf("times\n"); }
	| PRINT { printf("print\n"); }
	| ASSIGN { printf("assign\n"); }
	| NUM { printf("num\n"); }
	| INT ID { printf("int id\n"); }
	| FLOAT ID { printf("float id\n"); }
	| INT ID ASSIGN NUM { printf("int id assign num\n"); }
	| FLOAT ID ASSIGN NUM { printf("float id assign num\n"); }
	| INT ID ASSIGN ID { printf("int id assign id\n"); }
	| FLOAT ID ASSIGN ID { printf("float id assign id\n"); }
	| PRINT ID { printf("print id\n"); }
	| PRINT NUM { printf("print num\n"); }
	| PRINT FLOAT { printf("print float\n"); }
	| PRINT INT { printf("print int\n"); }
	| ID ASSIGN NUM { printf("id assign num\n", (strstr($3, ".") != NULL) ? "id":"num"); }
	| ID ASSIGN ID PLUS NUM{ printf("id assign id plus num\n", (strstr($3, ".") != NULL) ? "id":"num"); }
	;
%%

 
void yyerror(const char *s) {
	fprintf(stderr, "Error -> %s\n", s);
}

int main(void)
{
	yyparse();
	return 0;
}
