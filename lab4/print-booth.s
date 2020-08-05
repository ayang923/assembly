	.cpu cortex-a72
        .fpu neon-fp-armv8

        .data
nl:     .asciz "\n"
test:	.asciz "%d\n"
character:	.asciz "%c"
	

        .text
        .align 2
        .global printBooth
        .type printBooth, %function

printBooth:
	push {fp, lr}
	add fp, sp, #4

	@r0 is address of array
	@r1 is int booths, number of booths
	mov r8, r0 @moves variables into non volatile registers
	mov r9, r1 

	mov r6, #0 @i = 0
	mov r3, #4 @constant for array indexing

startForLoop:
	cmp r6, r9 @compares i with booths
	bge endLoop
	
	mov r3, #4	
	mul r4, r6, r3 @i*4 for indexing array

	ldr r4, [r8, r4] @loads value of array from stack

	cmp r4, #0
	beq printFalse
	bne printTrue

returnLoop:
	add r6, r6, #1 @i++
	b startForLoop

printFalse:
	ldr r0, =character
	mov r1, #95
	bl printf
	b returnLoop

printTrue:
	ldr r0, =character
	mov r1, #88
	bl printf
	b returnLoop
	
endLoop:
	ldr r0, =nl
	bl printf
	
	sub sp, fp, #4
	pop {fp, pc}
