#define VERTSTORE_MAX 10

typedef struct {
	float x;
	float y;
	float z;
} vec3;

typedef struct {
	float x;
	float y;
	float z;
	float r;
	float g;
	float b;
} vertex;

typedef struct {
	int max;		// used to know when to stop drawing verts
	int next;
	float vertex[VERTSTORE_MAX];
} vertstore;

void print_vertstore();

// add new cube to vertstore
// vectors are two opposite corners of mesh
int add_cube(vertstore* v, vec3 a, vec3 b);

vertstore create_vertstore();
