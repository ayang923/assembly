        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
digit:  .asciz "%d\n"

        .text
        .align 2
        .global shuffle
        .type shuffle, %function

shuffle:
	push {fp, lr}
	add fp, sp, #4

	@r0=file pointer r1=number of cards @r2=address of first element
	mov r8, r0
	mov r9, r1
	mov r10, r2 @moved to more permanent registers

	@reseeds random number generator
	mov r0, #0
	bl time
	bl srand

	mov r4, #0 @i=0

startLoop:
	cmp r4, r9
	bge endLoop @checks loop

	bl rand @places random number in r0
	mov r1, #13
	bl modulo @r0 % r1 generates random number from 0-12 in r0

	mov r1, #4	
	mul r1, r1, r0
	ldr r2, [r10, r1] @loads number of cards of that type

	cmp r2, #4
	bge startLoop

	add r7, r0, #1 	@0-12 -> 1-13
	add r2, r2, #1 @adds 1 to card count
	str r2, [r10, r1] @stores in array containing # of cards

	mov r0, r8 @file pointer
	mov r2, r7
	ldr r1, =digit
	bl fprintf

	add r4, r4, #1 @i++
	b startLoop

endLoop:	
	sub sp, fp, #4
	pop {fp, pc}
