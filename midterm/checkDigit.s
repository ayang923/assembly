.cpu cortex-a72
        .fpu neon-fp-armv8

        .data

        .text
        .align 2
        .global checkDigit
        .type checkDigit, %function

checkDigit:
	push {fp, lr}
	add fp, sp, #4

	@r0 is zipcode

	mov r4, r0 @ zip code
	mov r1, #0
	mov r2, #1 @ i = 1

startForLoop:
	cmp r2, #4
	blt endLoop

	mov r0, r2
        bl base @r0 = base

	udiv r3, r4, r0 @get digit

        mul r0, r0, r3
        sub r4, r0 @modulo operation

        @mov r1, r7
        @ldr r0, =in
        @bl printf

        sub r9, r9, #1 @increments i
        b startForLoop

endLoop:
	mov r3, #10
	udiv r0, r1, r3
	add r0, r0, #1

	sub r0, r0, r1

	sub sp, fp, #4
	pop {fp, pc}

	
	
	
