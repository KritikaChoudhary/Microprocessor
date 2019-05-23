assume cs:code,ds:data
data segment
        a db 20h,40h,67h,70h,80h
        n db n-a
        key db 40h
        msg1 db "key found at position"
        pos db ?,"$"
        msg2 db "key not found$"
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov cl,n
        dec cl
        mov ax,00
        mov ch,00
again:
        cmp al,cl
        ja fail
        mov dl,al
        add al,cl
        shr al,1
        mov si,ax
        mov bl,[si]
        cmp key,bl
        jbe loc
        inc al
        jmp again
loc:    je success
        dec al
        mov cl,al
        mov al,dl
        jmp again
fail:   lea dx,msg2
        jmp disp
success:inc al
        add al,30h
        mov pos,al
        lea dx,msg1
disp:   mov ah,09
        int 21h
        mov ah,4ch
        int 21h
code ends
end start


