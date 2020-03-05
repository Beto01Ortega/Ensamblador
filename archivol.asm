%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    archivo  db '/home/beto/Escritorio/ensamblador/Ensamblador/codigo.txt',0
    msj_err db "error en el archivo",10
    lenerror equ $- msj_err
section .bss
    idarchivo resb 1
    text resb 30
section .text
    global _start
_start:
    ;*************acceder al archivo**************
    mov eax, 5 ;se convoca una subrutina de "lectura" al sistema operativo 
    mov ebx, archivo
    mov ecx, 0         ; modos de acceso
                        ; R-only = 0
                        ; W-only = 1
                        ;RDWR = 2
    mov edx, 0 ; lo dejamos sin permiso por ahora
    int 80h

    ;*************testear archivo**************
    test eax, eax ; cuando la bandera ZR = 0 significa que no existe el archivo
     ;podemos de testear-registro, memoria-registro y memoria-memoria 
    ;el test nos va a devolver un 0 o 1
    jz err
    ;*************asignar el id del archivo**************
    mov dword [idarchivo], eax
    ;*************leer archivo**************
    mov eax, 3
    mov ebx, [idarchivo] ; aquí vinculamos el archivo
    mov ecx, text
    mov edx, 30
    int 80h

    imprimir text, 30
    ;*************cerrar archivo**************
    mov eax, 6
    mov ebx, [idarchivo]
    mov ecx, 0
    mov edx, 0
    
    jmp salir 
err:
    imprimir msj_err, lenerror

salir:
    mov eax, 1
    int 80h