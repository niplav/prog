#include <stdio.h>
#include <stdlib.h>
#include <time.h>

const int FAMILIES=1000000;

int main(int argc, char** argv)
{
	int i, j;
	unsigned int c;
	unsigned long long boys=0, girls=0, children=0;

	FILE* urandom=fopen("/dev/urandom", "r");
	srandom((unsigned)time(NULL)+fgetc(urandom));
	fclose(urandom);

	for(i=0; i<FAMILIES; i++)
	{
		while(boys==0||girls==0||boys!=girls)
		{
			if(j==0) c=random();
			if(c&1) boys++;
			else girls++;
			c>>=1;
			j=(j+1)%31;
		}
		children+=boys+girls;
		boys=girls=0;
	}

	printf("%.4f\n", ((double)children)/((double)FAMILIES));

	return 0;
}
