        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
prompt:	.asciz "Enter a Price: "
input:	.asciz "%d"

	.text

        .align 2
        .global getPrice
	.type getPrice, %function

getPrice:
	push {fp, lr}
	add fp, sp, #4

	ldr r0, =prompt
	bl printf

	sub sp, sp, #4
	ldr r0, =input
	mov r1, sp
	bl scanf

	pop {r0}
	
	sub sp, fp, #4
	pop {fp, pc}
