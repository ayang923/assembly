goFish: main.o initialize.o
	gcc -g -o goFish main.o initialize.o

main.o: main.s
	gcc -c main.s

initialize.o: initialize.s
	gcc -c initialize.s

clean:
	rm *.o
