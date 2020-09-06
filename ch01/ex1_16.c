#include <stdio.h>

#define MAX_BUFFER  40  /* Keeping it artificially small for testing */

int get_line_with_ceil(char line[], int max);
void copy_line(char dest[], char source[]);

/* Count the character count in the longest line and print up to MAX_BUFFER */
int main()
{
	int c, max;
	char line[MAX_BUFFER], longest[MAX_BUFFER];

	max = 0;
	while ((c = get_line_with_ceil(line, MAX_BUFFER)) != 0)
	{
		if (max < c)
		{
			max = c;
			copy_line(longest, line);
		}
	}
	if (max > 0)
		printf("%6d : %s", max, longest);
	if (max >= MAX_BUFFER)
		printf("\n");
}

int get_line_with_ceil(char line[], int max)
{
	int c, len;

	len = 0;
	// Pull this silly math out of the loop, -1 for the '\0'
	max = max - 1;
	while ((c = getchar()) != EOF)
	{
		if (len < max)
			line[len++] = c;
		else if (len == max)
			line[len++] = '\0';
		else
			++len;

		if (c == '\n')
			return len;
	}
	return 0;
}

void copy_line(char dest[], char source[])
{
	int i;

	i = 0;
	while ((dest[i] = source[i]) != '\0')
		++i;
}
