.386
.model flat

.data
;intArray SWORD 0,0,0,0,0
intArray SWORD 10,3,0,-34,-56,7,8
.code
main proc
	mov ebx, OFFSET intArray
	mov ecx, LENGTHOF intArray


Loop1: 
	cmp WORD PTR[ebx], 0
	jnz	found
	add ebx, 2 ; Add 2 bytes to get the next element.
	loop Loop1
	jmp	notFound

found: 
	movsx eax, WORD PTR[ebx]
	jmp quit

notFound:
	mov eax, 999999

quit:
	ret
main endp
end	main