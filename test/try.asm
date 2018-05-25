global main

extern puts
extern getchar
extern putchar
extern __stack_chk_fail
extern malloc
extern printf
extern gets
extern scanf
extern __isoc99_scanf
section .data
MAXN__:
	dq	0
MAXM__:
	dq	0
intbuffer:
	dq 0
format1:
	db"%lld",0
section .text
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 264
	mov	rax, 10005
	mov	qword [ MAXN__ ], rax
	mov	rax, 10005
	mov	qword [ MAXM__ ], rax
	call	getInt
	mov	qword [rbp - 24], rax
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 8], rax
	call	getInt
	mov	qword [rbp - 32], rax
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 16], rax
	mov	rax, qword [ MAXN__ ]
	mov	qword [rbp - 40], rax
	mov	rdx, qword [rbp - 40]
	add	rdx, 1
	mov	qword [rbp - 40], rdx
	mov	rdx, qword [rbp - 40]
	imul	rdx, 8
	mov	qword [rbp - 40], rdx
	mov	rax, qword [rbp - 40]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 48], rax
	mov	rax, qword [ MAXN__ ]
	mov	rbx, qword [rbp - 48]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 48]
	add	rdx, 8
	mov	qword [rbp - 48], rdx
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 56], rax
	mov	rax, qword [ MAXN__ ]
	mov	qword [rbp - 64], rax
	mov	rdx, qword [rbp - 64]
	add	rdx, 1
	mov	qword [rbp - 64], rdx
	mov	rdx, qword [rbp - 64]
	imul	rdx, 8
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 72], rax
	mov	rax, qword [ MAXN__ ]
	mov	rbx, qword [rbp - 72]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 72]
	add	rdx, 8
	mov	qword [rbp - 72], rdx
	mov	rax, qword [rbp - 72]
	mov	qword [rbp - 80], rax
	mov	rax, qword [ MAXN__ ]
	mov	qword [rbp - 88], rax
	mov	rdx, qword [rbp - 88]
	add	rdx, 1
	mov	qword [rbp - 88], rdx
	mov	rdx, qword [rbp - 88]
	imul	rdx, 8
	mov	qword [rbp - 88], rdx
	mov	rax, qword [rbp - 88]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 96], rax
	mov	rax, qword [ MAXN__ ]
	mov	rbx, qword [rbp - 96]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 96]
	add	rdx, 8
	mov	qword [rbp - 96], rdx
	mov	rax, qword [rbp - 96]
	mov	qword [rbp - 104], rax
	mov	rax, 0
	mov	qword [rbp - 112], rax
Label_4:
	mov	rcx, qword [rbp - 112]
	cmp	rcx, qword [rbp - 16]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 128], rcx
	cmp	qword [rbp - 128], 1
	je	Label_3
	jmp	Label_2
Label_3:
	call	getInt
	mov	qword [rbp - 136], rax
	mov	rax, qword [rbp - 136]
	mov	rbx, qword [rbp - 112]
	imul	rbx, 8
	add	rbx, qword [rbp - 56]
	mov	qword [rbx], rax
	call	getInt
	mov	qword [rbp - 144], rax
	mov	rax, qword [rbp - 144]
	mov	rbx, qword [rbp - 112]
	imul	rbx, 8
	add	rbx, qword [rbp - 80]
	mov	qword [rbx], rax
Label_1:
	mov	rdx, qword [rbp - 112]
	add	rdx, 1
	mov	qword [rbp - 112], rdx
	jmp	Label_4
Label_2:
	mov	rax, 5555
	mov	qword [rbp - 152], rax
	mov	rbx, qword [rbp - 152]
	imul	rbx, 8
	add	rbx, qword [rbp - 56]
	mov	rax, qword [rbx]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 160], rax
	mov	rax, qword [rbp - 160]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 168], rax
	mov	rax, 7555
	mov	qword [rbp - 176], rax
	mov	rbx, qword [rbp - 176]
	imul	rbx, 8
	add	rbx, qword [rbp - 80]
	mov	rax, qword [rbx]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 184], rax
	mov	rax, qword [rbp - 184]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 192], rax
	mov	rax, 0
	mov	qword [rbp - 112], rax
Label_8:
	mov	rcx, qword [rbp - 112]
	cmp	rcx, qword [rbp - 16]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 200], rcx
	cmp	qword [rbp - 200], 1
	je	Label_7
	jmp	Label_6
Label_7:
	mov	rbx, qword [rbp - 112]
	imul	rbx, 8
	add	rbx, qword [rbp - 80]
	mov	rax, qword [rbx]
	mov	qword [rbp - 120], rax
Label_12:
	mov	rcx, qword [rbp - 120]
	cmp	rcx, qword [rbp - 8]
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 208], rcx
	cmp	qword [rbp - 208], 1
	je	Label_11
	jmp	Label_10
Label_11:
	mov	r11, qword [rbp - 112]
	imul	r11, 8
	add	r11, qword [rbp - 80]
	mov	rdx, qword [rbp - 120]
	sub	rdx, qword [r11]
	mov	qword [rbp - 232], rdx
	mov	r10, qword [rbp - 232]
	imul	r10, 8
	add	r10, qword [rbp - 104]
	mov	r11, qword [rbp - 112]
	imul	r11, 8
	add	r11, qword [rbp - 56]
	mov	rdx, qword [r10]
	add	rdx, qword [r11]
	mov	qword [rbp - 224], rdx
	mov	r10, qword [rbp - 120]
	imul	r10, 8
	add	r10, qword [rbp - 104]
	mov	rcx, qword [r10]
	cmp	rcx, qword [rbp - 224]
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 216], rcx
	cmp	qword [rbp - 216], 1
	je	Label_14
	jmp	Label_15
Label_14:
	mov	r11, qword [rbp - 112]
	imul	r11, 8
	add	r11, qword [rbp - 80]
	mov	rdx, qword [rbp - 120]
	sub	rdx, qword [r11]
	mov	qword [rbp - 248], rdx
	mov	r10, qword [rbp - 248]
	imul	r10, 8
	add	r10, qword [rbp - 104]
	mov	r11, qword [rbp - 112]
	imul	r11, 8
	add	r11, qword [rbp - 56]
	mov	rdx, qword [r10]
	add	rdx, qword [r11]
	mov	qword [rbp - 240], rdx
	mov	rax, qword [rbp - 240]
	mov	rbx, qword [rbp - 120]
	imul	rbx, 8
	add	rbx, qword [rbp - 104]
	mov	qword [rbx], rax
	jmp	Label_13
Label_15:
Label_13:
Label_9:
	mov	rdx, qword [rbp - 120]
	add	rdx, 1
	mov	qword [rbp - 120], rdx
	jmp	Label_12
Label_10:
Label_5:
	mov	rdx, qword [rbp - 112]
	add	rdx, 1
	mov	qword [rbp - 112], rdx
	jmp	Label_8
Label_6:
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 104]
	mov	rax, qword [rbx]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 256], rax
	mov	rax, qword [rbp - 256]
	mov	rdi, rax
	call	print
	mov	qword [rbp - 264], rax
	mov	rax, 0
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
println:
	call puts
	ret

array.size:
	mov	rax, qword [rdi - 8]
	ret

string.add:
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
	jmp     Ladd_002
Ladd_001:  add     dword [rbp-14H], 1
Ladd_002:  mov     eax, dword [rbp-14H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-28H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jnz     Ladd_001
	jmp     Ladd_004
Ladd_003:  add     dword [rbp-10H], 1
Ladd_004:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-30H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jnz     Ladd_003
	mov     dword [rbp-0CH], 0
	jmp     Ladd_006
Ladd_005:  mov     eax, dword [rbp-0CH]
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
Ladd_006:  mov     eax, dword [rbp-0CH]
	cmp     eax, dword [rbp-14H]
	jl      Ladd_005
	mov     eax, dword [rbp-14H]
	mov     dword [rbp-0CH], eax
	jmp     Ladd_008
Ladd_007:  mov     eax, dword [rbp-0CH]
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
Ladd_008:  mov     edx, dword [rbp-14H]
	mov     eax, dword [rbp-10H]
	add     eax, edx
	cmp     eax, dword [rbp-0CH]
	jg      Ladd_007
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
getInt:
	push rbp
	mov rbp,rsp
	mov rax,0
	mov rdi,format1
	mov rsi,intbuffer
	call scanf
	mov rax,[intbuffer]
	mov rsp,rbp
	pop rbp
	ret
string.length:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-4H], 0
	jmp     Llen_002
Llen_001:  add     dword [rbp-4H], 1
Llen_002:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jnz     Llen_001
	mov     eax, dword [rbp-4H]
	pop     rbp
	ret
string.ord:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-1CH], esi
	mov     eax, dword [rbp-1CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	mov     dword [rbp-4H], eax
	mov     eax, dword [rbp-4H]
	pop     rbp
	ret
print:
	push    rbp
	mov     rbp, rsp
	sub     rsp, 32
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-8H], 0
	jmp     Lprt_002
Lprt_001:  add     dword [rbp-8H], 1
Lprt_002:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jnz     Lprt_001
	mov     dword [rbp-4H], 0
	jmp     Lprt_010
Lprt_003:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 92
	jne     Lprt_008
	mov     eax, dword [rbp-4H]
	add     eax, 1
	cmp     eax, dword [rbp-8H]
	jge     Lprt_008
	mov     eax, dword [rbp-4H]
	cdqe
	lea     rdx, [rax+1H]
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 110
	jnz     Lprt_004
	mov     edi, 10
	call    putchar
	add     dword [rbp-4H], 1
	jmp     Lprt_009
Lprt_004:  mov     eax, dword [rbp-4H]
	cdqe
	lea     rdx, [rax+1H]
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 116
	jnz     Lprt_005
	mov     edi, 9
	call    putchar
	add     dword [rbp-4H], 1
	jmp     Lprt_009
Lprt_005:  mov     eax, dword [rbp-4H]
	cdqe
	lea     rdx, [rax+1H]
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 92
	jnz     Lprt_006
	mov     edi, 92
	call    putchar
	add     dword [rbp-4H], 1
	jmp     Lprt_009
Lprt_006:  mov     eax, dword [rbp-4H]
	cdqe
	lea     rdx, [rax+1H]
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 34
	jnz     Lprt_007
	mov     edi, 34
	call    putchar
	add     dword [rbp-4H], 1
	jmp     Lprt_009
Lprt_007:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	mov     edi, eax
	call    putchar
	jmp     Lprt_009
Lprt_008:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	mov     edi, eax
	call    putchar
Lprt_009:  add     dword [rbp-4H], 1
Lprt_010:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jne     Lprt_003
	nop
	        leave
	ret
getString:
	push    rbp
	mov     rbp, rsp
	sub     rsp, 288
	mov     rax, qword [fs:abs 28H]
	mov     qword [rbp-8H], rax
	xor     eax, eax
	lea     rax, [rbp-110H]
	mov     rdi, rax
	mov     eax, 0
	call    gets
	mov     edi, 256
	call    malloc
	mov     qword [rbp-118H], rax
	mov     dword [rbp-120H], 0
	jmp     Lgs_002
Lgs_001:  add     dword [rbp-120H], 1
Lgs_002:  mov     eax, dword [rbp-120H]
	cdqe
	movzx   eax, byte [rbp+rax-110H]
	test    al, al
	jnz     Lgs_001
	mov     dword [rbp-11CH], 0
	mov     dword [rbp-11CH], 0
	jmp     Lgs_004
Lgs_003:  mov     eax, dword [rbp-11CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-118H]
	add     rdx, rax
	mov     eax, dword [rbp-11CH]
	cdqe
	movzx   eax, byte [rbp+rax-110H]
	mov     byte [rdx], al
	add     dword [rbp-11CH], 1
Lgs_004:  mov     eax, dword [rbp-11CH]
	cmp     eax, dword [rbp-120H]
	jl      Lgs_003
	mov     eax, dword [rbp-120H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-118H]
	add     rax, rdx
	mov     byte [rax], 0
	mov     rax, qword [rbp-118H]
	mov     rcx, qword [rbp-8H]
	xor     rcx, qword [fs:abs 28H]
	jz      Lgs_005
	call    __stack_chk_fail
	Lgs_005:  leave
	ret
string.substring:
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
	jmp     Lsub_002
Lsub_001:  mov     eax, dword [rbp-10H]
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
Lsub_002:  mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jl      Lsub_001
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-8H]
	add     rax, rdx
	mov     byte [rax], 0
	mov     rax, qword [rbp-8H]
	leave
	        ret
string.parseInt:
	push    rbp
	mov     rbp, rsp
	sub     rsp, 32
	mov     qword [rbp-18H], rdi
	mov     edi, 256
	call    malloc
	mov     qword [rbp-8H], rax
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Lpar_002
Lpar_001:  add     dword [rbp-10H], 1
Lpar_002:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lpar_004
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lpar_001
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lpar_001
	jmp     Lpar_004
Lpar_003:  mov     edx, dword [rbp-0CH]
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
Lpar_004:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 47
	jle     Lpar_005
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jle     Lpar_003
Lpar_005:  mov     eax, dword [rbp-0CH]
	leave
	ret
	string.eq:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-0CH], 0
	mov     dword [rbp-8H], 0
	jmp     Leq_002
Leq_001:  add     dword [rbp-0CH], 1
Leq_002:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Leq_004
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Leq_001
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Leq_001
	jmp     Leq_004
Leq_003:  add     dword [rbp-8H], 1
Leq_004:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Leq_005
	mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Leq_003
	mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Leq_003
Leq_005:  mov     eax, dword [rbp-0CH]
	cmp     eax, dword [rbp-8H]
	jz      Leq_006
	mov     eax, 0
	jmp     Leq_010
Leq_006:  mov     dword [rbp-4H], 0
	mov     dword [rbp-4H], 0
	jmp     Leq_009
Leq_007:  mov     eax, dword [rbp-4H]
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
	jz      Leq_008
	mov     eax, 0
	jmp     Leq_010
Leq_008:  add     dword [rbp-4H], 1
Leq_009:  mov     eax, dword [rbp-4H]
	cmp     eax, dword [rbp-0CH]
	jl      Leq_007
	mov     eax, 1
Leq_010:  pop     rbp
	ret
string.s:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Ll_012
Ll_011:  add     dword [rbp-10H], 1
Ll_012:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Ll_014
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Ll_011
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Ll_011
	jmp     Ll_014
Ll_013:  add     dword [rbp-0CH], 1
Ll_014:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Ll_015
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Ll_013
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Ll_013
Ll_015:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Ll_019
Ll_016:  mov     eax, dword [rbp-8H]
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
	jge     Ll_017
	mov     eax, 1
	jmp     Ll_021
Ll_017:  mov     eax, dword [rbp-8H]
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
	jle     Ll_018
	mov     eax, 0
	jmp     Ll_021
Ll_018:  add     dword [rbp-8H], 1
Ll_019:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Ll_016
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jl      Ll_020
	mov     eax, 0
	jmp     Ll_021
Ll_020:  mov     eax, 1
Ll_021:  pop     rbp
	ret
string.g:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Lg_023
Lg_022:  add     dword [rbp-10H], 1
Lg_023:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lg_025
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lg_022
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lg_022
	jmp     Lg_025
Lg_024:  add     dword [rbp-0CH], 1
Lg_025:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lg_026
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lg_024
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lg_024
Lg_026:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Lg_030
Lg_027:  mov     eax, dword [rbp-8H]
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
	jle     Lg_028
	mov     eax, 1
	jmp     Lg_032
Lg_028:  mov     eax, dword [rbp-8H]
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
	jge     Lg_029
	mov     eax, 0
	jmp     Lg_032
Lg_029:  add     dword [rbp-8H], 1
Lg_030:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Lg_027
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jg      Lg_031
	mov     eax, 0
	jmp     Lg_032
Lg_031:  mov     eax, 1
Lg_032:  pop     rbp
	ret
	string.le:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Llege_002
Llege_001:  add     dword [rbp-10H], 1
Llege_002:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_004
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_001
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_001
	jmp     Llege_004
Llege_003:  add     dword [rbp-0CH], 1
Llege_004:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_005
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_003
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_003
Llege_005:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Llege_009
Llege_006:  mov     eax, dword [rbp-8H]
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
	jge     Llege_007
	mov     eax, 1
	jmp     Llege_011
Llege_007:  mov     eax, dword [rbp-8H]
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
	jle     Llege_008
	mov     eax, 0
	jmp     Llege_011
Llege_008:  add     dword [rbp-8H], 1
Llege_009:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Llege_006
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jle     Llege_010
	mov     eax, 0
	jmp     Llege_011
	Llege_010:  mov     eax, 1
	Llege_011:  pop     rbp
	ret
	string.ge:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Llege_013
Llege_012:  add     dword [rbp-10H], 1
Llege_013:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_015
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_012
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_012
	jmp     Llege_015
Llege_014:  add     dword [rbp-0CH], 1
Llege_015:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_016
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_014
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_014
Llege_016:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Llege_020
Llege_017:  mov     eax, dword [rbp-8H]
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
	jle     Llege_018
	mov     eax, 1
	jmp     Llege_022
Llege_018:  mov     eax, dword [rbp-8H]
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
	jge     Llege_019
	mov     eax, 0
	jmp     Llege_022
Llege_019:  add     dword [rbp-8H], 1
Llege_020:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Llege_017
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jge     Llege_021
	mov     eax, 0
	jmp     Llege_022
Llege_021:  mov     eax, 1
Llege_022:  pop     rbp
	ret
