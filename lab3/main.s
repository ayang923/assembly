	.cpu cortex-a72
	.fpu neon-fp-armv8

	.data
prompt:	.asciz "Enter two positive integers: "
in:	.asciz "%d %d"
outPrompt:	.asciz "Prime numbers between %d and %d are: "
out:	.asciz "%d "
nl:	.asciz "\n"

	.text
	.align 2
	.global main
	.type main, %function

main:
	push {fp, lr} @stores link register and frame pointer in memory
	add fp, sp, #4 @frame pointer points to address where lr is stored

	ldr r0, =prompt @loads prompt string into r0
	bl printf @calls printf to print prompt

	ldr r0, =in @loads input string
	sub sp, sp, #4 @ moves stack pointer down one position
	mov r1, sp @ loads address of stack pointer into r1 (n1)

	sub sp, sp, #4 @ moves sp down one position
	mov r2, sp @ loads address of sp into r2 (n2)

	bl scanf @ scanf in order to get n1 and n2

	ldr r0, =outPrompt
	ldr r1, [sp, #4] @ loads n1 into r1
	ldr r2, [sp] @ loads n2 into r2
	bl printf @ calls printf

	ldr r5, [sp, #4] @ i=n1
	add r5, r5, #1 @ i=n1+1

	ldr r6, [sp] @ r6=n2

beginForLoop:
	cmp r5, r6 @i<n2 comparison
	bge endForLoop

	mov r0, r5 @ checkPrimeNumber(i)
	bl checkPrimeNumber @ returns if it is prime in r0

	cmp r0, #1 @checks if flag is 1
	beq printNum
	
continueLoop:
	add r5, r5, #1
	b beginForLoop

endForLoop:
	ldr r0, =nl
	bl printf
	
	sub sp, fp, #4
	pop {fp, pc}

printNum:
	mov r1, r5
	ldr r0, =out

	bl printf
	b continueLoop

	
