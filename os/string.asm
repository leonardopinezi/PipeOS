[BITS 16]

strcmp:
.next:
    lodsb
    scasb
    jne .fail
    cmp al, 0
    jne .next
    clc
    ret
.fail:
    stc
    ret