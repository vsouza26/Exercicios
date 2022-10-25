%{
   // validador: a program used to determine whether
   // a given program is standards compliant.

   #include <stdio.h>

   void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
   }

	int result;
  extern int yylex();
%}

%token TOKEN_ERROR // declarar os demais tokens
%token TOKEN_INT
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_MUL
%token TOKEN_DIV
%token TOKEN_OPENP
%token TOKEN_SEMI


%%

program: expr TOKEN_SEMI { result = $1; }
expr : expr TOKEN_PLUS term { $$ = $1 + $3; printf("addition"); }
		 | expr TOKEN_MINUS term { $$ = $1 - $3; }
		 | term
		 ;
term : term TOKEN_MUL factor { $$ = $1 * $3; }
		 | term TOKEN_DIV factor { $$ = $1 / $3; }
		 | factor
		 ;
factor : TOKEN_MINUS factor { $$ = -1*$2; }
			 | TOKEN_OPENP expr TOKEN_OPENP { $$ = $2; }
			 | TOKEN_INT  
			 ;
%%


