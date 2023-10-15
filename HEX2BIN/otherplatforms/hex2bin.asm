; Hex to Binary Converter for DOS using NASM
org 100h

section .bss
    hex_buffer resb 8
    bin_buffer resb 4

section .text
    mov ah, 0Ah
    mov dx, hex_buffer
    int 21h

    mov si, hex_buffer
    mov di, bin_buffer
    xor cx, cx

convert_loop:
    mov al, [si]
    inc si

    cmp al, 0
    je done

    sub al, '0'
    cmp al, 9
    jbe convert_digit
    sub al, 7
convert_digit:
    shl al, 4
    mov ah, [si]
    sub ah, '0'
    cmp ah, 9
    jbe convert_digit2
    sub ah, 7
convert_digit2:
    or al, ah

    mov [di], al
    inc di
    inc cx
    cmp cx, 4
    jnz convert_loop

done:
    mov ah, 9
    mov dx, bin_buffer
    int 21h

    mov ah, 4Ch
    int 21h
