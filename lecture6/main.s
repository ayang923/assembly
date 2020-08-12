.cpu cortex-a53
.fpu neon-fp-armv8

.data

@ define a constant for value 52
.equ  ncards, 52  @ ncards = 52
.equ  ntypes, 13  @ ntypes = 13
filename: .asciz "deck.dat"
rwIOw:    .asciz "w"
rwIOr:    .asciz "r"

.text
.align 2
.global main
.type main, %function

main:
    push {fp, lr}
    add fp, sp, #4

    @ allocate a block of 13 memory locations on the stack
    @ to count how many of each card
    mov r0, #4  @ 4 bytes
    mov r1, #ntypes
    mul r0, r0, r1
    sub sp, sp, r0  @ allocates an array of 13 4-byte integers

    @ initialize array to all 0
    mov r0, sp
    mov r1, #ntypes
    bl initialize  @ initialize(r0, ntypes)

    @ shuffle card
    @ fopen(filename, "w");
    ldr r0, =filename
    ldr r1, =rwIOw
    bl fopen  @ returns file pointer to r0
    mov r4, r0

    @ call shuffle function to shuffle cards
    @ shuffle(fp, ncards, sp)
    @ r0 already has value of fp
    mov r1, #ncards
    mov r2, sp

    bl shuffle
    mov r0, r4
    bl fclose

    sub sp, fp, #4
    pop {fp, pc}

