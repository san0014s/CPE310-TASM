.model small
.stack 100h
.data
;Colorred db 1100b
;activecolor db 1111b --define bite
;Startx dw		0		--define word
;Starty dw 		0
.code

main proc
;mov Al, [Colorred]
;mov [activecolor], AL
;mov CX, [Startx]
;mov DX, [Starty]
;cmp BX

	MOV AH, 0       ;set video mode
	MOV AL, 10h		;chosing the option for video mode
	INT 10h			;execute config
top:	
;Call DrawSquare	
;Call DrawSquare2
;Call DrawSquare3
;Call DrawSquare4
;Call DrawSquare5
;Call DrawSquare6
;Call DrawSquare7
;Call DrawSquare8
;Call DelayFun
Call DisplayPats
Call ClearScreen
Call DelayFun
jmp top

	;MOV AH, 0       ;set video mode
	;MOV AL, 03h		;chosing the option for video mode
	;INT 10h			;execute config
	MOV AH, 4Ch
	INT 21h

main endp
DisplayPats proc 
	MOV AL, 01011101b
	AND AL, 01010101b
	CMP AL, 01010101b
	JNE DrawSquare
	;Call DrawSquare

	DisplayPats2:
	MOV AL, 11111111b
	AND AL, 10101010b
	CMP AL, 10101010b
	JE DrawSquare2
	;Call DrawSquare2

	DisplayPats3:
	MOV AL, 11110100b
	AND AL, 11011100b
	CMP AL, 11010100b
	JE DrawSquare3
	;Call DrawSquare3


	DisplayPats4:
	MOV AL, 00001111b
	AND AL, 10011011b
	CMP AL, 00001111b
	JNZ DrawSquare4
	;Call DrawSquare4

	DisplayPats5:
	MOV AL, 00111100b
	AND AL, 10011111b
	CMP AL, 00111100b
	JNZ DrawSquare5
	;Call DrawSquare5


	DisplayPats6:
	MOV AL, 11101100b
	AND AL, 10111111b
	CMP AL, 11001100b
	JNZ DrawSquare6
	;Call DrawSquare6

	
	DisplayPats7:
	MOV AL, 01010001b
	AND AL, 01011111b
	CMP AL, 00010001b
	JNZ DrawSquare7
	;Call DrawSquare7


	DisplayPats8:
	MOV AL, 11101111b
	AND AL, 10010001b
	CMP AL, 11101111b
	JNZ DrawSquare8
	;Call DrawSquare8
RET
endp DisplayPats
DrawSquare:

	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 15	 ;yellow color
	MOV BH, 00h	 ;set page nm
	MOV CX, 0	 ;set col x 0bH  WIDTH
	MOV DX, 0	 ;set row y oah HEIGHT
	INT 10h		 ;execute

	label1:
	inc CX
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	cmp CX, 15  ; was 30
	jne Label1
	
	MOV CX, 0 ;resetting to start column
	inc DX		;next row  
	cmp DX, 15 
	jne label1
	
	pop DX
	pop CX
	pop BX
	pop AX
	
	RET
DrawSquare2:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 15	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 20	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label3:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 35
	jne Label3
	
	MOV CX, 20 ;resetting to start column
	inc DX		;next row
	cmp DX, 15
	jne label3
	
	pop DX
	pop CX
	pop BX
	pop AX
RET
DrawSquare3:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 15	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 40	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label4:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 55
	jne Label4
	
	MOV CX, 40 ;resetting to start column
	inc DX		;next row
	cmp DX, 15
	jne label4
	
	pop DX
	pop CX
	pop BX
	pop AX
RET
DrawSquare4:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 15	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 60	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label5:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 75
	jne Label5
	
	MOV CX, 60 ;resetting to start column
	inc DX		;next row
	cmp DX, 15
	jne label5
	
	pop DX
	pop CX
	pop BX
	pop AX
RET
DrawSquare5:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 15	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 80	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label6:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 95
	jne Label6
	
	MOV CX, 80 ;resetting to start column
	inc DX		;next row
	cmp DX, 15
	jne label6
	
	pop DX
	pop CX
	pop BX
	pop AX
RET
DrawSquare6:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 15	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 100	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label7:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 115
	jne Label7
	
	MOV CX, 100 ;resetting to start column
	inc DX		;next row
	cmp DX, 15
	jne label7
	
	pop DX
	pop CX
	pop BX
	pop AX
RET
DrawSquare7:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 15	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 120	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label8:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 135
	jne Label8
	
	MOV CX, 120 ;resetting to start column
	inc DX		;next row
	cmp DX, 15
	jne label8
	
	pop DX
	pop CX
	pop BX
	pop AX
RET
DrawSquare8:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 15	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 140	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label9:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 155
	jne Label9
	
	MOV CX, 140 ;resetting to start column
	inc DX		;next row
	cmp DX, 15
	jne label9
	
	pop DX
	pop CX
	pop BX
	pop AX
RET

ClearScreen:
		push AX
		MOV AH, 00h
		MOV AL, 0
		INT 10h
		MOV AH, 00h
		MOV AL, 10h
		INT 10h
		POP AX
RET

DelayFun:		;functions/methods
	PUSH AX
	PUSH BX
	MOV AX, 0fh
	MOV BX, 10
	Delay2:		;outer  loop
	Delay3:		;inner loop
	NOP
	dec BX
	cmp BX, 0
	jne Delay3
	dec AX
	cmp AX, 0
	jne Delay2
	
	POP BX
	POP AX
RET


end main