	.cpu cortex-a72
	.fpu neon-fp-armv8

	.data
nl:	.asciz "\n"
true:	.asciz "X"
false:	.asciz "_"
test:	.asciz "%d\n"

	.text
	.align 2
	.global main
	.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	mov r5, #10 @booths variable, number of total booths stored in r5
	mov r0, #4 @temporary register to store for mul

	mul r0, r5, r0 @4*booths in order to calculate how much sp must be moved in order to allocate space
	sub sp, sp, r0 @allocates space for array

	mov r0, sp @passes in address of array as argument for fillBooth
	mov r1, r5 @passes number of booths as parameter

	push {r5} @pushes booths into memory
	bl fillBooth @fills booth with 0s
	pop {r5}

	mov r0, sp @passes in address as parameter 1
	mov r1, r5 @passes in number of booths
	bl printBooth

	mov r0, sp @passes in address as parameter 1
	mov r1, r5 @passes in number of booths
	push {r5} @stores number of booths in memory

	bl nextVisitor
	pop {r5}
	
	mov r1, r0 @stores position in r1
	mov r0, sp
	
	bl insertBooth

	mov r0, sp
	mov r1, r5
	bl printBooth
	
	sub sp, fp, #4
	pop {fp, pc}
