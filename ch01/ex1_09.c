#include <stdio.h>

#define BLANKS_ON   1  /* We are in the middle of a string of blanks */
#define BLANKS_OFF  0  /* We are not in blank territory */

/* Copy input to output and blanks get squashed */
int main()
{
	int c, blanks;

	blanks = BLANKS_OFF;
	while ((c = getchar()) != EOF)
	{
		if (c == ' ')
		{
			if (blanks != BLANKS_ON)
			{
				blanks = BLANKS_ON;
				putchar(c);
			}
		}
		else
		{
			blanks = BLANKS_OFF;
			putchar(c);
		}
	}
}
