/*Instito tecnológico de Tijuana
* Lenguaje de interfaz
* Autor: Rodriguez Moreno Omar Gamaliel
* programa corto que obtiene la entrada del teclado y luego lo imprime de nuevo en la pantalla.
*
* 13/12/2021
*/


.section	.bss
.comm buffer, 48	     

.section	.data
msg:
	.ascii	"** Greeter **\nIntroduzca su nombre: "
msgLen = . - msg
msg2:
	.ascii	"Hola "
msg2Len = . - msg2

.section	.text
.globl	_start
_start:

mov r0, $1		   //imprimimos el mensaje incial	
ldr r1, =msg
ldr r2, =msgLen
mov r7, $4
svc $0

mov r7, $3		    //leemos
mov r0, $1		
ldr r1, =buffer
mov r2, $0x30
svc $0

mov r0, $1		    //imprimimos el msg2
ldr r1, =msg2
ldr r2, =msg2Len
mov r7, $4
svc $0

mov r0, $1		   
ldr r1, =buffer
mov r2, $0x30
mov r7, $4
svc $0

mov r7, $1	            
svc $0		            
.end
