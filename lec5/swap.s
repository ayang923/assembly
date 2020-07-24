        .cpu cortex-a72
        .fpu neon-fp-armv8

        .text
        .align 2
        .global swap
        .type swap, %function

swap:
	push {fp, lr}
	add fp, sp, #4

	@r0 = address of a
	@r1 = address of b

	ldr r2, [r0]
	ldr r3, [r1]
	str r3, [r0]
	str r2, [r1]

	sub sp, fp, #4
	pop {fp, pc}
