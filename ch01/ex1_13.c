#include <stdio.h>

#define IN_WORD      1  /* counting characters */
#define OUT_WORD     0  /* stop counting */

#define MAX_LENGTH  20  /* words larger than this will be grouped */

#define DEBUG_OUT    0  /* debug output to ensure that word counting is correct */
#define HORIZ_OUT    1  /* horizontal bars for the histogram */
#define VERT_OUT     2  /* vertical bars for the histogram */

#define HORIZ_MAX 80.0  /* max number of characters to use in the histogram horizontally */
#define VERT_MAX  20.0  /* max number of characters to use in the histogram vertically */

/* print histogram of word lengths */
int main()
{
	// Declarations
	int c, i, state, length, out;
	int lcounts[MAX_LENGTH];

	// Initializations
	out = VERT_OUT;
	state = OUT_WORD;
	length = i = 0;
	for (; i < MAX_LENGTH; ++i)
		lcounts[i] = 0;

	// Collect lengths
	while ((c = getchar()) != EOF)
	{
		// We have reached the end of a word, count it
		if ((c == ' ' || c == '\t' || c == '\n') && IN_WORD)
		{
			state = OUT_WORD;
			// NOTE: There is a case where we will count 0-length words.
			//       I don't really care about that case since I just
			//       won't print it out at the end.
			if (length >= MAX_LENGTH)
				++lcounts[MAX_LENGTH - 1];
			else
				++lcounts[length];
			length = 0;
		}
		else if (c != ' ' && c != '\t' && c != '\n')
		{
			state = IN_WORD;
			++length;
		}
	}

	// Histo math
	int j, max_count, print_steps;
	double horiz_step, vert_step;

	max_count = print_steps = 0;
	horiz_step = vert_step = 0.0;

	for (i = 1; i < MAX_LENGTH; ++i)
		if (max_count < lcounts[i])
			max_count = lcounts[i];

	horiz_step = max_count / HORIZ_MAX;
	vert_step = max_count / VERT_MAX;

	// Print out results
	if (out == DEBUG_OUT)
	{
		printf("\nHere are the counts:\n");
		for (i = 1; i < MAX_LENGTH - 1; ++i)
			printf("%3d : %6d %4d %4d\n", i, lcounts[i],
				(int)(lcounts[i] / horiz_step), (int)(lcounts[i] / vert_step));
		printf("19+ : %6d %4d %4d\n", lcounts[19],
			(int)(lcounts[19] / horiz_step), (int)(lcounts[19] / vert_step));
		printf("\nStats about the data, max: %d, horiz: %.2f, vert: %.2f\n",
			max_count, horiz_step, vert_step);
	}
	else if (out == HORIZ_OUT)
	{
		for (i = 1; i < MAX_LENGTH; ++i)
		{
			print_steps = (int)(lcounts[i] / horiz_step);
			if (i == MAX_LENGTH - 1)
				printf("19+ :");
			else
				printf("%3d :", i);

			for (j = 0; j < print_steps; ++j)
				printf("*");

			printf("| ");

			for (j = 0; j < HORIZ_MAX - print_steps; ++j)
				printf(" ");

			printf("%6d\n", lcounts[i]);	
		}
	}
	else if (out == VERT_OUT)
	{
		// Precompute the steps because this is too hard otherwise
		int steps[MAX_LENGTH];
		for (i = 1; i < MAX_LENGTH; ++i)
			steps[i] = (int)(lcounts[i] / vert_step);

		// Loop through my histogram rows
		for (i = VERT_MAX; i > 0; --i)
		{
			// Print row preamble
			printf("    ");
			// Loop through my histogram columns
			for (j = 1; j < MAX_LENGTH; ++j)
			{
				// If this is outside the range punt
				if (i > steps[j])
					printf("    ");
				// If this is the entry point draw the cap
				else if (i == steps[j])
					printf("__  ");
				// If this is inside the range fill the bar
				else
					printf("**  ");
			}
			printf("\n");
		}

		// Draw the bottom labeling
		printf("    ");
		for (i = 1; i < MAX_LENGTH - 1; ++i)
			printf("%2d  ", i);
		printf("\b19+\n");

		// Draw the precise values every third row
		for (j = 1; j < 4; ++j)
		{
			for (i = j - 1; i > 0; --i)
				printf(" ");

			for (i = 1; i < MAX_LENGTH; ++i)
			{
				if (i % 3 == j % 3)
					printf("%6d", lcounts[i]);
				else
					printf("   ");
			}
			printf("\n");
		}
	}
}
