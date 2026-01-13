; Fibonacci

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	; Your program begins here:
	call    read_hex    ; Reads eax as hex from console.
	
	cmp	eax, 0
	jle	fib_zero

	cmp	eax, 2
	jle	fib_one_two

	mov	ecx, eax
	sub	ecx, 2		; Subtract n from the first two sequences

	mov	eax, 0
	mov	ebx, 1
	mov	edx, 1

fib:
	cmp	ecx, 0
	jz	print_and_exit

	; f(n) = f(n-1) + f(n-2)
	mov	eax, 0
	add	eax, ebx
	add	eax, edx

	; Shift f(n-1) and f(n-2)i
	mov	edx, ebx
	mov	ebx, eax

	dec	ecx
	jmp	fib

fib_zero:
	mov	eax, 0
	jmp	print_and_exit

fib_one_two:
	mov	eax, 1

print_and_exit:
	call	print_eax
	
	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

