zipcode: main.o base.o digit_pat.o checkDigit.o
	gcc -o zipcode main.o base.o digit_pat.o checkDigit.o

main.o: main.s
	gcc -c -g main.s

base.o: base.s
	gcc -c -g base.s

digit_pat.o: digit_pat.s
	gcc -c -g digit_pat.s

checkDigit.o: checkDigit.s
	gcc -c -g checkDigit.s

clean:
	rm *.o
