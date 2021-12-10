/*Instito tecnológico de Tijuana
* Lenguaje de interfaz
* Autor: Rodriguez Moreno Omar Gamaliel
* 06/12/2021
*
* r1 
* r3 N
* r4 J 
* r5	
* r6 divisor
* r7 R 
* r8 Q 
* r9 Numero de primos*/

.section	.bss
.comm prime, 2000	

.section	.data
spc:			
	.ascii "  "
len = . - spc
nl: 			
	.ascii "\n"
limit:			
	.long 500 

.section .text
.globl	_start
_start:

P1:			
ldr r1, =prime		
mov r0, $2		//damos el promer primo que es 2
str r0, [r1]		
ldr r0, =limit
ldr r9, [r0]		
mov r3, $3		//iniciamos N con 3
mov r4, $1		//iniciamos J con 1

P2:			
add r4, r4, $1		//Aumentamos J
str r3, [r1, #4]!	

P3:
cmp r4, r9		
bge P9			

P4:
add r3, r3, $2		//Aumentamos 2 a N

P5:			
ldr r6, =prime		
ldr r5, [r6]		
mov r7, r3		//Copiamos N en R
mov r8, $0		

P6:
cmp r7, r5		//Comparamos si R es igual o mayor que divisor
subge r7, r7, r5 	
addge r8, r8, $1	//aumentamos Q
bge P6			//Repetimos
cmp r7, $0		//Comparamos R con 0
beq P4			//Si no es primo N intentamos con el siguiente N

P7:
cmp r8, r5		//Comparamos Q con divisor
ble P2			//si Q <= divisor, N es primo

P8:
mov r7, r3		
mov r8, $0		
ldr r5, [r6, #4]!	
bal P6			

P9:
mov r0, $1		
mov r4, $0		
mov r5, $0		//Contamos todos los primos
ldr r6, =prime		
ldr r3, [r6]		

printLoop:
bl print_num		
add r4, $1		
add r5, $1		
cmp r5, r9 		
bge exit		
cmp r4, $9		//después de 10  primos
bgt newline		
ble space		

space:                  
mov r0, $1              
ldr r1, =spc		
ldr r2, =len	
mov r7, $4
svc $0
ldr r3, [r6, #4]!	//cargamos el nuevo primo
bal printLoop          

newline:                
mov r0, $1              
ldr r1, =nl             
mov r2, $1
mov r7, $4
svc $0
ldr r3, [r6, #4]!       
mov r4, $0              
bal printLoop		

print_num:
	stmfd sp!, {r0-r9, lr}	
	mov r4, $0 		
	mov r5, $1		

loop:				
	cmp r3, $9		
	ble stackPush		//if r3 <= 9, llamamos stackPush
	sub r3, r3, $10		
	add r4, r4, $1		
	bal loop		

stackPush:
	add r5, r5, $1		//aumentamos char counter
	orr r0, r3, $0x30	
	stmfd	sp!, {r0}	
	cmp r4, $0		
	beq printChars		
	mov r3, r4		
	mov r4, $0		
	bal loop		

printChars:
	mov r1, sp		
	mov r0, $1		
	mov r2, $1		
	mov r7, $4		
	svc $0			
	subs r5, r5, $1		
	ble return		
	ldmfd sp!, {r0}		 
	bal printChars		
return:
	ldmfd sp!, {r0-r9, pc}	

exit:
mov r0, $1			
ldr r1, =nl
mov r2, $1
mov r7, $4
svc $0
mov r7, $1			
svc $0

.end
