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
	dq	13
str__0:
	db	110, 111, 32, 115, 111, 108, 117, 116, 105, 111, 110, 33, 10, 0
N__:
	dq	0
head__:
	dq	0
startx__:
	dq	0
starty__:
	dq	0
targetx__:
	dq	0
targety__:
	dq	0
x__:
	dq	0
y__:
	dq	0
xlist__:
	dq	0
ylist__:
	dq	0
tail__:
	dq	0
ok__:
	dq	0
now__:
	dq	0
dx__:
	dq	0
dy__:
	dq	0
step__:
	dq	0
i__:
	dq	0
j__:
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
origin:
	push	rbp
	mov	rbp, rsp
	mov	rsi, rdi
	mov	rax, 0
	mov	qword [ head__ ], rax
	mov	rax, 0
	mov	qword [ tail__ ], rax
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	malloc
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	qword [ step__ ], rdi
	mov	rax, 0
	mov	qword [ i__ ], rax
Label_4:
	mov	rax, qword [ i__ ]
	cmp	rax, rsi
	jl	Label_3
	jmp	Label_2
Label_3:
	mov	r10, qword [ step__ ]
	mov	r11, qword [ i__ ]
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	malloc
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	qword [r10 + r11 * 8], rdi
	mov	rax, 0
	mov	qword [ j__ ], rax
Label_8:
	mov	rax, qword [ j__ ]
	cmp	rax, rsi
	jl	Label_7
	jmp	Label_6
Label_7:
	mov	rdi, qword [ step__ ]
	mov	r10, qword [ i__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	r10, qword [ j__ ]
	mov	rax, 0
	mov	qword [rdi + r10 * 8], rax
Label_5:
	mov	rdi, qword [ j__ ]
	mov	rcx, qword [ j__ ]
	add	rcx, 1
	mov	qword [ j__ ], rcx
	jmp	Label_8
Label_6:
Label_1:
	mov	rdi, qword [ i__ ]
	mov	rcx, qword [ i__ ]
	add	rcx, 1
	mov	qword [ i__ ], rcx
	jmp	Label_4
Label_2:
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
check:
	push	rbp
	mov	rbp, rsp
	cmp	rdi, qword [ N__ ]
	jl	Label_10
	mov	rdi, 0
	jmp	Label_11
Label_10:
	mov	rcx, rdi
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_11:
	mov	rax, rdi
	jmp	Label_9
Label_9:
	mov	rsp, rbp
	pop	rbp
	ret
addList:
	push	rbp
	mov	rbp, rsp
	cmp	rdi, qword [ N__ ]
	jl	Label_16
	mov	r10, 0
	jmp	Label_17
Label_16:
	mov	rcx, rdi
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r10, rcx
Label_17:
	cmp	r10, 1
	je	Label_18
	mov	r10, 0
	jmp	Label_19
Label_18:
	cmp	rsi, qword [ N__ ]
	jl	Label_20
	mov	r10, 0
	jmp	Label_21
Label_20:
	mov	rcx, rsi
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r10, rcx
Label_21:
Label_19:
	cmp	r10, 1
	je	Label_22
	mov	r10, 0
	jmp	Label_23
Label_22:
	mov	r10, qword [ step__ ]
	mov	r10, qword [r10 + rdi * 8]
	mov	r11, 1
	neg	r11
	mov	rcx, qword [r10 + rsi * 8]
	cmp	rcx, r11
	sete	cl
	movzx	rcx, cl
	mov	r10, rcx
Label_23:
	cmp	r10, 1
	je	Label_14
	jmp	Label_15
Label_14:
	mov	r10, qword [ tail__ ]
	mov	rcx, qword [ tail__ ]
	add	rcx, 1
	mov	qword [ tail__ ], rcx
	mov	r10, qword [ xlist__ ]
	mov	r11, qword [ tail__ ]
	mov	qword [r10 + r11 * 8], rdi
	mov	r10, qword [ ylist__ ]
	mov	r11, qword [ tail__ ]
	mov	qword [r10 + r11 * 8], rsi
	mov	r10, qword [ step__ ]
	mov	r10, qword [r10 + rdi * 8]
	mov	rcx, qword [ now__ ]
	add	rcx, 1
	mov	r11, rcx
	mov	qword [r10 + rsi * 8], r11
	cmp	rdi, qword [ targetx__ ]
	je	Label_27
	mov	rdi, 0
	jmp	Label_28
Label_27:
	mov	rcx, rsi
	cmp	rcx, qword [ targety__ ]
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_28:
	cmp	rdi, 1
	je	Label_25
	jmp	Label_26
Label_25:
	mov	rax, 1
	mov	qword [ ok__ ], rax
	jmp	Label_24
Label_26:
Label_24:
	jmp	Label_13
Label_15:
Label_13:
Label_12:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	mov	rdi, 12000
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	call	malloc
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, 12000
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ xlist__ ], rdi
	mov	rdi, 12000
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	call	malloc
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, 12000
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ ylist__ ], rdi
	mov	rdi, 8
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	call	malloc
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, 8
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ dx__ ], rdi
	mov	rdi, 9
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	call	malloc
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, 9
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ dy__ ], rdi
	push	rdi
	push	rsi
	push	r10
	mov	rdi, 106
	call	origin
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	call	getInt
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [ N__ ], rdi
	mov	rcx, qword [ N__ ]
	sub	rcx, 1
	mov	rdi, rcx
	mov	qword [ targety__ ], rdi
	mov	rax, qword [ targety__ ]
	mov	qword [ targetx__ ], rax
	mov	rax, 0
	mov	qword [ i__ ], rax
Label_33:
	mov	rax, qword [ i__ ]
	cmp	rax, qword [ N__ ]
	jl	Label_32
	jmp	Label_31
Label_32:
	mov	rax, 0
	mov	qword [ j__ ], rax
Label_37:
	mov	rax, qword [ j__ ]
	cmp	rax, qword [ N__ ]
	jl	Label_36
	jmp	Label_35
Label_36:
	mov	rdi, qword [ step__ ]
	mov	rsi, qword [ i__ ]
	mov	rdi, qword [rdi + rsi * 8]
	mov	rsi, qword [ j__ ]
	mov	r10, 1
	neg	r10
	mov	qword [rdi + rsi * 8], r10
Label_34:
	mov	rdi, qword [ j__ ]
	mov	rcx, qword [ j__ ]
	add	rcx, 1
	mov	qword [ j__ ], rcx
	jmp	Label_37
Label_35:
Label_30:
	mov	rdi, qword [ i__ ]
	mov	rcx, qword [ i__ ]
	add	rcx, 1
	mov	qword [ i__ ], rcx
	jmp	Label_33
Label_31:
	mov	rdi, qword [ dx__ ]
	mov	rsi, 0
	mov	r10, 2
	neg	r10
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ dy__ ]
	mov	rsi, 0
	mov	r10, 1
	neg	r10
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ dx__ ]
	mov	rsi, 1
	mov	r10, 2
	neg	r10
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ dy__ ]
	mov	rsi, 1
	mov	rax, 1
	mov	qword [rdi + rsi * 8], rax
	mov	rdi, qword [ dx__ ]
	mov	rsi, 2
	mov	rax, 2
	mov	qword [rdi + rsi * 8], rax
	mov	rdi, qword [ dy__ ]
	mov	rsi, 2
	mov	r10, 1
	neg	r10
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ dx__ ]
	mov	rsi, 3
	mov	rax, 2
	mov	qword [rdi + rsi * 8], rax
	mov	rdi, qword [ dy__ ]
	mov	rsi, 3
	mov	rax, 1
	mov	qword [rdi + rsi * 8], rax
	mov	rdi, qword [ dx__ ]
	mov	rsi, 4
	mov	r10, 1
	neg	r10
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ dy__ ]
	mov	rsi, 4
	mov	r10, 2
	neg	r10
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ dx__ ]
	mov	rsi, 5
	mov	r10, 1
	neg	r10
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ dy__ ]
	mov	rsi, 5
	mov	rax, 2
	mov	qword [rdi + rsi * 8], rax
	mov	rdi, qword [ dx__ ]
	mov	rsi, 6
	mov	rax, 1
	mov	qword [rdi + rsi * 8], rax
	mov	rdi, qword [ dy__ ]
	mov	rsi, 6
	mov	r10, 2
	neg	r10
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ dx__ ]
	mov	rsi, 7
	mov	rax, 1
	mov	qword [rdi + rsi * 8], rax
	mov	rdi, qword [ dy__ ]
	mov	rsi, 7
	mov	rax, 2
	mov	qword [rdi + rsi * 8], rax
Label_41:
	mov	rax, qword [ head__ ]
	cmp	rax, qword [ tail__ ]
	jle	Label_40
	jmp	Label_39
Label_40:
	mov	rdi, qword [ xlist__ ]
	mov	rsi, qword [ head__ ]
	mov	rax, qword [rdi + rsi * 8]
	mov	qword [ x__ ], rax
	mov	rdi, qword [ ylist__ ]
	mov	rsi, qword [ head__ ]
	mov	rax, qword [rdi + rsi * 8]
	mov	qword [ y__ ], rax
	mov	rdi, qword [ step__ ]
	mov	rsi, qword [ x__ ]
	mov	rdi, qword [rdi + rsi * 8]
	mov	rsi, qword [ y__ ]
	mov	rax, qword [rdi + rsi * 8]
	mov	qword [ now__ ], rax
	mov	rax, 0
	mov	qword [ j__ ], rax
Label_45:
	mov	rax, qword [ j__ ]
	cmp	rax, 8
	jl	Label_44
	jmp	Label_43
Label_44:
	mov	rdi, qword [ dx__ ]
	mov	rsi, qword [ j__ ]
	mov	rcx, qword [ x__ ]
	add	rcx, qword [rdi + rsi * 8]
	mov	rdi, rcx
	mov	rsi, qword [ dy__ ]
	mov	r10, qword [ j__ ]
	mov	rcx, qword [ y__ ]
	add	rcx, qword [rsi + r10 * 8]
	mov	rsi, rcx
	push	rdi
	push	rsi
	push	r10
	call	addList
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
Label_42:
	mov	rdi, qword [ j__ ]
	mov	rcx, qword [ j__ ]
	add	rcx, 1
	mov	qword [ j__ ], rcx
	jmp	Label_45
Label_43:
	mov	rax, qword [ ok__ ]
	cmp	rax, 1
	je	Label_47
	jmp	Label_48
Label_47:
	jmp	Label_39
	jmp	Label_46
Label_48:
Label_46:
	mov	rdi, qword [ head__ ]
	mov	rcx, qword [ head__ ]
	add	rcx, 1
	mov	qword [ head__ ], rcx
Label_38:
	jmp	Label_41
Label_39:
	mov	rax, qword [ ok__ ]
	cmp	rax, 1
	je	Label_50
	jmp	Label_51
Label_50:
	mov	rdi, qword [ step__ ]
	mov	rsi, qword [ targetx__ ]
	mov	rdi, qword [rdi + rsi * 8]
	mov	rsi, qword [ targety__ ]
	push	rdi
	push	rsi
	push	r10
	mov	rdi, qword [rdi + rsi * 8]
	call	toString
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	call	println
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_49
Label_51:
	push	rdi
	push	rsi
	push	r10
	mov	rdi, str__0
	call	print
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
Label_49:
	mov	rax, 0
	jmp	Label_29
Label_29:
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
