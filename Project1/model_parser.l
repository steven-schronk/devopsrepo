%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "model_parser.tab.h"
#include "model_parser.h"

int yyline_num = 1;
int name_length = 0;
float yyval;
char *name;

int yyerror(); 

%}

%option noyywrap

%%

[-+]?[0-9]*\.?[0-9]+ { yyval = atof(yytext); add_vertex(yyval); printf("\nLEX->%s: %f<-\n", yytext, yyval); return NUMBER; }

"vec1" { return VEC1; }
"vec2" { return VEC2; }
"vec3" { return VEC3; }
"vec4" { return VEC4; }

"cube" {  /* printf("cube "); */ return CUBE; }

[a-zA-Z_][a-zA-Z0-9_]{1,64} { name = strdup(yytext+1); /* printf("name %d->%s", strlen(yytext), yytext); */ return NAME; }

[\r\n] { /* printf("eol\n"); */ return EOL; }

%%
