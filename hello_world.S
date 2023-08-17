.section .rodata
	msg:
	.string "Hello World!\n"

.section .text
.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	$msg
	call	printf
	addl	$4, %esp

	movl	%ebp, %esp
	popl	%ebp
	ret
