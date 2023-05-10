; function: _ft_strdup
; char* ft_strdup(const char* s);
;
; input:
; rdi - address of the string to duplicate
;
; output:
; rax - returns a pointer to the copy of s,
;       if insufficient memory returns NULL and errno is set to ENOMEM
;
; clobbered registers:
; rax, rbx

    global _ft_strdup
    extern _ft_strlen
    extern _ft_strcpy
    extern _malloc
    extern ___error

    section .text
_ft_strdup:
    ; save callee-saved registers (and align the stack in this case)
    push rbx

    ; get string len + 1 (for '\0')
    call _ft_strlen
    inc rax

    ; save string pointer
    mov rbx, rdi

    ; set first argument for malloc
    mov rdi, rax
    ; allocate memory
    call _malloc
    jc .error

    ; set first argument to allocated pointer
    mov rdi, rax
    ; set second argument to string pointer
    mov rsi, rbx
    ; copy string to allocated pointer
    call _ft_strcpy

    jmp .done
.error:
    ; save errno
    mov ebx, eax
    ; get errno address
    call ___error
    ; put errno in return value of ___error (pointer to errno)
    mov dword [rax], ebx

    ; error returns -1
    mov rax, -1
.done:
    ; restore callee-saved registers (and fix up the stack in this case)
    pop rbx

    ret
