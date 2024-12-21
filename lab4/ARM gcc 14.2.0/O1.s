pi:
        push    {r4, r5, r6, r7, r8, lr}        // используется больше регистров
        vpush.64        {d8, d9, d10}
        cmp     r0, #2
        sbcs    r3, r1, #0
        blt     .L4
        mov     r7, r0
        mov     r8, r1
        movs    r4, #1
        movs    r6, #0
        vmov.f64        d8, #1.0e+0
        mov     r5, #-1
        vmov.f64        d10, d8
.L3:
        vmov    s15, r5 @ int
        vcvt.f64.s32    d9, s15
        mov     r0, r4
        mov     r1, r6
        bl      __aeabi_l2d
        vmov    d7, r0, r1
        vadd.f64        d7, d7, d7
        vadd.f64        d7, d7, d10
        vdiv.f64        d6, d9, d7
        vadd.f64        d8, d8, d6
        rsbs    r5, r5, #0
        adds    r2, r4, #1
        adc     r3, r6, #0
        mov     r4, r2
        mov     r6, r3
        cmp     r8, r3
        it      eq
        cmpeq   r7, r2
        bne     .L3        // цикл упрощен, нет метки проверки условия
.L2:
        vmov.f64        d0, #4.0e+0
        vmul.f64        d0, d8, d0
        vldm    sp!, {d8-d10}
        pop     {r4, r5, r6, r7, r8, pc}
.L4:
        vmov.f64        d8, #1.0e+0
        b       .L2
.LC0:
        .ascii  "%lld\000"
.LC1:
        .ascii  "%Lf\000"
main:
        push    {lr}
        sub     sp, sp, #12
        mov     r1, sp
        movw    r0, #:lower16:.LC0
        movt    r0, #:upper16:.LC0
        bl      __isoc99_scanf
        ldrd    r0, [sp]
        bl      pi
        vmov    r2, r3, d0
        movw    r0, #:lower16:.LC1
        movt    r0, #:upper16:.LC1
        bl      printf
        movs    r0, #0
        add     sp, sp, #12
        ldr     pc, [sp], #4
