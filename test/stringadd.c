#include<stdio.h>
char *stringadd(char *a, char *b) {
	char *c = malloc(256);
	int la = 0, lb = 0, i;
	while (a[la] != 0) ++la;
	while (b[lb] != 0) ++lb;
	for (i = 0; i < la; ++i) c[i] = a[i];
	for (i = la; i < la + lb; ++i) c[i] = b[i - la];
	c[la + lb] = 0;
	return c;	
}
int main(){
	char a[111],b[111];
	scanf("%s%s",a,b);
	puts(stringadd(a,b));
}
