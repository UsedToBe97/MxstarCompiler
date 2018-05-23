#include<stdio.h>

int stringeq(char *s, char *s2) {
	int t = 0, t2 = 0;
	while (s[t] != 0 && !(s[t] >= 0 && s[t] <= '9')) ++t;
	while (s2[t2] != 0 && !(s2[t2] >= 0 && s2[t2] <= '9')) ++t2;
	if (t != t2) return 0;
	int i = 0;
	for (i = 0; i < t; ++i) if (s[i] != s2[i]) return 0;
	return 1;
}

int stringl(char *s, char *s2) {
	int t = 0, t2 = 0;
	while (s[t] != 0 && !(s[t] >= 0 && s[t] <= '9')) ++t;
	while (s2[t2] != 0 && !(s2[t2] >= 0 && s2[t2] <= '9')) ++t2;
	int p = t > t2 ? t2 : t;
	int i = 0;
	for (i = 0; i < p; ++i) {
		if (s[i] < s2[i]) return 1;
		if (s[i] > s2[i]) return 0;
	}
	if (t >= t2) return 0;
	return 1;
}

int stringg(char *s, char *s2) {
	int t = 0, t2 = 0;
	while (s[t] != 0 && !(s[t] >= 0 && s[t] <= '9')) ++t;
	while (s2[t2] != 0 && !(s2[t2] >= 0 && s2[t2] <= '9')) ++t2;
	int p = t > t2 ? t2 : t;
	int i = 0;
	for (i = 0; i < p; ++i) {
		if (s[i] > s2[i]) return 1;
		if (s[i] < s2[i]) return 0;
	}
	if (t <= t2) return 0;
	else return 1;
}

int main(){
	//puts();
}
