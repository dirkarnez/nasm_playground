%include "io.inc"

extern _system

section .data
        pauseStr: db 'pause', 0xA, 0

section .text
    global CMAIN ; global _main
CMAIN:
        mov     eax, 90     ; move our first number into eax
        mov     ebx, 9      ; move our second number into ebx
        sub     eax, ebx    ; subtract ebx from eax
        PRINT_DEC 4, eax
        NEWLINE

        sub     esp, 4          ; Allocate space on the stack for one 4 byte parameter
        lea     eax, [pauseStr]
        mov     [esp], eax      ; Arg1: pointer to format string
        call     _system        ; Call printf(3):
                                ;       int printf(const char *format, ...);
        add     esp, 4          ; Pop stack once
        xor eax, eax
        ret
