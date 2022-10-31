#include <stdio.h>
#include "expr.h"
extern int yyparse();
extern int result;
int main() {
    if (yyparse()==0)
		{
			printf("%d", result);
		}
    else 
       printf("Parse failed.\n"); 
}
