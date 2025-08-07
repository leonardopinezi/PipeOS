[BITS 16]
[org 0x1000]

start:
	call clear                ; Limpa a tela
	mov si, msg
	call print                ; Mostra mensagem de boas-vindas

	mov si, prompt
	call printl               ; Mostra o prompt inicial ">"

	mov di, cmd_buffer        ; DI aponta para onde o input será armazenado

	jmp input

input:
	call getkey               ; Lê tecla
	call printc               ; Mostra caractere digitado

	cmp al, 0x0D              ; Enter pressionado?
	je .cmd

	cmp al, 0x08              ; Enter pressionado?
	je .back

	stosb                     ; Salva caractere no buffer
	jmp input

.cmd:
	mov al, 0
	stosb                     ; Finaliza string com null

	call breakline
	mov si, cmd_buffer
	call cmd                  ; Processa comando digitado

	mov di, cmd_buffer
	mov si, prompt
	call printl               ; Mostra o prompt novamente
	jmp input
.back:
	cmp di, cmd_buffer
	je .skip_bs
	dec di
	mov ah, 0x0E
	mov al, ' '
	int 0x10
	mov al, 0x08
	int 0x10
.skip_bs:
	jmp input

msg: db "Welcome to PipeOS 1.0", 0
prompt: db ">", 0

%include "drivers/stdio.asm"
%include "drivers/keyboard.asm"
%include "drivers/display.asm"
%include "os/cmd.asm"

cmd_buffer: times 128 db 0     ; Buffer para armazenar input do usuário