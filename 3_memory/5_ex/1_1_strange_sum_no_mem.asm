format PE console
entry start

include 'win32a.inc' 


; This is the text section:
; ===============================================
section '.text' code readable executable

start:
    ; Program begins here.

	call	read_hex
	mov		ecx, eax
	xor		ebx, ebx

strange_sum:
	call	read_hex
	mul		ecx
	add		ebx, eax
	loop	strange_sum

	mov		eax, ebx
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
