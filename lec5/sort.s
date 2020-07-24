        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data

        .text
        .align 2
        .global sort
        .type sort, %function

sort:
	push {fp, lr}
	add fp, sp, #4

	@r0 = array
	@r1 = n

	mov r9, r0
	mov r8, r1

	mov r10, #0 @i

sort_loopi:
	sub r2, r8, #1
	cmp r10, r2
	bge sort_doneloopi

	add r2, r10, #1 @r2 = i+1
	mov r7, r2

sort_loopj:
	cmp r7, r8
	bge sort_doneloopj

	@a[i] > a[j]
	@swap (a+i, a+j)

	mov r0, #4
	mul r0, r0, r10 @ 4*i
	add r0, r9, r0
	ldr r2, [r0] @ value at a[i]

	mov r1, #4
	mul r1, r1, r4
	add r1, r9, r1
	ldr r3, [r1] @ value at j

	cmp r0, r1
	ble sort_else
	mov swap

else:
	add r7, r7, #1
	b sort_loopj

	sort_doneloopj
