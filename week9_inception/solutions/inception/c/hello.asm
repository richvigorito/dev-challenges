; 
; hello.asm (x86-64, NASM syntax)
; 
; 
; disclaimer: this was generated via chatgpt
; 
; 
section .text
global hello
extern printf

hello:
    push rdi
    lea rdi, [rel fmt]       ; RIP-relative address of format string
    pop rsi                  ; original arg becomes 2nd printf arg
    xor eax, eax             ; printf variadic requires eax = 0
    call printf wrt ..plt    ; ensure PLT call (position-independent)
    ret

section .rodata
fmt db "hello. Thank you for running %s queens", 10, 0

