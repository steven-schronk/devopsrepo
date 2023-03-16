/*
    TYPE	any of the built in types
    NUMBER  any floating point or integer number
	GROUP   any named group of numbers (recursive grouping)
	FNCALL  call to function to generate vertices
*/

%{

#define YYDEBUG 1

int yyerror(); 

#include <string.h>
#include <stdio.h>

extern int yyline_num;

%}

%error-verbose

%union {
 float value;
 char *group_name;
}

%token VEC1
%token VEC2
%token VEC3
%token VEC4
%token NUMBER
%token NAME
%token EOL

%%

program :
	| program VEC1 NAME NUMBER EOL
	| program VEC2 NAME NUMBER NUMBER EOL
	| program VEC3 NAME NUMBER NUMBER NUMBER EOL
	| program VEC4 NAME NUMBER NUMBER NUMBER NUMBER EOL
	;

%%

int yyerror(char * s)
{
  fprintf(stderr, "line %d: %s\n", yyline_num, s);
  return 0;
}

int main(void)
{
	while(1) { yyparse(); }
	return 0;
}
