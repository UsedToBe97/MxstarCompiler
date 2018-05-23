global main

extern puts
extern __stack_chk_fail
extern malloc
section .data
section .text
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	rax, 1
	mov	qword [rbp - 8], rax
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 8], rdx
	mov	rdx, qword [rbp - 8]
	imul	rdx, 8
	mov	qword [rbp - 8], rdx
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 16], rax
	mov	rbx, qword [rbp - 16]
	mov	rax, 1
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 16]
	add	rdx, 8
	mov	qword [rbp - 16], rdx
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 24], rax
	mov	rax, 0
	mov	qword [rbp - 32], rax
	mov	rbx, qword [rbp - 32]
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, 10
	mov	qword [rbx], rax
	mov	rax, 0
	mov	qword [rbp - 48], rax
	mov	rbx, qword [rbp - 48]
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rdx, qword [rbx]
	add	rdx, 20
	mov	qword [rbp - 40], rdx
	mov	rax, qword [rbp - 40]
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
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
	mov     dword [rbp-420H], 0
	jmp     L_002
L_001:  mov     ecx, dword [rbp-434H]
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
	mov     eax, ecx
	mov     dword [rbp-41CH], eax
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
	mov     eax, dword [rbp-424H]
	lea     edx, [rax+1H]
	mov     dword [rbp-424H], edx
	        cdqe
	mov     edx, dword [rbp-41CH]
	mov     dword [rbp+rax*4-410H], edx
L_002:  cmp     dword [rbp-434H], 0
	jnz     L_001
	mov     dword [rbp-420H], 0
	jmp     L_004
L_003:  mov     eax, dword [rbp-420H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-418H]
	add     rdx, rax
	mov     eax, dword [rbp-424H]
	sub     eax, 1
	sub     eax, dword [rbp-420H]
	cdqe
	mov     eax, dword [rbp+rax*4-410H]
	add     eax, 48
	mov     byte [rdx], al
	add     dword [rbp-420H], 1
L_004:  mov     eax, dword [rbp-420H]
	cmp     eax, dword [rbp-424H]
	jl      L_003
	mov     eax, dword [rbp-424H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-418H]
	add     rax, rdx
	mov     byte [rax], 0
	mov     rax, qword [rbp-418H]
	mov     rsi, qword [rbp-8H]
	xor     rsi, qword [fs:abs 28H]
	jz      L_005
	call    __stack_chk_fail
L_005:  leave
	ret

println:
	call puts
	ret

