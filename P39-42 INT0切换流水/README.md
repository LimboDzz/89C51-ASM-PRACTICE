[Source Code](./proj.a51)

## Notes

### INIT INT0

```
SETB EA					;ENABLE ALL INT
SETB EX0				;ENABLE XTERNAL INT0
SETB IT0				;SET TRIGGER MODE
```

### FLASHING EFFECT

```
		CLR A
DISP:
		MOV P0,A
		CPL A			;Converse Position Logical
		LCALL DELAY
		JMP DISP
```

### SAVE AND RECOVER DURING INT PROCESSING

```
INT_0:
		PUSH ACC		;SAVE
		PUSH PSW
		;SETB RS0		;SWITCH REGSET

		;DOING TASKS...

		;CLR RS0
		POP PSW			;RECOVER
		POP ACC
		RETI
```

## Result

![实验结果](./result.gif)
