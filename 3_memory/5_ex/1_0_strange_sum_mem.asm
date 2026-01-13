; This program takes a number n as input and takes n more numbers in array a
; The program calculates n*a_1 + (n-1)*a_2 + ... + 1*a_n

format PE console
entry start

include 'win32a.inc' 

MAX_NUMS = 10d


; This is the data section:
; ===============================================
section '.data' data readable writeable
	nums	dd	MAX_NUMS dup (0)

; This is the text section:
; ===============================================
section '.text' code readable executable

start:
    ; Program begins here.
	
	call	read_hex		; Read n
	
	cmp		eax, MAX_NUMS
	jg		exit_process
	
	mov		ecx, eax
	mov		ebx, eax
	mov		esi, nums		; Store address of nums array in esi

read_nums:
	dec		ecx

	call	read_hex
	mov		[esi+4*ecx], eax

	cmp		ecx, 0
	jnz		read_nums

	mov		ecx, ebx
	xor		ebx, ebx

strange_sum:
	mov		eax, [esi+4*(ecx-1)]
	mul		ecx
	add		ebx, eax
	loop	strange_sum

	mov		eax, ebx
	call	print_eax

exit_process:
	; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
