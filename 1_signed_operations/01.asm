; This program receives a 4 bytes input as n and outputs the product of each byte

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    call    read_hex		; Reads eax as hex from console.
	mov		ecx, eax		; Keep a copy of n

	movzx	eax, cl			; Product operand 1
	movzx	ebx, ch			; Product operand 2

	mul		ebx				; eax *= ebx
	mov		edi, eax		; Store the accumulated result in edi

	mov		eax, ecx
	mov		edx, 0			; Set edx to 0 instead of cdq because we don't care about sign
	mov		esi, 10000h		; Divisor
	div		esi				; Remove the 2 least significant bytes
	mov		ecx, eax

	movzx	eax, cl
	movzx	ebx, ch

	mul		ebx
	mul		edi

	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

