	.file	"main.c"
	.text
	.def	_scanf;	.scl	3;	.type	32;	.endef
_scanf:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$36, %esp
	leal	12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %ebx
	movl	$0, (%esp)
	movl	__imp____acrt_iob_func, %eax
	call	*%eax
	movl	%ebx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	___mingw_vfscanf
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	ret
	.def	_printf;	.scl	3;	.type	32;	.endef
_printf:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$36, %esp
	leal	12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %ebx
	movl	$1, (%esp)
	movl	__imp____acrt_iob_func, %eax
	call	*%eax
	movl	%ebx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	___mingw_vfprintf
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	ret
	.globl	_pi
	.def	_pi;	.scl	2;	.type	32;	.endef
_pi:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%eax, -40(%ebp)
	movl	%edx, -36(%ebp)
	movl	$-1, -4(%ebp)
	fld1
	fstpt	-16(%ebp)
	movl	$1, -24(%ebp)
	movl	$0, -20(%ebp)
	jmp	L6
L7:
	fildl	-4(%ebp)
	fildq	-24(%ebp)
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	faddp	%st, %st(1)
	fdivrp	%st, %st(1)
	fldt	-16(%ebp)
	faddp	%st, %st(1)
	fstpt	-16(%ebp)
	negl	-4(%ebp)
	addl	$1, -24(%ebp)
	adcl	$0, -20(%ebp)
L6:
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	cmpl	-40(%ebp), %eax
	movl	%edx, %eax
	sbbl	-36(%ebp), %eax
	jl	L7
	fldt	-16(%ebp)
	fldt	LC1
	fmulp	%st, %st(1)
	fstpt	-16(%ebp)
	fldt	-16(%ebp)
	leave
	ret
	.section .rdata,"dr"
LC3:
	.ascii "%lld\0"
LC4:
	.ascii "%Lf\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_pi
	fstpt	4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	ret
	.section .rdata,"dr"
	.align 16
LC1:
	.long	0
	.long	-2147483648
	.long	16385
	.def	___main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 14.1.0"
	.def	___mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	___mingw_vfprintf;	.scl	2;	.type	32;	.endef
