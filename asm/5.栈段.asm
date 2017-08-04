assume cs:code

stack segment
    db 20 dup(1) ;定义一个20个字节的空栈，默认值为1
stack ends

code segment
start:
    ;栈初始化
    mov ax, stack
    mov ss, ax
    
    ;exit
    mov ax, 0x004ch
    int 21h
code ends
end start