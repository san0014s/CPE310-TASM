.model small
.stack 100h
.data
Color db ?
.code

main proc
	MOV AH, 0       ;set video mode
	MOV AL, 13h		;chosing the option for video mode
	INT 10h			;execute config
	
	;objective 1
	;resetting the mouse
	
	MOV AX, 0   ;mouse in
	INT 33h
	
	MOV AX, 1		;showing mouse pointer
	INT 33h

CALL LeftCLickCheck	

	

	MOV AH, 4Ch
	INT 21h
	
	

;objective 2
LeftCLickCheck:
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	
	loop1:
	MOV AH, 01h
	INT 16h
	
	call keycheck 
	mouseread:
	MOV AX, 03h
	INT 33h
	cmp BX, 1
	JNE loop1 
	

	
	
	SHR CX, 1
	MOV AH, 0Ch  ;set config to create pixel
	MOV AL, color	 ;white color
	MOV BH, 00h	 ;set page nm
	INT 10h		 ;execute
	SUB CX, 1
	SUB DX, 1
	INT 10h
	
	ADD CX, 2
	ADD DX, 2
	INT 10h
	MOV AH, 01h
	INT 16h
	JMP loop1
	
	keycheck proc
	
	 mov     ah,     1h
    int     16h         ; check keypress
    jz      exit     ; no keypress
    mov     ah,     0h
    int     16h       ; check keypress 
	cmp AX, 4800h
	JE ColorChange1
	cmp ax, 4b00h
	je colorchange2
	cmp ax, 4d00h
	je colorchange3
	cmp ax, 5000h
	je colorchange4
	JMP mouseread
	keycheck endp
	;Objective 3
	exit:
	ret
	ColorChange1:
	
	MOV color, 10   ;green color
	
	
	JMP mouseread
	
	


ColorChange2:
	mov color, 11
	JMP mouseread
	
	


ColorChange3:
	mov color, 12
	JMP mouseread
	
	


ColorChange4:
	mov color, 13
	JMP mouseread
	
	



main endp
end main