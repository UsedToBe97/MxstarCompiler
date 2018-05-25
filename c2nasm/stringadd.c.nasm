





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
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-20H], rsi
        mov     edi, 256
        call    malloc
        mov     qword [rbp-8H], rax
        mov     dword [rbp-10H], 0
        mov     dword [rbp-0CH], 0
        jmp     L_002

L_001:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-10H]
        movsxd  rcx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-10H], 1
L_002:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jnz     L_001
        jmp     L_004

L_003:  mov     edx, dword [rbp-0CH]
        mov     eax, dword [rbp-10H]
        add     eax, edx
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-0CH]
        movsxd  rcx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-0CH], 1
L_004:  mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jnz     L_003
        mov     edx, dword [rbp-10H]
        mov     eax, dword [rbp-0CH]
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
        mov     edi, L_006
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
        jz      L_005
        call    __stack_chk_fail
L_005:  leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_006:
        db 25H, 73H, 25H, 73H, 00H


