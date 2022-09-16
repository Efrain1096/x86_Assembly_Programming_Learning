.386
.model flat, c ; What the 'c' means here is that we want to use C-style names for public symbols.
.code

AdderASM proc

	push ebp ;  Saves the contents of the ebp register onto the Stack???
	mov ebp, esp ; Copy contents of esp to ebp. Initializes a Stack frame for the procedure and enables access to the function's arguments.
	
	mov eax, [ebp + 8] ; eax = 'a'
	mov ecx, [ebp + 12] ; eax = 'b'
	mov edx, [ebp + 16] ; eax = 'c'

	add eax, ecx ; eax = 'a' + 'b'
	add eax, edx ; eax = ('a' + 'b') + 'b'. The result is stored in eax. Must use 'e' register for 32-bit integer functions.

	pop ebp 

	ret
AdderASM	endp
		end
