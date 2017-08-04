;通过loop求2的6次方的和64
assume cs:code

code segment
start:
    mov ax, 2
    mov cx, 0x05h ;设置循环次数
s:  add ax, ax
    loop s
    ; exit
    mov ah, 4ch
    int 21h
code ends
end start
             
    