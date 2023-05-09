; function: _ft_read
; ssize_t ft_read(int fd, void* buf, size_t count);
;
; input:
; rdi - fd to read on
; rsi - buffer to save readed bytes
; rdx - number of bytes to read
;
; output:
; rax - number of bytes actually readed, 0 on end-of-file, -1 on error
;
; clobbered registers:
; rax, rbx

    global _ft_read
    extern ___error

    section .text
_ft_read:
    ; write syscall
    mov rax, 0x02000003
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
