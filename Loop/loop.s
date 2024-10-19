.global _start
.align 2

_start:
    mov X3, #2

loop:
    add X0, X3, #'0'
    mov W1, W0
    strb W1, [sp]

    mov X0, #1
    mov X1, sp
    mov X2, #1
    mov X16, #4
    svc #0x80

    sub X3, X3, #1

    cbnz X3, loop

end:
    mov X0, #0
    mov X16, #1
    svc #0x80
