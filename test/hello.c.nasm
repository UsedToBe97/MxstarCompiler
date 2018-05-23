





default rel

global toString
global main

extern puts
extern __isoc99_scanf
extern __stack_chk_fail
extern malloc


SECTION .text   

toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 1088
        mov     dword [rbp-434H], edi


        mov     rax, qword [fs:abs 28H]
        mov     qword [rbp-8H], rax
        xor     eax, eax
        mov     edi, 256
        call    malloc
        mov     qword [rbp-418H], rax
        mov     dword [rbp-424H], 0
        cmp     dword [rbp-434H], 0
        jnz     L_001
        mov     rax, qword [rbp-418H]
        mov     byte [rax], 48
        mov     rax, qword [rbp-418H]
        add     rax, 1
        mov     byte [rax], 0
        mov     rax, qword [rbp-418H]
        jmp     L_007

L_001:  cmp     dword [rbp-434H], 0
        jns     L_002
        mov     rax, qword [rbp-418H]
        mov     byte [rax], 45
        neg     dword [rbp-434H]
        mov     dword [rbp-424H], 1
L_002:  mov     dword [rbp-420H], 0
        jmp     L_004

L_003:  mov     esi, dword [rbp-420H]
        lea     eax, [rsi+1H]
        mov     dword [rbp-420H], eax
        mov     ecx, dword [rbp-434H]
        mov     edx, 1717986919
        mov     eax, ecx
        imul    edx
        sar     edx, 2
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        shl     eax, 2
        add     eax, edx
        add     eax, eax
        sub     ecx, eax
        mov     edx, ecx
        movsxd  rax, esi
        mov     dword [rbp+rax*4-410H], edx
        mov     ecx, dword [rbp-434H]
        mov     edx, 1717986919
        mov     eax, ecx
        imul    edx
        sar     edx, 2
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        mov     dword [rbp-434H], eax
L_004:  cmp     dword [rbp-434H], 0
        jnz     L_003
        mov     dword [rbp-41CH], 0
        jmp     L_006

L_005:  mov     edx, dword [rbp-424H]
        mov     eax, dword [rbp-41CH]
        add     eax, edx
        movsxd  rdx, eax
        mov     rax, qword [rbp-418H]
        add     rdx, rax
        mov     eax, dword [rbp-420H]
        sub     eax, 1
        sub     eax, dword [rbp-41CH]
        cdqe
        mov     eax, dword [rbp+rax*4-410H]
        add     eax, 48
        mov     byte [rdx], al
        add     dword [rbp-41CH], 1
L_006:  mov     eax, dword [rbp-41CH]
        cmp     eax, dword [rbp-420H]
        jl      L_005
        mov     edx, dword [rbp-424H]
        mov     eax, dword [rbp-420H]
        add     eax, edx
        movsxd  rdx, eax
        mov     rax, qword [rbp-418H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-418H]
L_007:  mov     rdi, qword [rbp-8H]


        xor     rdi, qword [fs:abs 28H]
        jz      L_008
        call    __stack_chk_fail
L_008:  leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16


        mov     rax, qword [fs:abs 28H]
        mov     qword [rbp-8H], rax
        xor     eax, eax
        lea     rax, [rbp-0CH]
        mov     rsi, rax
        mov     edi, L_010
        mov     eax, 0
        call    __isoc99_scanf
        mov     eax, dword [rbp-0CH]
        mov     edi, eax
        call    toString
        mov     rdi, rax
        call    puts
        mov     eax, 0
        mov     rdx, qword [rbp-8H]


        xor     rdx, qword [fs:abs 28H]
        jz      L_009
        call    __stack_chk_fail
L_009:  leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_010:
        db 25H, 64H, 00H


