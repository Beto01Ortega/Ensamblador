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
        mensaje1 db 10,"ADVERTENCIA: Operación de 8 bits",10
        len1 equ $ - mensaje1

        mensajen1 db "Ingrese un número:"
        lenn1 equ $ - mensajen1

        mensajen2 db "El número es primo"
        lenn2 equ $ - mensajen2

        mensajesuma db 10,"El número no es primo"
        lensuma equ $ - mensajesuma

        mensajeres db 10,"resta: "
        lenres equ $ - mensajeres

section .bss
        n1 resb 2
        n2 resb 1
        residuo resb 1
        cociente resb 1
        suma resb 1

section .text
        global _start
_start:
        
ingreso:    
; ingreso del primer numero

        escribir mensaje1, len1 
        escribir mensajen1, lenn1 
        leer n1, 2
        