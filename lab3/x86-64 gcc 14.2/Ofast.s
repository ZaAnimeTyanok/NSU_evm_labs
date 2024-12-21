pi:
        cmp     rdi, 1
        jle     .L4
        fld1
        mov     eax, 1
        mov     edx, -1
        fld     st(0)
.L3:
        mov     DWORD PTR [rsp-16], edx
        fild    DWORD PTR [rsp-16]
        neg     edx
        mov     QWORD PTR [rsp-16], rax
        add     rax, 1
        fild    QWORD PTR [rsp-16]
        fadd    st, st(0)
        fadd    st, st(2)
        fdivp   st(1), st
        faddp   st(2), st
        cmp     rdi, rax
        jne     .L3
        fstp    st(0)
        fmul    DWORD PTR .LC1[rip]
        ret
.L4:
        fld     DWORD PTR .LC1[rip]
        ret
.LC3:
        .string "%lld"
.LC4:
        .string "%Lf"
main:
        sub     rsp, 40
        mov     edi, OFFSET FLAT:.LC3
        xor     eax, eax
        lea     rsi, [rsp+24]
        call    __isoc99_scanf
        mov     rcx, QWORD PTR [rsp+24]
        fld1
        cmp     rcx, 1
        jle     .L8
        mov     eax, 1
        fld     st(0)
        mov     edx, -1
.L9:                        # цикл встроен в тело мейна
        mov     DWORD PTR [rsp+8], edx
        fild    DWORD PTR [rsp+8]
        neg     edx
        mov     QWORD PTR [rsp+8], rax
        add     rax, 1
        fild    QWORD PTR [rsp+8]
        fadd    st, st(0)
        fadd    st, st(2)
        fdivp   st(1), st
        faddp   st(2), st
        cmp     rcx, rax
        jne     .L9
        fstp    st(0)
.L8:
        fmul    DWORD PTR .LC1[rip]
        sub     rsp, 16
        mov     edi, OFFSET FLAT:.LC4
        xor     eax, eax
        fstp    TBYTE PTR [rsp]
        call    printf
        xor     eax, eax
        add     rsp, 56
        ret
.LC1:
        .long   1082130432
