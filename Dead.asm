.model small
.stack 100h
.data
org 100h
mov ax,@data
mov ds,ax
mov ah, 0   ; display mode 
mov al, 13h ; graphical mode 13h
int 10h  

;creating the squares
LeftX0 dw 20 ;x val 
LeftX1 dw 40 ;X val 
LeftX2 dw 60 ;X val 
LeftX3 dw 80 ;X val 
LeftX4 dw 100 ;X val 
LeftX5 dw 120 ;X val 
LeftX6 dw 140 ;X val 
LeftX7 dw 160 ;X val 
YCord dw 120 ;Y val 
PixelSize dw 0Fh ;size of the the square

;Exercise 3: processal operators
x1 db 00h
x2 db 55h
x3 db 0aah
x4 db 0ffh
x5 db 0aah

;8 across
y  db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h

signal dw 0

;8 including y going vertically
y0 db 0
y1 db 0
y2 db 0
y3 db 0
y4 db 0
y5 db 0
y6 db 0
y7 db 0
.code

    DrawSquare proc 
        
        mov cx, LeftX0 ;initial x val 
        mov dx, YCord ;initial y val

        draw_LeftX0:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0Fh ;choosing the color blanco
            mov bh, 00h ;setting the page nm
            int 10h ;execute 

            inc cx
            mov ax,cx
            sub ax, LeftX0
            cmp ax, PixelSize
            jle draw_LeftX0
            mov cx, LeftX0

            inc dx
            mov ax,dx 
            sub ax, YCord
            cmp ax, PixelSize
            jle draw_LeftX0
            
            ret
    DrawSquare endp

    DrawSquare2 proc 
        
        mov cx, LeftX1 ;initial x val 
        mov dx, YCord ;initial y val


        draw_LeftX1:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0Eh ;choosing the color yellow
            mov bh, 00h ;setting the page nm
            int 10h ;execute 

            inc cx
            mov ax,cx
            sub ax, LeftX1
            cmp ax, PixelSize
            jle draw_LeftX1
            mov cx, LeftX1

            inc dx
            mov ax,dx 
            sub ax, YCord
            cmp ax, PixelSize
            jle draw_LeftX1
            
            ret
    DrawSquare2 endp

    DrawSquare3 proc 
        
        mov cx, LeftX2 ;initial x val 
        mov dx, YCord ;initial y val


        draw_LeftX2:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0Dh ;choosing the color Magenta
            mov bh, 00h ;setting the page nm
            int 10h ;execute 

            inc cx
            mov ax,cx
            sub ax, LeftX2
            cmp ax, PixelSize
            jle draw_LeftX2
            mov cx, LeftX2

            inc dx
            mov ax,dx 
            sub ax, YCord
            cmp ax, PixelSize
            jle draw_LeftX2
            
            ret
    DrawSquare3 endp

    DrawSquare4 proc 
        
        mov cx, LeftX3 ;initial x val 
        mov dx, YCord ;initial y val


        draw_LeftX3:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0Ch ;choosing the color Red
            mov bh, 00h ;setting the page nm
            int 10h ;execute 

            inc cx
            mov ax,cx
            sub ax, LeftX3
            cmp ax, PixelSize
            jle draw_LeftX3
            mov cx, LeftX3

            inc dx
            mov ax,dx 
            sub ax, YCord
            cmp ax, PixelSize
            jle draw_LeftX3
            
            ret
    DrawSquare4 endp

    DrawSquare5 proc 
        
        mov cx, LeftX4 ;initial x val 
        mov dx, YCord ;initial y val


        draw_LeftX4:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0Bh ;choosing the color Cyan
            mov bh, 00h ;setting the page nm
            int 10h ;execute 

            inc cx
            mov ax,cx
            sub ax, LeftX4
            cmp ax, PixelSize
            jle draw_LeftX4
            mov cx, LeftX4

            inc dx
            mov ax,dx 
            sub ax, YCord
            cmp ax, PixelSize
            jle draw_LeftX4
            
            ret
    DrawSquare5 endp

    DrawSquare6 proc 
        
        mov cx, LeftX5 ;initial x val 
        mov dx, YCord ;initial y val


        draw_LeftX5:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0Ah ;choosing the color Green
            mov bh, 00h ;setting the page nm
            int 10h ;execute 

            inc cx
            mov ax,cx
            sub ax, LeftX5
            cmp ax, PixelSize
            jle draw_LeftX5
            mov cx, LeftX5

            inc dx
            mov ax,dx 
            sub ax, YCord
            cmp ax, PixelSize
            jle draw_LeftX5
            
            ret
    DrawSquare6 endp

    DrawSquare7 proc 
        
        mov cx, LeftX6 ;initial x val 
        mov dx, YCord ;initial y val


        draw_LeftX6:
            mov ah, 0ch ;set the config to write pixel
            mov al, 09h ;choosing the color Blue
            mov bh, 00h ;setting the page nm
            int 10h ;execute 

            inc cx
            mov ax,cx
            sub ax, LeftX6
            cmp ax, PixelSize
            jle draw_LeftX6
            mov cx, LeftX6

            inc dx
            mov ax,dx 
            sub ax, YCord
            cmp ax, PixelSize
            jle draw_LeftX6
            
            ret
    DrawSquare7 endp

    DrawSquare8 proc 
        
        mov cx, LeftX7 ;initial x val 
        mov dx, YCord ;initial y val


        draw_LeftX7:
            mov ah, 0ch ;set the config to write pixel
            mov al, 08h ;choosing the color Gray
            mov bh, 00h ;setting the page nm
            int 10h ;execute 

            inc cx
            mov ax,cx
            sub ax, LeftX7
            cmp ax, PixelSize
            jle draw_LeftX7
            mov cx, LeftX7

            inc dx
            mov ax,dx 
            sub ax, YCord
            cmp ax, PixelSize
            jle draw_LeftX7
            
            ret

    DrawSquare8 endp

  ClearScreen proc
		push AX
		MOV AH, 00h
		MOV AL, 0
		INT 10h
		MOV AH, 00h
		MOV AL, 10h
		INT 10h
		POP AX
		RET
	ClearScreen endp

DelayFun proc		;functions/methods
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
DelayFun endp

    DisplaySquares proc
        call DrawSquare
        call DrawSquare2
        call DrawSquare3
        call DrawSquare4
        call DrawSquare5
        call DrawSquare6
        call DrawSquare7
        call DrawSquare8
        call DelayFun
        call ClearScreen
		call DelayFun
    DisplaySquares endp

    Flicker proc 
        Square:
        cmp y0, 0
        jz Square2 
        call DrawSquare

        Square2:
        cmp y1, 0
        jz Square3 
        call DrawSquare2

        Square3:
        cmp y2, 0
        jz Square4
        call DrawSquare3

        Square4:
        cmp y3, 0
        jz Square5 
        call DrawSquare4

        Square5:
        cmp y4, 0
        jz Square6 
        call DrawSquare5 

        Square6:
        cmp y5, 0
        jz Square7  
        call DrawSquare6 

        Square7:
        cmp y6, 0
        jz Square8 
        call DrawSquare7 

        Square8:
        cmp y7, 0
        jz depart 
        call DrawSquare8

        depart:
        ret
    Flicker endp
    
    process proc
        Offset0:
        mov bl, [y]
        mov y0, bl

        Offset1:
        mov bl, [y+1]
        mov y1, bl

        Offset2:
        mov bl, [y+2]
        mov y2, bl

        Offset3:
        mov bl, [y+3]
        mov y3, bl

        Offset4:
        mov bl, [y+4]
        mov y4, bl

        Offset5:
        mov bl, [y+5]
        mov y5, bl

        Offset6:
        mov bl, [y+6]
        mov y6, bl

        Offset7:
        mov bl, [y+7]
        mov y7, bl 
        ret
    process endp

    pattern1 proc  ;Exercise 4 patterns

       cmp signal, 0 
       jz point

       cmp signal, 0 
       jnz point2

        point:
         not [y+1]
         not [y+6]
         inc signal
        ret
       

        point2:
         not [y]
         not [y+1]
         not [y+2]
         not [y+3]
         not [y+4]
         not [y+5]  
         not [y+6]
         not [y+7]
        ret
    pattern1 endp

    pattern2 proc 
        sort1:
        cmp signal, 0 
        jz point21

       cmp signal, 1 
       jz point22

       cmp signal, 2 
       jz point23

       cmp signal, 3 
       jz point24

       cmp signal, 4
       jz point25 

       jmp sort2


        point21:
         not [y+0]
         inc signal
        ret 
        
        point22:
         not [y+0]
         not [y+1]
         inc signal
        ret

        point23:
         not [y+1]
         not [y+2]
         inc signal
        ret

        point24:
         not [y+2]
         not [y+3]
         inc signal
        ret

        point25:
         not [y+3]
         not [y+4]
         inc signal
        ret

        sort2:
        cmp signal, 5 
        jz point26 

        cmp signal, 6
        jz point27

        cmp signal, 7 
        jz point28

        cmp signal, 8 
        jz point29

        jmp sort3
        
        point26:
         not [y+4]
         not [y+5]
         inc signal
        ret

        point27:
         not [y+5]
         not [y+6]
         inc signal
        ret

        point28:
         not [y+6]
         inc signal
        ret

        point29:
         not [y+7]
         not [y+6]
         inc signal
        ret

        sort3:
        cmp signal, 9 
        jz point30

        cmp signal, 10
        jz point31

        cmp signal, 11 
        jz point32

        cmp signal, 12
        jz point33

        cmp signal, 13
        jz point34

        cmp signal, 14
        jz point35

        point30:
         not [y+6]
         not [y+5]
         inc signal
        ret

        point31:
         not [y+5]
         not [y+4]
         inc signal
        ret

        point32:
         not [y+4]
         not [y+3]
         inc signal
        ret

        point33:
         not [y+3]
         not [y+2]
         inc signal
        ret

       point34:
         not [y+2]
         not [y+1]
         inc signal
        ret

        point35:
         not [y+1]
         not [y+0]
         mov signal, 1
        ret
    pattern2 endp

    pattern3 proc 
        
        sort11:
        cmp signal, 0 
        jz id

       cmp signal, 1 
       jz id2

       cmp signal, 2 
       jz id3

       cmp signal, 3 
       jz id4

       cmp signal, 4
       jz id5 

      cmp signal, 5
      jz id2 

      cmp signal, 6
      jz id3

      cmp signal, 7
      jz id3

      cmp signal, 8
      jz id2

      cmp signal, 9
      jz id5

      cmp signal, 10
      jz id4

      cmp signal, 11
      jz id3

      cmp signal, 12
      jz id2
    

        id:
         mov signal, 1
        ret 

        id2:
         not [y+0]
         not [y+7]
         inc signal
        ret

        id3:
         not [y+1]
         not [y+6]
         inc signal
        ret

        id4:
         not [y+2]
         not [y+5]
         inc signal
        ret

        id5:
         not [y+3]
         not [y+4]
         inc signal
        ret
    pattern3 endp

    main proc
		
        push ds 
		push ax 
        sub ax,ax 
        mov ax, @data ;the data will be allocated in the ax reg
        mov ds, ax 
        pop ax 
        
        ;call pattern1
        call pattern2
        ;call pattern3
		;call DisplaySquares
        call process
        call Flicker
        call DelayFun
        call ClearScreen
        call main
        
    main endp
 end main