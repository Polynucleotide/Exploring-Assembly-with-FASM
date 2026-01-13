; This program takes 2 rectangles and outputs the rectangle with the greater area
; Each rectangle is defined by 2 points
; Each point is defined by 2 dwords

format PE console
entry start

include 'win32a.inc' 

struct Point
	x	dd	?
	y	dd	?
ends

struct Rectangle
	point_start	Point	?
	point_end	Point	?
	area		dd		?
ends


; This is the bss section:
; ===============================================
section '.bss' readable writeable
	rect1	Rectangle	<?, ?>, <?, ?>, ?
	rect2	Rectangle	<?, ?>, <?, ?>, ?

; This is the text section:
; ===============================================
section '.text' code readable executable

start:

read_rect1:
	; Read rectangle 1
	call	read_hex
	mov		dword [rect1.point_start.x], eax
	call	read_hex
	mov		dword [rect1.point_start.y], eax

	call	read_hex
	mov		dword [rect1.point_end.x], eax
	call	read_hex
	mov		dword [rect1.point_end.y], eax

	; Calculate area of rectangle 1
	; Distance of x
	mov		eax, dword [rect1.point_end.x]
	sub		eax, dword [rect1.point_start.x]

	; Distance of y
	mov		ebx, dword [rect1.point_end.y]
	sub		ebx, dword [rect1.point_start.y]

	imul	ebx
	test	eax, eax
	jns		skip_negate1
	neg		eax

skip_negate1:
	; Store rectangle 1 area
	mov		dword [rect1.area], eax

read_rect2:
	; Read rectangle 2
	call	read_hex
	mov		dword [rect2.point_start.x], eax
	call	read_hex
	mov		dword [rect2.point_start.y], eax

	call	read_hex
	mov		dword [rect2.point_end.x], eax
	call	read_hex
	mov		dword [rect2.point_end.y], eax

	; Calculate area of rectangle 2
	; Distance of x
	mov		eax, dword [rect2.point_end.x]
	sub		eax, dword [rect2.point_start.x]

	; Distance of y
	mov		ebx, dword [rect2.point_end.y]
	sub		ebx, dword [rect2.point_start.y]

	imul	ebx
	test	eax, eax
	jns		skip_negate2
	neg		eax

skip_negate2:
	; Store rectangle 2 area
	mov		dword [rect2.area], eax

	; Compare rect1.area and rect2.area
	mov		ebx, dword [rect1.area]
	cmp		eax, ebx
	jl		rect1_is_larger

	; Rectangle 2 is larger
	call	print_delimiter
	mov		eax, 1
	call	print_eax
	mov		eax, dword [rect2.area]
	call	print_eax
	jmp		exit_process

rect1_is_larger:
	call	print_delimiter
	mov		eax, 0
	call	print_eax
	mov		eax, dword [rect1.area]
	call	print_eax

exit_process:
    ; Exit the process:
	push	0
	call	[ExitProcess]


include 'training.inc'
