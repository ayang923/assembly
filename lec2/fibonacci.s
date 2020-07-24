	@define CPU/FPU
	.cpu cortex-a72 @ for pi 4
	.fpu neon-fp-armv8 @ math coprocessor for pi 4

	@define data section
	.data

output:	 .asciz "%d\n" @output = %d\n

	@ define text section (code)
	.text
	.align 2
	.global main
	.type main, %function

main:
	@save the value of the address where this function was called
	@need to save value of lr register
	@copy lr into r4, which is general purpose register
	mov r4, lr @ r4 = lr
	mov r5, #1 @ a = 1
	mov r6, #1 @ b = 1
	@ Use r0 = i
	mov r10, #3

startFORLOOP:
	@ i <=20
	cmp r10, #20
	bgt getoutFORLOOP @quit loop if r0>20

	@ c = a+b
	add r1, r5, r6
	@ a = b
	mov r5, r6 @ r5=r6
	@ b = c
	mov r6, r1 @ r6 = r1

	@call printf for r1
	ldr r0, =output

	@calling printf does printf(r0, r1)
	bl printf

	@ i = i+1
	add r10, r10, #1 @ r10++

	b startFORLOOP

getoutFORLOOP:
	mov lr, r4 @ restore value of lr

	bx lr
	
