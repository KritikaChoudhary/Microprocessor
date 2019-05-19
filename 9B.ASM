assume cs:code,ds:data
data segment
        pa equ 20a0h
        pb equ 20a1h
        pc equ 20a2h
        cr equ 20a3h
        msg db 91h,61h,c3h,31h,0ffh,71h,0f3h,0f5h,61h,0ffh
data ends
code segment
start:
        mov ax,data
        mov ds,ax

        mov dx,cr
        mov al,80h
        out dx,al
 rpt:
        mov cx,10d
        lea si,msg
 char:
        mov al,[si]
        call disp
        call delay
        inc si
        loop char
        mov ah,06h
        mov dl,0ffh
        int 21h
        jz rpt
        mov ah,4ch
        int 21h
disp proc
        push cx
        mov cx,8
next:
        mov dx,pb
        out dx,al
        push ax
        mov dx,pc
        mov al,0ffh
        out dx,al
        mov ax,00h
        out dx,al
        pop ax
        ror al,1
        loop next
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
