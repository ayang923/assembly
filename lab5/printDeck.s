        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
numcard:	.asciz "%d "
facecard:	.asciz "%c "
nl:	.asciz "\n"
	
        .text
        .align 2
        .global printDeck
        .type printDeck, %function

printDeck:
	push {fp, lr}
	add fp, sp, #4

	@r0 is address of hand
	@r1 is length of hand

	mov r4, r0 @permanent registers
	mov r5, r1

	mov r6, #0 @i=0
beginRead:
	cmp r6, r5
	bge endRead

	mov r0, #4
	mul r0, r0, r6
	ldr r1, [r4, r0] @a[i] is in r1

	cmp r1, #10
	bgt faceCard

	ldr r0, =numcard
	bl printf

continueRead:	
	add r6, r6, #1
	b beginRead

faceCard:
	ldr r0, =facecard

	cmp r1, #11
	moveq r1, #74
	beq endCheck
	
	cmp r1, #12
	moveq r1, #81
	beq endCheck
	
	cmp r1, #13
	moveq r1, #75
	beq endCheck
	
endCheck:
	bl printf
	b continueRead
	
endRead:	
	ldr r0, =nl
	bl printf
	
	sub sp, fp, #4
	pop {fp, pc}
