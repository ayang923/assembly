@I don't know what any of the stuff with the . is. I think .L# are pointers
	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"test.c"
	.text
	.align	2
	.global	test
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	test, %function
test:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]! @value at frame pointer is stored at stack pointer-4
	add	fp, sp, #0 @fp = sp frame pointer points to current location of stack pointer
	sub	sp, sp, #12 @sp = sp+12 stack pointer points at current location + 12 bits
	str	r0, [fp, #-8] @store value at register 0 at frame pointer - 8 bits
	ldr	r2, [fp, #-8] @load value at frame pointer - 8 bits to register 2
	ldr	r3, .L3 @ load value at register 3 to pointer .L3
	smull	r1, r3, r3, r2 @I don't know
	asr	r1, r3, #2 @Math operation?
	asr	r3, r2, #31 @Math operation?
	sub	r1, r1, r3 @r1 = r1-3
	mov	r3, r1 @move value at register 1 to register 3
	lsl	r3, r3, #2 @I don't know what this does
	add	r3, r3, r1 @r3 = r3 + r1
	lsl	r3, r3, #1 @I don't know what this does
	sub	r1, r2, r3 @r1 = r2-r3
	mov	r3, r1 @move value from register 1 to register 3
	mov	r0, r3 @move value from register 3 to register 0
	add	sp, fp, #0 @stack pointer = frame pointer
	@ sp needed
	ldr	fp, [sp], #4 @I don't know what this does
	bx	lr @I don't know what this does
.L4:
	.align	2
.L3:
	.word	1717986919
	.size	test, .-test
	.section	.rodata
	.align	2
.LC0:
	.ascii	"The digit in the ones place of %d is %d\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main: @Allen Yang 012695877
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr} @I don't know what this is
	add	fp, sp, #4 @fp = sp+4 
	sub	sp, sp, #16 @sp = sp-16
	str	r0, [fp, #-16] @value at register 0 is stored at the frame pointer-16 bits
	str	r1, [fp, #-20] @value at register 1 is stored at the frame pointer-20 bits
	ldr	r3, .L7 @load stuff at pointer .L7 to register 3
	str	r3, [fp, #-8] @value at register 3 is stored at frame pointer-8
	ldr	r0, [fp, #-8] @value at frame pointer-8 is stored at r0
	bl	test @calls subroutine test
	mov	r3, r0 @places value at register 0 into register 3
	mov	r2, r3 @places values in register 3 into register 2
	ldr	r1, [fp, #-8] @ loads value at address frame pointer - 8 bit into register 1
	ldr	r0, .L7+4 @loads value at .L7 + 4 bits into register 0
	bl	printf @branches to printf subroutine 
	mov	r3, #0 @places value 0 into register 3
	mov	r0, r3 @places value at register 3 into register 0
	sub	sp, fp, #4 @sp=fp-4 stack pointer points at frame pointer - 4 bits
	@ sp needed
	pop	{fp, pc} @I don't know what this does
.L8:
	.align	2
.L7:
	.word	294
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
