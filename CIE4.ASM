assume cs:code,ds:data
data segment
        str1 db 'aka'
        str2 db 3 dup(?)
        n db n-str1
        msg1 db "Palindrome$"
        msg2 db "Not palindrome$"
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov cl,n
        mov ch,00
        mov si,cx
        lea di,str2
copy:
        mov ax,[si]
        mov [di],ax
        inc di
        dec si
        loop copy
        lea si,str1
        lea di,str2
        mov cl,n
        cld
        rep cmpsb
        jnz unsuccess
        lea dx,msg1
        jmp disp
unsuccess:
        lea dx,msg2
disp:
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
