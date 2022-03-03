.model small
.stack 100h
.data
.code

main proc

ORG 0100h
START: JMP WVU
ORG 011Eh
WVU: ADD AX, BX
main endp
end main