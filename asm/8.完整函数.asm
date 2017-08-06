assume cs:code,ss:stack

stack segment
    db 40 dup(0)
stack ends

code segment
start:
    mov ax, stack
    mov ss, ax  
    
    ;假设初值
    mov bp, 1002h
    mov bx, 1003h
    mov cx, 1004h
    mov dx, 1005h
    
    ;执行求和函数
    push 03h ;传递参数
    push 02h ;传递参数
    call sum ;调用函数
    
    ;exit
    
    mov ah, 4ch
    int 21h
    
sum:
    push bp ;现场保护
    mov bp, sp
    sub sp, 20 ;20字节留作局部变量
    ;保护寄存器
    push bx
    push cx
    push dx 
    
    ;*业务逻辑代码*
    
    ;申明局部变量 
    mov ss:[bp-2], 1h
    mov ss:[bp-4], 2h  
    
    ;有可能修改寄存器
    mov bx,2h
    mov cx,3h
    mov dx,4h  
    
    ;计算结果
    mov ax, [bp+4] ; bp 指向call 下条指令地址，取形参要加4
    add ax, [bp+6]
    add ax, [bp-2] ;局部变量
    add ax, [bp-4]
    
    ;sp指向寄存器保护位置
    pop dx
    pop cx
    pop bx
    
    ;清空局部变量
    mov sp,bp
    pop bp; 现场保护恢复，防止多个函数调用改变bp
    ret 4 ;栈平衡
code ends
end start