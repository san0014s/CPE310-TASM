.model small
.stack 100h
.data
.code

main proc

UPDATE:
push AX
push BX
push CX
push DX

	MOV AL, 13H
	MOV AH, 0 
	int 10h  ;set graphics video mode
pixel1:
pixel2:
	MOV AL, 11000b
	MOV CX, 10
	
	
	MOV DX, 20
	MOV AH, 0ch
	int 10h   ;set pixel
	cmp CX, 15
je exit1
	inc CX
jmp pixel1
exit1:
cmp DX, 25
je exit2
	inc DX
jmp 
main endp
end main

