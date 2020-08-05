	.cpu cortex-a72
	.fpu neon-fp-armv8

	.data

	.text
	.align 2
	.global insertBooth
	.type insertBooth, %function

insertBooth:	
	push {fp, lr}
	add fp, sp, #4

	@r0 is address of array
	@r1 is index of position with voter

	mov r3, #4
	mul r2, r1, r3

	mov r3, #1
	str r3, [r0, r2]

	sub sp, fp, #4
	pop {fp, pc}
