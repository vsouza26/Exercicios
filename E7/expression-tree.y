%{
   // validador: a program used to determine whether
   // a given program is standards compliant.
	#include "expr.h"
	#include <stdio.h>
	#define YYSTYPE struct expr *
   void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
   }

	struct expr *parser_result = 0;
	extern char* yytext;
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
expr : expr TOKEN_PLUS term { $$ = expr_create(EXPR_ADD,$1,$3); }
		 | expr TOKEN_MINUS term { $$ = expr_create(EXPR_SUBTRACT,$1,$3); }
		 | term { $$ = $1; }
		 ;
term : term TOKEN_MUL factor { $$ = expr_create(EXPR_MULT,$1,$3); }
		 | term TOKEN_DIV factor { $$ = expr_create(EXPR_DIVIDE,$1,$3); }
		 | factor { $$ = $1; }
		 ;
factor : TOKEN_MINUS factor { $$ = expr_create(EXPR_SUBTRACT,
									expr_create_value(0),$2); }
			 | TOKEN_OPENP expr TOKEN_OPENP { $$ = $2; }
			 | TOKEN_INT { $$ = expr_create_value(atoi(yytext)); } 
			 ;
%%


