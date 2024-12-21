pi:
        push    rbp                              # сохраняем старое значение указателя базы стека
        mov     rbp, rsp                         # устанавливаем новый указатель базы стека
        mov     QWORD PTR [rbp-56], rdi          # сохраняем аргумент функции (переданный через rdi) в локальной переменной
        mov     DWORD PTR [rbp-4], -1            # инициализируем счетчик итераций значением -1
        fld1                                     # загружаем 1.0 в стек FPU
        fstp    TBYTE PTR [rbp-32]               # сохраняем это значение (1.0) по адресу [rbp-32]
        mov     QWORD PTR [rbp-40],              # инициализируем переменную для подсчета (счетчик итераций) значением 1
        jmp     .L2                              # переходим к метке .L2 для начала цикла

.L3:                                             # Начало цикла
        fild    DWORD PTR [rbp-4]                # загружаем значение счетчика (целое) в стек FPU
        fild    QWORD PTR [rbp-40]               # загружаем текущее значение счетчика итераций (целое) в стек FPU
        fld     st(0)                            # копируем верхнее значение стека FPU
        faddp   st(1), st                        # складываем верхние два значения и удаляем одно из них
        fld1                                     # загружаем 1.0 в стек FPU
        faddp   st(1), st                        # складываем 1.0 с предыдущим значением и удаляем одно из них
        fdivp   st(1), st                        # делим второе значение стека на первое и удаляем первое значение
        fld     TBYTE PTR [rbp-32]               # загружаем текущее значение из памяти в стек FPU
        faddp   st(1), st                        # складываем текущее значение с новым значением и удаляем одно из них
        fstp    TBYTE PTR [rbp-32]               # сохраняем новое значение обратно по адресу [rbp-32]
        neg     DWORD PTR [rbp-4]                # инвертируем счетчик итераций (делаем его отрицательным)
        add     QWORD PTR [rbp-40], 1            # увеличиваем счетчик итераций на 1

.L2:                                             # проверка условия цикла
        mov     rax, QWORD PTR [rbp-40]          # загружаем текущее значение счетчика итераций в rax
        cmp     rax, QWORD PTR [rbp-56]          # сравниваем его с переданным аргументом функции
        jl      .L3                              # если текущее значение меньше аргумента, продолжаем цикл

        fld     TBYTE PTR [rbp-32]               # загружаем конечное значение из памяти в стек FPU
        fld     TBYTE PTR .LC1[rip]              # загружаем константу из памяти
        fmulp   st(1), st                        # умножаем два верхних значения стека и удаляем одно из них
        fstp    TBYTE PTR [rbp-32]               # сохраняем результат обратно по адресу [rbp-32]
        fld     TBYTE PTR [rbp-32]               # загружаем финальное значение  в стек FPU
        pop     rbp                              # восстанавливаем старое значение указателя базы стека
        ret                                      # возвращаемся из функции

.LC3:                                            # строка формата для scanf(long long)
        .string "%lld"

.LC4:                                            # строка формата для printf (long double)
        .string "%Lf"      

main:                                            # начало функции main
        push    rbp                              # сохраняем старое значение указателя базы стека
        mov     rbp, rsp                         # устанавливаем новый указатель базы стека
        sub     rsp, 16                          # выделяем место в стеке для локальных переменных
        lea     rax, [rbp-8]                     # загружаем адрес для хранения введенного значения в rax
        mov     rsi, rax                         # устанавливаем rsi на адрес для scanf
        mov     edi, OFFSET FLAT:.LC3            # устанавливаем адрес строки формата для scanf в edi
        mov     eax, 0                           # устанавливаем eax в 0 для вызова scanf
        call    __isoc99_scanf                   # вызываем scanf для считывания значения
        mov     rax, QWORD PTR [rbp-8]           # загружаем введенное значение в rax
        mov     rdi, rax                         # передаем это значение в функцию pi через rdi
        call    pi                               # вызываем функцию pi
        lea     rsp, [rsp-16]                    # подготавливаем стек для хранения результата
        fstp    TBYTE PTR [rsp]                  # сохраняем результат функции pi на стек
        mov     edi, OFFSET FLAT:.LC4            # устанавливаем адрес строки формата для printf в edi
        mov     eax, 0                           # устанавливаем eax в 0 для вызова printf
        call    printf                           # вызываем printf для вывода результата
        add     rsp, 16                          # освобождаем место в стеке после вызова printf
        mov     eax, 0                           # устанавливаем eax в 0 перед выходом из main
        leave                                    # восстанавливаем указатель базы стека и возвращаемся из функции main
        ret                                      # возвращаемся из функции main

.LC1:                                            # константа для использования в вычислениях 
        .long   0   
        .long   -2147483648  
        .long   16385  
        .long   0              
