		
		
		
		
		ORG 8100H
			
		MOV DPTR,#9000H
		MOV A,#05H
		MOV R0,#4 ; stores length of pattern

		GENERATE_PATTERN:
			MOVX @DPTR,A
			DEC A
			INC DPTR
			DJNZ R0,GENERATE_PATTERN
			
		MOV A,#0
		MOVX @DPTR,A
		MOV R0,#2

		MOV DPTR,#9200H
		MOV A,#03H
		MOV R1,#2 ; stores length of string to be matched with
		GENERATE_STRING1:
			MOVX @DPTR,A
			DEC A
			INC DPTR
			DJNZ R1,GENERATE_STRING1
			
		MOV A,#08H
		MOV R1,#5 ; stores length of string to be matched with
		GENERATE_STRING2:
			MOVX @DPTR,A
			DEC A
			INC DPTR
			DJNZ R1,GENERATE_STRING2
		
		MOV R1,#7 ; stores length of string to be matched with
		
		MOV A,#0
		MOVX @DPTR,A

		MOV DPTR,#9500H
		MOV A,#0XFF
		MOVX @DPTR,A

		MOV R2,#0 ; starting index to be matched in string
		TRAVERSE_STRING:
			; check if the starting index == length of string
			MOV A,R2
			MOV B,R1
			XRL A,B
			JZ STOP
			
			MOV R3,#0 ; current index in pattern which is to be matched with string
			MATCH_PATTERN:
				MOV DPTR,#9200H
				MOV A,DPL
				ADD A,R2
				ADD A,R3
				MOV B,R1
				DIV AB
				MOV DPL,B
				MOVX A,@DPTR
				MOV R4,A ; stores the current character to be compared in the main string

				MOV DPTR,#9000H
				MOV A,DPL
				ADD A,R3
				MOV DPL,A
				MOVX A,@DPTR ; stores the current character of the pattern

				MOV B,R4
				CJNE A,B,IGNORE_NEXT ; if current characters didn't match, ignore subsequent characters 

				INC R3
				MOV A,R3
				MOV B,R0
				CJNE A,B,MATCH_PATTERN ; If the entire pattern is not yet matched

				MOV DPTR,#9500H
				MOV A,R2
				MOVX @DPTR,A
				SJMP STOP

				IGNORE_NEXT:
					INC R2 ; increment starting index in string and start checking again
					SJMP TRAVERSE_STRING

		STOP: SJMP STOP
		
		END