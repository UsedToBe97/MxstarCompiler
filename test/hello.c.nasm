





default rel

global parseInt
global main

extern __stack_chk_fail
extern printf
extern __isoc99_scanf
extern malloc


SECTION .text   

parseInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     edi, 256
        call    malloc
        mov     qword [rbp-8H], rax
        mov     dword [rbp-10H], 0
        mov     dword [rbp-0CH], 0
        jmp     L_002

L_001:  add     dword [rbp-10H], 1
L_002:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_004
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_001
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_001
        jmp     L_004

L_003:  mov     edx, dword [rbp-0CH]
        mov     eax, edx
        shl     eax, 2
        add     eax, edx
        add     eax, eax
        mov     ecx, eax
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movsx   eax, al
        add     eax, ecx
        sub     eax, 48
        mov     dword [rbp-0CH], eax
        add     dword [rbp-10H], 1
L_004:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 47
        jle     L_005
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jle     L_003
L_005:  mov     eax, dword [rbp-0CH]
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
        mov     edi, L_007
        mov     eax, 0
        call    __isoc99_scanf
        lea     rax, [rbp-80H]
        mov     rdi, rax
        call    parseInt
        mov     esi, eax
        mov     edi, L_008
        mov     eax, 0
        call    printf
        mov     eax, 0
        mov     rdx, qword [rbp-8H]


        xor     rdx, qword [fs:abs 28H]
        jz      L_006
        call    __stack_chk_fail
L_006:  leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_007:
        db 25H, 73H, 00H

L_008:
        db 25H, 64H, 0AH, 00H


