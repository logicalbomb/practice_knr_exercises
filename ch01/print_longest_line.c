#include <stdio.h>
#define MAXLINE 1000   /* maximum input line length */

int get_a_line(char line[], int maxline);
void my_copy(char to[], char from[]);

/* print the longest input line */
/* NOTE: the text as written had some flaw, so this is slightly different */
int main()
{
	int len;               /* current line length */
	int max;               /* maximum length seen so far */
	char line[MAXLINE];    /* current input line */
	char longest[MAXLINE]; /* longest line saved here */

	max = 0;
	while ((len = get_a_line(line, MAXLINE)) > 0)
	{
		if (len > max && len < MAXLINE)
		{
			max = len;
			//printf("MAIN: line -> %s", line);
			my_copy(longest, line);
		}
	}
	if (max > 0)  /* there was a line */
		printf("%d : %s", max, longest);
	return 0;
}

/* get_a_line:  read a line into s, return length */
int get_a_line(char s[], int lim)
{
	int c, i;

	for (i = 0; i < lim - 1; ++i)
	{
		if ((c = getchar()) == EOF)
		{
			//printf("G_A_L: EOF!\n");
			s[i] = '\0';
			return 0;
		}
		s[i] = c;
		if (c == '\n')
		{
			s[++i] = '\0';
			//printf("G_A_L: line length is %d\n", i);
			return i;
		}
	}
	// The line was too long, give up
	return -1;
}

/* my_copy:  copy 'from' into 'to'; assume to is big enough */
void my_copy(char to[], char from[])
{
	int i;

	i = 0;
	while ((to[i] = from[i]) != '\0')
		++i;
}
