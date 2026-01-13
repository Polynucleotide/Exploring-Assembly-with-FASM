; This program flips the bits of a number from an input

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    call    read_hex    ; Reads eax as hex from console.
	neg		eax			; Negate eax
	dec		eax			; -1 from two's complement
	call	print_eax
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

