; se escribe un numero y se decrementa 
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
    msj db 10,"Ingrese un número:",10
    len_msj equ $-msj

    msj_enter db 10,"",10
    len_msjen equ $-msj_enter

section .bss
    num resb 2

section .text
    global _start

_start:
    ;Pido número
    escribir msj, len_msj
    leer num, 1
    
    ;Desarrollo
    jmp imprimir

imprimir:
    mov eax, [num]
    push eax

    escribir num, 1
    escribir msj_enter, 1
    
    pop eax
    sub eax, '0'
    dec eax
    
    mov ecx, eax 
    add eax, '0'
    mov [num], eax

    cmp ecx, 0
    jz salir
    jmp imprimir

salir:
    mov eax, 1
    int 80h