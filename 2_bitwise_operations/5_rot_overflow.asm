format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex

	call    print_eax_binary
	ror		eax, 255d
	call	print_eax_binary

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
