



		ORG 8100
			MOV DPTR,#9000H
			MOV R0,#10
			
			LOOP:
			MOV @DPTR,R0
			INC DPTR
			DJNZ R0,LOOP
		END