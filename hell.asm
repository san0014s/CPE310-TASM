.model small
.stack 100h

.data

mov ax,@data
mov ds,ax
mov ah, 0   ; set display mode function.
mov al, 13h ; mode 13h = 320x200 pixels, 256 colors.
int 10h  


ball_x0 dw 146 ;X val for the ball0
ball_x1 dw 154 ;X val for the ball1
ball_x2 dw 162 ;X val for the ball2
ball_x3 dw 170 ;X val for the ball3
ball_y dw 100 ;Y val for the balls

ball_size dw 04h ;size of the ball (how many pixels HxW)

.code


    draw_ball0 proc 
        
        mov cx, ball_x0 ;set initial x val 
        mov dx, ball_y ;set initial y val


        draw_ball_x0:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0ch ;choosing the write color to red
            mov bh, 00h ;setting the page num
            int 10h ;execute config

            inc cx
            mov ax,cx
            sub ax, ball_x0
            cmp ax, ball_size
            jng draw_ball_x0
            mov cx, ball_x0

            inc dx
            mov ax,dx 
            sub ax, ball_y
            cmp ax, ball_size
            jng draw_ball_x0
            
            ret

    draw_ball0 endp


    draw_ball1 proc 
        
        mov cx, ball_x1 ;set initial x val 
        mov dx, ball_y ;set initial y val


        draw_ball_x1:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0bh ;choosing the write color to blue
            mov bh, 00h ;setting the page num
            int 10h ;execute config

            inc cx
            mov ax,cx
            sub ax, ball_x1
            cmp ax, ball_size
            jng draw_ball_x1
            mov cx, ball_x1

            inc dx
            mov ax,dx 
            sub ax, ball_y
            cmp ax, ball_size
            jng draw_ball_x1
            
            ret

        draw_ball1 endp

        draw_ball2 proc 
        
        mov cx, ball_x2 ;set initial x val 
        mov dx, ball_y ;set initial y val


        draw_ball_x2:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0ah ;choosing the write color to green
            mov bh, 00h ;setting the page num
            int 10h ;execute config

            inc cx
            mov ax,cx
            sub ax, ball_x2
            cmp ax, ball_size
            jng draw_ball_x2
            mov cx, ball_x2

            inc dx
            mov ax,dx 
            sub ax, ball_y
            cmp ax, ball_size
            jng draw_ball_x2
            
            ret

    draw_ball2 endp

    draw_ball3 proc 
        
        mov cx, ball_x3 ;set initial x val 
        mov dx, ball_y ;set initial y val


        draw_ball_x3:
            mov ah, 0ch ;set the config to write pixel
            mov al, 0eh ;choosing the write color to yellow
            mov bh, 00h ;setting the page num
            int 10h ;execute config

            inc cx
            mov ax,cx
            sub ax, ball_x3
            cmp ax, ball_size
            jng draw_ball_x3
            mov cx, ball_x3

            inc dx
            mov ax,dx 
            sub ax, ball_y
            cmp ax, ball_size
            jng draw_ball_x3
            
            ret

    draw_ball3 endp

    clear_screen proc 
    
        mov ah, 00h ;selecting video mode 
        mov al, 13h ;choosing the mode
        int 10h ;executing the config

        mov ah, 0bh ;setting config
        mov bh, 00h ;select background color 
        mov bl, 00h ;setting color to black
        int 10h ;execute the config

        ret
    clear_screen endp

    delay_sec proc

        mov bx, 0

        delay:
        mov     cx, 0
        mov     dx, 9999
        mov     ah, 86h
        int     15h

        inc bx
        cmp bx, 100
        je delay_end

        jmp delay

        delay_end:
        ret

    delay_sec endp 

    main proc
 
        push ds ;push the stack to ds seg
        sub ax,ax ;clear the ax reg
        push ax ;push ax to the stack 
        mov ax, @data ;save the contents of data on the ax reg
        mov ds, ax ;save the contents of ax on the ds seg
        pop ax ;release the top item from the stack to the ax reg
        pop ax ;same as prev line

        call clear_screen
        call delay_sec

        call draw_ball0
        call draw_ball1
        call draw_ball2
        call draw_ball3

        call delay_sec
        call clear_screen
       
        call main
        
        
        
    main endp

 end main
 