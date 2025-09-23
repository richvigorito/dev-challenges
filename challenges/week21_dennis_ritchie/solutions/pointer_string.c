#include <stdio.h>
/* mv char pointer */

main()
{
	char s[] = "hello, world";
	char *p = s;
	while (*p) putchar(*p++);
}
