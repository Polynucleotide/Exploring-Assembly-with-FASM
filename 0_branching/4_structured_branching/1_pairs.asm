; This program receives a number n and prints out pairs (x, y) where x < y < n

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    ; Your program begins here:

    call    read_hex    ; Reads eax as hex from console.
	mov		esi, eax	; Store n in esi
	mov		ebx, 0		; Set ebx(x) to 0

x_loop:
	; Check if n - x <= 1
	mov		edi, esi
	sub		edi, ebx
	cmp		edi, 1
	jle		exit_process

	; y = x + 1
	mov		ecx, ebx
	inc		ecx

y_loop:
	cmp		ecx, esi
	jge		next_x

print_pairs:
	; Print x
	mov		eax, ebx
	call	print_eax

	; Print y
	mov		eax, ecx
	call	print_eax

	; Increment y
	inc		ecx

	jmp		y_loop

next_x:
	inc		ebx
	jmp		x_loop

exit_process:
    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

