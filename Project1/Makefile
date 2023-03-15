
all:
	model_parser

model_parser: model_parser.tab.c
	gcc lex.yy.c model_parser.tab.c -o model_parser.exe

model_parser.tab.c model_parser.tab.h: lex.yy.c
	bison --debug -d model_parser.y

lex.yy.c:
	flex model_parser.l

clean:
	rm -f lex.yy.c model_parser.tab.c model_parser.tab.h model_parser.exe
