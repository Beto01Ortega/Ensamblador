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
        msj db 10, "Número mayor",10
        len1 equ $ - msj
        msj2 db 10, "Número menor",10
        len2 equ $ - msj2

        mensajen1 db "#1: "
        lenn1 equ $ - mensajen1

        mensajen2 db "#2: "
        lenn2 equ $ - mensajen2

        mensajes db 10,"Son iguales",10
        lens equ $ - mensajes

section .bss
        n1 resb 1
        n2 resb 2
section .text
        global _start ; establece una posición de memoria
_start:

      
; ingreso del primer numero

        escribir mensajen1, lenn1 

        leer n1, 2


; ingreso del segundo numero 

        escribir mensajen2, lenn2

        leer n2, 2 

        mov al, [n1]
        mov bl, [n2]
        cmp al, bl  
        jg mayor   ; (ZF=0, CF=0)  
        je igual
        jng menor
       
        
mayor:
        mov eax, 4
        mov ebx, 1
        mov ecx, msj
        mov edx, len1
        int 80h  ; se va al sistema operativo 
        jmp salir

menor:
        mov eax, 4
        mov ebx, 1
        mov ecx, msj2
        mov edx, len2
        int 80h  ; se va al sistema operativo 
        jmp salir
igual: 
        mov eax, 4
        mov ebx, 1
        mov ecx, mensajes
        mov edx, lens
        int 80h  ; se va al sistema operativo 
        jmp salir
salir: 
        mov eax, 1
        int 80h
