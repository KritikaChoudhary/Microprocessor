assume cs:code,ds:data
data segment
        pa equ 20a0h
        pb equ 20a1h
        pc equ 20a2h
        cr equ 20a3h
data ends
code segement
start:
        mov ax,data
        mov ds,ax
        mov dx,cr
        mov ax,82h
        out dx,al
        mov dx,pa
        mov al,00h
        out dx,al
        mov al,0f0h
        out dx,al
        mov dx,pb
rpt:
        in al,dx
        and al,0fh
        cmp al,0fh
        je rpt
        mov cl,1
next:
        ror al,1
        jc nextl
        jmp next2
nextl:
        add cl,3h
        jmp next
next2:
        mov al,0f0h
        mov dx,pa
next3:
        out dx,al
        call delay
        inc al
        dec cl
        jnz next3
        call delay
        call delay
        dec al
        and al,0fh
comedown:
        out dx,al
        call delay
        dec al
        cmp al,00
        jge comedown
        mov ah,4ch
        int 21h
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









