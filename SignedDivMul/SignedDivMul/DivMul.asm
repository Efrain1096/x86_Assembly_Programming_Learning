.386 ; Not compulsory.This can be skipped.
.model flat, c
.code

;	Procedure: (This is what a function, or a subroutine (Ex. M68K) is called in assembly)
;		Return : 0 Error (Division by zero)
;		Return : 1 Success
;
;		Computation "product" = a * b
;					"quotient" = a/b			
;					"remainder" = a % b

IntegerMulDiv proc
			
			push ebp
			mov	ebp, esp
			push ebx

			xor eax, eax

			mov ecx, [ebp + 8]	; ecx = 'a'
			mov edx, [ebp + 12]	; edx = 'b'

			or edx, edx	; This is done to test if a division by zero is going to happen. The status flags in the E register are updated, and preserved.
			jz InvalidDivisor



			imul edx, ecx	; edx = 'a' * 'b'

			mov ebx, [ebp+16] ; ebx = 'product'
			mov [ebx], edx

			mov eax, ecx	; eax = 'product'
			cdq	; edx, eax, contains dividend

			idiv dword ptr[ebp+12] ; Have to use a double word since it's a 32-bit operation.

			mov ebx, [ebp+20] ; Stores quotient
			mov [ebx], eax
			mov ebx, [ebp+24]
			mov [ebx], edx
			mov eax, 1

	InvalidDivisor: ; This helps prevent a crash.
		pop ebx
		pop	ebp
		ret

IntegerMulDiv endp
	end