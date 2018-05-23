#include<stdio.h>

char* getString() {
	char s[256];
	gets(s);
	char *c = malloc(256);
	int t = 0;
	while (s[t] != 0) ++t;
	int i = 0;
	for (i = 0; i < t; ++i) c[i] = s[i];
	c[t] = 0;
	return c;
}


int main(){
	puts(getString());
	//puts();
}
