[BITS 16]

; Commands parser
cmd:
    pusha
    call split_cmd
    mov bx, 0
.next:
    mov si, cmd_name
    mov di, [commands + bx]
    call strcmp
    jc .try_next

    call word [handlers + bx]
    popa
    ret
.try_next:
    add bx, 2
    cmp bx, cmd_end - commands
    jl .next

    mov si, not_found_msg
    call print
    popa
    ret

%include "os/string.asm"

help_msg: db "help - cls - exit - echo <message>", 0
not_found_msg: db "Command not found.", 0
exit_msg: db "Good bye, have a good time.", 0

cmd_name: times 32  db 0
cmd_args: times 96  db 0

commands:
    dw help_str
    dw cls_str
    dw exit_str
    dw echo_str
cmd_end:

handlers:
    dw help_handler
    dw clear_handler
    dw exit_handler
    dw echo_handler

help_handler:
    mov si, help_msg
    call print
    ret

clear_handler:
    call clear
    ret

echo_handler:
    mov si, cmd_args
    call print
    ret

exit_handler:
    mov si, exit_msg
    call print
    cli
    hlt


help_str: db "help", 0
cls_str: db "cls", 0
exit_str: db "exit", 0
echo_str: db "echo", 0

split_cmd:
    pusha

    mov cx, 32
    mov di, cmd_name
    xor al, al
    rep stosb

    mov cx, 96
    mov si, cmd_buffer
    xor al, al
    rep stosb

    mov si, cmd_buffer
    mov di, cmd_name
.copy_name:
    lodsb
    cmp al, 0
    je .done
    cmp al, ' '
    je .copy_args
    stosb
    jmp .copy_name
.copy_args:
    mov byte [di], 0
    mov di, cmd_args
.copy_args_loop:
    lodsb
    stosb
    cmp al, 0
    jne .copy_args_loop
.done:
    popa
    ret