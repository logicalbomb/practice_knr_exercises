#include <stdio.h>

#define IN   1  /* in whitespace */
#define OUT  0  /* not in whitespace */

/* Output words from the input 1 per line */
int main()
{
	int c, state;

	state = OUT;
	while ((c = getchar()) != EOF)
	{
		if ((c == ' ' || c == '\t' || c == '\n') && state == OUT)
		{
			state = IN;
			putchar('\n');
		}
		else if (c != ' ' && c != '\t' && c != '\n')
		{
			state = OUT;
			putchar(c);
		}
	}
}
