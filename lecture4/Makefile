fib: main.o fib.o
	gcc -o fib main.o fib.o

main.o: main.s
	gcc -c -g main.s

fib.o: fib.s
	gcc -c -g fib.s

clean:
	rm *.o
