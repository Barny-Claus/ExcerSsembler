//@@ Instituto Tecnologico de Tijuana
//@@ Depto de Sistemas y Computación
//@@ Ing.En Sistemas Computacionales

/*@@ Autor : Hernández Fernández Diana @DianaHFer
//@@ Repositorio: https://github.com/tectijuana/li20b3ej-4-DianaHFer(REPOSITORIO PRIVADO)
//@@ Fecha de revisión : Miercoles 01 de Diciembre del 2020.
tec@raspberrypi:~/profe $ nano stack.s
tec@raspberrypi:~/profe $ as -o stack.o stack.s
tec@raspberrypi:~/profe $ ld -o stack stack.o
ld: warning: cannot find entry symbol _start; defaulting to 00010054
tec@raspberrypi:~/profe $ ./stack
Segmentation fault
tec@raspberrypi:~/profe $ echo ?
?
tec@raspberrypi:~/profe $ echo $?
0
tec@raspberrypi:~/profe $ */

//@ Objetivo del programa :

Ejemplo muy sencillo  del uso del stack de la cpu.
*/

// Basically Push() and Pop() as in stacks. Hmm, interesting stuff for me as a beginner.
// Basically Push() and Pop() as in stacks. Hmm, interesting stuff for me as a beginner.

//.section // __TEXT, __text
.global main

main:
     mov   r0, #2  /* set up r0 */
     push  {r0}    /* save r0 onto the stack */
     mov   r0, #3  /* overwrite r0 */
     pop   {r0}    /* restore r0 to it's initial state */
     bx    lr      /* finish the program */
