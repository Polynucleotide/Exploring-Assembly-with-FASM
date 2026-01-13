; This program checks for AABB intersection
; This program checks if 2 axis-aligned boxes intersects

format PE console
entry start

include 'win32a.inc' 

struct Point
	x	dd	?
	y	dd	?
ends

struct Rectangle
	min	Point	?
	max	Point	?
ends

; ===============================================
section '.bss' readable writeable
	rect1	Rectangle <?,?>, <?,?>
	rect2	Rectangle <?,?>, <?,?>


; This is the text section:
; ===============================================
section '.text' code readable executable

start:
	; Rectangle 1
	; x1
	call	read_hex
	mov		ebx, eax

	; y1
	call	read_hex
	mov		ecx, eax

	; x2
	call	read_hex
	mov		edx, eax

	; y2
	call	read_hex

	; Store min and max x
	; cmp x1, x2
	cmp		ebx, edx
	jl		rect1_x1_is_lower

	; x2_is_lower
	mov		dword [rect1.min.x], edx
	mov		dword [rect1.max.x], ebx

	jmp		compare_rect1_y

rect1_x1_is_lower:
	mov		dword [rect1.min.x], ebx
	mov		dword [rect1.max.x], edx

compare_rect1_y:
	; Store min and max y
	; cmp y1, y2
	cmp		ecx, eax
	jl		rect1_y1_is_lower

	; y2_is_lower
	mov		dword [rect1.min.y], eax
	mov		dword [rect1.max.y], ecx

	jmp		compare_rect2

rect1_y1_is_lower:
	mov		dword [rect1.min.y], ecx
	mov		dword [rect1.max.y], eax

compare_rect2:
	call	print_delimiter

	; Rectangle 2
	; x1
	call	read_hex
	mov		ebx, eax

	; y1
	call	read_hex
	mov		ecx, eax

	; x2
	call	read_hex
	mov		edx, eax

	; y2
	call	read_hex

	; cmp x1, x2
	cmp		ebx, edx
	jl		rect2_x1_is_lower

	; x2_is_lower
	mov		dword [rect2.min.x], edx
	mov		dword [rect2.max.x], ebx

	jmp		compare_rect2_y

rect2_x1_is_lower:
	mov		dword [rect2.min.x], ebx
	mov		dword [rect2.max.x], edx

compare_rect2_y:
	; cmp y1, y2
	cmp		ecx, eax
	jl		rect2_y1_is_lower

	; y2_is_lower
	mov		dword [rect2.min.y], eax
	mov		dword [rect2.max.y], ecx

	jmp		check_intersection

rect2_y1_is_lower:
	mov		dword [rect2.min.y], ecx
	mov		dword [rect2.max.y], eax

check_intersection:
	mov		eax, dword [rect1.max.x]
	cmp		eax, dword [rect2.min.x]
	jl		no_intersection

	mov		eax, dword [rect1.min.x]
	cmp		eax, dword [rect2.max.x]
	jg		no_intersection

	mov		eax, dword [rect1.max.y]
	cmp		eax, dword [rect2.min.y]
	jl		no_intersection

	mov		eax, dword [rect1.min.y]
	cmp		eax, dword [rect2.max.y]
	jg		no_intersection

	mov		eax, 1
	jmp		exit_process

no_intersection:
	mov		eax, 0

exit_process:
	call	print_delimiter
	call	print_eax

	; Exit the process:
	push	0
	call	[ExitProcess]

include 'training.inc'
