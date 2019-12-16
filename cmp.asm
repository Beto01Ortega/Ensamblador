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
        mensaje1 db 10,"ADVERTENCIA: Operación de 8 bits",10
        len1 equ $ - mensaje1

        mensajen1 db "#1: "
        lenn1 equ $ - mensajen1

        mensajen2 db "#2: "
        lenn2 equ $ - mensajen2

        mensajesuma db 10,"suma: "
        lensuma equ $ - mensajesuma

        mensajeres db 10,"resta: "
        lenres equ $ - mensajeres

        mensajeprod db 10,"Producto: "
        lenprod equ $ - mensajeprod

        mensajedivid db 10,"***La división***",10
        lendivid equ $ - mensajedivid

        mensaje2 db 10,"Cociente: "
        len2 equ $ - mensaje2

        new_line db 10, " "

        mensajed db 10, "residuo: "
        lend equ $ - mensajed


        mensajeop db 10, "Elija una opción: ", 10, "1. Suma", 10, "2. Resta", 10, "3. Producto",  10, "4. Dividir",10
        lenop equ $ - mensajeop

section .bss
        n1 resb 1
        n2 resb 1
        residuo resb 1
        cociente resb 1
        suma resb 1
        resta resb 1
        producto resb 1
        opcion resb 2

section .text
        global _start
_start:
        
      
; ingreso del primer numero

        escribir mensajen1, lenn1 

        leer n1, 2


; ingreso del segundo numero 

        escribir mensajen2, lenn2

        leer n2, 2

        escribir mensaje1, len1
        
        
        escribir mensajeop, lenop

        leer opcion, 2
        mov bl, [opcion]
        sub bl, '0'

        cmp bl,1
        je sum

        cmp bl,2
        je rest

        cmp bl,3
        je mult

        cmp bl,4
        je dividir
      
sum:
        
        mov ax, [n1]
        mov bx, [n2]
        
        sub ax, '0'
        sub bx, '0'
        add ax, bx
        add ax, '0'
    
        mov[suma], ax

        escribir mensajesuma, lensuma
        escribir suma, 1

        jmp salir

rest:
        mov ax, [n1]
        mov bx, [n2]
        
        sub ax, '0'
        sub bx, '0'
        sub ax, bx
        add ax, '0'
    
        mov[resta], ax

        escribir mensajeres, lenres
        escribir resta, 1

        jmp salir


mult:
        mov al, [n1]
        mov bl, [n2]
        
        sub ax, '0'
        sub bl, '0'

        mul bl
        add al, '0'
        mov [producto], al

        escribir mensajeprod, lenprod
        escribir producto, 1

        jmp salir

dividir:
        escribir mensajedivid, lendivid
       
        mov al, [n1]
        mov bl, [n2]
        
        sub ax, '0'
        sub bl, '0'


        div bl
        add al, '0'  
        mov [cociente], al 
        add ah, '0'
        mov [residuo], ah
        ;++++++++++++++++++cociente++++++++++++++++++++++++++
        escribir mensaje2, len2
        escribir cociente, 1
        ;++++++++++++++++++residuo++++++++++++++++++++++++++
        escribir mensajed, lend
        escribir residuo, 1


        escribir new_line, 1
        jmp salir
        ;++++++++++++++++++resultado++++++++++++++++++++++++++
salir: 
        
        mov eax, 1
        int 80h

; call son subrutinas

; al= cociente
; ah= residuo