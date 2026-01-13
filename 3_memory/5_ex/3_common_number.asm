; This program takes a number n as input, followed by n numbers
; The program will output the most common number in the list of n numbers
; Largest number in the list is 0xff

format PE console
entry start

include 'win32a.inc' 

MAX_NUMS = 256d


; This is the data section:
; ===============================================
section '.data' data readable writeable
	nums	dd	MAX_NUMS	dup (0)

; This is the text section:
; ===============================================
section '.text' code readable executable

start:
    ; Program begins here.
	call	read_hex			; Read n
	mov		ecx, eax			; Store n in ecx for loop
	mov		esi, nums			; Store address of nums array

read_nums:
	call	read_hex			; Read b_i
	
	cmp		eax, 0ffh			; Terminate is b_i > 255d / ffh
	jg		exit_process

	inc		dword [esi+4*eax]
	loop	read_nums

	mov		ecx, MAX_NUMS		; Set ecx to array size
	dec		ecx					; Decrement ecx to start on the last index

	mov		ebx, dword [esi]	; Set greatest number to first element
	xor		edi, edi			; Set greatest number index to 0

common_num:
	mov		eax, dword [esi+4*ecx]
	cmp		eax, ebx
	jle		no_new_maximum
	
	; Set new maximum
	mov		ebx, eax			; Set greatest number
	mov		edi, ecx			; Set greatest number index

no_new_maximum:
	loop	common_num

print_common_num:
	mov		eax, edi
	call	print_eax

exit_process:
    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
