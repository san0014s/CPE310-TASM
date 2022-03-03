.model small
.stack 100h

.data
color db ?
startx dw ?
starty dw ?
endx dw ?
endy dw ? 

.code
DrawBox1 macro viscolor

 mov color,viscolor  
    ;------Box 1------------
    mov startx,100
    mov endx,115
    mov starty,100
    mov endy,115
    call draw
endm

DrawBox2 macro viscolor

 mov color,viscolor  
    ;------Box 1------------
    mov startx,120
    mov endx,135
    mov starty,120
    mov endy,135
    call draw
endm

DrawBox3 macro viscolor

 mov color,viscolor  
    ;------Box 1------------
    mov startx,140
    mov endx,155
    mov starty,140
    mov endy,155
    call draw
endm

DrawBox4 macro viscolor

 mov color,viscolor  
    ;------Box 1------------
    mov startx,160
    mov endx,175
    mov starty,160
    mov endy,175
    call draw
endm

main proc
push ds 
    sub ax,ax 
    push ax 
    mov ax, @data 
    mov ds, ax 
    pop ax 
    pop ax 

mainloop:
mov ah, 00h 
mov al, 13h 
int 10h 

mov ah, 0bh 
mov bh, 00h 
mov bl, 00h 
int 10h 
        
drawbox1 10
call Delay
drawbox1 0
call Delay
drawbox2 3
call Delay
drawbox2 0
call Delay
drawbox3 6
call Delay
drawbox3 0
call Delay
drawbox4 8
call Delay
drawbox4 0
call Delay
jmp mainloop
ret
main endp

Delay proc
MOV     CX, 0FH
MOV     DX, 4240H
MOV     AH, 86H
INT     15H
Delay endp

draw proc
    push ax
    push cx
    push dx
     
    mov dx,starty
    mov cx,startx
    mov ah,0ch
    mov al,color
    c:
    inc cx
    int 10h
    cmp cx,endx
    jne c

    mov cx,startx
    inc dx
    cmp dx,endy
    jne c 
    
    pop dx
    pop cx
    pop ax
    ret
draw endp
end main

