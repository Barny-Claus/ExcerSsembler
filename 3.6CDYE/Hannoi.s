/*Instito tecnológico de Tijuana
* Lenguaje de interfaz
* Autor: Rodriguez Moreno Omar Gamaliel
* 13/12/2021
*/
	.data
	.balign 4
prompt:	.asciz	"Cuantos discos quieres mover? "
format:	.asciz	"%d"	
string: .asciz  "mover el disco de %c a %c\n\0"
peg1:	.int	'A'		
peg2:	.int	'B'
peg3:	.int	'C'
n:	.int	4		
	
	.text
	.global main
	.extern printf
	.extern	scanf

getNumberOfDisks:
	push 	{ip, lr}	

	ldr	r0, =prompt	
	bl	printf

	ldr     r0, =format	//llamamos al scanf
	ldr	r1, =n		
	bl	scanf		
        pop 	{ip, pc}
	
	
moveDisks:	// n, Source, Destino, Extra
	push	{r4-r8, lr}

	@ if n==1:
	cmp	r4, #1 //comparamos si r4 (n) es igual a 1
			//sino repetimos movedisck pero con n-1 e imprimimos
	bgt	moveN_1Disks 

move1Disk:	
	// llamamos a print( mover el disco de %c a %c\n, Source, Dest )
	ldr	r0, =string
	mov	r1, r5
	mov	r2, r6
	bl	printf
	b	endMoveDisk

moveN_1Disks:	
	// moveDisks( n-1, Source, Extra, Destino )
	mov	r8, r7		
	mov	r7, r6
	mov	r6, r8
	sub	r4, #1
	bl	moveDisks
	mov	r8, r7		
	mov	r7, r6
	mov	r6, r8

	// llamamos a print( mover el disco de %c a %c\n, Source, Dest )
	ldr	r0, =string
	mov	r1, r5
	mov	r2, r6
	bl	printf

	// mandamos moveDisks( n-1, Extra, Dest, Source )	
	mov	r8, r5		
	mov	r5, r7
	mov	r7, r8
	bl	moveDisks
	
endMoveDisk:	
	pop	{r4-r8, pc}

	

main:   push 	{ip, lr}	
	bl	getNumberOfDisks //numero de discos
	ldr	r4, =n		
	ldr	r4, [r4]
	ldr	r5, =peg1	
	ldr	r5, [r5]
	ldr	r6, =peg2	
	ldr	r6, [r6]
	ldr	r7, =peg3	
	ldr	r7, [r7]
	bl	moveDisks	

	
@ return to OS	
        pop 	{ip, pc}	
