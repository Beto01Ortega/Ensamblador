convertir de cadena a numero ----> se resta
convertir de numero a cadena ----> se suma
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
