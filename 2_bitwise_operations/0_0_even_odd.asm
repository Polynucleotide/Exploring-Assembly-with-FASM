; This program receives a number n and outputs 0 if n is even and 1 if n is odd

format PE console
entry start

include 'win32a.inc'

; ===============================================
section '.text' code readable executable

start:
    call    read_hex
	and		eax, 1b
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
