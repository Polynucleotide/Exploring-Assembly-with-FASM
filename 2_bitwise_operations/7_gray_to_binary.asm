; This program converts Gray Code into Binary

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex
	call	print_eax_binary

	xor		ebx, ebx
	mov		ecx, 32d

	mov		ebx, 80000000h
	and		ebx, eax
	rol		ebx, 1

	mov		edx, ebx
	and		edx, 1
	shl		ebx, 1

convert:
	shl		eax, 1
	jc		xor_edx_1
	xor		edx, 0
	jmp		skip_xor_edx_1

xor_edx_1:
	xor		edx, 1

skip_xor_edx_1:
	xor		ebx, edx
	mov		edx, ebx
	and		edx, 1
	rol		ebx, 1
	loop	convert
	ror		ebx, 1

exit_process:
	mov		eax, ebx
	call	print_eax_binary

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
