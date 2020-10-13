#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

#define CHILDREN_PER_FAMILY 3

const int TITLES=200;
const int FAMILIES=200;

typedef struct {
	short int title;
	short int sex; /*0 for m, 1 for f*/
} Person;

typedef struct {
	short int title;
	Person parents[2];
	Person children[CHILDREN_PER_FAMILY];
} Family;

void shuffle(Person people[], size_t len);

void shuffle(Person people[], size_t len)
{
	size_t i, rnpos;
	Person tmp;
	for(i=0; i<len; i++)
	{
		rnpos=i+1+rand()%(len-i);
		tmp=people[i];
		people[i]=people[rnpos];
		people[rnpos]=tmp;
	}
	return;
}

int main(int argc, char** argv)
{
	int c, i, j, numofmen, numofwomen, numoffamilies, numoftitles;
	int titles[TITLES];
	Family* families=(Family*) calloc(FAMILIES, sizeof(Family));
	Person* women=(Person*) calloc(CHILDREN_PER_FAMILY*FAMILIES, sizeof(Person));
	Person* men=(Person*) calloc(CHILDREN_PER_FAMILY*FAMILIES, sizeof(Person));

	/* initialize */
	srand(time(NULL)+(int)getpid());

	numoffamilies=FAMILIES;

	for(c=0; c<numoffamilies; c++)
	{
		families[c].title=rand()%TITLES;
		families[c].parents[0].title=families[c].parents[1].title=families[c].title;
		families[c].parents[0].sex=0;
		families[c].parents[1].sex=1;
		families[c].children[0].title=families[c].children[1].title=families[c].title;
		for(i=0; i<CHILDREN_PER_FAMILY; i++)
			families[c].children[i].sex=rand()%2;
	}

	/* not actually true, but an approximation */
	numoftitles=TITLES;

	/* iterate until all titles are the same */
	for(c=0;numoffamilies>0 && numoftitles>1;c++)
	{
		/* collect women/men */
		numofmen=numofwomen=0;
		for(i=0; i<numoffamilies; i++)
			for(j=0; j<CHILDREN_PER_FAMILY; j++)
			{
				if(families[i].children[j].sex==0)
					men[numofmen++]=families[i].children[j];
				else
					women[numofwomen++]=families[i].children[j];
			}

		shuffle(men, numofmen);
		shuffle(women, numofwomen);

		/* marry and have children */
		for(numoffamilies=0; numoffamilies<numofmen && numoffamilies<numofwomen && numoffamilies<FAMILIES; numoffamilies++)
		{
			families[numoffamilies].parents[0]=men[numoffamilies];
			families[numoffamilies].parents[1]=women[numoffamilies];
			families[numoffamilies].title=men[numoffamilies].title;
			for(j=0; j<CHILDREN_PER_FAMILY; j++)
			{
				families[numoffamilies].children[j].sex=rand()%2;
				families[numoffamilies].children[j].title=families[numoffamilies].title;
			}
		}

		/* select titles */
		numoftitles=0;
		memset(titles, 0, 4*TITLES);
		for(i=0; i<numoffamilies; i++)
			titles[families[i].title]++;
		for(i=0; i<TITLES; i++)
			if(titles[i]>0)
				numoftitles++;

		printf("number of families: %d\n", numoffamilies);
		printf("number of titles: %d\n", numoftitles);
		printf("number of generations: %d\n", c);
	}

	free(women);
	free(men);
	free(families);
	return 0;
}
