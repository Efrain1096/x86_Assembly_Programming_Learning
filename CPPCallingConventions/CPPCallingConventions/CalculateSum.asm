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
		sub esp, 12 ; Allocate local storage space.
		push ebx
		push esi
		push edi

; Load arguments
		mov eax, [ebp + 8]
		mov ebx, [ebp + 12]
		mov ecx, [ebp + 16]
		mov	edx, [ebp + 20]
		mov	esi, [ebp + 24]
		mov	edi, [ebp + 28]

; Compute s1 = a + b + c
		mov [ebp - 12], eax
		add [ebp - 12], ebx
		add [ebp - 12], ecx

; Compute s2 = a*a + b*b + c*c
		imul eax, eax
		imul ebx, ebx
		imul ecx, ecx
		mov [ebp - 8], eax
		add [ebp - 8], ebx
		add [ebp - 8], ecx

; Compute s3 = a*a*a + b*b*b + c*c*c
		imul eax, [ebp + 8]
		imul ebx, [ebp + 12]
		imul ecx, [ebp + 16]
		mov	[ebp - 4], eax
		add	[ebp - 4], ebx
		add [ebp - 4], ecx

; Save s1, s2, s3
		mov eax, [ebp - 12]
		mov [edx], eax
		mov eax, [ebp - 8]
		mov [esi], eax
		mov eax, [ebp - 4]
		mov [edi], eax

; Epilogue. Restores the non-volatile registers.
		pop edi
		pop	esi
		pop	ebx
		mov	esp, ebp
		pop ebp

		ret


CalculateSum	endp
				end