		
		
		
		ORG 8100H
			
		MOV DPTR,#0XE803
		MOV A, #80H
		MOVX @DPTR,A
		
		MOV DPTR, #0XE800
		MOV A,#00H
		MOVX @DPTR,A
		LOOP:
			MOV A,#01H
			MOVX @DPTR,A
			MOV R0,#255
			LOOP01:
				MOV R1,#32
				LOOP02:
					MOV R2,#52
					LOOP03:
						DJNZ R2,LOOP03
					DJNZ R1,LOOP02
				DJNZ R0,LOOP01
				
			MOV A,#02H
			MOVX @DPTR,A
			MOV R0,#255
			LOOP11:
				MOV R1,#32
				LOOP12:
					MOV R2,#52
					LOOP13:
						DJNZ R2,LOOP13
					DJNZ R1,LOOP12
				DJNZ R0,LOOP11
				
			MOV A,#04H
			MOVX @DPTR,A
			MOV R0,#255
			LOOP21:
				MOV R1,#32
				LOOP22:
					MOV R2,#52
					LOOP23:
						DJNZ R2,LOOP23
					DJNZ R1,LOOP22
				DJNZ R0,LOOP21
			
			MOV A,#08H
			MOVX @DPTR,A
			MOV R0,#255
			LOOP31:
				MOV R1,#32
				LOOP32:
					MOV R2,#52
					LOOP33:
						DJNZ R2,LOOP33
					DJNZ R1,LOOP32
				DJNZ R0,LOOP31
			
			SJMP LOOP
			
			
		END