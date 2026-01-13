; This program takes a 4 byte number n, and finds the multiplies each byte. If the product is equal to n, output n
format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	mov		ecx, 00000000h		; Current number
	mov		esi, 010000h		; Divisor to remove 2 least significant bytes

calculate:
	movzx	eax, cl				; Product operand 1
	movzx	ebx, ch				; Product operand 2

	mul		ebx					; eax * ebx
	mov		edi, eax			; Store in accumulator edi

	mov		edx, 0				; Set edx to 0 for division
	mov		eax, ecx			; Set eax to current number for division
	div		esi					; eax / esi to remove 2 least significant bytes
	
	movzx	eax, al
	movzx	ebx, ah

	mul		ebx					; eax * ebx
	mul		edi					; eax * ebi

	cmp		eax, ecx
	jnz		skip_print

	call	print_eax

skip_print:
	cmp		ecx, 0ffffffffh
	jz		exit_process
	inc		ecx
	jmp		calculate

exit_process:
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

