%{

#define YYDEBUG 1

int yyerror(); 

#include <string.h>
#include <stdio.h>

extern int yyline_num;

float variables[8];

%}

%error-verbose

%union {
	float dx;
}

%type <dx> NUMBER

%token VEC1
%token VEC2
%token VEC3
%token VEC4
%token NUMBER
%token NAME
%token EOL
%token CUBE
%token END



%%


program :
	| program NUMBER EOL { printf("ZZZ %f ZZZ", $2); }
	| program VEC1 NAME NUMBER EOL
	| program VEC2 NAME NUMBER NUMBER EOL
	| program VEC3 NAME NUMBER NUMBER NUMBER EOL
	| program VEC4 NAME NUMBER NUMBER NUMBER NUMBER EOL
	| program CUBE NAME NUMBER NUMBER NUMBER NUMBER NUMBER NUMBER NUMBER NUMBER EOL { test_function(); }
	| END
	;

%%

int yyerror(char * s)
{
  fprintf(stderr, "line %d: %s\n", yyline_num, s);
  return 0;
}
