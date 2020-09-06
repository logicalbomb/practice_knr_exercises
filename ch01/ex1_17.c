#include <stdio.h>

#define LONG_LINE  40  /* Cutting in half for easier testing */

/* Print all lines longer than LONG_LINE */
int main()
{
	int c, buf_used;
	char buffer[LONG_LINE+1];

	buffer[LONG_LINE] = '\0';
	buf_used = 0;
	while ((c = getchar()) != EOF)
	{
		if (c == '\n')
		{
			if (buf_used >= LONG_LINE)
				printf("\n");
			buf_used = 0;
		}
		else if (buf_used < LONG_LINE)
			buffer[buf_used++] = c;
		else if (buf_used == LONG_LINE)
		{
			++buf_used;
			printf("%s%c", buffer, c);
		}
		else
			printf("%c", c);
	}
}
