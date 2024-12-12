pi:
        push    {r4, r5, r7, lr}
        vpush.64        {d8}
        sub     sp, sp, #32
        add     r7, sp, #0
        strd    r0, [r7]
        mov     r3, #-1
        str     r3, [r7, #28]
        mov     r2, #0
        mov     r3, #0
        movt    r3, 16368
        strd    r2, [r7, #16]
        mov     r2, #1
        mov     r3, #0
        strd    r2, [r7, #8]
        b       .L2
.L3:
        ldr     r3, [r7, #28]
        vmov    s15, r3 @ int
        vcvt.f64.s32    d8, s15
        ldrd    r0, [r7, #8]
        bl      __aeabi_l2d
        vmov    d7, r0, r1
        vadd.f64        d7, d7, d7
        vmov.f64        d6, #1.0e+0
        vadd.f64        d6, d7, d6
        vdiv.f64        d7, d8, d6
        vldr.64 d6, [r7, #16]
        vadd.f64        d7, d6, d7
        vstr.64 d7, [r7, #16]
        ldr     r3, [r7, #28]
        rsbs    r3, r3, #0
        str     r3, [r7, #28]
        ldrd    r2, [r7, #8]
        adds    r4, r2, #1
        adc     r5, r3, #0
        strd    r4, [r7, #8]
.L2:
        ldrd    r0, [r7, #8]
        ldrd    r2, [r7]
        cmp     r0, r2
        sbcs    r3, r1, r3
        blt     .L3
        vldr.64 d7, [r7, #16]
        vmov.f64        d6, #4.0e+0
        vmul.f64        d7, d7, d6
        vstr.64 d7, [r7, #16]
        ldrd    r2, [r7, #16]
        vmov    d7, r2, r3
        vmov.f64        d0, d7
        adds    r7, r7, #32
        mov     sp, r7
        vldm    sp!, {d8}
        pop     {r4, r5, r7, pc}
.LC0:
        .ascii  "%lld\000"
.LC1:
        .ascii  "%Lf\000"
main:
        push    {r7, lr}
        sub     sp, sp, #8
        add     r7, sp, #0
        mov     r3, r7
        mov     r1, r3
        movw    r0, #:lower16:.LC0
        movt    r0, #:upper16:.LC0
        bl      __isoc99_scanf
        ldrd    r2, [r7]
        mov     r0, r2
        mov     r1, r3
        bl      pi
        vmov    r2, r3, d0
        movw    r0, #:lower16:.LC1
        movt    r0, #:upper16:.LC1
        bl      printf
        movs    r3, #0
        mov     r0, r3
        adds    r7, r7, #8
        mov     sp, r7
        pop     {r7, pc}
