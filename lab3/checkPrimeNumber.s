	.cpu cortex-a72
	.fpu neon-fp-armv8

	.data
test:	.asciz "%d"
	
	.text
	.align 2
	.global checkPrimeNumber
	.type checkPrimeNumber, %function

checkPrimeNumber:
	push {fp, lr}
	add fp, sp, #4

	@ n is in r0
	mov r1, #2 @j=2
	udiv r2, r0, r1 @ n/2	


startForLoop:
	cmp r1, r2 @comapres j and n/2
	bgt endForLoop

	udiv r4, r0, r1
	mul r4, r4, r1
	sub r4, r0, r4 @n%j stored in r4

	cmp r4, #0 @checks if modulo is 0
	beq zero

	mov r4, #1 @resets r4 to 1
	
	add r1, r1, #1 @increments j by 1
	b startForLoop

zero:
	mov r4, #0 @ sets flag to 0
	b endForLoop @ branches to the end of the program
	
endForLoop:
	mov r0, r4 @puts return value in r0
	
	sub fp, sp, #4
	pop {fp, pc}
