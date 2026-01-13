; This program reverses the bits of input n. 1101 -> 1011

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex
    call    print_eax_binary
	
	xor		ebx, ebx
	mov		ecx, 32d

reverse_bits:
	shr		eax, 1
	jnc		skip_xor
	xor		ebx, 1

skip_xor:
	rol		ebx, 1
	loop	reverse_bits

	ror		ebx, 1
	mov		eax, ebx
	call	print_eax_binary

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
