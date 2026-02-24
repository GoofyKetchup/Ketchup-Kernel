[BITS 16]
[ORG 0x7C00]

start:
    mov si, msg1
    call print_string
    call load_gdt
    mov si, gdt_ld
    call print_string
    call load_next_boot

print_string:
.next_char:
    lodsb
    cmp al, 0
    je .done

    mov ah, 0x0E
    int 0x10
    jmp .next_char
.done:
    ret

load_gdt:
    lgdt [gdt_descriptor]
    ret

load_next_boot:
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x00
    mov bx, 0x8000
    int 0x13
    jmp 0x8000

gdt_start:
    dq 0
    dq 0x00CF9A000000FFFF
    dq 0x00CF92000000FFFF

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

msg1 db "Loading Global Descriptor Table...",0

gdt_ld db "Global Descriptor Table loaded Succefuly.",0

times 510-($-$$) db 0
dw 0x55AA