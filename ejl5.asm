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
	cont db 0 ;cont = contador 
    MCM db 0 ;en esta variable se guarda el MCM
    MCD db 0 ;en esta variable se guarda el MCD
    nro1 db 48 ;numero1 decimal
    nro2 db 60 ;numero2 decimal

section .bss
	;cont resb 2
	;MCM resb 2
	
section .text
	global _start

_start :
	
    mov cont,1
bucle: 
    mov ah,0
    mov al,cont
    mov bl,nro1
    div bl
    cmp ah,0 ;si el resto de la division del contador con el nro1 es igual 0
    je parte1 
bc:
 inc cont ;incrementar el contador
 jmp bucle ;bucle hasta que encuentre el MCM

parte1: ;si nro1 es multiplo del contador
 mov ah,0
 mov al,cont
 mov bl,nro2
 div bl
 cmp ah,0 ;compara si el resto de la division del contador con el nro2 es 0
 je parte2 
 jmp bc ;si el nro2 no es multiplo del contador regresa a bucle1
parte2: ;si el nro1 y el nro2 son multiplos del contador
 mov al,cont
 mov MCM,al ;guarda el MCM
 jmp parte3 ;ir a final

parte3: ;una vez que tengamos el MCM primero multiplicar nro1 * nro 2
 mov al, nro1 ;con ese resultado, dividir por el MCM de nro1 y nro2 y tenemos el MCD
 mov bl, nro2
 mul bl
 mov bl, MCM
 div bl 
 mov MCD, al 

salir:
	mov eax, 1
	int 80h





