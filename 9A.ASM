assume cs:code
code segment
start:
        mov cx,100d
        mov bl,0
 next_digit:
        mov al,bl
        aam       
        add ax,3030h
        push ax
        mov dx,ah
        mov ah,2
        int 21h
        mov dl,al
        mov ah,2
        int 21h
        pop ax
       mov dl,0dh
        mov ah,2
        int 21h
        call delay
        inc bl
        loop next_digit
        mov ah,4ch
        int 21h
  delay proc
       mov si,0100h
    l2: mov di,0fffh
    l1: dec di
        jnz l1
        dec si
        jnz l2
        ret
 delay endp
 code ends
 end start
