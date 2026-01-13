; This program takes in 12 numbers as input. Each pair of input represents an x, y position of a point
; We only take in 6 points
; The 6 points will then be sorted lexicographically

format PE console
entry start

include 'win32a.inc' 

struct Point
	x	dd	?
	y	dd	?
ends

POINTS_COUNT = 6


; This is the data section:
;================================================
section 'data' data readable writeable
	sorted_size	dd	0


; This is the bss section:
; ===============================================
section '.bss' readable writeable
	points	Point	?, ?
			Point	?, ?
			Point	?, ?
			Point	?, ?
			Point	?, ?
			Point	?, ?

	sorted_points	Point	?, ?
					Point	?, ?
					Point	?, ?
					Point	?, ?
					Point	?, ?
					Point	?, ?


; This is the text section:
; ===============================================
section '.text' code readable executable

start:
	; Set ecx for loop to read coordinates
	mov		ecx, POINTS_COUNT
	xor		esi, esi

read_points:
	; Read x
	call	read_hex
	mov		dword [points + esi*sizeof.Point + Point.x], eax
	
	; Read y
	call	read_hex
	mov		dword [points + esi*sizeof.Point + Point.y], eax   

	call	print_delimiter

	inc		esi
	loop	read_points
	
	; Reset loop counters for the unsorted array loop
	mov		ecx, POINTS_COUNT
	xor		esi, esi

loop_unsorted_array:
	; Set eax to unsorted point x
	mov		eax, dword [points + esi*sizeof.Point + Point.x]
	
	; Reset loop counters for the sorted array loop
	xor		edi, edi
	mov		edx, dword [sorted_size]

loop_sorted_array:
	cmp		edi, edx
	jge		insert_point

	mov		ebx, dword [sorted_points + edi*sizeof.Point + Point.x]
	cmp		eax, ebx
	jl		right_shift_points
	je		check_y

	; If x1 is greater than x2
	inc		edi
	jmp		loop_sorted_array

check_y:
	mov		eax, dword [points + esi*sizeof.Point + Point.y]
	mov		ebx, dword [sorted_points + edi*sizeof.Point + Point.y] 

	cmp		eax, ebx
	jle		right_shift_points

	inc		edi
	cmp		edi, edx
	jl		check_y
	jmp		insert_point

right_shift_points:
	mov		ebx, dword [sorted_size]

right_shift_loop:
	dec		ebx
	mov		eax, dword [sorted_points + ebx*sizeof.Point + Point.x]
	inc		ebx
	mov		dword [sorted_points + ebx*sizeof.Point + Point.x], eax

	dec		ebx
	mov		eax, dword [sorted_points + ebx*sizeof.Point + Point.y]
	inc		ebx
	mov		dword [sorted_points + ebx*sizeof.Point + Point.y], eax

	dec		ebx
	sub		ebx, edi

	cmp		ebx, 0
	jle		complete_right_shift

	add		ebx, edi
	jmp		right_shift_loop

insert_point:
complete_right_shift:
	mov		eax, dword [points + esi*sizeof.Point + Point.x]
	mov		dword [sorted_points + edi*sizeof.Point + Point.x], eax
	
	mov		eax, dword [points + esi*sizeof.Point + Point.y]
	mov		dword [sorted_points + edi*sizeof.Point + Point.y], eax

	inc		esi
	inc		dword [sorted_size]
	dec		ecx
	jnz		loop_unsorted_array

	mov		ecx, POINTS_COUNT
	xor		esi, esi

display_sorted:
	mov		eax, dword [sorted_points + esi*sizeof.Point + Point.x]
	call	print_eax

	mov		eax, dword [sorted_points + esi*sizeof.Point + Point.y]
	call	print_eax

	call	print_delimiter
	inc		esi
	loop	display_sorted

exit_process:
	; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
