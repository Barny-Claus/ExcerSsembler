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
Ejemplo:
  g++ Ejemplo.s -g -o Ejemplo
Run:
  ./Ejemplo
gdbRun:
  gdb Ejemplo
BareMetal:
  as -o Ejemplo.o Ejemplo.s
  ld -e 0 -Ttext=0x8000 -o Ejemplo.elf Ejemplo.o
  objcopy Ejemplo.elf -O binary kernel.img
Limpiar:
  rm Ejemplo
  rm Ejemplo.s
  rm Ejemplo.o
