; function: _ft_write
; ssize_t ft_write(int fd, const void* buf, size_t count);
;
; input:
; rdi - fd to write on
; rsi - buffer with bytes to read
; rdx - number of bytes to write
;
; output:
; rax - number of bytes written, -1 on error
;
; clobbered registers:
; rax, rbx

    global _ft_write
    extern ___error

    section .text
_ft_write:
    ; write syscall
    mov rax, 0x02000004
    syscall
    ; if syscall error (BSD sets the carry flag on error)
    jc .error

    ret
.error:
    ; save callee-saved registers (and align the stack in this case)
    push rbx

    ; save errno
    mov ebx, eax
    ; get errno address
    call ___error
    ; put errno in return value of ___error (pointer to errno)
    mov dword [rax], ebx

    ; restore callee-saved registers (and fix up the stack in this case)
    pop rbx

    ; error returns -1
    mov rax, -1
    ret
