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
	.file	"zip-code.c"
	.text
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Enter a zip code: \000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	ldr	r0, .L9
	bl	printf
	sub	r3, fp, #28
	mov	r1, r3
	ldr	r0, .L9+4
	bl	__isoc99_scanf
	sub	r3, fp, #60
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #124
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]
	mov	r3, #4
	str	r3, [fp, #-16]
	b	.L2
.L5:
	ldr	r0, [fp, #-16]
	bl	base
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L3
	ldr	r0, [fp, #-8]
	bl	digit_pat_0
	b	.L4
.L3:
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-20]
	bl	digit_pat
.L4:
	ldr	r3, [fp, #-8]
	add	r3, r3, #5
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-16]
	bl	base
	mov	r2, r0
	ldr	r3, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L5
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	checkDigit
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L6
	ldr	r0, [fp, #-8]
	bl	digit_pat_0
	b	.L7
.L6:
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	digit_pat
.L7:
	ldr	r3, [fp, #-8]
	add	r3, r3, #5
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #124
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	strb	r2, [r3]
	sub	r3, fp, #60
	mov	r0, r3
	bl	puts
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L10:
	.align	2
.L9:
	.word	.LC2
	.word	.LC3
	.size	main, .-main
	.align	2
	.global	base
	.syntax unified
	.arm
	.fpu vfp
	.type	base, %function
base:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #1
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L12
.L13:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L12:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L13
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	base, .-base
	.section	.rodata
	.align	2
.LC0:
	.word	7
	.word	4
	.word	2
	.word	1
	.align	2
.LC1:
	.byte	58
	.byte	124
	.byte	124
	.byte	58
	.byte	124
	.byte	58
	.byte	58
	.byte	124
	.byte	58
	.byte	58
	.text
	.align	2
	.global	digit_pat
	.syntax unified
	.arm
	.fpu vfp
	.type	digit_pat, %function
digit_pat:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	ldr	r3, .L20
	sub	ip, fp, #36
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r2, .L20+4
	sub	r3, fp, #48
	ldm	r2, {r0, r1, r2}
	stmia	r3!, {r0, r1}
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-56]
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L16
.L19:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-32]
	mov	r1, r3
	ldr	r0, [fp, #-56]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L17
	ldr	r3, [fp, #-8]
	mov	r2, #124
	strb	r2, [r3]
	b	.L18
.L17:
	ldr	r3, [fp, #-8]
	mov	r2, #58
	strb	r2, [r3]
.L18:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-32]
	ldr	r3, [fp, #-56]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L16:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L19
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldrb	r2, [r3, #-44]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	strb	r2, [r3]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L21:
	.align	2
.L20:
	.word	.LC0
	.word	.LC1
	.size	digit_pat, .-digit_pat
	.section	.rodata
	.align	2
.LC4:
	.ascii	"||:::\000"
	.text
	.align	2
	.global	digit_pat_0
	.syntax unified
	.arm
	.fpu vfp
	.type	digit_pat_0, %function
digit_pat_0:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	ldr	r2, .L25
	sub	r3, fp, #16
	ldm	r2, {r0, r1}
	str	r0, [r3]
	add	r3, r3, #4
	strh	r1, [r3]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L23
.L24:
	sub	r2, fp, #16
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L23:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L24
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LC4
	.size	digit_pat_0, .-digit_pat_0
	.align	2
	.global	checkDigit
	.syntax unified
	.arm
	.fpu vfp
	.type	checkDigit, %function
checkDigit:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #4
	str	r3, [fp, #-12]
	b	.L28
.L29:
	ldr	r0, [fp, #-12]
	bl	base
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-12]
	bl	base
	mov	r2, r0
	ldr	r3, [fp, #-24]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L28:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L29
	ldr	r3, [fp, #-8]
	ldr	r2, .L31
	smull	r1, r2, r2, r3
	asr	r2, r2, #2
	asr	r3, r3, #31
	sub	r3, r2, r3
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L32:
	.align	2
.L31:
	.word	1717986919
	.size	checkDigit, .-checkDigit
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
