#include <stdio.h>
#include <stdlib.h>

#define BUF_SIZE 1024

int main(int argc, char * argv[]) {
	if (argc < 2) {
		printf("no file provided!");
		return 1;
	}
	
	FILE *file = fopen(argv[1], "r");
	if (file == NULL) {
		perror("cannot open this file!");
		return 1;
	}

	char buffer[BUF_SIZE];
	while ( fgets(buffer, sizeof(buffer), file) ) {
		printf("%s", buffer);
	}

	if (fclose(file) != 0) {
		perror("cannot close this file!");
		return 1;
	}

	return 0;

}
