; This program adds two numbers by using only AND and XOR

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex
	mov		ebx, eax
	
	call	read_hex

addition:
	mov		ecx, eax
	and		ecx, ebx
	xor		eax, ebx

	cmp		ecx, 0
	jz		exit_process

	shl		ecx, 1
	mov		ebx, ecx
	jmp		addition

exit_process:
	call	print_eax

	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
