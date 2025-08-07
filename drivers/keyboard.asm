[BITS 16]

getkey:
    xor ah, ah
    int 0x16
    ret