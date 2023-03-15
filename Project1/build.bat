%echo on

bison -v --debug -d model_parser.y
flex model_parser.l
cl model_parser.tab.c lex.yy.c
