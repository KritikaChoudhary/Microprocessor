assume cs:code,ds:data
data segment
        fname db "test.txt"
        buff db 100 dup(?)
        errmsg db 0ah,0dh,"not found$"
        close db 0ah,0dh,"Closed succesfully$"
data ends
code segment
start:
        mov ah,3dh
        lea si,fname
        mov al,2
        int 21h
        jnc next
        lea dx,errmsg
        mov ah,09h
        int 21h
        jmp finish
next:
        mov bx,ax
        mov ah,3fh
        mov cx,100d
        lea dx,buff
        int 21h
        mov cx,100d
        lea si,buff
repeat:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        loop repeat
        mov ah,3eh
        int 21h
        mov dl,close
        mov ah,9
        int 21h
finish:
        mov ah,4ch
        int 21h
code ends
end start
