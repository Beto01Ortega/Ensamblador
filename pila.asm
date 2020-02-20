%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj db "*"
    len_msj equ $-msj

    msje db " "
    len_msje equ $-msje

section .bss
    num_uno resb 2

section .text
    global _start

_start:
    
    mov ecx, 5
    jmp princip; lo puedo omitir igual va a entrar, pero para hacer referencia a los jumpers


princip: 
    cmp ecx, 0
    jz salir; o también je
    jmp imprimir

imprimir:
    dec ecx
    push ecx 
    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len_msj
    int 80h
    pop ecx 
    jmp princip

salir:
    mov eax, 1
    int 80h