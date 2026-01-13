; This program checks if a given number n is a power of 2

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex
	mov		ecx, 32d
	xor		edx, edx

check:
	mov		ebx, eax
	and		ebx, 1
	add		edx, ebx
	shr		eax, 1
	loop	check

	mov		eax, 0
	cmp		edx, 1
	jnz		exit_process
	mov		eax, edx

exit_process:
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
