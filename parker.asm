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

section .text
    global _start

_start:

ingreso:
    imprimir msj_ingreso, len_msj_ingreso
    leer caracter, 2

    mov bl, [caracter]
    cmp bl, 47
    jg comp_n

    jmp es_caracter

comp_n:

    cmp bl,48
    je es_numero
    cmp bl,49
    je es_numero
    cmp bl,50
    je es_numero
    cmp bl,51
    je es_numero
    cmp bl,52
    je es_numero
    cmp bl,53
    je es_numero
    cmp bl,54
    je es_numero
    cmp bl,55
    je es_numero
    cmp bl,56
    je es_numero
    cmp bl,57
    je es_numero
    jmp comp_M

comp_M:
    cmp bl, 65
    je es_vocal
    cmp bl, 66
    je es_consonante
    cmp bl, 67
    je es_consonante
    cmp bl, 68
    je es_consonante
    cmp bl, 69
    je es_vocal
    cmp bl, 70
    je es_consonante
    cmp bl, 71
    je es_consonante
    cmp bl, 72
    je es_consonante
    cmp bl, 73
    je es_vocal
    cmp bl, 74
    je es_consonante
    cmp bl, 75
    je es_consonante
    cmp bl, 76
    je es_consonante
    cmp bl, 77
    je es_consonante
    cmp bl, 78
    je es_consonante
    cmp bl, 79
    je es_vocal
    cmp bl, 80
    je es_consonante
    cmp bl, 81
    je es_consonante
    cmp bl, 82
    je es_consonante
    cmp bl, 83
    je es_consonante
    cmp bl, 85
    je es_consonante
    cmp bl, 85
    je es_vocal
    cmp bl, 86
    je es_consonante
    cmp bl, 87
    je es_consonante
    cmp bl, 88
    je es_consonante
    cmp bl, 89
    je es_consonante
    cmp bl, 90
    je es_consonante

    jmp comp_m

comp_m:
    cmp bl, 97
    je es_vocal
    cmp bl, 98
    je es_consonante
    cmp bl, 99
    je es_consonante
    cmp bl, 100
    je es_consonante
    cmp bl, 101
    je es_vocal
    cmp bl, 102
    je es_consonante
    cmp bl, 103
    je es_consonante
    cmp bl, 104
    je es_consonante
    cmp bl, 105
    je es_vocal
    cmp bl, 106
    je es_consonante
    cmp bl, 107
    je es_consonante
    cmp bl, 108
    je es_consonante
    cmp bl, 109
    je es_consonante
    cmp bl, 110
    je es_consonante
    cmp bl, 111
    je es_vocal
    cmp bl, 112
    je es_consonante
    cmp bl, 113
    je es_consonante
    cmp bl, 114
    je es_consonante
    cmp bl, 115
    je es_consonante
    cmp bl, 116
    je es_consonante
    cmp bl, 117
    je es_vocal
    cmp bl, 118
    je es_consonante
    cmp bl, 119
    je es_consonante
    cmp bl, 120
    je es_consonante
    cmp bl, 121
    je es_consonante
    cmp bl, 122
    je es_consonante


    jne es_caracter

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

salida:
    mov eax, 1
    int 80h
