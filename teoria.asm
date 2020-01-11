convertir de cadena a numero ----> se resta   sub 
convertir de numero a cadena ----> se suma    add
mov ax, opcion
sub ax, '0'

cmp (3,3)
ZF= 1
CF= 0
cmp (4,3)
ZF= 0 
CF= 0

jg= cuando el primer operando es mayor(>) que el segundo operando 
jng= cuando el primer operando es menor(<) que el segundo operando 
je= si son iguales 
jz= resultado es cero
js= signal ---> 0=pl
            -->1=ng
1.jnn= para definir jz js je jg
2.call
3.loop= define una dirección corta
4.jmp
existen 4 tipos de saltos los numerados en la linea de arriba
            CF      ZF
cmp(5,4)    0       0
cmp(4,5)    1       0
cmp(5,5)    0       1

PILAS
pop  --->obtiene
push --->guarda

