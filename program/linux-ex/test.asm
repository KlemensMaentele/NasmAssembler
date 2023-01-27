

;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;
prompt db "This is a test", 0


segment .bss
;
; uninitialized data is put in the bss segment
;

 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
        
        mov eax, 0 
        mov ebx, 10 
        sub eax, ebx
        call print_int
        jc end

        mov eax, prompt
        call print_string 


;
; code is put in the text segment. Do not modify the code before
; or after this comment.
;

end:
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


