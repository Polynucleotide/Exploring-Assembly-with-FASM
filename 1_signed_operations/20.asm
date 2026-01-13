; Example for a simple FASM console program.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:
    call    read_hex    ; Reads eax as hex from console.
	
	mov		ebx, 0ffffffffh
	sub		ebx, eax
	mov		eax, ebx
	
	call	print_eax
	
	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

