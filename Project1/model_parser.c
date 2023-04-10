#include <stdio.h>
#include <GL/glut.h>
#include "model_parser.h"

extern FILE * yyin;
extern char* name;

vertstore v;
FILE* model;

vertstore create_vertstore() {
	vertstore v;
	v.max = 0;
	v.next = 0;
	for (int i = 0; i < VERTSTORE_MAX; ++i) {
		v.vertex[i] = 0.0f;
	}
	return v;
}

void print_vertstore(vertstore* v) {
	printf("\nmax: %d\nnext: %d\n", v->max, v->next);
	int count = 0;
	while (count < VERTSTORE_MAX) {
		printf("%d: %f\n", count, v->vertex[count]);
		++count;
	}
}

void add_vertex(float x) {
	//printf("\nadd_vertex_yyval: %f\n",x);
	v.vertex[v.next++] = x;
}

void restart_symbols() {
	name = '\0';
	v.next = 0;
}

void load_model() {
	//printf("restarting parse\n");
	fseek(model, 0, 0);
	yyrestart(model);
	do {
		yyparse();
	} while (!feof(yyin));
	//print_vertstore(&v);
}

void draw(void)
{
	//printf("drawing\n");
	load_model();
	glClear(GL_COLOR_BUFFER_BIT);
	glBegin(GL_TRIANGLES);
	glColor3f(1, 0, 0);
	glVertex2f(v.vertex[0], v.vertex[1]);
	glColor3f(0, 1, 0);
	glVertex2f(v.vertex[2], v.vertex[3]);
	glColor3f(0, 0, 1);
	glVertex2f(v.vertex[4], v.vertex[5]);
	glEnd();
	glFlush();
}

void processNormalKeys(unsigned char key, int x, int y)
{
	//printf("%c\n", key);
	switch (key)
	{
		case 'q':
		case 'Q':
			printf("exiting");
			exit(0);
			break;
		case 'r':
		case 'R':
			printf("loading model file\n");
			load_model();
			break;
	}
}

int main(int argc, char** argv) {
	if (argc > 1) {
		if (!(model = fopen(argv[1], "r"))) {
			printf("Cannot open file for parsing.\n");
			return 1;
		}
	}
	yyin = model;
	v = create_vertstore();

	do {
		yyparse();
	} while (!feof(yyin));
	//print_vertstore(&v);
	
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE);
	glutInitWindowSize(300, 300);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("");
	glutDisplayFunc(draw);
	glutKeyboardFunc(processNormalKeys);
	glutMainLoop();
	fclose(model);
	return 0;
}
