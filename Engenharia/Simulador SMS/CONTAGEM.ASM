 CLO
 	MOV BL, 1		
Rep:
	MUL BL, 2
	JMP Rep	
JNS Rep	
	;DIV BL, 2		
END 	
