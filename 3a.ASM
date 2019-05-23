assume cs:code,ds:data
disp macro msg
        lea dx,msg
        mov ah,9
        int 21h
endm
data segment
        pwd1 db "kc@241099"
        n db n-pwd1
        pwd2 db 10 dup(?)
        m db ?
        msg1 db 0ah,0dh,"Enter password:$"
        msg2 db 0ah,0dh,"Correct password$"
        msg3 db 0ah,0dh,"3 incorrect attemps Access denied!$"
        msg4 db 0ah,0dh,"Incorrect password$"
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov es,ax

        mov bl,0
 rpt:
        call readpwd
        call match
        inc bl
        cmp bl,3
        jne rpt
        disp msg3
        mov ah,4ch
        int 21h
 readpwd proc
        disp msg1
        lea si,pwd2
        mov bh,0
 next:
        mov ah,8
        int 21h
        cmp al,0dh
        je new
        mov [si],al
        mov dl,'*'
        mov ah,2
        int 21h
        inc si
        inc bh
        jmp next
 new:
        mov m,bh
        ret
 readpwd endp
 match proc
        mov cl,n
        cmp cl,m
        jne mismatch
        lea di,pwd2
        lea si,pwd1
        cld
        rep cmpsb 
        jnz mismatch
        disp msg2
        mov ah,4ch
        int 21h
  mismatch:
        disp msg4
        ret
 match endp
 code ends
 end start
