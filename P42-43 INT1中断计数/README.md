[Source Code](./proj.a51)

## Notes

1.  74LS245
    当 8051 单片机的 P0 总线负载达到或超过 P0 最大负载能力时，必须接入 74LS245 等总线驱动器。

2.  查表法，如果是为了在七段上显示 16 进制数，在达到段码数组长度时以往使用判断是否相等若相等则清零的做法，本次实验采用与#0FH 相与从而移除超过 16 的部分（即 mod 16）

    ```
    INC R1
    MOV A,R1
    ANL A,#0FH
    MOVC A,@A+DPTR
    MOV P0,A
    ```

3.  外部中断向量起始地址

- INT0 0003H
- INT1 0013H

4. 如果使用了 PUSH 和 POP 等堆栈操作，需要设置堆栈地址  
   MOV SP,#30H

5. ACC AND A
   PUSH ACC，POP ACC 不可以写成 PUSH A 和 POP A

   PUSH 指令只有一条，那就是 PUSH direct，所以如果想将 A 寄存器的值临时存放在堆栈上，PUSH A 是通不过编译的，只能写 PUSH ACC

   通过直接寻址访问 A 寄存器时，要将其写为 ACC

![实验结果](./result.gif)
