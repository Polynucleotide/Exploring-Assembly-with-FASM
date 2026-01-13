; This program receives a number n as input and finds 2 proper divisors x
; where 1 < x < n

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	; Your program begins here:

	call	read_hex    ; Reads eax as hex from console.
	mov		esi, eax	; Store n
	mov		edi, 1		; First divisor. It is 2 but set to 1 because while_counter will increment it to 2
	mov		ecx, 0		; Counter for integral divisors

while_counter:
	inc		edi			; Increment edi for next divisor

	cmp		ecx, 2		; Compare current integral divisors with maximum count
	jae		exit_process

	; Divide n by current divisor
	mov		edx, 0
	mov		eax, esi
	div		edi

	; Check if remainder is 0
	cmp		edx, 0
	jnz		while_counter	; Jump back to loop if remainder is not 0

	; If remainder is 0
	mov		eax, edi		; Set eax to the divisor(edi)
	call	print_eax		; Output the proper divisor
	inc		ecx

	jmp		while_counter

exit_process:
	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

