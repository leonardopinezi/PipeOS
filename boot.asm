[BITS 16]
[org 0x7c00]

; 16BIT Bootloader RealMode

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti

    mov si, msg
    call print

    mov ax, 0x0000
    mov es, ax
    mov bx, 0x1000       ; offset 0x1000
    mov dh, 0
    mov dl, 0
    mov ch, 0
    mov cl, 2
    mov al, 2
    call disk_load

    jmp 0x0000:0x1000    ; pula para kernel carregado aqui

halt:
    jmp halt

msg: db "Loading PipeOS Kernel...", 0

%include "drivers/stdio.asm"
%include "disk.asm"

times 510-($-$$) db 0
dw 0xaa55
