#!/bin/bash
clear
nasm -f bin boot.asm -o boot.bin
nasm -f bin kernel.asm -o kernel.bin
cat boot.bin kernel.bin > PipeOS.img
dd if=/dev/zero of=PipeOS.img bs=512 count=2880
dd if=boot.bin of=PipeOS.img conv=notrunc
dd if=kernel.bin of=PipeOS.img bs=512 seek=1 conv=notrunc

qemu-system-i386 -fda PipeOS.img