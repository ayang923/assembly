        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
outp:   .asciz "%d\n"

        .text
        .align 2
        .global printarray
        .type printarray, %function

printarray:
	@r0 = array = sp
	@r1 = n = 10
	
	push {fp, lr}
	add fp, sp, #4

	mov r9, r0
	mov r8, r1
	mov r10, #0

	b printarray_loopi

printarray_loopi:
	cmp r10, r1 @i < n
	bge printarray_doneloopi

	ldr r0, =outp
	@a[i] = sp[r9+4*i]
	mov r0, #4
	mul r0, r0, r10
	add r0, r0, r9
	ldr r1, [r0] @ r1= value at r0

	bl printf
	add r10, r10, 1

	b printarray_loopi

printarray_doneloopi:
	sub sp, fp, #4
	pop {fp, pc}
