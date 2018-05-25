#include<stdio.h>

int parseInt(char *s) {
	char *c = malloc(256);
	int t = 0, x = 0;
	while (s[t] != 0 && !(s[t] >= 0 && s[t] <= '9')) ++t;
	while (s[t] >= '0' && s[t] <= '9') {
		x = x * 10 + s[t] - '0';
		++t;
	}
	return x;
}


int main(){
	char s[111];
	scanf("%s", s);
	printf("%d\n", parseInt(s));
	//puts();
}
