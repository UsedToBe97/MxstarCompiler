global main

extern puts
extern getchar
extern putchar
extern sprintf
extern __stack_chk_fail
extern malloc
extern printf
extern strlen
extern memcpy
extern scanf
section .data
	dq	1
str__0:
	db	32, 0
	dq	1
str__1:
	db	10, 0
N__:
	dq	0
M__:
	dq	0
ch__:
	dq	0
l__:
	dq	0
r__:
	dq	0
w__:
	dq	0
intbuffer:
	dq 0
format1:
	db"%lld",0
format2:
	db"%s",0

section .bss
stringbuffer:
	resb 256
section .text
merge:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	rax, 0
	cmp	rax, r10
	je	Label_2
	jmp	Label_3
Label_2:
	mov	rax, rsi
	jmp	Label_0
Label_3:
	mov	rax, 0
	cmp	rax, rsi
	je	Label_5
	jmp	Label_6
Label_5:
	mov	rax, r10
	jmp	Label_0
Label_6:
	mov	rdi, qword [ w__ ]
	mov	r11, qword [ w__ ]
	mov	rax, qword [rdi + r10 * 8]
	cmp	rax, qword [r11 + rsi * 8]
	jl	Label_8
	jmp	Label_9
Label_8:
	mov	rdi, r10
	mov	r10, rsi
	mov	rsi, rdi
	jmp	Label_9
Label_9:
	mov	r11, qword [ r__ ]
	mov	rdi, qword [ r__ ]
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, qword [rdi + r10 * 8]
	call	merge
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [r11 + r10 * 8], rdi
	mov	rdi, qword [ l__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	rsi, qword [ l__ ]
	mov	r11, qword [ r__ ]
	mov	rax, qword [r11 + r10 * 8]
	mov	qword [rsi + r10 * 8], rax
	mov	rsi, qword [ r__ ]
	mov	qword [rsi + r10 * 8], rdi
	mov	rax, r10
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	getInt
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [ N__ ], rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	getInt
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [ M__ ], rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	getString
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [ ch__ ], rdi
	mov	rcx, qword [ N__ ]
	add	rcx, qword [ M__ ]
	mov	rdi, rcx
	mov	rcx, rdi
	add	rcx, 5
	mov	rsi, rcx
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	malloc
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	qword [ l__ ], rdi
	mov	rcx, qword [ N__ ]
	add	rcx, qword [ M__ ]
	mov	rdi, rcx
	mov	rcx, rdi
	add	rcx, 5
	mov	rsi, rcx
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	malloc
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	qword [ r__ ], rdi
	mov	rcx, qword [ N__ ]
	add	rcx, qword [ M__ ]
	mov	rdi, rcx
	mov	rcx, rdi
	add	rcx, 5
	mov	rsi, rcx
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	malloc
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	qword [ w__ ], rdi
	mov	r10, 1
Label_14:
	cmp	r10, qword [ N__ ]
	jle	Label_13
	jmp	Label_12
Label_13:
	mov	rdi, qword [ w__ ]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	getInt
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rsi, rax
	mov	qword [rdi + r10 * 8], rsi
	mov	rdi, qword [ l__ ]
	mov	rax, 0
	mov	qword [rdi + r10 * 8], rax
	mov	rdi, qword [ r__ ]
	mov	rax, 0
	mov	qword [rdi + r10 * 8], rax
	add	r10, 1
	jmp	Label_14
Label_12:
	mov	r10, 1
Label_18:
	cmp	r10, qword [ M__ ]
	jle	Label_17
	jmp	Label_16
Label_17:
	mov	r11, qword [ w__ ]
	mov	rcx, r10
	add	rcx, qword [ N__ ]
	mov	r8, rcx
	mov	rcx, r10
	sub	rcx, 1
	mov	rsi, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, qword [ ch__ ]
	call	string.ord
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [r11 + r8 * 8], rdi
	mov	rdi, qword [ l__ ]
	mov	rcx, r10
	add	rcx, qword [ N__ ]
	mov	rsi, rcx
	mov	rax, 0
	mov	qword [rdi + rsi * 8], rax
	mov	rdi, qword [ r__ ]
	mov	rcx, r10
	add	rcx, qword [ N__ ]
	mov	rsi, rcx
	mov	rax, 0
	mov	qword [rdi + rsi * 8], rax
	add	r10, 1
	jmp	Label_18
Label_16:
	mov	r11, 1
	mov	rcx, qword [ N__ ]
	add	rcx, 1
	mov	rdi, rcx
	mov	r8, rdi
	mov	r10, 2
Label_22:
	cmp	r10, qword [ N__ ]
	jle	Label_21
	jmp	Label_20
Label_21:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r11
	mov	rsi, r10
	call	merge
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r11, rdi
	add	r10, 1
	jmp	Label_22
Label_20:
	mov	rcx, qword [ N__ ]
	add	rcx, 2
	mov	rdi, rcx
	mov	r10, rdi
Label_26:
	mov	rcx, qword [ N__ ]
	add	rcx, qword [ M__ ]
	mov	rdi, rcx
	cmp	r10, rdi
	jle	Label_25
	jmp	Label_24
Label_25:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r8
	mov	rsi, r10
	call	merge
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r8, rdi
	add	r10, 1
	jmp	Label_26
Label_24:
	mov	rdi, qword [ w__ ]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, qword [rdi + r11 * 8]
	call	toString
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	print
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, str__0
	call	print
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rcx, r8
	sub	rcx, qword [ N__ ]
	mov	rdi, rcx
	mov	rcx, rdi
	sub	rcx, 1
	mov	rsi, rcx
	mov	rcx, r8
	sub	rcx, qword [ N__ ]
	mov	rdi, rcx
	mov	rcx, rdi
	sub	rcx, 1
	mov	r10, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, qword [ ch__ ]
	mov	rdx, r10
	call	string.substring
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	print
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, str__1
	call	print
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r11
	mov	rsi, r8
	call	merge
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	toString
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	println
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rax, 0
	jmp	Label_10
Label_10:
	mov	rsp, rbp
	pop	rbp
	ret
toString:
	push rbp
	mov rbp,rsp
	mov rdx,rdi
	mov rax,0
	mov rdi,stringbuffer
	mov rsi,format1
	call sprintf
	mov rdi,stringbuffer
	call transtring
	mov rsp,rbp
	pop rbp
	ret
println:
	call puts
	ret

array.size:
	mov	rax, qword [rdi - 8]
	ret

string.add:
	push rbp
	mov rbp,rsp
	push rsi
	mov rsi,rdi
	mov rdi,stringbuffer
	mov rdx,[rsi-8]
	push rdx
	call memcpy
	pop rdi
	pop rsi
	add rdi,stringbuffer
	mov rdx,[rsi-8]
	add rdx,1
	call memcpy
	mov rdi,stringbuffer
	call transtring
	mov rsp,rbp
	pop rbp
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
	push rbp
	mov rbp,rsp
	mov rax,0
	mov rsi,rdi
	mov rdi,format2
	call printf
	mov rsp,rbp
	pop rbp
	ret
transtring:

	push rbp
	mov rbp,rsp
	call strlen
	push rdi
	mov rdi,rax
	push rdi
	add rdi,9
	call malloc
	pop rdi
	mov [rax],rdi
	add rax,8
	mov rdx,rdi
	add rdx,1
	mov rdi,rax
	pop rsi
	sub rsp,8
	push rax
	call memcpy
	pop rax
	mov rsp,rbp
	pop rbp
	ret

getString:

	push rbp
	mov rbp,rsp
	mov rax,0
	mov rdi,format2
	mov rsi,stringbuffer
	call scanf
	mov rdi,stringbuffer
	call transtring
	mov rsp,rbp
	pop rbp
	ret

string.substring:
	push rbp
	mov rbp,rsp
	push rdi
	push rsi
	mov rdi,rdx
	sub rdi,rsi
	add rdi,1
	push rdi
	add rdi,9
	call malloc
	pop rdx
	mov [rax],rdx
	add rax,8
	pop rsi
	pop rdi
	add rsi,rdi
	mov rdi,rax
	push rdx
	push rax
	call memcpy
	pop rax
	pop rdx
	mov qword[rax+rdx],0
	mov rsp,rbp
	pop rbp
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
