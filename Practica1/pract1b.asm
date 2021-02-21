.global start
.data
C: 		.word 0x00
A: 		.word 0x0F
B: 		.word 0x03

.text
start:
		LDR R3, =C
		LDR R4, =A
		LDR R5, =B
		LDR R0, [R3]//CARGO C
		LDR R1, [R4]//CARGO A
		LDR R2, [R5]//CARGO B
WHILE:	CMP R1, R2
		BLS FIN_W
		SUB R1,R1,R2//A=A-B
		ADD R0,R0,#1//C=C+1
		B WHILE
FIN_W:	STR R1, [R4]
		STR R0, [R3]
FIN:	B .

		.end
