@%echo off
if exist lex.yy.c             del lex.yy.c
if exist lex.yy.obj           del lex.yy.obj
if exist model_parser.obj     del model_parser.obj
if exist model_parser.output  del model_parser.output
if exist model_parser.tab.c   del model_parser.tab.c
if exist model_parser.tab.exe del model_parser.tab.exe
if exist model_parser.tab.h   del model_parser.tab.h
if exist model_parser.tab.h   del model_parser.tab.h
if exist model_parser.tab.obj del model_parser.tab.obj
win_bison -v --debug -d model_parser.y
win_flex model_parser.l
cl /nologo model_parser.tab.c lex.yy.c model_parser.c /I freeglut\include\ freeglut\lib\freeglut.lib
