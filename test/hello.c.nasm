





default rel

global print
global main

extern __stack_chk_fail
extern __isoc99_scanf
extern putchar


SECTION .text   

print:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     dword [rbp-8H], 0
        jmp     L_002

L_001:  add     dword [rbp-8H], 1
L_002:  mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jnz     L_001
        mov     dword [rbp-4H], 0
        jmp     L_010

L_003:  mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 92
        jne     L_008
        mov     eax, dword [rbp-4H]
        add     eax, 1
        cmp     eax, dword [rbp-8H]
        jge     L_008
        mov     eax, dword [rbp-4H]
        cdqe
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 110
        jnz     L_004
        mov     edi, 10
        call    putchar
        add     dword [rbp-4H], 1
        jmp     L_009

L_004:  mov     eax, dword [rbp-4H]
        cdqe
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 116
        jnz     L_005
        mov     edi, 9
        call    putchar
        add     dword [rbp-4H], 1
        jmp     L_009

L_005:  mov     eax, dword [rbp-4H]
        cdqe
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 92
        jnz     L_006
        mov     edi, 92
        call    putchar
        add     dword [rbp-4H], 1
        jmp     L_009

L_006:  mov     eax, dword [rbp-4H]
        cdqe
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 34
        jnz     L_007
        mov     edi, 34
        call    putchar
        add     dword [rbp-4H], 1
        jmp     L_009

L_007:  mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     edi, eax
        call    putchar
        jmp     L_009

L_008:  mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     edi, eax
        call    putchar
L_009:  add     dword [rbp-4H], 1
L_010:  mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        test    al, al
        jne     L_003
        nop
        leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32


        mov     rax, qword [fs:abs 28H]
        mov     qword [rbp-8H], rax
        xor     eax, eax
        lea     rax, [rbp-20H]
        mov     rsi, rax
        mov     edi, L_012
        mov     eax, 0
        call    __isoc99_scanf
        lea     rax, [rbp-20H]
        mov     rdi, rax
        call    print
        mov     eax, 0
        mov     rdx, qword [rbp-8H]


        xor     rdx, qword [fs:abs 28H]
        jz      L_011
        call    __stack_chk_fail
L_011:  leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_012:
        db 25H, 73H, 00H


