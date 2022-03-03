Assume cs:code, ds:data, ss:stack

data segment 

message db "Lab 4 Exercise 1$"
STORAGE db "                 "
data ends

stack segment  
dw 100 dup(?)
stacktop:
stack ends

code segment
begin:	mov ax, data
mov ds,ax
mov ax, stack
mov ss,ax
mov sp, offset stacktop

mov di, offset STORAGE
mov si, offset message	;ADDRESSING MODE?
mov ah, 2				;ADDRESSING MODE?
mov bx, 0				;used in ex2

xxx:
mov di,[si]		;ADDRESSING MODE? used in ex2
cmp dl,"$"				;ADDRESSING MODE?			
je exit				

int 21H
inc bx					;used in ex2
jmp xxx

exit:
mov ah,4ch				;ADDRESSING MODE?
int 21h

code ends
end begin
