;作用：hello world! 字符串的输出
;寄存器关联：代码段code与代码段寄存器CS关联，
;数据段data与数据段寄存器DS关联。
assume CS:code,DS:data ;注意：assume是伪指令，在扫描编译时不翻译
 
;data数据段定义
data segment
  string: db 'Hello world!','$' ;切忌串结束符$
data ends
 
;代码段定义
code segment
;程序开始
start:
  mov ax,data  ;将数据段段地址装入AX寄存器
  mov ds,ax ;将数据段段地址通过通用寄存器AX装入DS
  mov dx, string ;将串的段内地址装入DX
  mov ah,09h ;调用DOS的09H号功能，传入参数DS:DX=串地址，'$'结束字符串
  int 21h
  mov ah,4ch ;调用DOS的4CH号功能，带返回码结束，返回码存在于AL
  int 21h
code ends  ;代码段定义结束
end start  ;程序结束