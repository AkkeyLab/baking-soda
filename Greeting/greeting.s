.global _start
.align 2

_start: 
    // std out
    mov X0, #1 
    adr X1, greeting
    // "Hello, AkkeyLab\n".length
    mov X2, #16
    // Unix write system call
    mov X16, #4
    // Call kernel to output the string
    svc #0x80
    // exit
    mov X0, #0
    // exit
    mov X16, #1
    svc #0x80

greeting: .ascii "Hello, AkkeyLab\n"
