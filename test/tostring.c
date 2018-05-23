#include<stdio.h>
char* toString(int x) {
	char *c = malloc(256);
	int base = 0;
	if (x == 0) {
		c[0] = '0';
		c[1] = 0;
		return c;
	} else if (x < 0) {
		c[0] = '-';
		x = -x;
		base = 1;
	}
	int a[256], cc = 0;
	while (x) {
		a[cc++] = x % 10;
		x = x / 10;
	}
	int i; 
	for (i = 0; i < cc; ++i) c[base + i] = a[cc - 1 - i] + '0';
	c[base+cc] = 0;
	return c;
}
int main(){
	int x;
	scanf("%d", &x);
	puts(toString(x));
	//puts();
}
