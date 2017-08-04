assume cs:code
code segment
start:
    mov ax, 1122h
    mov bx, 3344h
    add ax, bx

    ;exit
    mov ah, 4ch
    int 21h
code ends
end start
