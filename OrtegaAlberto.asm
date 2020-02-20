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
        mensaje1 db 10,"ADVERTENCIA: Números del 1 al 9",10
        len1 equ $ - mensaje1

        mensajen1 db "Ingrese un número:",10
        lenn1 equ $ - mensajen1

        mensajen2 db 10,"El número es primo",10
        lenn2 equ $ - mensajen2

        mensajesuma db 10,"El número no es primo",10
        lensuma equ $ - mensajesuma

        msg_cociente db 'El cociente es '
	    len_cociente equ $ - msg_cociente

	    msg_residuo db 10,'El residuo es '
	    len_residuo equ $ - msg_residuo
        
section .bss
        n1 resb 3
        residuo resb 2
        cociente resb 2
        
section .text
        global _start
_start:
         
; ingreso del número

        escribir mensaje1, len1 
        escribir mensajen1, lenn1 
        leer n1, 3


        mov al,[n1]
	    sub al,'0'

        
        ; al= cociente
        ; ah= residuo
        ;divido para si mismo
        mov bl, [n1]
        sub bl,'0'
	    div bl

	    add al,'0'
	    mov [cociente],al

	    add ah,'0'
	    mov [residuo],ah

        ; comparo si el cociente es igual a 1
        cmp al,1 
        je div ; si son iguales lo envio a la etiqueta div
        jg noprimo ;si es  mayor al imprimo que no es primo

        ;escribir msg_cociente, len_cociente
        ;escribir cociente,2

        ;escribir msg_residuo, len_residuo
        ;escribir residuo,2
        ;jmp salir

div: 
; divido para la unidad
    mov bl, 1
	div bl

	add al,'0'
	mov [cociente],al

	add ah,'0'
	mov [residuo],ah

        ; comparo si el cociente es igual al numero
    cmp al, [n1]
        ;cmp ah, 0
    je primo  ;si es igual imprimo que es primo
    jg noprimo ; si el cociente es mayor imprimo que no es primo
        
        
        ;escribir msg_cociente, len_cociente
        ;escribir cociente,2

        ;escribir msg_residuo, len_residuo
        ;escribir residuo,2
        ;jmp salir

primo:
    escribir mensajen2, lenn2
    jmp salir

noprimo:
    escribir mensajesuma, lensuma
    jmp salir
salir:
	mov eax,1
	int 80h