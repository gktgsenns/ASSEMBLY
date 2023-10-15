section .bss
    buffer resb 32  

section .data
    hex_value db "1A3F", 0  

section .text
global _start

_start:
   
    mov esi, hex_value
    xor ecx, ecx  

convert_loop:
    
    mov al, byte [esi]
    cmp al, 0
    je done

 
    call hex_to_bin


    shl byte [buffer], 1  
    or byte [buffer], al  

    inc esi 
    inc ecx 
    jmp convert_loop

done:
   
    mov edx, ecx 
    mov ebx, 1    
    mov eax, 4   
    mov ecx, buffer
    int 0x80 

 
    mov eax, 1   
    int 0x80

hex_to_bin:
   
    cmp al, '0'
    jge no_sub
    ret
no_sub:
    sub al, '0'
    ret
