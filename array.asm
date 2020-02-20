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

	msg db "Ingrese 6 numeros",10
	tam equ $ - msg

	msg_mayor db "El número mayor es "
	tam_mayor equ $ - msg_mayor

	msg_menor db "El número menor es "
	tam_menor equ $ - msg_menor

	msg_salto db 10,""
	tam_salto equ $ - msg_salto

	arreglo db 0,0,0,0,0,0
	tam_arreglo equ $ - arreglo

	msj2 db "# ingresados: ",10
    len2 equ $-msj2

section .bss
	num resb 2
	may resb 2
	men resb 2
	igu resb 2

section .text
	global _start
_start:
	
	imprimir msg,tam

	mov esi,arreglo
	mov edi,0

ciclo:
	leer num,2

	mov al,[num]
	sub al,'0'
	mov [esi],al

	add esi,1
	add edi,1

	cmp edi,tam_arreglo
	jb ciclo 

	imprimir msg_salto,tam_salto

	sub esi,tam_arreglo
	mov edi,0

	imprimir msj2, len2

escribir:
	
	mov al,[esi]
	add al,'0'

	mov [num],al
	imprimir num,2

	add esi,1
	add edi,1

	cmp edi,tam_arreglo
	jb escribir

	sub esi,tam_arreglo
	mov edi,0

	mov ebx,0

	
mayor: 
	cmp [esi],ebx
	jg numMayor
	je continuar
	jng continuar

numMayor:
	mov ebx,[esi]
	jmp continuar



continuar:
	add esi,1
	add edi,1

	cmp edi,tam_arreglo
	jb mayor

	add bl,'0'
	mov [may],bl

	imprimir msg_mayor,tam_mayor
	imprimir may,2

salir:
	mov eax,1
	int 80h