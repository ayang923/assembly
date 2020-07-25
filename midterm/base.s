        .cpu cortex-a72
        .fpu neon-fp-armv8

	.data
print:	.asciz "%d"
        .text
        .align 2
        .global base
        .type base, %function

base:
	push {fp, lr}
	add fp, sp, #4

	@r0 = n
	mov r1, #0 @i = 0
	mov r3, #1 @r=1

startForLoop:
	cmp r1, r0
	bge endForLoop

	mov r4, #10 @stores constant 10 in register 3
	mul r3, r3, r4

	add r1, r1, #1
	b startForLoop

endForLoop:
	mov r0, r3 @puts return value in register 0
	sub sp, fp, #4
	pop {fp, pc}
