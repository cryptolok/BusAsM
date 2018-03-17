.386
.model flat, stdcall
.code
start:
    jmp $+2
    jmp $-2
end start
; because, we need to force memory change, so we will modify EIP by simply jumping all over again, without conditions to make it more fast, which will increase the signal even more
