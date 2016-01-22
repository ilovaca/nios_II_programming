.section .data 
/* Assembler directive that tells the assembler that this
section is data*/
.align 2 
/* tells the linker to place the data at an address that is divisible
	by 2^2 = 4 */
var_a : .long 0x0 
var_b : .long 0x11223344
var_c : .long 0x22334455

.section .text
.global main 
main:
	movia r11, var_b
	ldw r12, 0(r11)
	movia r11, var_a
	ldw r13, 0(r11)
	add r14, r12, r13
	movia r11, var_c
	stw r14, 0(var_c)

	/* Version 2: we know the variables a, b, and c will be placed contiguously 
	in memory, so we only need to load the symbol (address) of var_a and use the 
	immediate field in the instruction */

	movia r11, var_a
	ldw r12, 0(var_a) # r12 = a
	ldw r13, 4(var_a) # r13 = b
	ldw r14, 8(var_a) # r14 = c
	add r15, r12, r13
	stw r15, 8(var_a)