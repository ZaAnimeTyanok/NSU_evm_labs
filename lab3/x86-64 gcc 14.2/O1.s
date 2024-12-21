pi:
        cmp     rdi, 1           # отдельно обрабатывается случай, когда аргумент функции равен 1, так же не устанавливается новый указатель базы стека
        jle     .L4
        mov     eax, 1
        fld1
        mov     edx, -1
        fld     st(0)
.L3:                          
        mov     DWORD PTR [rsp-16], edx
        fild    DWORD PTR [rsp-16]
        mov     QWORD PTR [rsp-16], rax
        fild    QWORD PTR [rsp-16]
        fadd    st, st(0)
        fadd    st, st(2)
        fdivp   st(1), st
        faddp   st(2), st
        neg     edx
        add     rax, 1
        cmp     rdi, rax
        jne     .L3                # цикл упрощен, вместо метки проверки условий используется сравнение значений на регистрах
        fstp    st(0)
.L2:
        fmul    DWORD PTR .LC1[rip]
        ret
.L4:
        fld1
        jmp     .L2
.LC3:
        .string "%lld"
.LC4:
        .string "%Lf"
main:
        sub     rsp, 24
        lea     rsi, [rsp+8]
        mov     edi, OFFSET FLAT:.LC3
        mov     eax, 0
        call    __isoc99_scanf
        mov     rdi, QWORD PTR [rsp+8]
        call    pi
        lea     rsp, [rsp-16]
        fstp    TBYTE PTR [rsp]
        mov     edi, OFFSET FLAT:.LC4
        mov     eax, 0
        call    printf
        mov     eax, 0
        add     rsp, 40
        ret
.LC1:
        .long   1082130432         # используется константа, это число с плавающей запятой 4.0f, используется для умножения для получения числа пи
