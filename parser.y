%{
#include <stdio.h>
extern int yylex();
//void yyerror(char *s);
%}

%token FLOATDCL INTDCL ID ASSIGN INUM FNUM PLUS PRINT COMMENT

%%
program: /* empty */
   	| program statement
   	;

statement: floatdcl_statement
     	| intdcl_statement
     	| assign_statement
     	| print_statement
     	;

floatdcl_statement: FLOATDCL ID COMMENT { printf("floatdcl\n"); }
              	;

intdcl_statement: INTDCL ID COMMENT { printf("intcdl\n"); }
            	;

assign_statement: ID ASSIGN inum_statement COMMENT
            	| ID ASSIGN id_plus_fnum_statement COMMENT
            	;

inum_statement: INUM { printf("inum\n"); }
          	;

id_plus_fnum_statement: ID PLUS FNUM { printf("plus \n"); }
                  	;

print_statement: PRINT ID COMMENT { printf("comment\n"); }
           	;

%%
extern FILE *yyin;
extern int yyparse();
//extern void yyerror(char *s);

int main()
{
	do
	{
    	yyparse();
	}
	while (!feof(yyin));
	return 0;
}

//void yyerror(const char *s) {
//  fprintf(stderr, "error: %s\n", s);
//}
