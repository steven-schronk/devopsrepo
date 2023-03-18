%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "model_parser.tab.h"

int yyline_num = 1;
int name_length = 0;

int yyerror(); 

%}

%option noyywrap

digit   [0-9]
integer -?{digit}+
real    ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp     ({integer}|{real})[eE]-?{integer}
float   ({real}f|{real}F|{exp}f|{exp}F)

%%

-?({integer}|{real}|{exp}|{float}) { printf("num |%e|", atof(yytext)); return NUMBER; }

"vec1" { return VEC1; }
"vec2" { return VEC2; }
"vec3" { return VEC3; }
"vec4" { return VEC4; }

"cube" {  printf("cube "); return CUBE; }

[a-zA-Z_][a-zA-Z0-9_]{1,64} { printf("name %d->%s", strlen(yytext), yytext); return NAME; }

[\r\n] { printf("eol\n"); return EOL; }

%%
