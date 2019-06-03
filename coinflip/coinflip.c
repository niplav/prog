#include <stdlib.h>
#include <stdio.h>

enum flip { HEAD, TAIL };

int p;

flip biased_flip(void)
{
}

int main(int argc, char** argv)
{
	if(argc!=2)
	{
		fprintf(stderr, "coinflip bias\n");
		exit(1);
	}

	srand(time(NULL));
}
