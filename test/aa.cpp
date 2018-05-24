#include<bits/stdc++.h>
using namespace std;
int getInt() {
	int x;scanf("%d",&x);
	return x;
}
int hilo(int hi, int lo)
{
	return lo | (hi << 16);
}

int shift_l(int x, int n)
{
	return (x << n) & hilo(65535, 65535);	// 0xffff ffff
}

int shift_r(int x, int n)
{
	int tmp = hilo(32767, 65535);	// 0x7fff ffff
	tmp = ((tmp >> n) << 1) + 1;
	tmp = tmp & (x >> n);
	return tmp & hilo(65535, 65535);
}

int xorshift(int seed, int num)
{
	int x = seed + 1;
	int i;
	
	for(i=0; i<num * 10; i++)
	{
		x = x ^ shift_l(x, 13);
		x = x ^ shift_r(x, 17);
		x = x ^ shift_l(x, 5);
	}
	
	return x ^ 123456789;
}

string asciiTable = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
string int2chr(int x)
{
	printf("%d\n",x-32);
	cout<<asciiTable.substr(x-32,1)<<endl;
	if(x >= 32 && x <= 126)
		return asciiTable.substr(x-32,1);
		//.substring(x-32, x-32);
	return "";
}

string toStringHex(int x)
{
	string ret = "";
	int i;
	for(i=28;i>=0;i=i-4)
	{
		int digit = (x >> i) & 15;
		if(digit < 10)
			ret = ret + int2chr(48+digit);
		else
			ret = ret + int2chr(65+digit-10);
	}
	return ret;
}

int getnumber(int seed, int num, int y)
{
	int shift = y & 31;
	int val = xorshift(seed, num);
	return shift_l(val, shift) | shift_r(val, 32-shift);
}

int main()
{
	int l1; int r1;
	int l2; int r2;
	int l3; int r3;
	int i; int j; int k;
	
	l1 = getInt();
	r1 = getInt();
	l2 = getInt();
	r2 = getInt();
	l3 = getInt();
	r3 = getInt();
	
	int round = 30;
	
	int ans0 = 0;
	int ans1 = 0;
	int ans2 = 0;
	int ans3 = 0;
	int cc = 0;
	for(i=l1; i<r1; i++)
		for(j=l2; j<r2; j++)
			for(k=l3; k<r3; k++)
			{
				int x0 = getnumber(l1, round, k);
				int x1 = getnumber(i, round, k);
				int x2 = getnumber(j, round, k);
				int x3 = getnumber(i ^ j, round, k);
				
				int y = xorshift(k, 1) ^ xorshift(j, 1) ^ xorshift(i, 1);
				
				ans0 = ans0 + xorshift(x0 ^ y, 1);
				ans1 = ans1 + xorshift(x1 ^ y, 1);
				ans2 = ans2 + xorshift(x2 ^ y, 1);
				ans3 = ans3 + xorshift(x3 ^ y, 1);
			}
	
	cout << ans0 << " " << ans1 << " " << ans2 << " " << ans3 << endl;
	cout<<toStringHex(ans0)<< " ";
	cout<<toStringHex(ans1)<< " ";
	cout<<toStringHex(ans2)<< " ";
	cout<<toStringHex(ans3)<< " ";
	puts("");
	
	
	return 0;
}

/*!! metadata:
=== comment ===
 Testcase for Loop Invariant Optimization (also Register Allocation & Inlining) v2
=== is_public ===
True
=== assert ===
output
=== timeout ===
12.0
=== input ===
0 40
100 200
125 250

=== phase ===
optim pretest
=== output ===
C22EE30E 1CCFFFD1 587343F6 E333CAFF

=== exitcode ===
0

!!*/

