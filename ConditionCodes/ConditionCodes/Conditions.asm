.model flat, c
.code



; Find min A.

SignedMinA proc

	push ebp
	mov	ebp, esp

	mov eax, [ebp + 8] ; eax = 'a'
	mov ecx, [ebp + 12] ; ecx = 'b'

	cmp eax, ecx
	jle @F ; The @F is an assembler symbol that designates the nearest forward @@ label/symbol as the target of the condition. @b is to jump backwards.
	mov eax, ecx ; eax = min(a, b)


@@:	mov ecx, [ebp + 16]
	cmp eax, ecx
	jle @F
	mov eax, ecx ; eax = min(a, b, c)


@@:	pop	ebp
	ret

SignedMinA	endp


; Find max A.

SignedMaxA	proc

	push ebp
	mov	 ebp, esp
	mov	eax, [ebp + 8] ; eax = 'a'
	mov ecx, [ebp + 12] ; ecx = 'b'

	cmp	eax, ecx
	jge @F ; Jump forward to the nearest @@ symbol.
	mov eax, ecx ; eax = max(a, b)


@@:	mov ecx, [ebp + 16]
	cmp eax, ecx
	jge @F
	mov eax, ecx ; eax = max(a, b, c)

@@:	pop ebp
	ret

SignedMaxA	endp

; Find min B.

SignedMinB	proc
	push ebp
	mov	 ebp, esp
	mov	eax, [ebp + 8] ; eax = 'a'
	mov ecx, [ebp + 12] ; ecx = 'b'	

	cmp eax, ecx
	cmovg eax, ecx ; eax = min(a, b) Use cmova for unsigned integers
	mov ecx, [ebp + 16]
	cmp eax, ecx
	cmovg eax, ecx ; eax = min(a, b, c)

	pop ebp
	ret

SignedMinB	endp

; Find max B.
SignedMaxB	proc

	push ebp
	mov	 ebp, esp
	mov	eax, [ebp + 8] ; eax = 'a'
	mov ecx, [ebp + 12] ; ecx = 'b'	

	cmp eax, ecx
	cmovl eax, ecx ; The unsigned version is cmovb. eax = max(a, b).
	mov ecx, [ebp + 16]
	cmp eax, ecx
	cmovl eax, ecx ; eax = max(a, b, c)

	pop ebp
	ret

SignedMaxB	endp
	end