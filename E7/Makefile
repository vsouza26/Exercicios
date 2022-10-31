compile : parser.o main.o scanner.o expr.o
	gcc -lfl main.o parser.o scanner.o expr.o
parser.o: parser.c 
	bison -o "parser.c" expression-tree.y
	gcc -c parser.c -lfl
scanner.o: scanner.c
	bison --defines=token.h expression-tree.y 
	flex -o scanner.c expression-tree.l
	gcc -c scanner.c -lfl
main.o: main.c
	gcc -c main.c
expr.o: expr.c
	gcc -c expr.c
