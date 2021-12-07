/*Instito tecnológico de Tijuana
* Lenguaje de interfaz
* Autor: Rodriguez Moreno Omar Gamaliel
* 08/12/2021
*/
.data
seed: .word 1
const1: .word 1103515245
const2: .word 12345

.text
.global myrand, mysrand //llamamos a las funciones del archivo c
myrand: ldr r1, =seed //se lee la semilla del programa en c y se coloca en r1
  ldr r0, [r1] 
  ldr r2, [r1, #4] 
  mul r3, r0, r2 //multiplica seed por const1 y se almacena en r3
  ldr r0, [r1, #8] 
  add r0, r0, r3 
  str r0, [r1] 
  LSL r0, # 1
  LSR r0, # 17
  bx lr
mysrand:  ldr r1, =seed
  str r0, [r1]
  bx  lr
