; un programa que muestra la funcionalidad loop
; e imprimir el resultado en pantalla


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
	msj db "Ingrese un número:"
	len equ $ - msj
	new_line db '',10

section .bss
	numero resb 2
	resultado resb 1
	
section .text
	global _start

_start :
	; ******* mensaje ingrese número
    imprimir msj, len
    leer numero, 1

	mov ecx, [numero]
	sub ecx, '0'	
	jmp imprim

imprim:
	push ecx		; en numero
	mov eax, ecx
	add eax, '0'
	mov [numero], eax

    imprimir numero, 1
    imprimir new_line,1

	pop ecx
	loop imprim
	jmp salir
salir:
	mov eax, 1
	int 80h