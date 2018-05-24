stringle:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-20H], rsi
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

L_003:  add     dword [rbp-0CH], 1
L_004:  mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_005
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_003
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_003
L_005:  mov     eax, dword [rbp-0CH]
        cmp     dword [rbp-10H], eax
        cmovle  eax, dword [rbp-10H]
        mov     dword [rbp-4H], eax
        mov     dword [rbp-8H], 0
        mov     dword [rbp-8H], 0
        jmp     L_009

L_006:  mov     eax, dword [rbp-8H]
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
        jge     L_007
        mov     eax, 1
        jmp     L_011

L_007:  mov     eax, dword [rbp-8H]
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
        jle     L_008
        mov     eax, 0
        jmp     L_011

L_008:  add     dword [rbp-8H], 1
L_009:  mov     eax, dword [rbp-8H]
        cmp     eax, dword [rbp-4H]
        jl      L_006
        mov     eax, dword [rbp-10H]
        cmp     eax, dword [rbp-0CH]
        jle     L_010
        mov     eax, 0
        jmp     L_011

L_010:  mov     eax, 1
L_011:  pop     rbp
        ret


stringge:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-20H], rsi
        mov     dword [rbp-10H], 0
        mov     dword [rbp-0CH], 0
        jmp     L_013

L_012:  add     dword [rbp-10H], 1
L_013:  mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_015
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_012
        mov     eax, dword [rbp-10H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_012
        jmp     L_015

L_014:  add     dword [rbp-0CH], 1
L_015:  mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jz      L_016
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        js      L_014
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        jg      L_014
L_016:  mov     eax, dword [rbp-0CH]
        cmp     dword [rbp-10H], eax
        cmovle  eax, dword [rbp-10H]
        mov     dword [rbp-4H], eax
        mov     dword [rbp-8H], 0
        mov     dword [rbp-8H], 0
        jmp     L_020

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
        mov     eax, 1
        jmp     L_022

L_018:  mov     eax, dword [rbp-8H]
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
        jge     L_019
        mov     eax, 0
        jmp     L_022

L_019:  add     dword [rbp-8H], 1
L_020:  mov     eax, dword [rbp-8H]
        cmp     eax, dword [rbp-4H]
        jl      L_017
        mov     eax, dword [rbp-10H]
        cmp     eax, dword [rbp-0CH]
        jge     L_021
        mov     eax, 0
        jmp     L_022

L_021:  mov     eax, 1
L_022:  pop     rbp
        ret
