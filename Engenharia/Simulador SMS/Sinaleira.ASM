

CLO
Inicio:
	MOV AL,33	;Copia 00110011 no registrador AL
	OUT 01		;Envia AL para Porta 01 (luz de tr�fego verde sinaleira 1 e vermelha na 2
	MOV AL,73	;Copia 01110011 no registrador AL
	OUT 01		;Envia AL para Porta 01 (luz de tr�fego verde e amarela sinaleira 1 e vermelha na 2
	MOV AL,87	;Copia 10000111 no registrador AL
	OUT 01		;Envia AL para Porta 01 (luz de tr�fego vermelha sinaleira 1 e verde na 2
	MOV AL,8F	;Copia 10001111 no registrador AL
	OUT 01		;Envia AL para Porta 01 (luz de tr�fego vermelha sinaleira 1 e verde e amarela na 2
JMP Inicio
END