		ORG 00H
		SJMP MAIN
		ORG 13H
		SJMP INT_1
		ORG 30H
MAIN:	
		ACALL ENINT			;ENABLE INTERRUPTION
		ACALL INITAB		;INIT TAB ARRAY
DISP:
		MOV P0,#3fH
		SJMP $
		
ENINT:
		SETB EA
		SETB EX1
		SETB IT1
		MOV SP,#30H			;SET STACK POINTER
		RET
		
INITAB:
		MOV DPTR,#TAB		;ARR
		MOV R0,#16			;ARR LENGTH
		MOV R1,#0			;ARR INDEX
		RET
		
INT_1:
		PUSH PSW
		PUSH ACC
		
		INC R1
		MOV A,R1
		ANL A,#0FH
		MOVC A,@A+DPTR
		MOV P0,A
		
		POP ACC
		POP PSW
		RETI

TAB:
DB 3fH,06H,5bH,4fH,66H,6dH,7dH,07H,7fH,6fH,77H,7cH,39H,5eH,79H,71H
END