	.cpu cortex-a72
	.fpu neon-fp-armv8

	.data
test:	.asciz "%d\n"
	.text
	.align 2
	.global insertBooth
	.type insertBooth, %function

insertBooth:	
	push {fp, lr} @ saves pointer information
	add fp, sp, #4

	@r0 is address of array
	@r1 is index of position with voter

	mov r3, #4 @ stores constant for multiplication for indexing
	mul r2, r1, r3 @ i*4 stored into r2

	mov r3, #1 @ stores constant 1 (true) for storing
	str r3, [r0, r2] @ stores 1 at array[i]

	sub sp, fp, #4
	pop {fp, pc}
