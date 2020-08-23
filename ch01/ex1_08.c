#include <stdio.h>

/* counts blanks, tabs, and  newlines */
int main()
{
	int c, nb, nt, nl;

	nb = 0;
	nt = 0;
	nl = 0;
	while ((c = getchar()) != EOF)
	{
		if (c == ' ')
			++nb;
		else if (c == '\t')
			++nt;
		else if (c == '\n')
			++nl;
	}
	printf("\nThere were %d blank(s), %d tab(s), and %d line(s).\n", nb, nt, nl);
}
