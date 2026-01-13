; This program takes a value m as input. It then receives m consecutive numbers from the user.
; Then, sum all those numbers and print back the sum.

format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
	; Your program begins here:
	call    read_hex    ; Reads eax as hex from console.
	mov	ebx, 0
	mov	ecx, eax

sum_user_input:
	cmp	ecx, 0
	jng	print_sum

	call	read_hex
	add	ebx, eax
	dec	ecx
	jmp	sum_user_input

print_sum:
	mov	eax, ebx
	call	print_eax

exit:
	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'

