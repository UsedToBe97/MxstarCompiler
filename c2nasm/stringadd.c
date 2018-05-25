#include<stdio.h>
char *stringadd(char *a, char *b) {
	char *c = malloc(256);
	int la = 0, lb = 0, i;
	while (a[la] != 0) {
		c[la] = a[la];
		++la;
	}
	while (b[lb] != 0) {
		c[lb + la] = b[lb];
		++lb;
	}
	c[la + lb] = 0;
	return c;	
}
int main(){
	char a[111],b[111];
	scanf("%s%s",a,b);
	puts(stringadd(a,b));
}
