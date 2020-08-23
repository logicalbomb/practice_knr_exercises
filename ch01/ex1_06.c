#include <stdio.h>

int main()
{
	int c;

	c = getchar() != EOF;
	printf("\nYour input was %d\n", c);
}
