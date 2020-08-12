@ shuffle(fp, ncards, sp)

.cpu cortex-a53
.fpu neon-fp-armv8

.data
cardoutput: .asciz "%d\n"

.text
.align 2
.global shuffle
.type shuffle, %function

shuffle:
    push {fp, lr}
    add fp, sp, #4

    mov r10, r0  @ r10 = fp = address of the file
    mov r9, r1   @ r6 = 52
    mov r8, r2   @ r8 = address of first array element = sp

    @ reseed random number generator
    mov r0, #0
    bl time
    bl srand  @ srand(time(0))

    @ loop over 52 cards

    mov r7, #0  @ loop counter

shuffle_loop:
    cmp r7, r9   @ done when we have written out 52 cards
    bge shuffle_done_loop

    @ generate a random number between 1 and 13
    bl rand
    mov r1, #13
    bl modulo  @ modulo(r0, r1) = r0 % r1
    @ returns a number between 0 and 12

    mov r1, #4
    mul r1, r1, r0
    ldr r2, [r8, r1]

    cmp r2, #4  @ checking if 4 numbers have been generated
    bge shuffle_loop

    add r7, r7, #1  @ increment number of cards
    add r2, r2, #1  @ increment number of card value r0
    str r2, [r8, r1]

    add r2, r0, #1   @ card value
    ldr r1, =cardoutput  @ "%d\n"
    mov r0, r10  @ filepointer
    @ fprintf(filepointer, "%d\n", cardvalue)
    bl fprintf

    b shuffle_loop

shuffle_done_loop:

    sub sp, fp, #4
    pop {fp, pc}
