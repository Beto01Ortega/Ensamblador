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

        mensajeop db 10, "Elija una opción: ", 10, "1. Area de Cuadrado", 10, "2. Area de Circulo", 10, "3.Area de Rectangulo",  10
        lenop equ $ - mensajeop

        mensajelado db "Ingrese Lado: "
        lenlado equ $ - mensajelado

        mensajeac db "área del cuadrado es: "
        lenac equ $ - mensajeac

        mensajebase db 10,"base: "
        lenbase equ $ - mensajebase

        mensajealt db 10,"altura: "
        lenalt equ $ - mensajealt

        mensajear db 10,"área del rectangulo es: "
        lenar equ $ - mensajear

        mensajecirc db 10,"radio",10
        lencirc equ $ - mensajecirc

        mensaje2 db 10,"área del circulo es: "
        len2 equ $ - mensaje2

        new_line db 10, " "





section .bss
        lado resb 1
        base resb 1
        altura resb 1
        ar resb 1
        resp resb 1
        radio resb 1
        circunf resb 1
        opcion resb 2

section .text
        global _start
_start:
        
        escribir mensajeop, lenop


; *****opción*******
        leer opcion, 2
        mov bl, [opcion]
        sub bl, '0'

        cmp bl,1
        je area_cuadrado

        cmp bl,2
        je area_circulo

        cmp bl,3
        je area_rectangulo


      
area_cuadrado:
        escribir  mensajelado, lenlado
        leer lado, 2

        mov al,[lado]  
	    mov bl,[lado]  

        sub al,'0' 
        sub bl,'0' 

	    mul bl 

        add al,'0'  
        mov [resp],al  
	

        escribir mensaje2, len2
        escribir resp, 1

        jmp salir

area_circulo:
        escribir  mensajecirc, lencirc
        leer radio, 2

        mov al,[radio]  
	    mov bl,[radio]  

        sub ax,'0'  
        sub bl,'0' 

	    mul bl 
        add al,'0' 

        mov al,al 
	    mov bl,3 

        sub ax,'0' 
        
        mul bl 
        add al,'0'  

        mov [circunf],al  

        escribir mensaje2, len2
        escribir circunf, 1

        jmp salir


area_rectangulo:
        escribir  mensajebase, lenbase
        leer base, 2
        escribir  mensajealt, lenalt
        leer altura, 2

        mov al,[base]  
	    mov bl,[altura]  

        sub al,'0' 
        sub bl,'0' 

	    mul bl 

        add al,'0'  
        mov [ar],al  
	

        escribir mensajear, lenar
        escribir ar, 1

        jmp salir
salir: 
        
        mov eax, 1
        int 80h

