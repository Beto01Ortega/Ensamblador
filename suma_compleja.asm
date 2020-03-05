%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    numero1  db '3277' ;definimos cadenas
    numero2 db '2566'
    resultado db '     '
    len_resultado equ $ - resultado

section .text
    global _start
_start:
    mov esi, 3 
    mov ecx, 4
    clc; desactiva el bit (estado activo) de la bandera carry
proceso_suma:
    mov al, [numero1 + esi]
    ;mov ah, [numero2 + esi]
    ;adc al, ah ; el adc suma carry

    adc al, [numero2 + esi]
    aaa ; esta instruccion solo trabaja con al y sirve para ajustar bcd (compara si > 9 y le suma 0110 osea 6)
    pushf ; salva todos los estados para poder devolver con el estado aas 
    or al, 30h ; equivale al aas
    popf
    ; cuando los valores sone extensos se guardan en memoria 
    ;no hay como mover de direc indirecto a indirecto
    mov [resultado + esi], al
    dec esi ;decremento el esi
    loop proceso_suma
    
    escribir resultado, len_resultado


    mov eax, 1
    int 80h