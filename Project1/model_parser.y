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
%token NUMBER
%token EOL

%%

program :
	| VEC1 NUMBER EOL
	| VEC2 NUMBER NUMBER EOL
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
