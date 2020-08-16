goFish: main.o initialize.o shuffle.o modulo.o drawCard.o drawSeven.o printDeck.o askForCard.o findPairs.o printPairs.o gameDriver.o
	gcc -g -o goFish main.o initialize.o shuffle.o modulo.o drawCard.o drawSeven.o printDeck.o askForCard.o findPairs.o printPairs.o gameDriver.o

main.o: main.s
	gcc -c -g main.s

initialize.o: initialize.s
	gcc -c -g initialize.s

shuffle.o: shuffle.s
	gcc -c -g shuffle.s

modulo.o: modulo.s
	gcc -c -g modulo.s

drawCard.o: drawCard.s
	gcc -c -g drawCard.s

drawSeven.o: drawSeven.s
	gcc -c -g drawSeven.s

printDeck.o: printDeck.s
	gcc -c -g printDeck.s

askForCard.o: askForCard.s
	gcc -c -g askForCard.s

findPairs.o: findPairs.s
	gcc -c -g findPairs.s

printPairs.o: printPairs.s
	gcc -c -g printPairs.s

gameDriver.o: gameDriver.s
	gcc -c -g gameDriver.s

clean:
	rm *.o
	rm *~
