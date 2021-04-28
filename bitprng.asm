.686
.model flat

.data

base	equ	1397861645
x		dd	1397861645

.code

_rnd PROC
	push	ebp
	mov		ebp, esp
	sub		esp, 4
	
	finit
	xor		edx, edx
	mov		ecx, 5
	mov		eax, x

	call	xor_shift
	
	mov		x, eax

	and		eax, 007FFFFFh
	or		eax, 3F800000h
	mov		[esp], eax
	fld		dword ptr [esp]
	fld1
	fsub

	add		esp, 4
	pop		ebp
	ret
_rnd ENDP

_seed PROC
	push	ebp
	mov		ebp, esp

	mov		eax, [ebp + 8]
	mov		ecx, 25
	call	xor_shift
	mov		x, eax
	
	mov		eax, [ebp + 8]

	pop		ebp
	ret
_seed ENDP

xor_shift PROC
shft:
	bt		eax, 7
	setc	dl
	bt		eax, 14
	setc	dh
	xor		dl, dh
	shr		dl, 1
	rcl		eax, 1
	
	loop	shft
	
	ret
xor_shift ENDP

END