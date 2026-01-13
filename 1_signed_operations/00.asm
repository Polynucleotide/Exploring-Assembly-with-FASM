; This program receives a 4 byte input and outputs the sum of each byte

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    call    read_hex    ; Reads eax as hex from console.
	mov		ebx, 0		; Accumulator
	mov		ecx, 100h

	mov		edx, 0
	div		ecx
	add		ebx, edx

	mov		edx, 0
	div		ecx
	add		ebx, edx

	mov		edx, 0
	div		ecx
	add		ebx, edx

	mov		edx, 0
	div		ecx
	add		ebx, edx

	mov		eax, ebx
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

