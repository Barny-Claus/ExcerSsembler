/*Instito tecnológico de Tijuana
* Lenguaje de interfaz
* Autor: Rodriguez Moreno Omar Gamaliel
* 08/12/2021
*/
.data
var1: .asciz  "%d\ n"
seed: .word 1
const1: .word 1103515245
const2: .word 12345
.text
.global main
main: push  {r4, r5}
  mov r0, #42 //damos el mismo 42 como "semilla" para msrand
  bl  mysrand
  mov r4, #5 //le damos valor 5 a r4 para el bucle
/*este bucle solo imprime 5 números aleatorios*/
bucle:  bl  myrand //llamamos myrand para los números
  mov r1, r0 
  ldr r0, =var1 
  bl  printf 
  subs  r4, r4, #1 //se repite hasta que r4 llega a 0, es decir termina las 5 impresiones
  bne bucle 
  pop {r4, r5}
  bx  lr
/*traducciones de los métodos myrand y mysrand de c*/
myrand: ldr r1, =seed 
  ldr r0, [r1]
  ldr r2, [r1, #4]
  mul r3, r0, r2
  ldr r0, [r1, #8]
  add r0, r0, r3
  str r0, [r1]
  mov r0, r0, LSL #1
  mov r0, r0, LSR # 17
  bx  lr
mysrand:  ldr r1, =seed
  str r0, [r1]
  bx  lr
