%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    numero1  db '518' 
    numero2 db '197'
    resultado db '     '
    len_resultado equ $ - resultado

section .text
    global _start
_start:
    mov esi, 2
    mov ecx, 3
    clc
proceso_resta:
    mov al, [numero1 + esi]
    ; sbb componente para restar
    sbb al, [numero2 + esi]
    aas; solo sirve en la "resta" 
    pushf 
    or al, 30h ; 30h = 48
    popf

    mov [resultado + esi], al
    dec esi 
    loop proceso_resta
    
    escribir resultado, len_resultado

    mov eax, 1
    int 80h