; function: _ft_strcmp
; int ft_strcmp(const char* s1, const char* s2);
;
; input:
; rdi - address of s1 string
; rsi - address of s2 string
;
; output:
; rax - integer difference according as s1 is >,== or < than s2
;
; clobbered registers:
; rax, rcx, rdx

    global _ft_strcmp

    section .text
_ft_strcmp:
    mov rax, -1
.loop:
    inc rax

    mov cl, byte [rdi + rax]
    mov dl, byte [rsi + rax]

    cmp cl, dl
    jne .done

    test cl, cl
    jz .done

    jmp .loop
.done
    movzx rax, cl
    movzx rdx, dl
    sub rax, rdx
    ret
