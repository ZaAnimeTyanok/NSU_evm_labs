	.file	"main.c"
	.text
	.def	_scanf;	.scl	3;	.type	32;	.endef
_scanf:
	pushl	%ebx
	subl	$24, %esp
	leal	36(%esp), %ebx
	movl	$0, (%esp)
	call	*__imp____acrt_iob_func
	movl	%ebx, 8(%esp)
	movl	32(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	___mingw_vfscanf
	addl	$24, %esp
	popl	%ebx
	ret
	.def	_printf;	.scl	3;	.type	32;	.endef
_printf:
	pushl	%ebx
	subl	$24, %esp
	leal	36(%esp), %ebx
	movl	$1, (%esp)
	call	*__imp____acrt_iob_func
	movl	%ebx, 8(%esp)
	movl	32(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	___mingw_vfprintf
	addl	$24, %esp
	popl	%ebx
	ret
	.globl	_pi
	.def	_pi;	.scl	2;	.type	32;	.endef
_pi:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$20, %esp
	movl	40(%esp), %edi
	movl	44(%esp), %ebp
	movl	$1, %eax
	cmpl	%edi, %eax
	movl	$0, %eax
	sbbl	%ebp, %eax
	jge	L8
	movl	$1, %eax
	movl	$0, %edx
	fld1
	movl	$-1, %ebx
L7:
	movl	%ebx, 4(%esp)
	fildl	4(%esp)
	movd	%eax, %xmm0
	movd	%edx, %xmm1
	punpckldq	%xmm1, %xmm0
	movq	%xmm0, 8(%esp)
	fildq	8(%esp)
	fadd	%st(0), %st
	fadds	LC0
	fdivrp	%st, %st(1)
	faddp	%st, %st(1)
	negl	%ebx
	addl	$1, %eax
	adcl	$0, %edx
	movl	%edi, %ecx
	xorl	%eax, %ecx
	movl	%ebp, %esi
	xorl	%edx, %esi
	orl	%esi, %ecx
	jne	L7
L6:
	fmuls	LC1
	addl	$20, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L8:
	fld1
	jmp	L6
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
	.align 4
LC0:
	.long	1065353216
	.align 4
LC1:
	.long	1082130432
	.def	___main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 14.1.0"
	.def	___mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	___mingw_vfprintf;	.scl	2;	.type	32;	.endef
