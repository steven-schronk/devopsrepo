%echo on
del lex.yy.c
del lex.yy.obj
del model_parser.obj
del model_parser.output
del model_parser.tab.c
del model_parser.tab.exe
del model_parser.tab.h
del model_parser.tab.h
del model_parser.tab.obj
bison -v --debug -d model_parser.y
flex model_parser.l
cl model_parser.tab.c lex.yy.c model_parser.c
