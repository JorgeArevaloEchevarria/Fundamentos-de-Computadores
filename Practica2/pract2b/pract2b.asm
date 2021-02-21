/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Ordena de mayor a menor un vector de enteros positivos
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

.EQU 	N, 8

.global start

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
B: 		.space N*4
max: 	.space 4
ind: 	.space 4

.text
start:
		mov r11,#0
		mov r0,#0		//j=0
for_j:	cmp r0,#N		//j<N
		bge fin_j
		ldr r1,=max		// Leo la dir. de max
		str r11,[r1]		// Escribo 0 en max
		mov r6,#0		//i=0
for_i: 	cmp r2,#N		//i<N
		bge fin_i
		ldr r2,=A		//cargo la primera dirreccion del array
		ldr r3,[r2,r6,LSL#2]//leo el elemento del array y lo guardo en r3
		ldr r4,[r1]		//cargo el contenido de max
if: 	cmp r4,r3		//los cambio el orden
		bge fin_if
		str r3,[r1]		//guardo el valor del array en max
		ldr r5,=ind		//leo la dir de ind
		str r6,[r5]		//ind=i
fin_if:	add r6,r6,#1	//i++
		b for_i
fin_i:	ldr	r7,=B
		ldr r8,[r7,r0,LSL#2]//B[j]
		ldr r9,[r5]		//cargo el valor de ind
		ldr r10,[r2,r9,LSL#2]//A[ind]
		str r10,[r8]	//B[j]=A[ind]
		str r11,[r10]	//A[ind]=0
		add r0,r0,#1	//j++
		b for_j
fin_j:	b .
		.end
