; Prints 1 if input is prime, 0 otherwise

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	; Your program begins here:
	call    read_hex	; Reads eax as hex from console.
	mov	ebx, eax	; Keep a copy of n
	
	; Start denominator of n-1
	mov	ecx, eax
	dec	ecx

check_prime:
	cmp	ecx, 2
	jl	is_prime

	mov	eax, ebx
	mov	edx, 0
	div	ecx
	cmp	edx, 0
	jz	is_not_prime

	dec	ecx
	jmp	check_prime
	
is_prime:
	mov	eax, 1
	call	print_eax
	jmp	exit

is_not_prime:
	mov	eax, 0
	call	print_eax

exit:
	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

