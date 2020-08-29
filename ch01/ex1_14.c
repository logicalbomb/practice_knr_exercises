#include <stdio.h>

/* Standard ASCII is 128 vals and anything more would be ridiculous */
#define NUM_CHARS    128
/* Since we are printing 128 vals, horizontal is the only way to go */
#define MAX_HORIZ   80.0

/* Character counter then spit out a giant histogram */
int main()
{

	int c, i, steps;
	int counters[NUM_CHARS];

	c = i = steps = 0;

	for (c = 0; c < NUM_CHARS; ++c)
		counters[c] = 0;

	while ((c = getchar()) != EOF)
		// Better safe than sorry on bounds checking
		if (c < 128 && c >= 0)
			++counters[c];

	for (c = 0; c < NUM_CHARS; ++c)
		if (i < counters[c])
			i = counters[c];

	double step_amount;
	step_amount = i / MAX_HORIZ;

	for (c = 0; c < NUM_CHARS; ++c)
	{
		printf("%2c : ", c);
		steps = (int)counters[c] / step_amount;
		
		for (i = 0; i < MAX_HORIZ; ++i)
			if (i < steps)
				printf("*");
			else if (i == steps)
				printf("|");
			else
				printf(" ");

		printf("%6d\n", counters[c]);
	}
}
