[BITS 16]
[ORG 0x8000]

start:
    mov ah, 0x0E
    mov al, 'A'
    int 0x10
    cli
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp 0x08:protected_mode_start_32

[BITS 32]
protected_mode_start_32:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0x90000

    mov esi, msg2
    mov edi, 0xB8000
    call print_string_32

hang:
    jmp hang

print_string_32:
.next_char:
    lodsb
    cmp al, 0
    je .done

    mov ah, 0x0F
    mov [edi], ax
    add edi, 2
    jmp .next_char
.done:
    ret

msg2 db "Protected Mode Enabled.",0
