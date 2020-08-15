        .cpu cortex-a72
        .fpu neon-fp-armv8

        .data
filename:	.asciz "seatchart.dat"
rwIOr:	.asciz "r"
test:	.asciz "%d\n"
input:	.asciz "%d"
customer:	.asciz "Customer #%d\n"
available:	.asciz "Seating Chart:\n"
seatingType:	.asciz "Press 1 to seat by price. Press 2 to seat by location: "
seatLoc:	.asciz "You will be sitting in row %d and column %d (indexed by 0)\n"
gap:	.asciz "\n\n\n\n"
invalidOption:	.asciz "Not a Valid Option\n"
customers:	.asciz "How many customers are you seating?: "

        .text

        .align 2
        .global main
        .type main, %function

main:	
	push {fp, lr}
	add fp, sp, #4

	ldr r0, =filename @gets file pointer for file
	ldr r1, =rwIOr
	bl fopen
	mov r4, r0 @saves pointer to r4

	mov r0, r4

	push {r4}
	bl getRowCol
	pop {r4}
	
	mov r5, r0 @rows in r5
	mov r6, r1 @columns in r6

	@allocating array space
	mov r0, #4
	mul r0, r0, r6 @space needed for 2D array
	mul r0, r5, r0
	sub sp, sp, r0 @sp is beginning of array

	mov r0, sp @parameters for reading chart
	mov r1, r5
	mov r2, r6
	mov r3, r4

	push {r4, r5, r6}
	bl readSeatingChartFromFile
	pop {r6, r5, r4}

	mov r0, r4
	bl fclose @closes file

	@asking for number of customers
	ldr r0, =customers
	bl printf

	ldr r0, =input
	sub sp, sp, #4
	mov r1, sp

	bl scanf
	pop {r10}

	@Asking customer after customer

	mov r9, #1 @i=0
	ldr r0, =gap
	bl printf
	
startLoop:
	cmp r9, r10
	bgt endLoop
	
	ldr r0, =customer
	mov r1, r9
	bl printf

	ldr r0, =available @prompts customer
	bl printf

	mov r0, sp
	mov r1, r5
	mov r2, r6
	
	push {r5, r6, r9, r10}
	bl printSeats
	pop {r10, r9, r6, r5}

askAgain:	
	ldr r0, =seatingType
	bl printf

	ldr r0, =input
	sub sp, sp, #4
	mov r1, sp
	bl scanf @gets type of seating

	pop {r4}
	cmp r4, #1
	beq priceSeating

	cmp r4, #2
	beq locationSeating

	ldr r0, =invalidOption
	bl printf
	
	b askAgain

continueLoop:
	ldr r0, =gap
	bl printf
	
	add r9, r9, #1
	b startLoop

priceSeating:
	mov r0, sp @inputs parameters
        mov r1, r5
        mov r2, r6

        push {r5, r6, r9, r10}
        bl assignSeatPrice
        pop {r10, r9, r6, r5}

	@r0 is row
	@r1 is column

	mov r2, r1
	mov r1, r0
	ldr r0, =seatLoc
	bl printf
	
	b continueLoop

locationSeating:
	mov r0, sp
	mov r1, r5
	mov r2, r6

	push {r5, r6, r9, r10}
	bl assignSeatLocation
	pop {r10, r9, r6, r5}

	mov r2, r1
	mov r1, r0
	ldr r0, =seatLoc
	bl printf
	
	b continueLoop

	
endLoop:	
	sub sp, fp, #4
	pop {fp, pc}
