;Programa que muestra mensajes en caso de que el numero ingresado sea menor o igual a cero
;En caso de ser positivo, evalua si es mayor a 5 divide el numero para 2. Caso contrario multiplica por 2 
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
	
	msg_numero db 'Ingrese el numero '
	len_numero equ $ - msg_numero

	msg_negativo db 'El numero ingresado es negativo =>'
	len_negativo equ $ - msg_negativo

	msg_cero db 'El numero ingresado es cero',10
	len_cero equ $ - msg_cero

	msg_cinco db 'El numero ingresado es cinco',10
	len_cinco equ $ - msg_cinco

	msg_producto db 'El producto es '
	len_producto equ $ - msg_producto

	msg_cociente db 'El cociente es '
	len_cociente equ $ - msg_cociente

	msg_residuo db 10,'El residuo es '
	len_residuo equ $ - msg_residuo

section .bss

	num resb 3
	producto resb 2
	cociente resb 2
	residuo resb 2

section .text
	global _start
_start:

	;Pedir el numero por consola
	imprimir msg_numero,len_numero
	leer num,3

	;Convertir el valor a numero 
	mov al,[num]
	sub al,'0'
	
	;En caso de que el numero ingresado sea cero
	jz cero

	;En caso de que el numero ingresado sea negativo
	js negativo

	cmp al,5
	jg dividir		  ;En caso de que el numero sea mayor a 5
	je cinco          ;En caso de que el numero ingresado sea 5
	jng multiplicar   ;En caso de que el numero este entre 1 y 4

negativo: 
	imprimir msg_negativo,len_negativo
	imprimir num,3
	jmp salir 

cero:
	imprimir msg_cero,len_cero
	jmp salir

cinco: 
	imprimir msg_cinco,len_cinco
	jmp salir

multiplicar:
	mov bl,2
	mul bl
	add ax,'0'
	mov [producto],ax

	imprimir msg_producto,len_producto
	imprimir producto,2
	jmp salir

dividir:
	mov bl,2
	div bl

	add al,'0'
	mov [cociente],al

	add ah,'0'
	mov [residuo],ah

	imprimir msg_cociente,len_cociente
	imprimir cociente,2

	imprimir msg_residuo,len_residuo
	imprimir residuo,2
	jmp salir


salir:
	mov eax,1
	int 80h