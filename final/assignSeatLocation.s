        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
seatTaken:	.asciz "This seat is already taken\n"
        .text

        .align 2
        .global assignSeatLocation
        .type assignSeatLocation, %function

assignSeatLocation:
	push {fp, lr}
	add fp, sp, #4

	@r0 is array pointer
	@r1 is nrow
	@r2 is ncol

	mov r4, r0 @array pointer
        mov r6, r1 @nrow
        mov r7, r2 @ncol

        mul r8, r6, r7 @total elements

resetLoop:
        push {r4, r6, r7, r8}
        bl getSeatLoc
        mov r9, r0 @row in r9
	mov r10, r1 @col in r10
	
        pop {r8, r7, r6, r4}
        
	@calculating offset for row and column
	mul r0, r9, r7
	add r0, r0, r10
	mov r1, #4
	mul r0, r0, r1

	ldr r0, [r4, r0]
	cmp r0, #0
	beq invalidInput
	
        @setting price to 0

	mul r0, r9, r7 @recalculating
	add r0, r0, r10
	mov r1, #4
	mul r0, r0, r1

	mov r1, #0
        str r1, [r4, r0] @stores 0 as price
	
	b endProgram

invalidInput:
        ldr r0, =seatTaken
        bl printf
	b resetLoop

endProgram:
	mov r0, r9 @returns row and column
	mov r1, r10
	
        sub sp, fp, #4
        pop {fp, pc}
