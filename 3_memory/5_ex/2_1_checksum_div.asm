; This program prints the checksum of itself.
; The checksum is the sum of each byte mod 100h

format PE console
entry start

include 'win32a.inc' 


; This is the text section:
; ===============================================
section '.text' code readable executable

start:
	mov		esi, start
	xor		ebx, ebx
	mov		ecx, 100h

print_byte:
	movzx	eax, byte [esi]
	xor		edx, edx
	div		ecx
	add		ebx, edx
	inc		esi
	cmp		esi, prog_end
	jnz		print_byte

	mov		eax, ebx
	call	print_eax

	; Exit the process:
	push	0
	call	[ExitProcess]

prog_end:

include 'training.inc'
