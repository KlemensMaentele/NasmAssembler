%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;

segment .bss
;
; uninitialized data is put in the bss segment
;
capacity      resW 1
linelength    resW 1
address       resW 1
linelog       resW 1
bytelog       resW 1


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        ; Nehme alle eingaben entgegen und speichere sie
        call read_int
        mov [address], eax

        call read_int
        mov [capacity], eax

        call read_int
        mov [linelength], eax

        ;Berechne Anzahl der Zeilen und lege den Wert auf den Stack
        mov eax, [capacity]
        mov edx, 0
        mov ebx, [linelength]
        div ebx
        push eax
        ;Bekomme duch den Logarithm die bitlaenge der Zeile in der Adresse.
        call get_exponent
        mov [linelog], eax
        ;Bekomme Logrithm fuer Zeilenlaenge und somit die bitlaenge der Bytes in der Adresse.
        pop eax
        push ebx
        call get_exponent
        mov [bytelog], eax

        ;addiere bytelog und linelog, subtrahiere das mit 32 und man erhaelt die laenge des Tags. Shifte den Tag weg und shifte die Bytes weg und es bleibt die line
        mov eax, [address]
        mov bl, 0
        add bl, [bytelog]
        add bl, [linelog]
        mov cl, 32
        sub cl, bl ; calculate tag size
        shl eax, cl

        ;Shifte so weit nach rechts das auch die Bits fuer Byte-addressierung weg sind und ganz rechts nur noch die line bits stehen
        add cl, [bytelog]
        shr eax, cl

        ;print and quit
        ;Das Ergebnis ist richtig jedoch habe ich immer am Ende einen Seg fault
        call print_int
        call print_nl

        jmp end



get_exponent:
        enter 4,0
        pusha

        ; Nehme das Argument und speichere es in eax. Schiebe dieses solange nach Rechts bis der Wert null ist. Somit erhaelt man die laenge der benoetigten Bits
        ; Wenn die eingabe 1 ist return 1
        mov eax, [ebp+8]
        mov ebx, 0
        mov ecx, 100
        cmp eax, 1
        jz one

; Schiebe die Bits so lange nach rechts und zahle dabei wie viele verschiebungen noetig sind.
divide: 
        shr eax, 1
        add ebx, 1
        cmp eax, 1
        jz other
        loop divide

one:    mov eax, 1
        mov [ebp-4], eax
        jmp lend

;speichere das Ergebnis in ebp-4, stelle alle register wieder her und lade das Ergebnis in eax.
other:  mov [ebp-4], ebx

lend:    popa
    mov eax, [ebp-4]
    leave 
    ret

;
; code is put in the text segment. Do not modify the code before
; or after this comment.
;
end:
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
