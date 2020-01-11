; MAYOR DE 3 NUMEROS
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
        mensaje1 db 10,"Ingresar valor",10
        len1 equ $ - mensaje1

        mensaje2 db 10, "#1", 10
        len2 equ $ - mensaje2

        mensaje3 db 10,"#2",10
        len3 equ $ - mensaje3

        mensaje4 db 10,"#3",10
        len4 equ $ - mensaje4

        mensajef db 10,"El mayor es el número:",10
        lenf equ $ - mensajef

        mensajeI db 10,"Los números son iguales",10
        lenI equ $ - mensajeI
section .bss
        n1 resb 5
        n2 resb 5
        n3 resb 5
section .text
        global _start
_start:

; ingreso del primer numero

        escribir mensaje1, len1 
        escribir mensaje2, len2
        leer n1, 5

; ingreso del segundo numero 

        escribir mensaje3, len3

        leer n2, 5


; ingreso del tercer numero 

        escribir mensaje4, len4

        leer n3, 5
;proceso
        mov eax,[n1]
	    mov ebx,[n2]
	    mov ecx,[n3]
        cmp eax,ebx
	    jg compare
        je compare2
	    jmp compare2


compare:
	cmp eax,ecx
	jg pmayor
	jmp tmayor
	
compare2:
	cmp ebx,ecx
    je igual
	jg smayor
	jmp tmayor

igual: 
    escribir mensajeI, lenI
    jmp salir

pmayor:
    escribir mensajef, lenf
    escribir mensaje2, len2
	jmp salir

smayor:
    escribir mensajef, lenf
    escribir mensaje3, len3
	jmp salir
	
tmayor:
    escribir mensajef, lenf
    escribir mensaje4, len4
    jmp salir

salir: 
	mov eax,1
	int 80h
