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

segment .data
	msj db "ingrese 5 números:", 10
	len1 equ $-msj

	msj2 db "El # mayor es: "
	len2 equ $-msj2

    msj3 db "El # menor es: "
	len3 equ $-msj3

	arre db 0,0,0,0,0
	la equ $-arre

segment .bss
	aux resb 2
    aux2 resb 2

segment .text
	global _start

_start:
  
	escribir msj, len1
	mov esi, arre
	mov edi, 0

lee:
    leer aux, 2
	mov al, [aux]
	sub al, '0'

	mov [esi], al
 
	add esi, 1
	add edi, 1

	cmp edi, la
	jb lee 		;Se efectúa el salto si CF esta activada.

	mov ecx, 0
	mov bl, 0   

lp:
	mov al, [arre+ecx]
	cmp al, bl
	jb reg
	mov bl, al

reg:
	inc ecx
	cmp ecx, la
	jb lp

imprimir:
	add bl, '0'
	mov [aux], bl

	escribir msj2, len2

	escribir aux, 2 


salir:
	mov eax, 1
	int 80h

