        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
seat:	.asciz "%d "
nl:	.asciz "\n"

        .text

        .align 2
        .global printSeats
        .type printSeats, %function

printSeats:
        push {fp, lr}
        add fp, sp, #4

        @r0 is array pinter
        @r1 is nrow
        @r2 is ncol

        mov r4, r0 @array pinter
        mov r5, r1 @nrow
        mov r6, r2 @ncol
        mul r7, r5, r6 @total elements
        mov r8, #0 @i = 0

startPrint:
	cmp r8, r7
	bge endLoop

	mov r0, #4
	mul r0, r8, r0
	ldr r1, [r4, r0]
	
	ldr r0, =seat
	bl printf

	mov r0, r8
	mov r1, r6
	bl modulo

	sub r1, r6, #1
	cmp r0, r1
	beq printNL

continueRead:	
	add r8, r8, #1
	b startPrint

printNL:
	ldr r0, =nl
	bl printf
	bl continueRead

endLoop:	
        sub sp, fp, #4
        pop {fp, pc}
