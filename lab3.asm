.model small
.stack 100h
.data
msg db "This is my first assembly program and it is confusing", '$'
.code
main proc
	 mov ax, SEG msg
	 mov	ds, ax
	 mov	dx, offset msg
	 mov	ah, 9
	 int	21h
	 mov	ax, 4c00h
	 int	21h
main endp
end main