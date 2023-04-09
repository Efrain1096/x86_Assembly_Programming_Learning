.386
.model flat, c
.code



; Function prologue

CalculateSum	proc
		
		; The procedure begins with a stack frame pointer initialization, along with the preservation of non-volatile registers on the stack.
		; Before the registers are saved, subtract 12 from the esp register for allocating 12 bytes of local storage space that can be used by the function.
		; The reason a subtraction is mad instead of adding is because the x86 stack grows downwards, towards lower memory addresses. 
		; When using the ebp register to access values on the stack, function arguments are accessed using positive displacement of the stack. Whereas negative is for variables.

		push ebp;
		mov ebp, esp
		sub esp, 12
		push ebx
		push esi
		push edi
