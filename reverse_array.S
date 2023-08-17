.section .rodata
	msg_p1:
	.string "Array before reverse : "
	
	msg_p2:
	.string "Array after reverse  : "
	
	fmt:
	.string "%d "
	
	new_line:
	.string "\n"
	
	msg_end:
	.string "End of program [THROUGH ASSEMBLY]\n"
	
.section .data
	.globl	arr
	.type	arr, @object
	.size	arr, 40
	.align	4
	arr:
	.int	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	
.section .text
.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	
	pushl	$msg_p1
	call	printf
	addl	$4, %esp
		
	movl	$0, -4(%ebp)
	jmp	mn_cond_1
	
mn_for_1:
	movl	arr(, %eax, 4), %edx

	pushl	%edx
	pushl	$fmt
	call	printf
	addl	$8, %esp
	
	addl	$1, -4(%ebp)
	
mn_cond_1:
	movl	-4(%ebp), %eax
	cmpl	$10, %eax
	jl	mn_for_1
	
	pushl	$new_line
	call	printf
	addl	$4, %esp

	pushl	$msg_p2
	call	printf
	addl	$4, %esp
	
	movl	$9, -4(%ebp)
	jmp	mn_cond_2
	
mn_for_2:
	movl	arr(, %eax, 4), %edx

	pushl	%edx
	pushl	$fmt
	call	printf
	addl	$8, %esp
	
	subl	$1, -4(%ebp)
	
mn_cond_2:
	movl	-4(%ebp), %eax
	cmpl	$0, %eax
	jge	mn_for_2
	
	pushl	$new_line
	call	printf
	addl	$4, %esp
	
	pushl	$msg_end
	call	printf
	addl	$4, %esp
	
	pushl	$0
	call	exit
