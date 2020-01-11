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

section .bss
        n1 resb 2
section .data
        msj db 10, "Escribir el directorio: ej /home/beto/Escritorio/carpet",10
        lenn1 equ $ - msj
        msj1 db 10, "Que dificil hacer clic derecho y crear carpeta",10
        len1 equ $ - msj1
        ;path db '/home/beto/Escritorio/carpet', 0
        ;len_path equ $ - path
        
section .text
        global _start 
_start:
        escribir msj, lenn1
        leer n1, 30

        mov eax, 39  ;servicio para crear un directorio
        mov ebx, n1 ; define la ruta del servicio
        mov ecx, 0x1FF ;definimos el tipo de permiso 777
        int 80h

        escribir msj1, len1

        mov eax, 1
        int 80h
