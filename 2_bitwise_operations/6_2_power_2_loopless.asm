; This program checks if a number n is a power of 2. Loops are not used

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	xor		ecx, ecx
    call    read_hex
	cmp		eax, 0
	jz		exit_process

	mov		ebx, eax
	dec		ebx
	and		eax, ebx
	
	jnz		exit_process
	inc		ecx

exit_process:
	mov		eax, ecx
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
