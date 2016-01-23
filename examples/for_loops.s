.section .data
.align 1

array: .hword 0x1, 0x2, 0x3, 0x4, 0x5
sum: .word 0

.section .text
.global main
main: 
	movia r8, array
	movia r9, 5	#size of the array
	mov r10, r0 # running index
	mov r12, r0 # initiailize the accumalator variable
for: 
	bge r10, r9, endfor
	ldh r11, 0(r8) 
	add r12, r12, r11 # r12 is the accumalator variable
	addi r8, r8, 0x4
	addi r10, r10, 1
	br for
endfor:
	movia r13, sum
	stw r12, 0(r13)
	