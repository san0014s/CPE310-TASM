ASSUME CS:code, ds:data, ss:stack


stack segment  
	db 100 dup(' ')
stack ends

data segment 

holder db 0Ah
step db 00h

data ends

code segment
Begin:

	main proc
		mov al, 0Ah
		mov [ds:0000], al
		mov al, 00h
		mov [ds:0001], al
		mov ah, 00h
		mov al, 13h
		int 10h ; Set Video Mode

		mov ah, 0bh
		mov bl, 00h
		mov bh, 00h
		int 10h ; Set Color Palette
		
		mov al, 09h ; Original Color
		mov cx, 0Ah 
		mov dx, 0Ah ; Original Location
		mov ah, 0ch ; Interrupt Code for Print Pixel
		
		call Next
		jmp Begin ; Jumping to begin to restart the process
	main endp
	
	
	Square:
	mov holder, cl ; Stores the original width value
	mov bl, cl 
	add bl, 11 ; Creates the endpoint for the square
	xxx:
	int 10h ; Prints Pixel
	inc cx ; Moves the pixel to right one
	cmp cl, bl ; Checks to see if it at the end of the line
	je height ; Jumps forward if it
	jmp xxx ; Jumps back if it is not to print another pixel
	
	height:
	
	cmp dx, 14h ; Compares to the bottom of the square
	je go ; Exits if it is
	inc dx ; Moves down one if it is not
	mov cl, holder ; Resets to the left side of the square
	jmp xxx ; Jumps back to beginning
	
	go:

	RET
	
	Next:
	sqr:
	call Square ; Calling in order to print the square
	
	inc al ; Changing the color
	mov dx, 0ah ; Resetting the height
	add cl, 10 ; Moving the length along
	inc step
	cmp step, 4
	jne sqr
	
	mov al, 0h ; Changing the color to black
	mov step, 0
	mov cx, 0ah
	call delay ; Calls to slow down pixel printing
	blk:
	call Square ; Calling in order to clear the square
	
	mov dx, 0ah ; Resetting the height
	add cl, 10 ; Moving the length along
	inc step
	cmp step, 4
	jne blk
	call delay ; Calls to slow down pixel printing
	RET
	
	Delay:
	push ax
	push cx
	push dx ; Saving the values for printing
	
	mov cx, 10h
	mov dx, 0000h ; Setting the amount of microseconds
	mov ah, 86h ; Setting the interrupt code for delay
	int     15H ; Delaying
	
	pop dx
	pop cx
	pop ax ; Returning the values for printing
	
	RET
	
code ends
end Begin