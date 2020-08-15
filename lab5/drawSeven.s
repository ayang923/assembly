        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
digit:	.asciz "%d\n"

        .text
        .align 2
        .global drawSeven
        .type drawSeven, %function

drawSeven:
	push {fp, lr}
	add fp, sp, #4
	
	@r0 contains address in memory

	@r0 = file pointer r4
	@r0+4 = player hand address r5
	@r0+8 = computer hand address r6
	@r0+12 = how many cards have been drawn r7
	@r0+16 = cards in players hand r8
	@r0+20 = cards in computer hand r9

	ldr r4, [r0] @loading into registers
	ldr r5, [r0, #4]
	ldr r6, [r0, #8]
	ldr r7, [r0, #12]
	ldr r8, [r0, #16]
	ldr r9, [r0, #20]
	
	mov r10, #0 @i=0

beginDraw:
        cmp r10, #7
        bge endDraw

        mov r0, r4 @filpointer as parameter

        @player hand draw
        mov r1, #4
        mul r1, r10, r1
        add r1, r5, r1 @player hand is moved as parameter
        mov r2, r7 @passses in number of cards drawn

        push {r4, r5, r6, r8, r9, r10}
        bl drawCard
        mov r7, r0
        pop {r10, r9, r8, r6, r5, r4}

        mov r1, #4
        mul r1, r10, r1
        add r1, r6, r1 @computer hand is moved as parameter
        mov r2, r7 @number of cards drawn

        mov r0, r4 @file pointer

        push {r4, r5, r6, r8, r9, r10}
        bl drawCard
        mov r7, r0 @adds 1 to numbers drawn
        pop {r10, r9, r8, r6, r5, r4}

        add r10, r10, #1
        b beginDraw

endDraw:
	mov r0, r7 @returns number of cards drawn

	sub sp, fp, #4
	pop {fp, pc}
