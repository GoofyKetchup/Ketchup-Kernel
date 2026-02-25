[BITS 16]
[ORG 0x8000]

start:
    cli
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    call CODE32:protected_mode_start
    mov si, msg2
    call print_string


protected_mode_start:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    ret
[BITS 32]
print_string:
    lodsb
.next_char:
    cmp al, 0
    je .done

    mov ah, 0x0E
    int 0x0E
    jmp .next_char
.done:
    mov ah, 0x0E
    mov al, 0x0D
    int 0x10
    mov al, 0x0A
    int 0x10
    ret

msg2 db "Protected Mode Enabled.",0
