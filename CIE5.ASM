assume cs:code,ds:data
data segment
        a db 5
        res db ?
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov al,a
        mov ah,00
        call fact
        mov ah,4ch
        int 21h
fact proc
        cmp al,0
        je calc
        push ax
        dec al
        call fact
        pop ax
        mul res
        mov res,al
        ret
calc:   mov res,1
        ret
code ends
end start
