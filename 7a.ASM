assume cs:code,ds:data
data segment
        fib db 10 dup(?)
        n db 0AH
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov al,0
        mov bl,1
        lea si,fib
        mov [si],al
        inc si
        mov [si],bl
        inc si
        mov cx,8
next:   add al,bl
        mov [si],al
        inc si
        xchg al,bl
        loop next
code ends
end start
