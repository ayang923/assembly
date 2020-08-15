        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
card:	.asciz "%d"
	
        .text
        .align 2
        .global drawCard
        .type drawCard, %function

drawCard:
	push {fp, lr}
	add fp, sp, #4
	
	mov r10, r0 @file pointer
	mov r9, r1 @address of hand
	mov r8, r2 @number of cards drawn

	sub sp, sp, #4 @makes space on stack
	
	mov r0, r10 @filepointer
	ldr r1, =card @format
	mov r2, sp @stack pointer
	bl fscanf @puts next number on stack

	ldr r2, [sp] 
	str r2, [r9] @moves card into heap

	add r0, r8, #1 @returns number of cards
	
	sub sp, fp, #4
	pop {fp, pc}
