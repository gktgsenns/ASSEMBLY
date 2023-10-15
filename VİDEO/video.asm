org 100h

section .data
section .text
    mov ax, 13h
    int 10h

    mov ah, 0Ch
    mov al, 1

    mov cx, 100
    mov dx, 100

draw_square:
    int 10h

    inc cx
    cmp cx, 200
    jnz draw_square

    mov cx, 100
    inc dx
    cmp dx, 150
    jnz draw_square

    MOV AH , 4Ch
    int 21h
