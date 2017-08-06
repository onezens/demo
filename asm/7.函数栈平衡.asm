assume cs:code,ss:stack

stack segment
    db 20 dup(0)
stack ends

code segment
start:
    mov ax, stack
    mov ss, ax
    
    push 1
    push 2
    push 3
    call sum
    ;add sp, 6 ;外平栈操作 SP恢复为默认值0x0014
    
    push 1
    push 2
    push 3
    call sum
    ;add sp, 6 ;外平栈操作 SP恢复为默认值0x0014
    
    push 1
    push 2
    push 3
    call sum
    ;add sp, 6 ;外平栈操作 SP恢复为默认值0x0014
    
    ;exit
    mov ah, 4ch
    int 21h
    ;参数：传递两个字型参数，参数分别用bx，dx存放
    ;返回值：返回值存放在ax中    
sum:
    mov bp, sp ;sp不能加减，bp可以
    mov ax, ss:[bp+2]
    add ax, ss:[bp+4]
    add ax, ss:[bp+6]
    ret 6
code ends
end start