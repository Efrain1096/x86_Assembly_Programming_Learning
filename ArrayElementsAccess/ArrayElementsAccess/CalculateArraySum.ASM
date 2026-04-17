.model flat, c
.code

CalcArraySumASM    proc
            push ebp
			mov ebp, esp


			mov edx, [ebp+8]    ; edx = x.
			mov ecx, [ebp+12]   ; ecx = n.
			xor eax, eax        ; eax = sum.

			cmp ecx, 0
			jle InvalidCount

@@:			add eax, [edx]    ; Add the next element to the sum.
			add edx, 4        ; Set pointer to the next element.
			dec ecx          ; Adjust the counter.

			jnz @B    ; If not equal to zero, then jump or refer to the next(?)/nearest @@ label.

InvalidCount:
          pop ebp
		  ret

CalcArraySumASM    endp
            end