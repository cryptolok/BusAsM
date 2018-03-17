# as --32 signal.s -o signal.o
# ld -m elf_i386 signal.o -o signal

jmp . + 2
jmp . - 2
# because, we need to force memory change, so we will modify EIP by simply jumping all over again, without conditions to make it more fast, which will increase the signal even more
