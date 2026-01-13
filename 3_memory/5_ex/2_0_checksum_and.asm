; This program prints a checksum of itself.
; The checksum is the sum of each byte mod 100h
; This program uses the AND instruction for mod

format PE console
entry start

include 'win32a.inc' 


; This is the text section:
; ===============================================
section '.text' code readable executable

start:
    ; Program begins here.
	mov		esi, start
	xor		eax, eax

print_checksum:
	movzx	ebx, byte [esi]
	mov		ecx, 11111111b
	and		ebx, ecx
	add		eax, ebx
	inc		esi
	cmp		esi, prog_end
	jnz		print_checksum

	call	print_eax

	; Exit the process:
	push	0
	call	[ExitProcess]

prog_end:

include 'training.inc'
