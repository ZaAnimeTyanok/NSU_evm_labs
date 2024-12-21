pi:
        cmp     r0, #2
        sbcs    r3, r1, #0
        blt     .L4
        push    {r4, r5, r6, r7, r8, lr}
        mov     r7, r0
        mov     r8, r1
        vpush.64        {d8, d9}
        vmov.f64        d9, #1.0e+0
        movs    r4, #1
        movs    r5, #0
        vmov.f64        d8, d9
        mov     r6, #-1
.L3:
        mov     r0, r4
        mov     r1, r5
        bl      __aeabi_l2d
        vmov    d7, r0, r1
        vmov    s13, r6 @ int
        adds    r4, r4, #1
        vadd.f64        d7, d7, d7
        adc     r5, r5, #0
        vcvt.f64.s32    d6, s13
        rsbs    r6, r6, #0
        cmp     r8, r5
        it      eq
        cmpeq   r7, r4
        vadd.f64        d7, d7, d8
        vdiv.f64        d5, d6, d7
        vadd.f64        d9, d9, d5
        bne     .L3
        vmov.f64        d0, #4.0e+0
        vmul.f64        d0, d9, d0
        vldm    sp!, {d8-d9}
        pop     {r4, r5, r6, r7, r8, pc}
.L4:
        vmov.f64        d0, #4.0e+0
        bx      lr
.LC0:
        .ascii  "%lld\000"
.LC1:
        .ascii  "%Lf\000"
main:
        push    {r4, r5, r6, r7, r8, lr}
        movw    r0, #:lower16:.LC0
        movt    r0, #:upper16:.LC0
        vpush.64        {d8, d9}
        sub     sp, sp, #8
        mov     r1, sp
        vmov.f64        d9, #1.0e+0
        bl      __isoc99_scanf
        ldrd    r7, r8, [sp]
        cmp     r7, #2
        sbcs    r3, r8, #0
        blt     .L12
        vmov.f64        d8, d9
        movs    r4, #1
        movs    r5, #0
        mov     r6, #-1
.L13:        // цикл встроен в тело мейна
        mov     r0, r4
        mov     r1, r5
        bl      __aeabi_l2d
        vmov    d7, r0, r1
        vmov    s13, r6 @ int
        adds    r4, r4, #1
        vadd.f64        d7, d7, d7
        adc     r5, r5, #0
        vcvt.f64.s32    d6, s13
        rsbs    r6, r6, #0
        cmp     r8, r5
        it      eq
        cmpeq   r7, r4
        vadd.f64        d7, d7, d8
        vdiv.f64        d5, d6, d7
        vadd.f64        d9, d9, d5
        bne     .L13
.L12:
        vmov.f64        d7, #4.0e+0
        movw    r0, #:lower16:.LC1
        movt    r0, #:upper16:.LC1
        vmul.f64        d7, d9, d7
        vmov    r2, r3, d7
        bl      printf
        movs    r0, #0
        add     sp, sp, #8
        vldm    sp!, {d8-d9}
        pop     {r4, r5, r6, r7, r8, pc}
