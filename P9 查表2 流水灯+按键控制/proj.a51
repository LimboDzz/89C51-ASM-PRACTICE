		BTN BIT P3.0
		
		ORG 00H
		SJMP MAIN
		ORG 30H
MAIN:	
		MOV DPTR,#TAB	;ARR
		MOV R1,#6		;ARR LENGTH
		MOV R2,#0		;ARR INDEX
DETECT:	
		JB BTN,DETECT	;IF NOT DOWN, KEEP DETECTION
DOWN:
		JNB BTN,DOWN	;IF NOT KEYUP, WAIT FOR KEYUP
UP:
		LCALL DISP
		LCALL LDELAY
		INC R2			;INDEX++
		
		DJNZ R1,DETECT	;LOOP COUNTDOWN
		LJMP MAIN		;RESET LOOP
			
			
			
DISP:
		MOV A,R2
		MOVC A,@A+DPTR
		MOV P0,A
		RET

LDELAY:
		MOV R5,#0
LOOP:	
		MOV R6,#0
		DJNZ R6,$		;FOR R6
		DJNZ R5,LOOP	;FOR R5
		RET
		
		

TAB:
DB 10100101B
DB 01011010B
DB 11001100B
DB 00110011B
DB 10101010B
DB 01010101B

END