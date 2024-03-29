	.cpu cortex-a72
        .fpu neon-fp-armv8

        .data
nl:     .asciz "\n"
true:   .asciz "X"
false:  .asciz "_"

	.text
	.align 2
	.global fillBooth
	.type fillBooth, %function

fillBooth:
	push {fp, lr}
	add fp, sp, #4

	@r0 is the address of the array on the stack
	@r1 is the number of booths

	mov r2, #0 @i=0
	mov r3, #0 @what is being passed into booth
	mov r4, #4 @temp variable to increment array

startLoop:
	cmp r2, r1 @compares i and booths
	bge endLoop

	mul r5, r4, r2 @r5 stores position in array
	add r5, r5, r0
	str r3, [r5] @stores 0 into position on array

	add r2, r2, #1 @increments i by 1
	b startLoop

endLoop:
	sub sp, fp, #4
	pop {fp, pc}
