[BITS 16]

printc:
	mov ah, 0x0e
	int 0x10
	ret

print:
	lodsb
	cmp al, 0
	je .end_print
	call printc
	jmp print
.end_print:
	mov al, 0x0D
	call printc
	mov al, 0x0A
	call printc
	ret

printl:
	lodsb
	cmp al, 0
	je .end_printl
	call printc
	jmp printl
.end_printl:
	ret