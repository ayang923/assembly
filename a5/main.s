        .cpu    cortex-a53
        .fpu    neon-fp-armv8

	.data
input:	.asciz "%d"
	
	.text
	.align 2
	.global main
	.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	sub sp, sp, #4
	ldr r0, =input
	mov r1, sp
	bl scanf

	sub sp, sp, #4
	ldr r0, =input
	mov r1, sp
	bl scanf

	sub sp, sp, #4
	ldr r0, =input
	mov r1, sp
	bl scanf

	ldr 
	
	sub sp, fp, #4
	pop {fp, pc}
