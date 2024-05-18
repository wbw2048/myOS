BITS 16
ORG 0x7c00

start:
    cli
    cld
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    mov bp, 0x9000
    mov si, msg
    call print

    jmp $

print:
    mov ah, 0x0e
.print_next:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .print_next
.done:
    ret

msg db "Booting MyOS...", 0

TIMES 510-($-$$) db 0
DW 0xaa55
