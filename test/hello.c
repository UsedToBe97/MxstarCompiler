char *toString(int a) {
	char *s = malloc(256);
	int len = 0, i = 0;
	int tmp[256];
	while (a) {
		int b = a % 10;
		a /= 10;
		tmp[len++] = b;
	}
	for (i = 0; i < len; ++i) s[i] = tmp[len - 1 - i] + '0';
	s[len] = 0;
	return s;
}
int main(){
	int a=233;
	puts(toString(a));
}
