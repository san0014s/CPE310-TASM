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
	MOV AL, 13h		;chosing the option for video mode
	INT 10h			;execute config
top:	
Call YellowDrawSquare	
Call PurpleDrawSquare
Call BlueDrawSquare
Call GreenDrawSquare
Call DelayFun
Call ClearScreen
Call DelayFun
jmp top

	;MOV AH, 0       ;set video mode
	;MOV AL, 03h		;chosing the option for video mode
	;INT 10h			;execute config
	MOV AH, 4Ch
	INT 21h

main endp

YellowDrawSquare:

	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 0Eh	 ;yellow color
	MOV BH, 00h	 ;set page nm
	MOV CX, 0	 ;set col x 0bH  WIDTH
	MOV DX, 0	 ;set row y oah HEIGHT
	INT 10h		 ;execute

	label1:
	inc CX
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	cmp CX, 15h  ; was 30
	jne Label1
	
	MOV CX, 0 ;resetting to start column
	inc DX		;next row  
	cmp DX, 15h 
	jne label1
	
	pop DX
	pop CX
	pop BX
	pop AX
	
	RET
PurpleDrawSquare:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 0Dh	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 20h	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label3:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 35h
	jne Label3
	
	MOV CX, 20h ;resetting to start column
	inc DX		;next row
	cmp DX, 15h
	jne label3
	
	pop DX
	pop CX
	pop BX
	pop AX
RET
BlueDrawSquare:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 01h	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 40h	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label4:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 55h
	jne Label4
	
	MOV CX, 40h ;resetting to start column
	inc DX		;next row
	cmp DX, 15h
	jne label4
	
	pop DX
	pop CX
	pop BX
	pop AX
RET
GreenDrawSquare:	
	push AX
	push BX
	push CX
	push DX
	
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, 0Ah	 ; color
	MOV BH, 00h	 ;set page nm
	MOV CX, 60h	 ;set col x
	MOV DX, 0 ;set row y STAYS THE SAME DONT CHANGE
	INT 10h		 ;execute

	label5:
	MOV AH, 0Ch  ;set config to create pixel
	INT 10h		 ;execute
	inc CX
	cmp CX, 75h
	jne Label5
	
	MOV CX, 60h ;resetting to start column
	inc DX		;next row
	cmp DX, 15h
	jne label5
	
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
		MOV AL, 13h
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