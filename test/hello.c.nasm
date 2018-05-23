





default rel

global stringeq
global stringl
global stringg
global main


SECTION .text   

stringeq:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-20H], rsi
        mov     dword [rbp-0CH], 0
        mov     dword [rbp-8H], 0
        jmp     L_002

L_001:  add     dword [rbp-0CH], 1
L_002:  mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_004
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_001
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_001
        jmp     L_004

L_003:  add     dword [rbp-8H], 1
L_004:  mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_005
        mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_003
        mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_003
L_005:  mov     eax, dword [rbp-0CH]
        cmp     eax, dword [rbp-8H]
        jz      L_006
        mov     eax, 0
        jmp     L_010

L_006:  mov     dword [rbp-4H], 0
        mov     dword [rbp-4H], 0
        jmp     L_009

L_007:  mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   edx, byte [rax]
        mov     eax, dword [rbp-4H]
        movsxd  rcx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rcx
        movzx   eax, byte [rax]
        cmp     dl, al
        jz      L_008
        mov     eax, 0
        jmp     L_010

L_008:  add     dword [rbp-4H], 1
L_009:  mov     eax, dword [rbp-4H]
        cmp     eax, dword [rbp-0CH]
        jl      L_007
        mov     eax, 1
L_010:  pop     rbp
        ret


stringl:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-20H], rsi
        mov     dword [rbp-10H], 0
        mov     dword [rbp-0CH], 0
        jmp     L_012

L_011:  add     dword [rbp-10H], 1
L_012:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_014
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_011
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_011
        jmp     L_014

L_013:  add     dword [rbp-0CH], 1
L_014:  mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_015
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_013
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_013
L_015:  mov     eax, dword [rbp-0CH]
        cmp     dword [rbp-10H], eax
        cmovle  eax, dword [rbp-10H]
        mov     dword [rbp-4H], eax
        mov     dword [rbp-8H], 0
        mov     dword [rbp-8H], 0
        jmp     L_019

L_016:  mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   edx, byte [rax]
        mov     eax, dword [rbp-8H]
        movsxd  rcx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rcx
        movzx   eax, byte [rax]
        cmp     dl, al
        jge     L_017
        mov     eax, 1
        jmp     L_021

L_017:  mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   edx, byte [rax]
        mov     eax, dword [rbp-8H]
        movsxd  rcx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rcx
        movzx   eax, byte [rax]
        cmp     dl, al
        jle     L_018
        mov     eax, 0
        jmp     L_021

L_018:  add     dword [rbp-8H], 1
L_019:  mov     eax, dword [rbp-8H]
        cmp     eax, dword [rbp-4H]
        jl      L_016
        mov     eax, dword [rbp-10H]
        cmp     eax, dword [rbp-0CH]
        jl      L_020
        mov     eax, 0
        jmp     L_021

L_020:  mov     eax, 1
L_021:  pop     rbp
        ret


stringg:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-20H], rsi
        mov     dword [rbp-10H], 0
        mov     dword [rbp-0CH], 0
        jmp     L_023

L_022:  add     dword [rbp-10H], 1
L_023:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_025
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_022
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_022
        jmp     L_025

L_024:  add     dword [rbp-0CH], 1
L_025:  mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_026
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_024
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_024
L_026:  mov     eax, dword [rbp-0CH]
        cmp     dword [rbp-10H], eax
        cmovle  eax, dword [rbp-10H]
        mov     dword [rbp-4H], eax
        mov     dword [rbp-8H], 0
        mov     dword [rbp-8H], 0
        jmp     L_030

L_027:  mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   edx, byte [rax]
        mov     eax, dword [rbp-8H]
        movsxd  rcx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rcx
        movzx   eax, byte [rax]
        cmp     dl, al
        jle     L_028
        mov     eax, 1
        jmp     L_032

L_028:  mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   edx, byte [rax]
        mov     eax, dword [rbp-8H]
        movsxd  rcx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rcx
        movzx   eax, byte [rax]
        cmp     dl, al
        jge     L_029
        mov     eax, 0
        jmp     L_032

L_029:  add     dword [rbp-8H], 1
L_030:  mov     eax, dword [rbp-8H]
        cmp     eax, dword [rbp-4H]
        jl      L_027
        mov     eax, dword [rbp-10H]
        cmp     eax, dword [rbp-0CH]
        jg      L_031
        mov     eax, 0
        jmp     L_032

L_031:  mov     eax, 1
L_032:  pop     rbp
        ret


main:
        push    rbp
        mov     rbp, rsp
        mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


