        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
prompt:	.asciz ""

        .text
        .align 2
        .global askForCard
        .type askForCard, %function

askForCard:
	push {fp, lr}
	add fp, sp, #4

	
