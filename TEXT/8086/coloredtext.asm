org 100h

section .data
val db '!',0

section .text
    mov ax, 03h
    int 10h

    mov ah, 09h
    mov dx, [val]
    mov cx, 13
    mov bh, 0
    mov bl, 1
    int 10h

    mov ah, 4Ch
    int 21h
