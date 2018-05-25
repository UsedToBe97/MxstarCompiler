#include<stdio.h>
int getint() {
	char c = getchar();
	int x;
	scanf("%d",&x);
	return x;
}
int main(){
	int x = getint();
	printf("%d\n", x);
	//puts();
}
