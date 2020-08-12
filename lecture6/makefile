simCards: main.o initialize.o shuffle.o modulo.o
	gcc -o simCards main.o initialize.o shuffle.o modulo.s

main.o: main.s
	gcc -c -g main.s

initialize.o: initialize.s
	gcc -c -g initialize.s

shuffle.o: shuffle.s
	gcc -c -g shuffle.s

modulo.o: modulo.s
	gcc -c -g modulo.s
