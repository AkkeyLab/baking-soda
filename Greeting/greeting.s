.global _start
.align 2

_start: 
    // int: fd
    mov X0, #1 
    // user_addr_t: cbuf
    adr X1, greeting
    // user_size_t: nbyte
    // "Hello, AkkeyLab\n".length -> 16
    mov X2, #16
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

greeting: .ascii "Hello, AkkeyLab\n"
