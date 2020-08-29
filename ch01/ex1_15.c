#include <stdio.h>

/* print Fahrenheit-Celsius table
	for fahr = 0, 20, ..., 300 */

float fahr_2_celsius(float fahr);

int main()
{
	float fahr, lower, upper, step;

	lower = 0;     /* lower limit of temperature scale */
	upper = 300;   /* upper limit */
	step = 20;     /* step size */

	printf("Temperature Table\n");
	printf("  F      C\n");

	fahr = lower;
	while (fahr <= upper) {
		printf("%3.0f %6.1f\n", fahr, fahr_2_celsius(fahr));
		fahr = fahr + step;
	}
}

float fahr_2_celsius(float fahr)
{
	return (5.0/9.0) * (fahr-32.0);
}
