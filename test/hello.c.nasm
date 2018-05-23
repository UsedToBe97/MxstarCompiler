





default rel

global stringsubstring
global main

extern __stack_chk_fail
extern puts
extern __isoc99_scanf
extern malloc


SECTION .text   

stringsubstring:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     dword [rbp-1CH], esi
        mov     dword [rbp-20H], edx
        mov     edi, 256
        call    malloc
        mov     qword [rbp-8H], rax
        mov     eax, dword [rbp-20H]
        sub     eax, dword [rbp-1CH]
        add     eax, 1
        mov     dword [rbp-0CH], eax
        mov     dword [rbp-10H], 0
        jmp     L_002

L_001:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     ecx, dword [rbp-10H]
        mov     eax, dword [rbp-1CH]
        add     eax, ecx
        movsxd  rcx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-10H], 1
L_002:  mov     eax, dword [rbp-10H]
        cmp     eax, dword [rbp-0CH]
        jl      L_001
        mov     eax, dword [rbp-0CH]
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
        add     rsp, -128


        mov     rax, qword [fs:abs 28H]
        mov     qword [rbp-8H], rax
        xor     eax, eax
        lea     rax, [rbp-80H]
        mov     rsi, rax
        mov     edi, L_004
        mov     eax, 0
        call    __isoc99_scanf
        lea     rax, [rbp-80H]
        mov     edx, 3
        mov     esi, 1
        mov     rdi, rax
        call    stringsubstring
        mov     rdi, rax
        call    puts
        mov     eax, 0
        mov     rcx, qword [rbp-8H]


        xor     rcx, qword [fs:abs 28H]
        jz      L_003
        call    __stack_chk_fail
L_003:  leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_004:
        db 25H, 73H, 00H


