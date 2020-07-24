	.cpu cortex-a72
	.fpu neon-fp-armv8

	.data
inp1:	.asciz "Enter a number: "
inp2:	.asciz "%d"

	.text
	.align 2
	.global main
	.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	@allocating array of 10 elements
	sub sp, sp, #40 @allocate array of 10
	
	mov r10, #0 @int i = 0

main_loopi:
	cmp r10, #10
	bge main_doneloopi
	
	ldr r0, =inp1 @printf("Enter a number: ") ;
	bl printf

	@scanf
	ldr r0, =inp2

	mov r1, #4
	mul r1, r10, r1
	add r1, sp, r1

	bl scanf

	add r10, r10, #1

	b main_loopi

main_doneloopi:
	@sort(a, 10)
	@a = address of a at index 0 = sp
	mov r0, sp
	mov r1, #10

	bl sort

	@printarray(a, 10)
	mov r0, sp
	mov r1, #10

	bl printarray

	sub sp, fp, #4 @resets value of sp to beginning of function
	pop {fp, pc}
