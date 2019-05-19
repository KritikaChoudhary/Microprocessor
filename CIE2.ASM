assume cs:code,ds:data
data segment
        a db 5,1,0,3,2,4
        n db n-a
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov bl,n
        mov bh,0
        dec bx
new:    lea si,a
        mov cx,bx
        mov ah,0
again: 
        mov al,[si+1]
        cmp al,[si]
        jae nothing
        xchg al,[si]
        mov ah,1
nothing: inc si
        loop again
        cmp ah,0
        je fin
        dec bx
        jnz new
fin:
        mov ah,4ch
        int 21h
code ends
end start
