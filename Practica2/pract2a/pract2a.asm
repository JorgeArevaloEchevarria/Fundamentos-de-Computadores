/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2a.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Busca el valor máximo de un vector de enteros positivos
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

.global start

.EQU 	N, 8

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
max: 	.space 4

.text
start:
		mov r0, #0		//i=0 y me sirve para poner 0 a max
		ldr r1,=max		// Leo la dir. de max
		str r0,[r1]		// Escribo 0 en max
for:	cmp r0,#N		//comparo i con N
		bge fin_for
		ldr r2,=A		//cargo la primera dirreccion del array
		ldr r3,[r2,r0,LSL#2]//leo el elemento del array y lo guardo en r3
		ldr r4,[r1]		//cargo el contenido de max
if: 	cmp r4,r3		//los cambio el orden para q sea bge
		bge fin_if
		str r3,[r1]		//guardo el valor del array en max
fin_if:	add r0,r0,#1	//i++
		b for
fin_for:b .
		.end
