.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global fib
.type fib, %function

fib:

    push {fp, lr}
    add fp, sp, #4

    mov r1, #1  @ a = 1
    mov r2, #1  @ b = 1
    mov r3, #1  @ c = 1

    mov r10, #3  @ i = 3

    forloop:
       cmp r10, r0  @ i <= n
       bgt done_forloop

       add r3, r1, r2  @ c = a + b
       mov r1, r2      @ a = b
       mov r2, r3      @ c = b

       add r10, r10, #1 @ i = i + 1
    b forloop

    done_forloop:

    mov r0, r3   @ return the value of c

    sub sp, fp, #4  @ resets the vlaues of sp, fp
    pop {fp, pc}
