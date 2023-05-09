; function:
; size_t ft_strlen(const char* s);
;
; input:
; rdi - address of the null-terminated string
;
; output:
; rax - length of the string (excluding the null character)
;
; clobbered registers:
; rax

    global _ft_strlen

    section .text
; VERSION 1
; _ft_strlen:
;     ; save callee-saved registers (none in this case)
;
;     ; initialize length counter (rax) to 0
;     xor rax, rax
; 
;     ; loop until a null character is found
; .loop:
;     ; load the current character into rcx
;     movzx rcx, byte [rdi + rax]
; 
;     ; check if the current character is null
;     test rcx, rcx
;     jz .done
;     ; Alternative: compare and jump if equal
;     ; cmp byte rcx, 0
;     ; cmp cl, 0
;     ; je .done
;
;     ; increment length counter
;     inc rax
;
;     ; continue with the next character
;     jmp .loop
;
; .done:
;     ; restore callee-saved registers (none in this case)
;
;     ; return
;     ret

; VERSION 2
_ft_strlen:
    mov rax, -1
.loop:
    inc rax
    cmp byte [rdi + rax], 0
    jne .loop
    ret
