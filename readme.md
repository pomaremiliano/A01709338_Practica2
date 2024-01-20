# A01709338 Práctica 02 TC2037

Lex Analyzer A01709338 Jorge Emiliano Pomar 


## Installation

1. install bison
2. install yacc 


## Usage

1. lex lexer.l
2. yacc -d parser.y 
3. gcc lex.yy.c y.tab.c -o lexicAnalyzer
4. ./lexicAnalyzer < example.ac
