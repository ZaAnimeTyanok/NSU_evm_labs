	.file	"main.c"
	.text
	.section .rdata,"dr"
LC0:
	.ascii "%Lf\0"
	.text
	.p2align 4
	.def	_printf.constprop.0;	.scl	3;	.type	32;	.endef
_printf.constprop.0:
	pushl	%ebx
	subl	$24, %esp
	leal	36(%esp), %ebx
	movl	$1, (%esp)
	call	*__imp____acrt_iob_func
	movl	%ebx, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	___mingw_vfprintf
	addl	$24, %esp
	popl	%ebx
	ret
	.section .rdata,"dr"
LC1:
	.ascii "%lld\0"
	.text
	.p2align 4
	.def	_scanf.constprop.0;	.scl	3;	.type	32;	.endef
_scanf.constprop.0:
	pushl	%ebx
	subl	$24, %esp
	leal	36(%esp), %ebx
	movl	$0, (%esp)
	call	*__imp____acrt_iob_func
	movl	%ebx, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	___mingw_vfscanf
	addl	$24, %esp
	popl	%ebx
	ret
	.p2align 4
	.globl	_pi
	.def	_pi;	.scl	2;	.type	32;	.endef
_pi:
	pushl	%ebp
	movl	$1, %eax
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$20, %esp
	movl	40(%esp), %edi
	movl	44(%esp), %ebp
	cmpl	%edi, %eax
	movl	$0, %eax
	sbbl	%ebp, %eax
	jge	L9
	fld1
	movl	$1, %eax
	xorl	%edx, %edx
	movl	$-1, %ebx
	fld	%st(0)
	.p2align 4,,10
	.p2align 3
L8:
	movd	%eax, %xmm0
	movd	%edx, %xmm1
	movl	%ebx, 4(%esp)
	negl	%ebx
	punpckldq	%xmm1, %xmm0
	addl	$1, %eax
	movl	%edi, %ecx
	movl	%ebp, %esi
	fildl	4(%esp)
	movq	%xmm0, 8(%esp)
	adcl	$0, %edx
	xorl	%eax, %ecx
	xorl	%edx, %esi
	fildq	8(%esp)
	orl	%esi, %ecx
	fadd	%st(0), %st
	fadd	%st(2), %st
	fdivrp	%st, %st(1)
	faddp	%st, %st(2)
	jne	L8
	fstp	%st(0)
	fmuls	LC3
	addl	$20, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,10
	.p2align 3
L9:
	flds	LC3
	addl	$20, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.section	.text.startup,"x"
	.p2align 4
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	leal	40(%esp), %eax
	movl	$LC1, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf.constprop.0
	movl	40(%esp), %esi
	movl	$1, %eax
	movl	44(%esp), %edi
	fld1
	cmpl	%esi, %eax
	movl	$0, %eax
	sbbl	%edi, %eax
	jge	L13
	movl	$-1, 20(%esp)
	movl	$1, %eax
	fld	%st(0)
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
L14:
	movd	%eax, %xmm0
	movd	%edx, %xmm1
	movl	20(%esp), %ecx
	movl	%edi, %ebx
	fildl	20(%esp)
	punpckldq	%xmm1, %xmm0
	movq	%xmm0, 24(%esp)
	negl	%ecx
	addl	$1, %eax
	fildq	24(%esp)
	adcl	$0, %edx
	movl	%ecx, 20(%esp)
	movl	%esi, %ecx
	xorl	%eax, %ecx
	xorl	%edx, %ebx
	orl	%ebx, %ecx
	fadd	%st(0), %st
	fadd	%st(2), %st
	fdivrp	%st, %st(1)
	faddp	%st, %st(2)
	jne	L14
	fstp	%st(0)
L13:
	fmuls	LC3
	movl	$LC0, (%esp)
	fstpt	4(%esp)
	call	_printf.constprop.0
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.section .rdata,"dr"
	.align 4
LC3:
	.long	1082130432
	.def	___main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 14.1.0"
	.def	___mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	___mingw_vfscanf;	.scl	2;	.type	32;	.endef
