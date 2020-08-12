.cpu cortex-a53
.fpu neon-fp-armv8

.data

@ define a constant for value 52


.text
.align 2
.global initialize
.type initialize, %function

initialize:
    push {fp, lr}
    add fp, sp, #4

    @ move the arguments into registers to use
    mov r10, r0  @ memory location of first array element
    mov r9, r1   @ r9 = #ntypes

    mov r2, #0   @ counter for loop

init_loop:
    cmp r2, r9
    bge end_init

    @ calculate number of bytes offset from r10
    mov r0, #4
    mul r0, r0, r2
    mov r1, #0
    str r1, [r10, r0]  @ r10[r0] = 0

    add r2, r2, #1
    b init_loop

end_init:
    sub sp, fp, #4
    pop {fp, pc}
