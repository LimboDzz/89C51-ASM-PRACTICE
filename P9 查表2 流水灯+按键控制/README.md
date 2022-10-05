[Source Code](./proj.a51)

## Notes

1. BTN BIT P3.0 使用 BIT 定义变量，以便后续使用。
2. 查表法三步走：

- ARR: DPTR
- ARR LENGTH: R1
- ARR INDEX: R2

3. DETECT KEYUP CODE SNIPPET

```
DETECT:
		JB BTN,DETECT	;IF NOT DOWN, KEEP DETECTION
DOWN:
		JNB BTN,DOWN	;IF NOT KEYUP, WAIT FOR KEYUP
UP:
		LCALL DISP
```

## Result

![实验结果](./result.gif)
