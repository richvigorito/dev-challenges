; 
; hello.asm (x86-64, NASM syntax)
; 
; 
; disclaimer: this was generated via chatgpt
; 

section .text
global hello
extern printf

hello:
    ; assumes first arg is in rdi (Linux calling convention)
    push rdi
    mov rdi, fmt
    pop rsi
    xor eax, eax
    call printf
    ret

section .rodata
fmt db "hello %s", 10, 0
