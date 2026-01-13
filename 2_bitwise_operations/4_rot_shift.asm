; This program rotates bits by n amount using shift instructions

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex				; Read input n
	mov		ebx, eax				; Store a copy of n

	call	read_hex				; Read rotation x
	mov		edi, eax				; Save x to edi
	mov		edx, 32d				; Set edx to 32
	sub		edx, edi				; Subtract x from 32. 32 - x

	; Print initial n
	mov		eax, ebx
	call	print_eax_binary

rotate_left:
	mov		eax, ebx				; Set eax to n to be shifted by x amount
	mov		esi, ebx				; Set esi to n to be shifted by (32 - x) amount

	mov		ecx, edi
	shl		eax, cl					; Shift eax to the left by x amount
	mov		ecx, edx				; Set cl to (32-x)
	shr		esi, cl					; Shift esi to the right by 32-x amount

	or		eax, esi
	call	print_eax_binary

rotate_right:
	mov		eax, ebx
	mov		esi, ebx

	mov		ecx, edi
	shr		eax, cl
	mov		ecx, edx
	shl		esi, cl

	or		eax, esi
	call	print_eax_binary

exit_process:
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
