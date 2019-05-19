assume cs:code,ds:data
data segment
        pa equ 20a0h
        pb equ 20a1h
        pc equ 20a2h
        cr equ 20a3h
        fire db 71h,9fh,0f5h,61h
        help db 0d1h,61h,0e3h,31h
data ends
code segment
start:
        mov ax,data
        mov ds,ax

        mov dx,cr
        mov al,80h
        out dx,al

rpt:
        mov cx,4
        lea si,fire
char:
        mov al,[si]
        call disp
        inc si
        loop char
        call delay
        mov cx,4
nextchar:
        mov al,[si]
        call disp
        inc si
        loop nextchar
        call delay
        mov ah,06h
        mov dl,0ffh
        int 21h
        jz rpt
        mov ah,4ch
        int 21h
disp proc
        push cx
        mov cx,8
seg:
        mov dx,pb
        out dx,al
        push ax
        mov dx,pc
        mov al,0ffh
        out dx,al
        mov al,00h
        out dx,al
        pop ax
        ror al,1
        loop seg
        pop cx
        ret
disp endp
delay proc
        mov si,02fffh
     l2:mov di,0ffffh
     l1:dec di
        jnz l1
        dec si
        jnz l2
        ret
delay endp
code ends
end start

