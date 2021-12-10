/*Instito tecnológico de Tijuana
* Lenguaje de interfaz
* Autor: Rodriguez Moreno Omar Gamaliel
* 13/12/2021
* Realiza 10 Hola mundo con uno o medio segundo de delay
*/	
	.data
	.balign 4	
hello:  .asciz "Hola mundo!\n\n"
seconds:
	.int	1		// 1 segundo
microsec:
	.int	500000		// medio segundo
	
n	.req    r6              //contador
max	.req	r5		// maximo de veces

	
	.text
	.global main
	.extern printf
	.extern sleep
	.extern usleep
	
main:   push 	{ip, lr}	
	mov	n, #0
	mov	max, #10
	
loop:	cmp	n, max		//Nos aseguramos si n es mayor que el maximo
	bgt	done		//sino sacamos el string
	
        ldr 	r0, =hello
        bl 	printf		

@	ldr	r0, =seconds	//usamos sleep para los segundos
@	ldr	r0, [r0]	
@	bl	sleep

	ldr	r0, =microsec	//usleep es para microsegundos, en este caso medio sec
	ldr	r0, [r0]	
	bl	usleep
	
	add	n, #1		//aumentamos contador en 1
	b	loop

done:	
        pop 	{ip, pc}	
