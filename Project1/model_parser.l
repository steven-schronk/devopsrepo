%{

#include <stdio.h>
#include "model_parser.tab.h"

int yyline_num = 1;

int yyerror(); 

%}

digit [0-9]
integer {digit}+
real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp ({integer}|{real})[eE]-?{integer}

%%

-?({integer}|{real}|{exp}) { return NUMBER; }

"vec1" { return VEC1; }

"vec2" { return VEC2; }

\n { fputs("<<newline>>\n", stderr); ++yyline_num; return EOL; }

[\t ] { /* ignore whitespace */ }

^#.*\n { ++yyline_num; }

.     yyerror("invalid character");

%%

int yywrap(void) {
	return 1;
}
