.section .rodata
	msg_num:
	.string "Enter number : "

	msg_s:
	.string "%d"

	msg_prime:
	.string "%d is a Prime Number\n"

	msg_not_prime:
	.string "%d is not a Prime Number\n"

	msg_end:
	.string "End of Program [THROUGH ASSMEBLY]"

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
	call	is_prime
	addl	$4, %esp
	movl	%eax, result

	cmpl	$1, result
	je	prime_number

	pushl	num
	pushl	$msg_not_prime
	call	printf
	addl	$8, %esp

	jmp	mn_out

prime_number:
	pushl	num
	pushl	$msg_prime
	call	printf
	addl	$8, %esp

mn_out:

	pushl	$msg_end
	call	puts
	addl	$4, %esp

	movl	%ebp, %esp
	popl	%ebp
	ret

.globl	is_prime
.type	is_prime, @function

is_prime:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp

	movl	8(%ebp), %eax
	cmpl	$1, %eax
	je	false

	cmpl	$2, %eax
	je	true

	movl	$2, -4(%ebp)
	jmp	is_prime_cond
	is_prime_for:
		movl	$0, %edx
		divl	%ebx
		
		cmpl	$0, %edx
		je	false

		addl	$1, -4(%ebp)

	is_prime_cond:
		movl	-4(%ebp), %ebx
		movl	8(%ebp), %eax
		cmpl	%eax, %ebx
		jl	is_prime_for

		jmp	true

false:
	movl	$0, %eax
	jmp	is_prime_out

true:
	movl	$1, %eax
	jmp	is_prime_out

is_prime_out:
	movl	%ebp, %esp
	popl	%ebp
	ret
