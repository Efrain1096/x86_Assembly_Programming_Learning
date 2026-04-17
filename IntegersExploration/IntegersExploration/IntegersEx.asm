.386
.model flat, c




extern GlChar:byte ; This is how to import global variables.
extern GlShort:word ; A word is 32 bits in x64, but is 16 bits in x86.
extern GlInt:dword 
extern GlongLong:qword

	.code

IntegerAddition	proc
	
	push ebp
	mov ebp, esp

; Compute GlChar +=a

	mov al, [ebp+8] ; First parameter passed to the stack.
	add [GlChar], al

; Compute GlShort += b

	mov ax, [ebp + 12]
	add [GlShort], ax

; Compute GlInt += c

	mov eax, [ebp + 16]
	add [GlInt], eax

; Compute GlongLong += d

	mov eax, [ebp+20]
	mov edx, [ebp+24]
	add dword ptr[GlongLong], eax
	add dword ptr[GlongLong], edx

	pop ebp
	ret

IntegerAddition endp
				end