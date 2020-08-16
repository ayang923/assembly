	.cpu cortex-a72
        .fpu neon-fp-armv8

	.data
        .equ ncards, 52
	.equ ntypes, 13

digit:  .asciz "%d\n"
fileName:       .asciz "deck.dat"
rwIOw:  .asciz "w"
rwIOr:  .asciz "r"
digitInput:     .asciz "%d"

        .text
        .align 2
	.global findPairs
        .type findPairs, %function

findPairs:
	push {fp, lr}
	add fp, sp, #4

	@r0 is address of hand
	@r1 is address of pairs
	

	sub sp, fp, #4
	pop {fp, pc}
