	.cpu cortex-a72
        .fpu neon-fp-armv8

        .data
        .equ ncards, 52
        
digit:  .asciz "%d\n"
digitInput:     .asciz "%d"
pressEnter:	.asciz "Enter any character to continue\n"
charInput:	.asciz "%s"
hand:	.asciz "Your (playable) hand: "
pairs:	.asciz "Your pairs: "
computerPairs:	.asciz "Computer's pairs: "
turnNum:	.asciz "Turn %d\n"
askPlayer:	.asciz "What card would you like to ask for?: "
gapSpace:	.asciz "\n\n\n\n"
computerSays:	.asciz "Computer says: "
computerAsks:	.asciz "Computer asks for a "
youSay:	.asciz "You say: "
cardsDrawn:	.asciz "# of cards drawn: "

        .text
        .align 2
        .global gameDriver
        .type gameDriver, %function

gameDriver:
	push {fp, lr}
	add fp, sp, #4

	@r0 is all the data
	mov r7, r0

	mov r8, #1 @turn # is 0
startLoop:

	@Prints information for turn
	mov r1, r8
	ldr r0, =turnNum
	bl printf
	push {r8}

	ldr r0, =cardsDrawn
	bl printf
	
        ldr r0, =digit
        ldr r1, [r7, #12]
        bl printf
	
	@find initial pairs for player
	mov r0, r7 @default configuration for player

	push {r7} @save data pointer into memory, sp is now at r7
	bl findPairs
	ldr r7, [sp] @restores stack pointer
	ldr r8, [sp, #4]

	ldr r0, =hand
	bl printf
	
	ldr r0, [r7, #20] @printDeck doesn't use r7
	ldr r1, [r7]
	bl printDeck @prints deck

	ldr r0, =pairs
	bl printf
	
	ldr r0, [r7, #36]
	ldr r1, [r7, #28]
	bl printPairs @prints pairs

	@prints computer pairs
	ldr r0, =computerPairs
	bl printf

	bl switchCheck

	mov r0, r7
	bl findPairs
	ldr r7, [sp]
        ldr r8,	[sp, #4]
		
	ldr r0, [r7, #36]
	ldr r1, [r7, #28]
	bl printPairs

	mov r0, r8
	mov r1, #2
	bl modulo

	cmp r0, #1
	beq playerAsk
	b computerTurn
	
continueLoop:
	ldr r0, =gapSpace
	bl printf
	add r8, r8, #1
	b startLoop
	
switchCheck:
	push {fp, lr}
	add fp, sp, #4
	
	ldr r0, [r7, #36]
	ldr r1, [r7, #32]
	str r0, [r7, #32]
	str r1, [r7, #36] @switches position in stack

        ldr r0, [r7, #28]
        ldr r1,	[r7, #24]
        str r0, [r7, #24]
	str r1, [r7, #28] @switches position in stack

	ldr r0, [r7, #20]
        ldr r1, [r7, #16]
        str r0, [r7, #16]
        str r1, [r7, #20] @switches position in stack

	ldr r0, [r7, #4]
        ldr r1, [r7]
        str r0, [r7]
        str r1, [r7, #4] @switches position in stack

	sub sp, fp, #4
	pop {fp, pc}

playerAsk:
	bl switchCheck @switch back to player data

askAgain:	
	ldr r0, =askPlayer
	bl printf

	sub sp, sp, #4
	ldr r0, =digitInput
	mov r1, sp
	bl scanf

	pop {r4}


	ldr r0, =computerSays
	bl printf
	
	mov r1, r4
	mov r0, r7
	
	bl askForCard @ask for card, returns 0 if not valide
        ldr r7, [sp]
        ldr r8, [sp, #4]

	cmp r0, #0
	beq askAgain @redoes if not valid input

	ldr r0, =pressEnter
	bl printf

	sub sp, sp, #4
	ldr r0, =charInput
	mov r1, sp
	bl scanf
	add sp, sp, #4

	b continueLoop

computerTurn:
	@already on computer array
	@picks random number to guess

	ldr r0, [r7, #20]
	ldr r1, [r7]
	bl printDeck

	bl rand @returns random number in r0
	ldr r1, [r7] @length of array
	ldr r4, [r7, #20] @address of computer hand
	
	bl modulo @returns random number between 0-last number
	mov r3, r0 @random index in r3
	mov r0, #4
	mul r5, r3, r0 @calculates increment
	
	ldr r4, [r4, r5] @card being asked for

	ldr r0, =computerAsks
	bl printf

	ldr r0, =digit @prints which card is being asked for
	mov r1, r4
	bl printf

	ldr r0, =youSay
	bl printf @printing pretext
	
	mov r0, r7
	mov r1, r4
	bl askForCard
	ldr r7, [sp]
        ldr r8, [sp, #4]

	ldr r0, =pressEnter
        bl printf

        sub sp, sp, #4
        ldr r0, =charInput
        mov r1, sp
        bl scanf
        add sp, sp, #4

	bl switchCheck
	b continueLoop
	
endGame:	
	sub sp, fp, #4
	pop {fp, pc}
