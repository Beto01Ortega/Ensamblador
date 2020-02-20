;Programa que imprime un cubo con caracteres

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
	msj db "* "
	lenn equ $ - msj

	msje db 10,""
	lene equ $ - msje

section .bss


section .text
	global _start
_start:

	mov cx,5
	mov dx,5

princip:
	cmp cx,0
	jg mostrar
	je exam 


mostrar:
	push cx
	push dx
	imprimir msj, lenn
	pop dx
	pop cx

	dec cx
	jmp princip
	

exam:
	dec dx

	push dx
	imprimir msje, lene
	pop dx

	mov cx,5

	cmp dx,0
	jg princip
	je salir

salir:
	mov eax,1
	int 80h