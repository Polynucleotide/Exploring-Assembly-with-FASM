; This program receives 3 numbers x, y, z as input. The 3 numbers is summed together x + y + z
; The program outputs 0 if the sum is odd, 1 if the sum is even

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex
	mov		ebx, eax

	call	read_hex
	mov		ecx, eax

	call	read_hex

	xor		eax, ebx
	xor		eax, ecx

	and		eax, 1
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
