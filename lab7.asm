.model small
.stack 100h

.data
color db ?
startx dw ?
starty dw ?
.code
main proc
Call ClearScreen
mov ax, 0000; initialize mouse
int 33h
mov ax, 1; draw mouse
int 33h
Loop1:

call checkkeyboard

mov ax, 3; check position
int 33h

mov starty, dx

shr cx, 1
mov startx, cx


cmp bx, 1
je draw1




jmp loop1
main endp

draw1:

 mov dx,starty
    mov cx,startx
     mov ah,0ch
    
    mov al, color
    sub cx,1
            sub dx,1
            int 10h ; cx and dx recieved from int 33h
            add cx,2
            add dx,2
            int 10h ; cx and dx recieved from int 33h
   
    
    
    
    
    
    
jmp loop1

;clear_screen proc 
    
       ; mov ah, 00h ;selecting video mode 
       ; mov al, 13h ;choosing the mode
       ; int 10h ;executing the config

        ;mov ah, 0bh ;setting config
       ; mov bh, 00h ;select background color 
       ; mov bl, 00h ;setting color to black
       ; int 10h ;execute the config

       ; ret
  ;  clear_screen endp
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
   

checkKeyboard proc
    mov     ah,     1h
    int     16h         ; check keypress
    jz      noInput     ; no keypress
    mov     ah,     0h
    int     16h
    cmp     ax,     4D00h
    je      rightKey
    cmp     ax,     4B00h
    je      leftKey
    cmp     ax,     5000h
    je      downkey
    cmp     ax,    4800h;space to begin
    je      upkey
    jne     noInput
    
    
    
    noInput:
    ret  

    rightKey:     
    mov color, 10
    jmp     noInput
    
    
    leftKey:   
    mov color, 11
    jmp     noInput
    
    upkey:
    mov color, 12
    jmp noinput
    
    downkey:
    mov color, 13
    jmp noinput
    
    

checkKeyboard endp

end main
