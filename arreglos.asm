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
    msj db "Ingrese 6 numeros",10
    len equ $-msj

    msj1 db "El numero mayor es: ",10
    len1 equ $-msj1

    msj2 db "Listado: ",10
    len2 equ $-msj2
    
    arreglo db 0,0,0,0,0,0
    len_arreglo equ $-arreglo

section .bss
    numero resb 2
    mayor resb 2
    menor resb 2

section .text
    global _start

_start:
    imprimir msj, len

    ; asignacion del arreglo en las posiciones efectivas
    mov esi, arreglo
    mov edi, 0

lectura:
    leer numero, 2

    ; asignacion de un numero al arreglo
    mov al, [numero]
    sub al, '0'
    mov [esi], al

    add esi, 1
    add edi, 1

    ; comparar para el salto
    cmp edi, len_arreglo
    jb lectura

    sub esi, len_arreglo
    mov edi, 0

    mov al, 0
    mov [mayor], al

    mov al, [esi]
    mov [menor], al

    imprimir msj2, len2

impresion:
    mov al, [esi]
    add al, '0'

;    mov bl, [mayor]
;    mov cl, [menor]

;   cmp bl, al
;    jng asignar_mayor

;    cmp cl, al
;    jg asignar_menor
    
    mov [numero], al
    imprimir numero, 2 

    add esi, 1
    add edi, 1

    cmp edi, len_arreglo
    jb impresion

    mov al, [mayor]
    add al, '0'
    mov [mayor], al

    imprimir mayor,2

    jmp salida

salida:
    mov eax, 1
    int 80h