.386
.model flat

.data
intArray DWORD 10000h, 20000h, 30000h, 40000h; Array with 4 elements.

.code
start proc
	mov edi, OFFSET intArray ; edi will hold or store the offset of a data label. In other words, the address difference of the label and the start of date(?).
	mov ecx, LENGTHOF intArray ; Store the length of the array in ecx
	mov eax, 0

LP: ; What this loop is doing is adding up all the elements of intArray to eax.
	add eax, [edi] ; The square braces are used by convention to make it clear that content is being loaded instead of an address.
	add edi, TYPE intArray ; Adds array element size to edi to move to the next element. Basically, [intArray+sizeof(TYPE intArray)] kind of...
	loop LP
	ret

start endp
end start


