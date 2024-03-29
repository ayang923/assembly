        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
test:	.asciz "%d\n"
	
        .text
        .align 2
        .global nextVisitor
        .type nextVisitor, %function

nextVisitor:
	push {fp, lr}
	add fp, sp, #4

	@r0 is pointer to array
	@r1 is the length of the booth
	
	mov r4, #0 @ max_length=0
	mov r5, #0 @ length=0
	mov r6, #0 @ first_i=0
	mov r7, #0 @ max_first_i=0
	mov r8, #0 @ i =0
	mov r9, r0 @moves parameters into non volatile registers, pointer to array
	mov r10, r1 @ pointer to length of booth

startForLoop:
	cmp r8, r10
	bge endLoop

	mov r3, #4 @i*4
	mul r3, r3, r8 

	ldr r3, [r3, r9] @loads array[i]

	cmp r3, #0
	beq addLength
	bne notFalse

returnLoop:
	add r8, r8, #1
	b startForLoop

addLength:
	add r5, r5, #1
	b returnLoop

notFalse:
	cmp r5, r4
	bgt switchMax

returnNotFalse:	
	mov r5, #0
	add r6, r8, #1
	b returnLoop

switchMax:
	mov r4, r5
	mov r7, r6
	b returnNotFalse

switchMaxEnd:
	mov r4, r5
	mov r7, r6
	b returnEndLoop

endLoop:
	cmp r5, r4
	bgt switchMaxEnd

returnEndLoop:	
	mov r10, #2
	udiv r0, r4, r10
	add r0, r0, r7
	sub sp, fp, #4
	pop {fp, pc}
