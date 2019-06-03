#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <gsasl.h>

int main(void)
{
	int count;
	char in[BUFSIZ];
	char **out;

	out=(char**) calloc(1, BUFSIZ);

	while(fgets((char*)in, BUFSIZ, stdin)!=NULL)
	{
		gsasl_md5((char*) in, strlen(in), out);
		in[strlen(in)-1]='\0';
		printf("%s ", in);
		for(count=0; count<16; count++)
			printf("%x%x", (0xF0&(*out)[count])>>4, (0xF&(*out)[count]));
		putchar('\n');
		free(*out);
	}

	return 0;
}
