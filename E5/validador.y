%{
   // validador: a program used to determine whether
   // a given program is standards compliant.

   #include <stdio.h>

   void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
   }

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

program: expr TOKEN_SEMI
expr : expr TOKEN_PLUS term
		 | expr TOKEN_MINUS term
		 | term
		 ;
term : term TOKEN_MUL factor
		 | term TOKEN_DIV factor
		 | factor
		 ;
factor : TOKEN_MINUS factor
			 | TOKEN_OPENP expr TOKEN_OPENP
			 | TOKEN_INT
			 ;
%%


