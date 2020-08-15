        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
digit:	.asciz "%d,"
test:	.asciz "%d\n"

        .text

        .align 2
        .global readSeatingChartFromFile
        .type readSeatingChartFromFile, %function

readSeatingChartFromFile:
	push {fp, lr}
	add fp, sp, #4

	@r0 is array pointer
	@r1 is nrow
	@r2 is ncol
	@r3 is file pointer

	@nonvolatile registers
	mov r4, r0 @array pointer
	mov r5, r1 @nrow
	mov r6, r2 @ncol
	mov r10, r3 @file pointer

	mul r7, r5, r6 @total numnber of elements in r7
	mov r8, #0 @i=0

	sub sp, sp, #4 @allocates space for fscanf
beginLoop:
	cmp r8, r7
	bge endLoop

	mov r0, r10 @reads in comma seperated values
	ldr r1, =digit
	mov r2, sp @stores in sp
	bl fscanf

	@calculating offset from address
	mov r0, #4
	mul r0, r8, r0
	ldr r1, [sp]

	str r1, [r4, r0] @stores in array
	
	add r8, r8, #1
	b beginLoop

endLoop:
	sub sp, fp, #4
	pop {fp, pc}
