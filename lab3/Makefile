checkPrime: main.o checkPrimeNumber.o
	gcc -g -o checkPrime main.o checkPrimeNumber.o

main.o: main.s
	gcc -c main.s

checkPrimeNumber.o: checkPrimeNumber.s
	gcc -c checkPrimeNumber.s

clean:
	rm *.o
