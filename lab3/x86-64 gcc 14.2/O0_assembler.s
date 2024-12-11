pi:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-56], rdi
        mov     DWORD PTR [rbp-4], -1
        fld1
        fstp    TBYTE PTR [rbp-32]
        mov     QWORD PTR [rbp-40], 1
        jmp     .L2
.L3:
        fild    DWORD PTR [rbp-4]
        fild    QWORD PTR [rbp-40]
        fld     st(0)
        faddp   st(1), st
        fld1
        faddp   st(1), st
        fdivp   st(1), st
        fld     TBYTE PTR [rbp-32]
        faddp   st(1), st
        fstp    TBYTE PTR [rbp-32]
        neg     DWORD PTR [rbp-4]
        add     QWORD PTR [rbp-40], 1
.L2:
        mov     rax, QWORD PTR [rbp-40]
        cmp     rax, QWORD PTR [rbp-56]
        jl      .L3
        fld     TBYTE PTR [rbp-32]
        fld     TBYTE PTR .LC1[rip]
        fmulp   st(1), st
        fstp    TBYTE PTR [rbp-32]
        fld     TBYTE PTR [rbp-32]
        pop     rbp
        ret
.LC3:
        .string "%lld"
.LC4:
        .string "%Lf"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rax, [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC3
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    pi
        lea     rsp, [rsp-16]
        fstp    TBYTE PTR [rsp]
        mov     edi, OFFSET FLAT:.LC4
        mov     eax, 0
        call    printf
        add     rsp, 16
        mov     eax, 0
        leave
        ret
.LC1:
        .long   0
        .long   -2147483648
        .long   16385
        .long   0
