        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
digit:	.asciz "%d"
	
        .text

        .align 2
        .global getRowCol
        .type getRowCol, %function

getRowCol:
	push {fp, lr}
	add fp, sp, #4
	
	@r0 is filepointer
	mov r4, r0 @moves into more permanent register

	mov r0, r4 @gets number of rows
	ldr r1, =digit
	sub sp, sp, #4
	mov r2, sp

	bl fscanf
	ldr r5, [sp] @saves number of rows into r5

	mov r0, r4 @gets number of columns
	ldr r1, =digit
	mov r2, sp

	bl fscanf
	pop {r6} @pops columns into r6

	mov r0, r5 @returns number of rows in r0
	mov r1, r6 @returns number of columns in r1
	
	sub sp, fp, #4
	pop {fp, pc}
