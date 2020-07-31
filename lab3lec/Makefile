isPrime: main.o prime.o
	gcc -o isPrime main.o prime.o

main.o: main.s
	gcc -c -g main.s

prime.o: prime.c
	gcc -c -g prime.c

clean:
	rm *.o
