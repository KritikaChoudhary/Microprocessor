assume cs:code       
code segment
start:
        mov ah,2ch
        int 21h
        mov al,ch
        call hex_bcd
        call disp
        mov dl,':'
        mov ah,2
        int 21h
        mov al,cl
        call hex_bcd
        call disp
        mov ah,4ch
        int 21h
hex_bcd proc
        push cx
        mov cl,al
        mov ch,0
        mov al,0
next:
        add al,1
        daa
        loop next
        pop cx
        ret
hex_bcd endp
disp proc
        push cx
        mov cl,4
        mov ah,0
        shl ax,cl
        shr al,cl
        add ax,3030h
        push ax
        mov dl,ah
        mov ah,2
        int 21h
        mov dl,al
        mov ah,2
        int 21h
        pop ax
        pop cx
        ret
disp endp
code ends
end start


        

