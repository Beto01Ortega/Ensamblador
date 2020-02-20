%macro escribir 2
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
	msj db 10,"Ok polisha"
	lenn equ $ - msj

	msje db 10,""
	lene equ $ - msje

section .bss
    cont resb 1

section .text
	global _start
_start:
    mov ecx, 20
ciclo:
	push ecx
    mov eax,4
	mov ebx,1

    add ecx, '0'
    mov [cont], cx

	mov ecx,msj
	mov edx,lenn
	int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, cont
    mov edx, 1
    int 80h
    pop ecx 
    loop ciclo


	mov eax,1
	int 80h

    ; CORREGIR ESTE CODIGO CON LA IMAGEN DE FRANZ
    