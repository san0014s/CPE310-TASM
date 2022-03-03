.model small
.stack 100h

.data
startW dw 100
startH dw 100
maxW dw 115
maxH dw 115 

ActiveColor db 0
Color1 db 1
Color2 db 2
Color3 db 3
Color4 db 4
Color5 db 5
Color6 db 6
Color7 db 7
Color8 db 8
Positionx dw 0
Positiony dw 0
;endx dw ?
;endy dw ? 
.code



main proc

call clearscreen

push ds 
    sub ax,ax 
    push ax 
    mov ax, @data 
    mov ds, ax 
    pop ax 
    pop ax 

mainloop:
call draw
call DelayFun
call ClearScreen
call DelayFun


;mov ah, 00h 
;mov al, 13h 
;int 10h 

;mov ah, 0bh 
;mov bh, 00h 
;mov bl, 00h 
;int 10h 

jmp mainloop
ret
main endp

CreateBox:
    ;------Box 1------------
    ;mov Al, [Color1]
    ;mov [ActiveColor], AL
    ;mov CX, [Positionx]
    ;mov DX, [Positiony]
    ;MOV AH, 0Ch  ;set config to create pixel

    ;cmp BX, 0
    ;label1:
    ;inc CX
    ;MOV AH, 0Ch  ;set config to create pixel
    ;INT 10h         ;execute
    ;cmp CX, 15h
    ;jne Label1

    ;MOV CX, 0 ;resetting to start column
    ;inc DX        ;next row
    ;cmp DX, 15h 
    ;jne label1
    ;RET
    ;inc color
    ;inc positions
    mov ah, 0ch
    mov al, ActiveColor
    mov cx, Positionx
    mov dx, Positiony

    L1:
    int 10h ;set pixel
    inc cx
    cmp cx, 15
    jne L1

    inc dx
    mov cx, 0
    cmp dx, 15
    jne L1


    ret

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
draw proc
    push ax
    push cx
    push dx

    mov dx,startH
    mov cx,startW
    mov ah,0ch
    mov al,10
    c:
    inc cx
    int 10h
    cmp cx,maxw
    jne c

    mov cx,startW
    inc dx
    cmp dx,maxh
    jne c 

    pop dx
    pop cx
    pop ax
    ret
draw endp



DelayFun:        ;functions/methods
    PUSH AX
    PUSH BX
    MOV AX, 0fh
    MOV BX, 10
    Delay2:        ;outer  loop
    Delay3:        ;inner loop
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
