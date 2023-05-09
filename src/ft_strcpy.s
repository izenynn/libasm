; function: _ft_strcpy
; char* ft_strcpy(char* dest, const char* src);
;
; input:
; rdi - address of dest string
; rsi - address of source string
;
; output:
; rax - address of the dest string
;
; clobbered registers:
; rax, rcx, rdx

section .text
    global _ft_strcpy

; VERSION 1
; _ft_strcpy:
;     mov rax, rdi
; .loop:
;     mov cl, byte [rsi]
;     mov byte [rdi], cl
;
;     test cl, cl
;     jz .done
;
;     inc rdi
;     inc rsi
;
;     jmp .loop
; .done:
;     ret

; VERSION 2
_ft_strcpy:
    mov rax, rdi
    mov rcx, -1
.loop:
    inc rcx
    mov dl, byte [rsi + rcx]
    mov byte [rdi + rcx], dl

    cmp byte [rsi + rcx], 0
    jne .loop

    ret
