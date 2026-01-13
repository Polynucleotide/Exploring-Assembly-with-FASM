format PE console
entry start

include 'win32a.inc' 

; ===============================================
section '.text' code readable executable

start:
    call    read_hex
	xor		edi, edi		; Zero out edi for total distance

count_1s_start:
	mov		ecx, 32d		; Amount of bits to iterate
	xor		edx, edx		; Zero out edx to store amount of 1 bits

count_1s_loop:
	ror		eax, 1
	jnc		count_1s_next
	inc		edx

count_1s_next:
	loop	count_1s_loop

first_loop:
	shr		eax, 1
	jnc		first_loop

	dec		edx
	cmp		edx, 0
	jz		exit_process

	mov		ebx, eax		; Copy of original input for shifting
	mov		ecx, 32d		; 32 bit iteration
	xor		esi, esi		; Zero out steps

second_loop:
	shr		ebx, 1
	inc		esi
	jnc		skip_second_loop
	add		edi, esi		; Add steps to total

skip_second_loop:
	loop	second_loop
	jmp		first_loop

exit_process:
	mov		eax, edi
	call	print_eax

    ; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
