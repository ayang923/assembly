	.cpu cortex-a72
        .fpu neon-fp-armv8

        .data
	.equ ncards, 52
	.equ ntypes, 13

digit:	.asciz "%d\n"
fileName:	.asciz "deck.dat"
rwIOw:	.asciz "w"
rwIOr:	.asciz "r"
digitInput:	.asciz "%d"
	
        .text
        .align 2
        .global main
        .type main, %function

main: @Allen Yang 012695877
	push {fp, lr}
	add fp, sp, #4

	mov r0, #4
	mov r1, #ntypes
	mul r0, r0, r1
	sub sp, sp, r0 @allocates an array of 13 4-byte integers to keep track of how many of each card

	@initializs arrays to all 0s
	mov r0, sp @address of array
	mov r1, #ntypes @different types of cards
	bl initialize

	@shuffles deck of cards
	ldr r0, =fileName
	ldr r1, =rwIOw
	bl fopen @file pointer at r0
	mov r4, r0 @file pointer at r4

	@shuffles cards and outputs to deck.dat

	mov r0, r4 @file pointer
	mov r1, #ncards @length of deck
	mov r2, sp @address of array

	push {r4} @saves file pointer address of stack
	bl shuffle
	pop {r4} @pops address from stack

	mov r7, #0 @tells how many cards have been drawn
	
	@drawing initial cards
	@7 cards, each integer is 4 bytes
	mov r0, #28
	bl malloc @allocates 28 bytes of memory for player hand
	mov r5, r0 @stores player hand address at r5
	mov r8, #7 @cards in player hand
	
	mov r0, #28
	bl malloc @allocates 28 bytes of memory for computer hand
	mov r6, r0 @stores computer hand address at r6
	mov r9, #7 @Cards in computer hand
	
	mov r0, r4
	bl fclose @closes file for writing

	ldr r0, =fileName
	ldr r1, =rwIOr
	bl fopen
	mov r4, r0 @opens file in read mode and stores pointer in r4

	push {r9, r8, r7, r6, r5, r4}
	mov r0, sp @passes pointer to data as parameter

	bl drawSeven
	pop {r4, r5, r6, r7, r8, r9}

	mov r7, r0 @numbers of cards drawn is stored in r7

        @allocats space for pairs
        mov r0, #4
        bl malloc
        push {r0} @space for human pairs

	mov r0, #4
	bl malloc
	push {r0} @space for computer pairs

	mov r0, #0
	push {r0} @number of human pairs

	mov r1, #0
	push {r0} @number of computer pairs
	
	@Starts Game

	push {r5}
	push {r6}
	push {r7}
	push {r4}
	push {r8}
	push {r9}

	mov r0, sp

	bl gameDriver

	ldr r4,	[sp, #8]
	
	mov r0, r4
	bl fclose

	sub sp, fp, #4
	pop {fp, pc}
