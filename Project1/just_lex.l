%{

#include <stdio.h>

#define NUMBER 400
#define CUBE 401
#define NAME 402
#define EOL 403

float yyval;

int yyerror(); 

%}

%option noyywrap

%%

[-+]?[0-9]*\.?[0-9]+ { yyval = atof(yytext); printf("->%s: %f<-\n", yytext, yyval); return NUMBER; }

"cube" {  printf("cube "); return CUBE; }

[a-zA-Z_][a-zA-Z0-9_]{1,64} { printf("name %d->%s", strlen(yytext), yytext); return NAME; }

[\r\n] { printf("eol\n"); return EOL; }

%%

void main()
{
	while(1){ yylex(); }
}