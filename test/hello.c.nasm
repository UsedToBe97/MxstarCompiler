





default rel

global stringadd
global main

extern __stack_chk_fail
extern puts
extern __isoc99_scanf
extern malloc


SECTION .text   

stringadd:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     edi, 256
        call    malloc
        mov     qword [rbp-8H], rax
        mov     dword [rbp-14H], 0
        mov     dword [rbp-10H], 0
        jmp     L_002

L_001:  add     dword [rbp-14H], 1
L_002:  mov     eax, dword [rbp-14H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jnz     L_001
        jmp     L_004

L_003:  add     dword [rbp-10H], 1
L_004:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-30H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jnz     L_003
        mov     dword [rbp-0CH], 0
        jmp     L_006

L_005:  mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-0CH]
        movsxd  rcx, eax
        mov     rax, qword [rbp-28H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-0CH], 1
L_006:  mov     eax, dword [rbp-0CH]
        cmp     eax, dword [rbp-14H]
        jl      L_005
        mov     eax, dword [rbp-14H]
        mov     dword [rbp-0CH], eax
        jmp     L_008

L_007:  mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-0CH]
        sub     eax, dword [rbp-14H]
        movsxd  rcx, eax
        mov     rax, qword [rbp-30H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-0CH], 1
L_008:  mov     edx, dword [rbp-14H]
        mov     eax, dword [rbp-10H]
        add     eax, edx
        cmp     eax, dword [rbp-0CH]
        jg      L_007
        mov     edx, dword [rbp-14H]
        mov     eax, dword [rbp-10H]
        add     eax, edx
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-8H]
        leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 240


        mov     rax, qword [fs:abs 28H]
        mov     qword [rbp-8H], rax
        xor     eax, eax
        lea     rdx, [rbp-80H]
        lea     rax, [rbp-0F0H]
        mov     rsi, rax
        mov     edi, L_010
        mov     eax, 0
        call    __isoc99_scanf
        lea     rdx, [rbp-80H]
        lea     rax, [rbp-0F0H]
        mov     rsi, rdx
        mov     rdi, rax
        call    stringadd
        mov     rdi, rax
        call    puts
        mov     eax, 0
        mov     rcx, qword [rbp-8H]


        xor     rcx, qword [fs:abs 28H]
        jz      L_009
        call    __stack_chk_fail
L_009:  leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_010:
        db 25H, 73H, 25H, 73H, 00H


