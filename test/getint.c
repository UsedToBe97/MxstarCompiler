#include<stdio.h>
int getint() {
	char c = getchar();
	int x = 0;
	while (c >= '0' && c <= '9') {
		x = x * 10 + c - '0';
		c = getchar();
	}
	return x;
}
int main(){
	int x = getint();
	printf("%d\n", x);
	//puts();
}
