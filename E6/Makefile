compile : parser.o main.o scanner.o
	gcc -lfl main.o parser.o scanner.o
parser.o: parser.c 
	bison -o "parser.c" validador.y
	gcc -c parser.c -lfl
scanner.o: scanner.c 
	flex -o scanner.c validador.l
	gcc -c scanner.c -lfl
main.o: main.c
	gcc -c main.c
