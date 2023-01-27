%include "asm_io.inc"

segment .data

segment .bss

segment .text
	global asm_main

asm_main:
	; Einstiegsroutine fuer die main-Funktion
	enter 0,0
	; Beispiel vorgeben
	pusha
	; Beispiel vorgeben
	
	push 4
	; 0 (Vorgabe)

	call fak_iterative
	; E
	add esp, 4
	; F
	call print_int
	call print_nl
	
	; Beendigung der main-Funktion und Rueckkehr zu C
	popa
	mov eax, 0
	leave
	ret

; berechnet 1*2*...*parameter iterativ
; Wir nehmen an, dass das Ergebnis in 32 passt, ohne dies zu ueberpruefen
fak_iterative:
	; A 
	; Speicher für eine lokale Variable (Ergebnis) reservieren.
	enter 4, 0
	; Register sichern
	pusha
	; B
	; Ergebnis mit 1 initialisieren 
	mov	eax, 1
	; Parameter nach ecx kopieren
	mov ecx, [ebp+8]


calc_loop:
	; eax:edx = eax * ecx - wir gehen hier davon aus, dass das Ergebnis in
	; 32 Bit passt und verwenden daher im weiteren nur eax.
	mul	ecx
	loop calc_loop
	mov	[ebp-4], eax
	
	; C
	; restore registers for caller
	popa
	; copy result to eax
	mov eax, [ebp-4]
	leave
	; D
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stackzustand zum Zeitpunkt 0 (Vorgabe)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; EBP = FFAE3C68 ESP = FFAE3C44
;       FFAE3C68  ?             ; alter EBP
;       FFAE3C64  ?             ; 
;          .
;          .                        gesicherte Register
;          .   
;      FFAE3C48  ?             ;
;      FFAE3C44  00000004      ; Parameter für Funktion

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stackzustand zum Zeitpunkt A 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Loesung hier einfuegen

; EBP = FFAE3C68 ESP = FFAE3C44
;       FFAE3C68  ?             ; alter EBP
;       FFAE3C64  ?             ; 
;          .
;          .                        gesicherte Register
;          .   
;      FFAE3C48  ?             ;
;      FFAE3C44  00000004      ; Parameter für Funktion


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stackzustand zum Zeitpunkt B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Loesung hier einfuegen

; EBP = FFAE3C3C ESP = FFAE3C18
;       FFAE3C68  ?             ; alter EBP
;       FFAE3C64  ?             ; 
;          .
;          .                        gesicherte Register
;          .   
;      FFAE3C48  ?             ;
;      FFAE3C44  00000004      ; Parameter für Funktion
;      FFAE3C40  ?             ; Ruecksprung zu Main
;      FFAE3C3C  FFAE3C68      ; alter EBP
;      FFAE3C38  ?             ; reserved locale variable space
;      FFAE3C34  ?             ; 
;			.
;			.						gesicherte Register
;			.
;      FFAE3C18  ?             ; 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stackzustand zum Zeitpunkt C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Loesung hier einfuegen

; EBP = FFAE3C3C ESP = FFAE3C18
;       FFAE3C68  ?             ; alter EBP
;       FFAE3C64  ?             ; 
;          .
;          .                        gesicherte Register
;          .   
;      FFAE3C48  ?             ;
;      FFAE3C44  00000004      ; Parameter für Funktion
;      FFAE3C40  ?             ; Ruecksprung zu Main
;      FFAE3C3C  FFAE3C68      ; alter EBP
;      FFAE3C38  24            ; reserved locale variable space
;      FFAE3C34  ?             ; 
;			.
;			.						gesicherte Register
;			.
;      FFAE3C18  ?             ; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stackzustand zum Zeitpunkt D
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Loesung hier einfuegen

; EBP = FFAE3C68 ESP = FFAE3C40
;       FFAE3C68  ?             ; alter EBP
;       FFAE3C64  ?             ; 
;          .
;          .                        gesicherte Register
;          .   
;      FFAE3C48  ?             ;
;      FFAE3C44  00000004      ; Parameter für Funktion
;      FFAE3C40  ?             ; Ruecksprung zu Main

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stackzustand zum Zeitpunkt E
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Loesung hier einfuegen

; EBP = FFAE3C68 ESP = FFAE3C44
;       FFAE3C68  ?             ; alter EBP
;       FFAE3C64  ?             ; 
;          .
;          .                        gesicherte Register
;          .   
;      FFAE3C48  ?             ;
;      FFAE3C44  00000004      ; Parameter für Funktion

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stackzustand zum Zeitpunkt F
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Loesung hier einfuegen

; EBP = FFAE3C68 ESP = FFAE3C48
;       FFAE3C68  ?             ; alter EBP
;       FFAE3C64  ?             ; 
;          .
;          .                        gesicherte Register
;          .   
;      FFAE3C48  ?             ;
