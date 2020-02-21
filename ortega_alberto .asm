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
    msj_ingreso db 'Ingrese un caracter: ',10
    len_msj_ingreso equ $-msj_ingreso

    msj_res_con db 'Constante',10
    len_msj_res_con equ $-msj_res_con

    msj_res_voc db 'Vocal',10
    len_msj_res_voc equ $-msj_res_voc

    msj_res_num db 'Número',10
    len_msj_res_num equ $-msj_res_num

    msj_res_esp db 'Carácter Especial',10
    len_msj_res_esp equ $-msj_res_esp

    salto db '',10

section .bss
    caracter resb 2
    resp_retorno resb 2

section .text
    global _start

_start:

ingreso:
    imprimir msj_ingreso, len_msj_ingreso
    leer caracter, 2

    mov al, [caracter]
    cmp al, 47
    jg comprobar_numero

    jmp es_caracter

comprobar_numero:
    cmp al, 58
    jng es_numero

    cmp al, 64
    jg comprobar_mayusculas

    jmp es_caracter

comprobar_mayusculas:
    cmp al, 90
    jng comprobar_vocal_mayuscula

    cmp al, 96
    jg comprobar_minusculas

    jmp es_caracter

comprobar_minusculas:
    cmp al, 122
    jng comprobar_vocal_minuscula

    jmp es_caracter

comprobar_vocal_mayuscula:
    cmp al, 65
    je es_vocal

    cmp al, 69
    je es_vocal

    cmp al, 73
    je es_vocal

    cmp al, 79
    je es_vocal

    cmp al, 85
    je es_vocal

    jmp es_consonante

comprobar_vocal_minuscula:
    cmp al, 97
    je es_vocal

    cmp al, 101
    je es_vocal

    cmp al, 105
    je es_vocal

    cmp al, 111
    je es_vocal

    cmp al, 117
    je es_vocal

    jmp es_consonante

es_numero:
    imprimir msj_res_num, len_msj_res_num
    jmp ingreso

es_caracter:
    imprimir msj_res_esp, len_msj_res_esp
    jmp ingreso

es_consonante:
    imprimir msj_res_con, len_msj_res_con
    jmp ingreso

es_vocal:
    imprimir msj_res_voc, len_msj_res_voc
    jmp ingreso

retorno:
    imprimir salto, 1
    leer resp_retorno, 2

    mov al, [resp_retorno]

    push ax
    imprimir salto, 1
    pop ax

    cmp al, 121
    je _start

    jmp salida

salida:
    mov eax, 1
    int 80h
