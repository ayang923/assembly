	.cpu cortex-a72
	.fpu neon-fp-armv8

	.data
p1:	.asciz "Enter first positive integer: "
p2:	.asciz "Enter second positive integer: "
in:	.asciz "%d"
out:	.asciz "The GCD is %d\n"

	.text
	.align 2
	.global main
	.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	ldr r0, =p1
	bl printf

	sub sp, sp, #4
	ldr r0, =in
	mov r1, sp
	bl scanf
	ldr r4, [sp]  @pops first number (a) from stack into register 4

	@ldr r0, =in
	@mov r1, r4
	@bl printf <- checks input number

	ldr r0, =p2
	bl printf

	ldr r0, =in
	mov r1, sp
	bl scanf
	ldr r5, [sp] @overrides previous stack pointer with second number (b), stored in register 5

	@switches a and b if a < b
	cmp r4, r5
	blt switchAB

	@ldr r0, =in
	@mov r1, r4
	@bl printf
startLoop:
	udiv r9, r4, r5
	mul r9, r9, r5
	sub r9, r4, r9 @performs a%b and stores it in register 9

	cmp r9, #0
	beq endLoop

	mov r4, r5 @a=b
	mov r5, r9 @ b=r

	b startLoop
	
endLoop:
	ldr r0, =out
	mov r1, r5
	bl printf

	sub sp, fp, #4
	pop {fp, pc}

switchAB:
	mov r6, r4
	mov r4, r5
	mov r5, r6

	b startLoop
	


