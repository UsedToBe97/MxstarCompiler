#include<stdio.h>

int length(char *s) {
	int cc = 0;
	while (s[cc] != 0) ++cc;
	return cc;
}
int ord(char *s, int x) {
	int y = 48 + s[x] - '0';
	return y;
}


int main(){
	char s[22];
	scanf("%s", s);
	printf("%d %d\n", length(s), ord(s, 5));
	//puts();
}
