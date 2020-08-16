goFish: main.o initialize.o shuffle.o modulo.o drawCard.o drawSeven.o printDeck.o askForCard.o
	gcc -g -o goFish main.o initialize.o shuffle.o modulo.o drawCard.o drawSeven.o printDeck.o askForCard.o

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

clean:
	rm *.o
	rm *~
