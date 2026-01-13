; This program takes a number n as input and counts the amount of "1"s
; in every even position

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex
	mov		ecx, 16d
	xor		edx, edx

count_bits:
	mov		ebx, eax
	and		ebx, 1
	add		edx, ebx
	shr		eax, 2
	loop	count_bits

	mov		eax, edx
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
