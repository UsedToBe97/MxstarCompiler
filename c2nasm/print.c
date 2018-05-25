#include<stdio.h>

void print(char *s) {
	int cc = 0;
	while (s[cc] != 0) ++cc;
	int t = 0;
	while (s[t] != 0) {
		if (s[t] == '\\' && t + 1 < cc) {
			if (s[t + 1] == 'n') putchar('\n'),++t;
			else if (s[t + 1] == 't') putchar('\t'),++t;
			else if (s[t + 1] == '\\') putchar('\\'),++t;
			else if (s[t + 1] == '\"') putchar('\"'),++t;
			else putchar(s[t]);
		}
		else putchar(s[t]);
		++t;
	}
	
}


int main(){
	char s[22];
	scanf("%s", s);
	print(s);
	//puts();
}
