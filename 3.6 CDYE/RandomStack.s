/*Instito tecnológico de Tijuana
* Lenguaje de interfaz
* Autor: Rodriguez Moreno Omar Gamaliel
* 13/12/2021*/

.global main

main:
     mov   r0, #2  
     push  {r0}    
     mov   r0, #3  
     pop   {r0}    
     bx    lr      
