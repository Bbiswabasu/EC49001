

		ORG 8100H
		
		MOV DPTR,#0XE803
		MOV A,#80H
		MOVX @DPTR,A
		
		
		MOV DPTR,#9000H
		MOV A,#0X3F
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X06
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X5B
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X4F
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X66
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X6D
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X7D
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X07
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X7F
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X6F
		MOVX @DPTR,A
		
		START:
			MOV R0,#10
			MOV DPTR,#9000H
			
			
			LOOP1:
			   MOV R1,DPL
			   MOVX A,@DPTR
   			   MOV DPTR,#0XE800
			   MOVX @DPTR,A
			   
			   MOV DPTR,#9000H
			   MOV DPL,R1
			   INC DPTR
			   
				
				MOV R2,#255
				LOOP01:
					MOV R3,#32
					LOOP02:
						MOV R4,#55
						LOOP03:
							DJNZ R4,LOOP03
						DJNZ R3,LOOP02
					DJNZ R2,LOOP01
				
				MOV DPTR,#9000H
				MOV DPL,R1
				INC DPTR
				
				DJNZ R0,LOOP1
				
			SJMP START
			
		END