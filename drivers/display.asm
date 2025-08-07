[BITS 16]

clear:
    mov ah, 0x06
    mov al, 0
    mov bh, 0x07
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10
    mov ah, 0x02
    mov bh, 0x00
    mov dx, 0x0000
    int 0x10
    ret

breakline:
	mov al, 0x0D
	call printc
	mov al, 0x0A
	call printc
    ret