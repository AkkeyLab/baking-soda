.global _start
.align 2

_start:
    mov X0, #8
    mov X1, #15
    add X2, X0, X1 // Calculate

    mov X0, X2
    mov X1, sp
    mov X2, #10

convert_loop:
    udiv X3, X0, X2      // 2024 / 10 = 202
    msub X4, X3, X2, X0  // 2024 - (202 * 10) = 4 -> 2024 % 10 = 4
    add X4, X4, #'0'

    // sub X1, X1, #1
    // strb W4, [X1]
    strb W4, [X1, #-1]!

    // prepare next loop
    mov X0, X3
    // zero check
    cmp X3, #0
    b.ne convert_loop

print_string:
    mov X0, #1
    // mov X1, X1
    mov X2, #2
    mov X16, #4
    svc #0x80

exit:
    mov X0, #0
    mov X16, #1
    svc #0x80
