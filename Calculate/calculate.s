.global _start
.align 2

_start:
    mov X0, #5
    mov X1, #4
    add X2, X0, X1
    add X2, X2, #'0'

    mov W3, W2
    strb W3, [sp]

    // int: fd
    mov X0, #1 
    // user_addr_t: cbuf
    mov X1, sp
    // user_size_t: nbyte
    mov X2, #1

    // https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master
    // 4	AUE_NULL	ALL	{ user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte); }
    // - Parameters:
    //   - int: fd
    //   - user_addr_t: cbuf
    //   - user_size_t: nbyte
    // - Returns:
    //   - user_ssize_t
    mov X16, #4
    // Supervisor Call
    svc #0x80
    // int: rval
    mov X0, #0
    // 1	AUE_EXIT	ALL	{ void exit(int rval); }
    // - Parameters:
    //   - int: rval
    // - Returns:
    //   - void
    mov X16, #1
    // Supervisor Call
    svc #0x80
