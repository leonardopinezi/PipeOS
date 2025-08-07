disk_load:
	push ax
	push cx
	push dx

	mov ah, 0x02
	int 0x13
	jc disk_error

	pop dx
	pop cx
	pop ax
	ret

disk_error:
	mov si, disk_fail_msg
	call print
	jmp $

disk_fail_msg: db "Error to load kernel.", 0
