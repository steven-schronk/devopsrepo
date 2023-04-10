#define VERTSTORE_MAX 6

typedef struct {
	int max;		// used to know when to stop drawing verts
	int next;
	float vertex[VERTSTORE_MAX];
} vertstore;

void print_vertstore();

// add new cube to vertstore
// vectors are two opposite corners of mesh
int add_cube(vertstore* v);

vertstore create_vertstore();

void add_vertex(float x);