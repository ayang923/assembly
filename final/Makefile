assignSeats: main.o getRowCol.o readSeatingChartFromFile.o modulo.o getPrice.o getSeatLoc.o assignSeatPrice.o assignSeatLocation.o printSeats.o
	gcc -g -o assignSeats main.o getRowCol.o readSeatingChartFromFile.o modulo.o getPrice.o getSeatLoc.o assignSeatPrice.o assignSeatLocation.o printSeats.o

main.o: main.s
	gcc -c -g main.s

getRowCol.o: getRowCol.s
	gcc -c -g getRowCol.s

readSeatingChartFromFile.o: readSeatingChartFromFile.s
	gcc -c -g readSeatingChartFromFile.s

modulo.o: modulo.s
	gcc -c -g modulo.s

getPrice.o: getPrice.s
	gcc -c -g getPrice.s

getSeatLoc.o: getSeatLoc.s
	gcc -c -g getSeatLoc.s

assignSeatPrice.o: assignSeatPrice.s
	gcc -c -g assignSeatPrice.s

assignSeatLocation.o: assignSeatLocation.s
	gcc -c -g assignSeatLocation.s

printSeats.o: printSeats.s
	gcc -c -g printSeats.s

clean:
	rm *.o
	rm *~
