#include<stdio.h>

void print(char *s) {
	int cc = 0;
	while (s[cc] != 0) {
		putchar(s[cc]);
		++cc;
	}
}


int main(){
	char s[22];
	scanf("%s", s);
	print(s);
	//puts();
}
