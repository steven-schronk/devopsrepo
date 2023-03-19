#include <stdio.h>
#include "model_parser.h"

extern FILE * yyin;
extern char* name;

vertstore v;
int vertex_counter = 0;

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
	printf("\nadd_vertex_yyval: %f\n",x);
	v.vertex[vertex_counter++] = x;
	if (vertex_counter > VERTSTORE_MAX-1) { vertex_counter = 0; }
}

int add_cube(vertstore* v, vec3 a, vec3 b) {
	if (v->next + 6 < VERTSTORE_MAX) {
		v->vertex[v->next++]   = a.x;
		//printf("v->vertex[%d] = %f\n", v->next, v->vertex[v->next]);
		v->vertex[v->next++] = a.y;
		//printf("v->vertex[%d] = %f\n", v->next, v->vertex[v->next]);
		v->vertex[v->next++] = a.z;
		//printf("v->vertex[%d] = %f\n", v->next, v->vertex[v->next]);
		v->vertex[v->next++] = b.x;
		//printf("v->vertex[%d] = %f\n", v->next, v->vertex[v->next]);
		v->vertex[v->next++] = b.y;
		//printf("v->vertex[%d] = %f\n", v->next, v->vertex[v->next]);
		v->vertex[v->next++] = b.z;
		v->max += 6;
	} else {
		printf("ERROR: Cannot add more verts to verstore");
		return -1;
	}
	return 0;
}

void test_function() {
	//printf("test_function: %f\n", yyval);
	printf("yytext: %s\n", name);

}

int main(int argc, char** argv) {
	FILE* model;
	if (argc > 1) {
		if (!(model = fopen(argv[1], "r"))) {
			printf("Cannot open file for parsing.\n");
			return 1;
		}
	}
	yyin = model;
	v = create_vertstore();

	vec3 a = { 1,2,3 };
	vec3 b = { 4,5,6 };
	
	//add_cube(&v, a, b);
	//printf("> ");
	//yyparse();
	do {
		//printf("call to parse\n");
		yyparse();
	} while (!feof(yyin));
	print_vertstore(&v);
	fclose(model);
	return;
}
