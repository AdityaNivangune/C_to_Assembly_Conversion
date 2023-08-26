.section .rodata
	msg_num:
	.string "Enter number : "

	msg_s:
	.string "%d"

	msg_perfect:
	.string "%d is a Perfect Number\n"

	msg_not_perfect:
	.string "%d is Not a Perfect Number\n"

	msg_end:
	.string "End of Program [THROUGH ASSEMBLY]"

.section .bss
	.comm	num, 4, 4
	.comm	result, 4, 4

.section .text
.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	pushl	$msg_num
	call	printf
	addl	$4, %esp

	pushl	$num
	pushl	$msg_s
	call	scanf
	addl	$8, %esp

	pushl	num
	call	is_perfect
	addl	$4, %esp
	movl	%eax, result

	cmpl	$0, result
	je	not_perfect

	pushl	num
	pushl	$msg_perfect
	call	printf
	addl	$8, %esp

	jmp	mn_out

not_perfect:
	pushl	num
	pushl	$msg_not_perfect
	call	printf
	addl	$8, %esp

mn_out:
	pushl	$msg_end
	call	puts
	addl	$4, %esp
	
	movl	%ebp, %esp
	popl	%ebp
	ret

.globl	is_perfect
.type	is_perfect, @function

is_perfect:	
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	
	movl	$0, -8(%ebp)

	movl	8(%ebp), %eax
	cmpl	$6, %eax
	jl	false

	movl	$1, -4(%ebp)
	jmp	is_perfect_cond

	is_perfect_for:
		movl	$0, %edx
		divl	%ebx
		cmpl	$0, %edx
		jne	i_plus_plus

		movl	-4(%ebp), %ebx
		addl	%ebx, -8(%ebp)

	i_plus_plus:
		addl	$1, -4(%ebp)

	is_perfect_cond:
		movl	-4(%ebp), %ebx		
		movl	8(%ebp), %eax
		cmpl	%eax, %ebx
		jl	is_perfect_for

is_perfet_if:
	movl	-8(%ebp), %ebx
	
	cmpl	8(%ebp), %ebx
	je	true

false:
	movl	$0, %eax
	jmp	is_perfect_out

true:
	movl	$1, %eax
	jmp	is_perfect_out

is_perfect_out:
	movl	%ebp, %esp
	popl	%ebp
	ret
