	.cpu cortex-a72
	.fpu neon-fp-armv8

	.data
nl:	.asciz "\n"
true:	.asciz "X"
false:	.asciz "_"
test:	.asciz "%d\n"
prompt:	.asciz "Enter how many voting booths: "
input:	.asciz "%d"
configPrompt:	.asciz "Enter voter positions (indexed from 0), one on each line. Enter a number greater than the length to exit\n"

	.text
	.align 2
	.global main
	.type main, %function

main: @ Allen Yang 012695877
	push {fp, lr}
	add fp, sp, #4

	ldr r0, =prompt
	bl printf @prompts for number of booths

	sub sp, sp, #4
	mov r1, sp
	ldr r0, =input
	bl scanf @reads in number of booths

	pop {r5} @puts number of booths in r5

	mov r0, #4 @temporary register to store for mul

	mul r0, r5, r0 @4*booths in order to calculate how much sp must be moved in order to allocate space
	sub sp, sp, r0 @allocates space for array

	mov r0, sp @passes in address of array as argument for fillBooth
	mov r1, r5 @passes number of booths as parameter

	push {r5} @pushes booths into memory
	bl fillBooth @fills booth with 0s
	pop {r5}

	ldr r0, =configPrompt
	bl printf
	
	@sets up initial configuration
	mov r9, #0 @i=0
	mov r8, #-1 @makes sure number compared is not greater
beginLoop:

	bgt continueProgram

	sub sp, sp, #4 
	ldr r0, =input
	mov r1, sp @stores input on stack
	bl scanf
	
	pop {r8} @pops input into r8

	cmp r8, r5 @compares to see if entered number is bigger
	bgt continueProgram
	
	mov r0, sp@puts parameters in
	mov r1, r8

	push {r8, r5}
	bl insertBooth @inserts position in booth
	pop {r5, r8}
	
	b beginLoop @loops back

continueProgram:	
	
	mov r0, sp @passes in address as parameter 1
	mov r1, r5 @passes in number of booths
	bl printBooth

	mov r0, sp @passes in address as parameter 1
	mov r1, r5 @passes in number of booths

	push {r5} @stores number of booths in memory
	bl nextVisitor @ returns position of next visitor in r0
	pop {r5} @ pops number of booths back into memory
	
	mov r1, r0 @stores position in r1
	mov r0, sp @ stores address of array
	
	bl insertBooth @ inserts person at booth position

	mov r0, sp 
	mov r1, r5
	bl printBooth @ prints booth

	sub sp, fp, #4 @ moves stack pointer to position of frame pointer
	pop {fp, pc} @ pops previous frame pointer into frame pointer register and pops link register into program counter
 
