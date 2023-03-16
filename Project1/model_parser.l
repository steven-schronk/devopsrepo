%{

#include <stdio.h>
#include "model_parser.tab.h"

int yyline_num = 1;

int yyerror(); 

%}

digit   [0-9]
integer -?{digit}+
real    ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp     ({integer}|{real})[eE]-?{integer}
float   ({real}f|{real}F|{exp}f|{exp}F)

%%

-?({integer}|{real}|{exp}|{float}) { return NUMBER; }

"vec1" { return VEC1; }
"vec2" { return VEC2; }
"vec3" { return VEC3; }
"vec4" { return VEC4; }

[a-zA-Z_][a-zA-Z0-9_]{1,64} { return NAME; }

\n { return EOL; }

[ \t] { /* ignore whitespace */ }

%%

int yywrap(void) {
	return 0;
}
