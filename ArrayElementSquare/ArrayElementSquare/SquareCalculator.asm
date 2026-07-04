.model flat, c
.code

CalcArraySquaresASM proc
	
	push ebp
	mov	ebp, esp
	push ebx
	push esi
	push edi

	; Load arguments
	mov edi, [ebp + 8]
	mov	esi, [ebp + 12]
	mov ecx, [ebp + 16]


	xor eax, eax	; eax= sum of 'y' array
	cmp	ecx, 0
	jle EmptyArray
	shl ecx, 2	; ecx = Size of the array in bytes. Logical shift to the left means multiply in powers of 2. Shift right to divide by powers of 2.
	xor ebx, ebx	; ebx = Array element offset

@@:	mov	edx, [esi +ebx]	; Load next x[i]
	imul edx, edx	; x[i]*x[i] = x[i]^2
	mov [edi + ebx], edx ; Save result to y[i]
	add eax, edx	; Update the running sum
	add ebx, 4;	Update array element offset
	cmp ebx, ecx
	jl @B	; Jump if not finished


EmptyArray:
	pop edi
	pop esi
	pop ecx
	pop	ebp
	ret

CalcArraySquaresASM endp
	end
