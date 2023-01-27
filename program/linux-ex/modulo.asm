%include "asm_io.inc"

segment .data
; In diesem Segment nichts aendern!
input_prompt_a db    "Bitte geben Sie a ein ", 0
input_prompt_b db    "Bitte geben Sie b ein ", 0
output_prompt db   "a Modulo b ist ", 0

segment .bss

segment .text
	global  asm_main

asm_main:
	; Einstiegsroutine fuer die main-Funktion
	enter   0,0
	pusha

	; lese a (in eax) und b (in ebx) hier nichts aendern!
	mov     eax, input_prompt_b   
	call    print_string
	call    read_int
	mov     ebx, eax
	mov     eax, input_prompt_a   
	call    print_string
	call    read_int
	; Ende nichts aendern

	; Parameter pushen und Funktion aufrufen
	; TODO
	push ebx
	push eax
	call Modulo
	call print_int
	call print_nl

	; Ergebnis ausgeben Vorab bitte output_prompt ausgeben.
	; TODO
	mov ebx, eax
	mov eax, output_prompt
	call print_string
	mov eax, ebx
	call print_string
	

	; Beendigung der main Funktion und Rueckkehr zu C
	popa
	mov     eax, 0
	leave
	ret

; Modulo Funktion gibt a modulo b zurueck (a, b > 0; keine Ueberpruefung notwendig)
; TODO

Modulo:
		enter 4,0
		pusha

		mov edx, 0
		mov eax, [ebp+8]
		mov ebx, [ebp+12]
		div ebx
		mov [ebp+4], edx


		popa
		mov eax, [ebp+4]
		leave
		ret