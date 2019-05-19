assume cs:code,ds:data
data segment
        pa equ 20a0h
        pb equ 20a1h
        pc equ 20a2h
        cr equ 20a3h
        msg db "No. of 1's"
        one db ?,"$"
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov dx,cr
        mov al,82h
        out dx,al

        mov cx,8
        mov ah,0
        mov dx,pb
        in al,dx
next:
        ror al,1
        jnc there
        inc ah
there:
        loop next
        add ah,30h
        mov one,ah
        lea dx,msg
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
