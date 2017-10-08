CLO
Rep:
	IN 00
  	CMP AL, 0D
	JZ SALTA
	MOV [CL], AL	
	MOV [C0], AL
	JMP Rep
SALTA:
END

















;	Jmp	Start



;	DB	0	
;	DB	1	
;Start:
;	MOV	BL,[02]	
;	MOV	CL,[03]	
;	ADD	BL,CL	
;	MOV	[02],CL	
;	MOV	[03],BL	

;	JMP	Start	
;
;	End
			;; FEITOOOOOOOOOOO  O EXER FIBONACCI