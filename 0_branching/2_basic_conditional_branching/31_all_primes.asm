; This program takes a number n as input, and prints back to the console all the prime numbers
; that are greater than 1 but not greater than n. 1 < x <= n

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	; Your program begins here:

	call    read_hex	; Reads eax from console. n

	; Store n in esi
	mov	esi, eax
	
	; Starting prime x where 1 < x <= n
	mov	ebx, 3

	; Always print 2 as the starting prime
	mov	eax, 2
	call	print_eax

	jmp	all_primes

all_primes:
	; Check x <= n
	cmp	ebx, esi
	jg	exit

	mov	ecx, ebx
	dec	ecx

prime_check:
	cmp	ecx, 1
	jz	is_prime

	mov	eax, ebx
	mov	edx, 0
	div	ecx

	cmp	edx, 0
	jz	next_number

	dec	ecx
	jmp	prime_check

is_prime:
	mov	eax, ebx
	call	print_eax

next_number:
	add	ebx, 2
	jmp	all_primes

exit:
	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

