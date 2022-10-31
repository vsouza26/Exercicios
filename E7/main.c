#include <stdio.h>
#include "expr.h"
extern int yyparse();
extern struct expr *parser_result;
int main()
{
  if (yyparse() == 0)
  {
    expr_print(parser_result);
  }
  else
    printf("Parse failed.\n");
}