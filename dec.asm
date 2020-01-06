%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        push cx
        add cx, '0'
        mov [cont], cx
        mov ecx, %1
        mov edx, %2
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, cont
        mov edx, 1
        int 80h
        pop cx
%endmacro


%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
section .data
        msj db 10, "Item: ",10
        lenn1 equ $ - msj
        
section .bss
        n1 resb 2
        n2 resb 2
        cont resb 1
section .text
        global _start 
_start:
        
        mov cx, 10
        ;mov [cont], cx

ciclo: 
        cmp cx, 0
        jz salir
        dec cx
        jnz imprimir_msj

imprimir_msj:
        escribir msj, lenn1

        jmp ciclo
        

salir: 
        mov eax, 1
        int 80h
