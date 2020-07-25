	.cpu cortex-a72
        .fpu neon-fp-armv8

        .data
n0:	.asciz "||:::"
n1:	.asciz ":::||"
n2:	.asciz "::|:|"
n3:	.asciz ":|::|"
n4:	.asciz ":|::|"
n5:	.asciz ":|:|:"
n6:	.asciz ":||::"
n7:	.asciz "|:::|"
n8:	.asciz "|::|:"
n9:	.asciz "|:|::"
	
	
        .text
        .align 2
        .global digit_pat
        .type digit_pat, %function

digit_pat:
	push {fp, lr}
	add fp, sp, #4
	
	@R0 = digit, r1 = pointer
	
	cmp r0, #1
	beq num1

	cmp r0,	#2
        beq num2

	cmp r0, #3
        beq num3

	cmp r0, #4
        beq num4

	cmp r0, #5
        beq num5

	cmp r0, #6
        beq num6

	cmp r0, #7
        beq num7

	cmp r0, #8
        beq num8

	cmp r0, #9
        beq num9

	cmp r0, #0
        beq num0

end:	
	sub sp, fp, #4
	pop {fp, pc}

num1:
        ldr r0, =n1
        bl printf
	b end

num2:
	ldr r0, =n2
        bl printf
	b end

num3:
	ldr r0, =n3
        bl printf
	b end
num4:
	ldr r0, =n4
        bl printf
	b end
num5:
	ldr r0, =n5
        bl printf
	b end
num6:
	ldr r0, =n6
        bl printf
	b end

num7:
	ldr r0, =n7
        bl printf
	b end
num8:
	ldr r0, =n8
        bl printf
	b end
num9:
	ldr r0, =n9
        bl printf
	b end
num0:
	ldr r0, =n0
        bl printf
	b end
