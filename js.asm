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
        msj db 10, "#1:",10
        lenn1 equ $ - msj
        msj2 db 10, "#2:",10
        lenn2 equ $ - msj2
        msjsad db 10, "Es negativo",10
        len1 equ $ - msjsad
        msj2smile db 10, "Es positivo",10
        len2 equ $ - msj2smile
section .bss
        n1 resb 2
        n2 resb 2
        
section .text
        global _start ; establece una posición de memoria osea etiqueta de inicio
_start:



      
; ingreso de numeros

        escribir msj, lenn1 ;5

        leer n1, 2

        escribir msj2, lenn2  ;9

        leer n2, 2

        mov ax, [n1]
        mov bx, [n2]
        sub ax, '0'
        sub bx, '0'
        sub ax, bx
      
        js negativo
        jmp positivo

positivo:
        escribir msj2smile, len2

        jmp salir        

negativo: 

        escribir msjsad, len1

        jmp salir
salir: 
        mov eax, 1
        int 80h
