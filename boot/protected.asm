[BITS 16]
[ORG 0x8000]

start:
    cli
    mov eax, cr0
    or eax, 1
    mov cr0, eax

[BITS 32]
    jmp CODE32:protected_mode_start

protected_mode_start:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 3
    mov dh, 0
    mov dl, 0x00
    mov bx, 0x10000
    int 0x13
    jmp 0x10000