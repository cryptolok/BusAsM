# arm-linux-gnueabi-as -o signalARM.o signalARM.s
# arm-linux-gnueabi-ld -o signalARM signalARM.o

b .text

# because, we need to force memory change, so we will modify PC by simply branching all over again, without conditions to make it more fast, which will increase the signal even more
