.section .data
.align 2
a: .word 0x1122
b: .word 0x1234
c:	.word 0x1010

/* This is an example of nios ii calling convention
	Functions will be called in a chain as follows:
		main -> Func -> foo
				  `->bar

	Func takes 3 arguments Func(int a, int b, int c)

*/
.section .text
.global main
main:
	movia r8, a
	subi sp, sp, 4 # main will be calling functions, so we save it
	stw ra, 0(sp)

	ldw r9, 0(r8) # r9 = a
	ldw r10, 4(r8) # r10 = b
	ldw r11, 8(r8) # r11 = c
	/* pass arguments via the stack, can also do so via registers */
	subi sp, sp, 12 
	stw r9, 0(sp) # the function you're calling expects a to be at the top of stack
	stw r10, 4(sp) 
	stw r11, 8(sp)
	call Func
	/* post-call: clear the arguments pushed onto the stack */
	addi sp, sp, 12
	ldw ra, 0(sp) # restore ra
	addi sp, sp, 4
	ret

Func:
	subi sp, sp, 4 # Func will be making two calls so save ra
	stw ra, 0(sp)
	/* ra is on top of stack right now, so incoming arguments are below*/
	ldw r

foo:

bar: