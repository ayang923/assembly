	.cpu cortex-a72
        .fpu neon-fp-armv8

	.data
test:	.asciz "%d\n"
pairsFoundTest:	.asciz "Pairs Found\n"
	
        .text
        .align 2
	.global findPairs
        .type findPairs, %function

findPairs:
	push {fp, lr}
	add fp, sp, #4

	@r0 is address of spwith all data

	ldr r4, [r0, #36] @address of pairs
	ldr r5, [r0, #20] @address of hand
	
	mov r7, r0 @address of pointer

	mov r8, #0 @i=0
startiLoop:
	ldr r0, [r7]
	sub r0, r0, #1 @don't need to check last card
	cmp r8, r0
	bge endLoop @compares i with total length

	mov r1, #4
	mul r1, r8, r1
	ldr r10, [r5, r1] @loads value being compared to r3

	add r9, r8, #1 @j=i+1
startjLoop:
	ldr r0, [r7] @compars j to end
	cmp r9, r0
	bge endjLoop

	mov r1, #4
	mul r1, r9, r1
	ldr r1, [r5, r1] @gets a[j]

	cmp r1, r10 @compares with a[i]
	beq pairsFound

	add r9, r9, #1
	b startjLoop

endjLoop:
	add r8, r8, #1
	b startiLoop
	
pairsFound:
	ldr r1, [r7, #28] @number of pairs
	add r1, r1, #1 @adds number of pairs
	str r1, [r7, #28] @stores new number of pairs

	mov r2, #4
	mul r1, r1, r2 @space needed for that number of pairs

	mov r0, r4
	bl realloc
	mov r4, r0 @reallocates space

	str r4, [r7, #36] @stores new address
	
	ldr r0, [r7, #28]
	sub r0, r0, #1
	mov r1, #4
	mul r0, r1, r0 @indexing of last element

	str r10, [r4, r0] @stores pair number in heap

	@replaces last with second one found

	@loads last card
	ldr r0, [r7]
	sub r0, r0, #1 @indexing
	mov r1, #4
	mul r1, r0, r1
	ldr r0, [r5, r1]

	mov r1, #4
	mul r1, r1, r9 @j index
	str r0, [r5, r1]

	@replaces second to last with first found
        ldr r0,	[r7]
        sub r0,	r0, #2 @indexing for second to last
        mov r1, #4
	mul r1, r0, r1
        ldr r0,	[r5, r1]
	
        mov r1,	#4
        mul r1, r1, r8 @i index
        str r0,	[r5, r1]

	@lower length by 2
	ldr r0, [r7]
	sub r0, r0, #2
	str r0, [r7]

	
	sub r8, r8, #1 @decrements i by 1
	b endjLoop

endLoop:
	sub sp, fp, #4
	pop {fp, pc}
