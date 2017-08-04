assume cs:code
code segment
start:
    mov ax, 1000h
    mov ss, ax
    mov sp, 0010h
    mov ax, 1122h
    mov bx, 2233h
    ;通过栈的特性交换
    push ax
    push bx
    pop ax
    pop bx
    ;exit
    mov ah, 4ch
    int 21h
code ends
end start
    
    