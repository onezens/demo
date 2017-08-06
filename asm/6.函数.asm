assume cs:code,ds:data

data segment
    str db 'Hello world!$'
data ends

code segment
start:
    mov ax, data
    mov ds, ax
    ;调用打印函数
    call print
    ;exit
    mov ah, 4ch
    int 21h
    
print:
    mov dx, offset str
    mov ah, 09h
    int 21h
    ret
code ends
end start