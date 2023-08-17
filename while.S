.section .rodata 
	msg_p1: 
	.string	"i = %d\n" 

	msg_end: 
	.string	"End or program -> [Through Assembly]" 

.section .bss 
	.comm	i, 4, 4 

.section .text 
.globl	main 
.type	main, @function 

main: 
	pushl	%ebp 
	movl	%esp, %ebp 

	movl 	$0, i 
	jmp		main_cond_1 

main_for_1: 
	pushl	i 
	pushl	$msg_p1 
	call	printf
	addl	$8, %esp 

	addl	$1, i 

main_cond_1: 
	movl 	i, %eax 
	cmpl	$5, %eax 
	jl		main_for_1
	
	pushl	$msg_end 
	call	puts 
	addl	$4, %esp 

	pushl	$0 
	call	exit 

