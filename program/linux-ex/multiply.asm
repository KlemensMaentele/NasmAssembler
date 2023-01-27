;
; file: skel.asm
; this file is a skeleton that can be used to start assembly programs.
%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;


segment .bss
;
; uninitialized data is put in the bss segment
;


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

;hole zwei integer und checke ob sie groesser als 0 sind, wenn ja speichere sie auf dem stack, wenn nicht quit
        mov ecx, 2
getint: 
        call read_int
        cmp eax, 0
        jng fehler
        push eax
        loop getint

        ; mult and print
        ; Das Ergebnis ist richtig jedoch habe ich am Ende immer ein Seg fault :(
        call multiply
        call print_int 
        call print_nl
        jmp ende
        
multiply:
        enter 4,0
        pusha
        ; nehme beide parameter, speichere einen in eax und den anderen in ecx
        mov ebx, 0
        mov eax, [ebp+8]
        mov ecx, [ebp+12]
        ; addiere ebx solange mit eax bis ecx 0 ist. Also eine schleife zb.: 3*5: ebx = 5+5+5
    alg: 
        add ebx, eax
        loop alg
        ; Speichere das Ergebnis als Lokale variable, stelle register wieder her und setze eax auf das Ergebnis der Rechnung
        mov [ebp-4], ebx
        popa
        mov eax, [ebp-4]
        leave
        ret


fehler: 
popa
mov eax, 1
leave
ret


ende:
        popa
        mov     eax, 0            ; return back to c
        leave                     
        ret
