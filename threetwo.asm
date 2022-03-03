.model small
.stack 100h
.data
.code
main proc
	 mov	ah, 2		
	 mov 	dh, 10		;row 10
	 mov	dl, 20		;column 20
	 mov	bh, 0		;video page 0
	 int	10h
main endp
end main