;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

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
        
        mov ecx, 5
getInt: call read_int
        push dword eax

        loop getInt

        mov ecx, 5
printInt:   pop eax
            call print_int
            call print_nl
        
        loop printInt


; code is put in the text segment. Do not modify the code before
; or after this comment.
;

end:
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret



