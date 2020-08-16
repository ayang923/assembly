        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
        .equ ncards, 52
goFishPrompt:	.asciz "Go Fish! Draw a Card\n"
invalidCardPrompt:	.asciz "Please choose a card that can be paired up\n"
test:	.asciz "%d\n"
bookCard:	.asciz "Yes. I have a %d\n"
	

        .text
        .align 2
        .global askForCard
        .type askForCard, %function

askForCard:
	push {fp, lr}
	add fp, sp, #4

	@r1 card being asked
	@r0 - stack pointer to data

	mov r7, r0 @sp - length of asking, sp + 4 - length of giving, sp + 8 - filepointer, sp + 12 -- total number of cards drawnn
	mov r6, r1  @card number

	ldr r4, [r7, #20] @address of asking
	ldr r5, [r7, #16] @address of receiving
	
	mov r8, #0 @i=0
startCheckOwnHand:
	ldr r0, [r7] @loads length of own hand
	cmp r8, r0
	bge invalidCard

	mov r0, #4
	mul r0, r0, r8
	ldr r0, [r4, r0] @loads card from player hand

	cmp r0, r6
	beq checkOpponentDeck @checks if card is in player hand

	add r8, r8, #1
	b startCheckOwnHand

invalidCard:
	ldr r0, =invalidCardPrompt
	bl printf
	mov r0, #0 @returns false
	b endProgram

checkOpponentDeck:	
	mov r8, #0 @i=0

startLoop:
	ldr r0, [r7, #4]
	cmp r8, r0
	bge goFish

	mov r0, #4
	mul r0, r0, r8
	ldr r0, [r5, r0]

	cmp r0, r6
	beq giveCard

	add r8, r8, #1
	b startLoop

goFish:
	ldr r0, =goFishPrompt @prints onto console
	bl printf

	mov r0, r4
	ldr r1, [r7]
	add r1, r1, #1
	str r1, [r7] @stores new length in memory
	
	mov r2, #4
	mul r1, r1, r2 @calculating new size for reallocation

	bl realloc @adds 1 card to asker hand
	mov r4, r0 @new pointer address
	str r4, [r7, #20] @stores new address in memory
	
	ldr r0, [r7, #8] @file pointer

	ldr r1, [r7]
	sub r1, r1, #1
	mov r2, #4
	mul r1, r2, r1
	add r1, r1, r4 @calculates position of new card

	ldr r2, [r7, #12] @total number of cards
	cmp r2, #ncards
	bllt drawCard @draws card
	str r0, [r7, #12] @stores total number of cards drawn

	mov r0, #1 @returns true
	b endProgram

giveCard:
	ldr r0, =bookCard
	bl printf

	@reallocation of asker hadn
	mov r0, r4
	ldr r1, [r7]
	add r1, r1, #1
	str r1, [r7] @increases size of hand

	mov r2, #4
	mul r1, r1, r2 @calculates new size for reallocation

	bl realloc
	mov r4, r0
	str r4, [r7, #20] @stores new address in memory

	@transfer of card from opponent to asker

	@puts card in asker
	ldr r0, [r7] @size of asker hand, putting card in last position
	sub r0, r0, #1 @index
	mov r1, #4
	mul r0, r0, r1 @offsett from position

	str r6, [r4, r0] @stores new card at last position

	@removes card from opponent
	ldr r0, [r7, #4]
	sub r0, r0, #1
	str r0, [r7, #4] @stores new length in stack

	@last card already has correct index
	mov r2, #4
	mul r0, r2, r0 @calculates offset
	ldr r1, [r5, r0] @loads last card

	mov r2, #4
	mul r0, r8, r2 @offset of current position
	str r1, [r5, r0]
	
	mov r0, #2 @returns 2 if not gofish

	b endProgram
	
endProgram:
	sub sp, fp, #4
	pop {fp, pc}
