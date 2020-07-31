.cpu cortex-a53
.fpu neon-fp-armv8

.data

inp1: .asciz "Enter nth Fibonacci: "
inp2: .asciz "%d"
out:  .asciz "The %dth number is %d\n"

.text
.align 2
.global main
.type main, %function

main:
   push {fp, lr}  @ store fp, lr onto stack
   add fp, sp, #4   @ reset fp to bottom of function stack

   ldr r0, =inp1  @ r0 = "Enter Fibonacci number: "
   bl printf  @ printf(r0)

   @ scanf("%d", &a)
   sub sp, sp, #4  @ writing user input to top of stack
   mov r1, sp     @ r1 = address to write user input
   ldr r0, =inp2  @ r0 = "%d"

   bl scanf  @ scanf(r0, r1)
   @ need to move the value at sp into a general purpose reg
   ldr r4, [sp]   @ r4 = *sp

   mov r0, r4  @ To call fib, pass argument into r0
   bl fib  @ output is in r0

   mov r2, r0
   ldr r0, =out  @printf("...%d... %d\n", r4, r0)
   mov r1, r4

   bl printf

   @ return 0
   mov r0, #0

   sub sp, fp, #4  @ restore the values of sp, and fp
   pop {fp,pc}  @ returns to the calling function
