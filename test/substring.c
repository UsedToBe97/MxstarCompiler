#include<stdio.h>

char* stringsubstring(char *s, int a, int b) {
	char *c = malloc(256);
	int t = b - a + 1, i;
	for (i = 0; i < t; ++i) c[i] = s[i + a];
	c[t] = 0;
	return c;
}


int main(){
	char s[111];
	scanf("%s", s);
	puts(stringsubstring(s, 1, 3));
	//puts();
}
