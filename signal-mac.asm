; nasm -f macho signal-mac.asm && ld -macosx_version_min 10.7.0 -o signal-mac signal-mac.o

global start

section .text
start:
    jmp $+2
    jmp $-2