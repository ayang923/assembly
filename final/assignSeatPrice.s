        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
invalid:	.asciz "Input is Invalid\n"
test:	.asciz "%d\n"
	.text

        .align 2
        .global assignSeatPrice
	.type assignSeatPrice, %function

assignSeatPrice:
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
	bl getPrice
	mov r5, r0 @price in r5
	pop {r8, r7, r6, r4}
	mov r9, #0 @i=0

startLoop:
	cmp r9, r8
	bge invalidInput

	mov r0, #4
	mul r0, r0, r9
	ldr r2, [r4, r0]

	cmp r5, r2
	beq seatFound

	add r9, r9, #1
	b startLoop

seatFound:
	@setting price to 0
	mov r1, #0
	str r1, [r4, r0] @stores 0 as price
	
	@calculating row and column
	mov r0, r9
	mov r1, r7
	bl modulo @columns number
	mov r1, r0

	udiv r0, r9, r7 @row number
	b endProgram

invalidInput:	
	ldr r0, =invalid
	bl printf
	b resetLoop
	
endProgram:
	sub sp, fp, #4
	pop {fp, pc}
