	.cpu cortex-a72
        .fpu neon-fp-armv8

        .data
	.equ ncards, 52
	.equ ntypes, 13

digit:	.asciz "%d\n"

        .text
        .align 2
        .global main
        .type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	mov r0, #4
	mov r1, #ntypes
	mul r0, r0, r1
	sub sp, sp, r0 @allocates an array of 13 4-byte integers to keep track of how many of each card

	@initializes arrays to all 0s
	mov r0, sp @address of array
	mov r1, #ntypes @different types of cards
	bl initialize
	
	sub sp, fp, #4
	pop {fp, pc}
