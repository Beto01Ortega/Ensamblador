;Programa que indica si una persona es mayor de edad o no

%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data

	msg_edad db 'Ingrese la edad '
	len_edad equ $ - msg_edad

	msg_mayor db 'La persona es mayor de edad'
	len_mayor equ $ - msg_mayor

	msg_menor db 'La persona es menor de edad'
	len_menor equ $ - msg_menor

section .bss

	edad resb 2

section .text
	global _start
_start:

	;Pedir la edad de la persona
	imprimir msg_edad,len_edad
	leer edad,2


	;Convirtir el valor de la edad a entero
	mov ax,[edad]
	sub ax,'0'

	;Comparar el valor de edad con 18
	cmp ax,18

    
	jge mayorEdad
    jna menorEdad
	
;Etiqueta que imprime el mensaje que es menor de edad	
menorEdad:
	imprimir msg_menor,len_menor
	jmp salir	

;Etiqueta que imprime el mensaje que es mayor de edad
mayorEdad:
	imprimir msg_mayor,len_mayor
	jmp salir


salir:
	mov eax,1
	int 80h

; no se porque chch no me sale 