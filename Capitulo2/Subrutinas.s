/*


*/
  .global main
  
main: mov r1, #1
  mov r2, #2
  bl nivel1
  mov r5, #5 
  
nivel1: push  {lr}
  mov r3, #3
  bl nivel2
  pop {lr}
  bx lr
nivel2: mov r4, #4
  bx lr
