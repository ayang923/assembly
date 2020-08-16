        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data

        .text
        .align 2
        .global switchCheck
        .type switchCheck, %function

switchCheck:
	push {fp, lr}
	
