	.cpu cortex-a72
        .fpu neon-fp-armv8

        .data
prompt:	.asciz "Enter a zip code: "
in:	.asciz "%d"
char:	.asciz "%c"
out:	.asciz "%s\n"
newLine:	.asciz "\n"
	
        .text
        .align 2
        .global main
        .type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	ldr r0, =prompt @asks for zip code
	bl printf

	sub sp, sp, #4
	ldr r0, =in
	mov r1, sp
	bl scanf

	ldr r5, [sp]
	sub sp, sp, #128 @allocates 128 bits for 32 character array

	ldr r0, =char
	mov r1, #124
	bl printf
	
	mov r6, sp
	str r0, [r6] @stores pipe at sp colon is 58
	add r6, r6, #1

	mov r9, #4 @i=
	mov r10, r5 @temp copy of zip code4

startForLoop:
	cmp r9, #0
	blt endForLoop
	
	mov r0, r9 
	bl base @r0 = base
	mov r8, r0
	udiv r7, r10, r8 @get digit
	
	mov r0, r7

	bl digit_pat
	
	mul r8, r8, r7
	sub r10, r8 @modulo operation

	@mov r1, r7
	@ldr r0, =in
	@bl printf

	sub r9, r9, #1 @increments i
	b startForLoop
	
endForLoop:	
	bl checkDigit
	bl digit_pat

	ldr r0, =char
	mov r1, #124
	bl printf

	ldr r0, =newLine
	bl printf
	
	sub sp, fp, #4
	pop {fp, pc}

	
	
