	.cpu cortex-a72
        .fpu neon-fp-armv8

        .data
        
        .text
        .align 2
        .global initialize
        .type initialize, %function

initialize:
	push {fp, lr}
	add fp, sp, #4

	@r0 is address of pointer to deck
	@r1 is length of arrays
	mov r9, r0 @moves address to more permanent register
	mov r10, r1 @moves length to more permanent register

	mov r4, #0 @i=0

beginLoop:
	cmp r4, r10 @checks i
	bge endLoop

	@calculates position of loop
	mov r1, #4
	mul r1, r4, r1 @i*4

	mov r2, #0
	str r2, [r9, r1] @a[i] = 0

	add r4, r4, #1
	b beginLoop

endLoop:	
	sub sp, fp, #4
	pop {fp, pc}
