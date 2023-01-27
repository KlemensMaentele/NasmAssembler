%include "asm_io.inc"

segment .data

segment .bss

segment .text
	global asm_main

; Nehmen Sie hier keine Änderungen vor!

asm_main:
	; Einstiegsroutine fuer die main-Funktion
	enter 0,0
	pusha

	call	read_int
	push eax

	call fak_rekursiv
	add esp, 4

	call print_int
	call print_nl
	
	; Beendigung der main-Funktion und Rueckkehr zu C
	popa
	mov eax, 0
	leave
	ret

; Ergänzen Sie hier die Funktion fak_rekursiv.
; Nehmen Sie an, dass das Ergebnis in 32-Bit passt.
; Nehmen Sie weiterhin an, dass nur Zahlen >= 0 eingegeben werden.
; Es gilt 0! = 1.

fak_rekursiv:
	enter 4,0
	pusha
	; Get argument and return 1 if == 0
	mov ebx, [ebp+8]
	cmp ebx, 0
	jz zero

	; Get fak for argument-1 and mult it with argument and return this
	sub ebx, 1
	push ebx
	call fak_rekursiv
	add ebx, 1
	mul ebx
	mov [ebp-4], eax

	add esp, 4

	popa
	mov eax, [ebp-4]
	leave 
	ret

zero:
	popa
	mov eax, 1
	leave
	ret
