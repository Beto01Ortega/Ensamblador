%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj_ingreso db 'Ingrese un número del 1 al 9:',10
    len_msj_ingreso equ $-msj_ingreso

    msj_binario db 'El binario es:',10
    len_binario equ $-msj_binario

    salto db '',10

    msj_cero db '0',10
    len_cero equ $-msj_cero

    msj_uno db '1',10
    len_uno equ $-msj_uno

section .bss
    numero resb 2

section .text
    global _start

_start:

ingreso:
    imprimir msj_ingreso, len_msj_ingreso
    leer numero, 2

    mov al, [numero]
    sub al, '0'

    cmp al, 0
    je bin_cero
    jne comparacion
comparacion: 
    cmp al, 1
    je bin_uno
    cmp al, 2
    je bin_dos
    cmp al,3
    je bin_tres
    cmp al,4
    je bin_cuatro
    cmp al, 5
    je bin_cinco
    cmp al, 6
    je bin_seis
    cmp al, 7
    je bin_siete
    cmp al, 8
    je bin_ocho
    cmp al, 9
    je bin_nueve

bin_cero:
    imprimir msj_binario, len_binario
    imprimir msj_cero, len_cero
    jmp ingreso
bin_uno:
    imprimir msj_binario, len_binario
    imprimir msj_uno, len_uno
    jmp ingreso
bin_dos:
    jmp ingreso
bin_tres:
    jmp ingreso
bin_cuatro:
    jmp ingreso
bin_cinco:
    jmp ingreso
bin_seis:
    jmp ingreso
bin_siete:
    jmp ingreso
bin_ocho:
    jmp ingreso
bin_nueve:
    jmp ingreso


salir:
    mov eax, 1
    int 80h
