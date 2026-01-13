format PE console
entry start

include 'win32a.inc' 


; This is the data section:
; ===============================================
section '.data' data readable writeable
    ; some initalized data.
	nums	dd	23h, 75h, 111h, 0abch, 443h, 1000h, 5h, 2213h, 433a34h, 0deadbeafh
	end_nums:

; This is the text section:
; ===============================================
section '.text' code readable executable

start:
    ; Program begins here.

	call	read_hex

	; Store array's address in edi
	mov		edi, nums

	; Number of dwords in array
	mov		ecx, (end_nums - nums) / 4
	dec		ecx

	mov		ebx, eax			; Copy x
	sub		ebx, [edi+4*ecx]	; Find difference (x - nums_i)
	
	jns		skip_negate_1		; Skip negate is not negative
	neg		ebx					; Negate if negative num

skip_negate_1:
	mov		esi, ecx			; Store index of first difference
	mov		edx, ebx			; Store the first difference

find_closest:
	dec		ecx

	mov		ebx, eax
	sub		ebx, [edi+4*ecx]

	jns		skip_negate_2
	neg		ebx

skip_negate_2:
	cmp		ebx, edx
	jae		no_new_minimum

	mov		esi, ecx			; Store new index
	mov		edx, ebx			; Store new lowest difference

no_new_minimum:
	cmp		ecx, 0
	jnz		find_closest

	mov		eax, [edi+4*esi]
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
