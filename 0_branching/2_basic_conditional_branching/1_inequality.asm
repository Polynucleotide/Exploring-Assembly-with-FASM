; Write a program that prints 1 if x < y < z, 0 otherwise.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	; Your program begins here:

	call    read_hex	; x
	mov	ecx, eax

	call	read_hex	; y
	mov	ebx, eax
	
	call	read_hex	; z

	cmp	ecx, ebx
	jae	print_zero

	cmp	ebx, eax
	jae	print_zero

print_one:
	mov	eax, 1
	call	print_eax
	jmp	exit

print_zero:
	mov	eax, 0
	call	print_eax

exit:
	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

