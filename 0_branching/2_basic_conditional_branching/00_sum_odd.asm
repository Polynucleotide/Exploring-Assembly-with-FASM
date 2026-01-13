; This program takes the value n as input and finds the sum of
; all the odd numbers between 1 and 2n+1, inclusive.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	; The program begins here:

	; Read input
	call	read_hex

	; f(n) = 2n + 1
	add	eax, eax
	inc	eax

	; Copy eax into ebx
	mov	ebx, eax

	mov	ecx, 1
	mov	eax, 1

sum_odd:
	add	ecx, 2
	cmp	ecx, ebx

	; Exit if ecx > ebx
	jg	exit

	add	eax, ecx
	jmp	sum_odd

exit:
	; Output will be in hexadecimal
	call	print_eax
	push	0
	call	[ExitProcess]

include 'training.inc'
