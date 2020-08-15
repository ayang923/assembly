        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
rowPrompt:	.asciz "Enter row number (indexed from 0): "
colPrompt:	.asciz "Enter column number (indexed from 0): "
input:	.asciz "%d"

	.text

        .align 2
        .global getSeatLoc
	.type getSeatLoc, %function

getSeatLoc:
	push {fp, lr}
	add fp, sp, #4

	ldr r0, =rowPrompt
	bl printf

	sub sp, sp, #4

	ldr r0, =input
	mov r1, sp

	bl scanf
	ldr r9, [sp]

	ldr r0, =colPrompt
	bl printf

	ldr r0, =input
	mov r1, sp

	bl scanf
	ldr r10, [sp]
	
	mov r0, r9 @rows in r0
	mov r1, r10 @columns in r1

	sub sp, fp, #4
	pop {fp, pc}
