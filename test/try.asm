global main

extern puts
extern getchar
extern putchar
extern __stack_chk_fail
extern malloc
extern printf
extern gets
extern __isoc99_scanf
section .data
	dq	2
str__0:
	db	45, 32, 0
	dq	2
str__1:
	db	42, 120, 0
	dq	3
str__2:
	db	120, 122, 32, 0
	dq	7
str__3:
	db	32, 60, 61, 32, 48, 59, 10, 0
	dq	1
str__4:
	db	120, 0
	dq	3
str__5:
	db	32, 43, 32, 0
	dq	6
str__6:
	db	32, 61, 32, 49, 59, 10, 0
	dq	9
str__7:
	db	109, 97, 120, 58, 32, 120, 122, 59, 10, 0
sat__:
	dq	0
assignment__:
	dq	0
cond_ass__:
	dq	0
k__:
	dq	0
n__:
	dq	0
m__:
	dq	0
last__:
	dq	0
myHash__:
	dq	0
section .text
check:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0
	mov	rax, 0
Label_4:
	mov	rcx, rax
	cmp	rcx, qword [ m__ ]
	setl	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_3
	jmp	Label_2
Label_3:
	mov	rax, 0
	mov	rax, 0
Label_8:
	mov	rcx, rax
	cmp	rcx, 3
	setl	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_7
	jmp	Label_6
Label_7:
	mov	rax, qword [ sat__ ]
	mov	rax, qword [rax + rax * 8]
	mov	rax, qword [rax + rax * 8]
	mov	rcx, rax
	cmp	rcx, 0
	setg	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_12
	mov	rax, 0
	jmp	Label_13
Label_12:
	mov	rax, qword [ assignment__ ]
	mov	rcx, qword [rax + rax * 8]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
Label_13:
	cmp	rax, 1
	je	Label_10
	jmp	Label_11
Label_10:
	mov	rax, 1
	jmp	Label_9
Label_11:
Label_9:
	mov	rcx, rax
	cmp	rcx, 0
	setl	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_17
	mov	rax, 0
	jmp	Label_18
Label_17:
	mov	rax, qword [ assignment__ ]
	neg	rax
	mov	rcx, qword [rax + rax * 8]
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
Label_18:
	cmp	rax, 1
	je	Label_15
	jmp	Label_16
Label_15:
	mov	rax, 1
	jmp	Label_14
Label_16:
Label_14:
Label_5:
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	jmp	Label_8
Label_6:
	mov	rcx, rax
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_20
	jmp	Label_21
Label_20:
	mov	rax, 0
	jmp	Label_0
	jmp	Label_19
Label_21:
Label_19:
Label_1:
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	jmp	Label_4
Label_2:
	mov	rax, 1
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
myprint:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0
	mov	rax, rdi
	mov	rax, 0
Label_26:
	mov	rdi, rax
	call	string.length
	mov	rcx, rax
	cmp	rcx, rax
	setl	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_25
	jmp	Label_24
Label_25:
	mov	rdi, rax
	mov	rsi, rax
	call	string.ord
	mov	rdx, qword [ myHash__ ]
	add	rdx, rax
	mov	rax, rdx
	mov	qword [ myHash__ ], rax
Label_23:
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	jmp	Label_26
Label_24:
Label_22:
	mov	rsp, rbp
	pop	rbp
	ret
payoff:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0
	mov	rax, rdi
	mov	rax, rsi
	mov	rax, 0
	mov	rax, 0
Label_31:
	mov	rcx, rax
	cmp	rcx, 3
	setl	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_30
	jmp	Label_29
Label_30:
	mov	rcx, qword [rax + rax * 8]
	cmp	rcx, qword [rax + rax * 8]
	setne	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_33
	jmp	Label_34
Label_33:
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	jmp	Label_32
Label_34:
Label_32:
Label_28:
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	jmp	Label_31
Label_29:
	jmp	Label_27
Label_27:
	mov	rsp, rbp
	pop	rbp
	ret
print_cond:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0
	mov	rax, rdi
	mov	rcx, rax
	cmp	rcx, qword [ n__ ]
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_37
	jmp	Label_38
Label_37:
	mov	rax, qword [ cond_ass__ ]
	mov	rdi, rax
	mov	rax, qword [ assignment__ ]
	mov	rsi, rax
	call	payoff
	mov	rdi, rax
	call	toString
	mov	rax, str__0
	mov	rdi, rax
	mov	rsi, rax
	call	string.add
	mov	rdi, rax
	mov	rax, str__1
	mov	rsi, rax
	call	string.add
	mov	rdi, rax
	call	myprint
	mov	rax, 0
Label_42:
	mov	rcx, rax
	cmp	rcx, qword [ n__ ]
	setl	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_41
	jmp	Label_40
Label_41:
	mov	rax, rax
	mov	rcx, 10
	cqo
	idiv	rcx
	mov	rax, rdx
	mov	rcx, rax
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_44
	jmp	Label_45
Label_44:
	mov	rax, qword [ cond_ass__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rax, qword [rax + rax * 8]
	mov	rdi, rax
	call	toString
	mov	rdi, rax
	call	myprint
	jmp	Label_43
Label_45:
Label_43:
Label_39:
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	jmp	Label_42
Label_40:
	jmp	Label_35
	jmp	Label_36
Label_38:
Label_36:
	mov	rax, qword [ cond_ass__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rax, 1
	mov	qword [rax + rax * 8], rax
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdi, rax
	call	print_cond
	mov	rax, qword [ cond_ass__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rax, 0
	mov	qword [rax + rax * 8], rax
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdi, rax
	call	print_cond
Label_35:
	mov	rsp, rbp
	pop	rbp
	ret
dfs:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0
	mov	rax, rdi
	mov	rcx, rax
	cmp	rcx, qword [ n__ ]
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_48
	jmp	Label_49
Label_48:
	call	check
	mov	rcx, rax
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_51
	jmp	Label_52
Label_51:
	mov	rax, str__2
	mov	rdi, rax
	call	myprint
	mov	rax, 0
	mov	rdi, rax
	call	print_cond
	mov	rax, str__3
	mov	rdi, rax
	call	myprint
	jmp	Label_50
Label_52:
Label_50:
	jmp	Label_46
	jmp	Label_47
Label_49:
Label_47:
	mov	rax, qword [ assignment__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rax, 1
	mov	qword [rax + rax * 8], rax
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdi, rax
	call	dfs
	mov	rax, qword [ assignment__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rax, 0
	mov	qword [rax + rax * 8], rax
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdi, rax
	call	dfs
Label_46:
	mov	rsp, rbp
	pop	rbp
	ret
print_last_cond:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0
	mov	rax, rdi
	mov	rcx, rax
	cmp	rcx, qword [ n__ ]
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_55
	jmp	Label_56
Label_55:
	mov	rax, str__4
	mov	rdi, rax
	call	myprint
	mov	rax, 1
	mov	rax, 0
Label_60:
	mov	rcx, rax
	cmp	rcx, qword [ n__ ]
	setl	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_59
	jmp	Label_58
Label_59:
	mov	rax, qword [ assignment__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rcx, qword [rax + rax * 8]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_62
	jmp	Label_63
Label_62:
	mov	rax, 0
	jmp	Label_61
Label_63:
Label_61:
	mov	rax, qword [ assignment__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rax, qword [rax + rax * 8]
	mov	rdi, rax
	call	toString
	mov	rdi, rax
	call	myprint
Label_57:
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	jmp	Label_60
Label_58:
	mov	rcx, rax
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_65
	jmp	Label_66
Label_65:
	mov	rax, str__5
	mov	rdi, rax
	call	myprint
	jmp	Label_64
Label_66:
	mov	rax, str__6
	mov	rdi, rax
	call	myprint
Label_64:
	jmp	Label_53
	jmp	Label_54
Label_56:
Label_54:
	mov	rax, qword [ assignment__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rax, 1
	mov	qword [rax + rax * 8], rax
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdi, rax
	call	print_last_cond
	mov	rax, qword [ assignment__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rax, 0
	mov	qword [rax + rax * 8], rax
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdi, rax
	call	print_last_cond
Label_53:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0
	mov	rax, 0
	mov	qword [ myHash__ ], rax
	mov	rax, 5
	mov	qword [ k__ ], rax
	mov	rdx, 2
	imul	rdx, qword [ k__ ]
	mov	rax, rdx
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	qword [ n__ ], rax
	mov	rax, qword [ k__ ]
	mov	qword [ m__ ], rax
	mov	rax, 1
	mov	qword [ last__ ], rax
	mov	rax, str__7
	mov	rdi, rax
	call	myprint
	mov	rax, qword [ m__ ]
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdx, rax
	imul	rdx, 8
	mov	rax, rdx
	mov	rdi, rax
	call	malloc
	mov	rax, qword [ m__ ]
	mov	rbx, rax
	mov	qword [rbx], rax
	mov	rdx, rax
	add	rdx, 8
	mov	rax, rdx
	mov	qword [ sat__ ], rax
	mov	rax, 0
Label_71:
	mov	rcx, rax
	cmp	rcx, qword [ m__ ]
	setl	cl
	movzx	rcx, cl
	mov	rax, rcx
	cmp	rax, 1
	je	Label_70
	jmp	Label_69
Label_70:
	mov	rax, 3
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdx, rax
	imul	rdx, 8
	mov	rax, rdx
	mov	rdi, rax
	call	malloc
	mov	rax, 3
	mov	rbx, rax
	mov	qword [rbx], rax
	mov	rdx, rax
	add	rdx, 8
	mov	rax, rdx
	mov	rax, 0
	mov	rax, qword [ last__ ]
	mov	qword [rax + rax * 8], rax
	mov	rax, 1
	mov	rdx, qword [ last__ ]
	add	rdx, 1
	mov	rax, rdx
	mov	qword [rax + rax * 8], rax
	mov	rax, 2
	mov	rdx, qword [ last__ ]
	add	rdx, 2
	mov	rax, rdx
	neg	rax
	mov	qword [rax + rax * 8], rax
	mov	rdx, qword [ last__ ]
	add	rdx, 2
	mov	rax, rdx
	mov	qword [ last__ ], rax
	mov	rax, qword [ sat__ ]
	mov	qword [rax + rax * 8], rax
Label_68:
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	jmp	Label_71
Label_69:
	mov	rdx, qword [ n__ ]
	add	rdx, 1
	mov	rax, rdx
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdx, rax
	imul	rdx, 8
	mov	rax, rdx
	mov	rdi, rax
	call	malloc
	mov	rbx, rax
	mov	qword [rbx], rax
	mov	rdx, rax
	add	rdx, 8
	mov	rax, rdx
	mov	qword [ assignment__ ], rax
	mov	rdx, qword [ n__ ]
	add	rdx, 1
	mov	rax, rdx
	mov	rdx, rax
	add	rdx, 1
	mov	rax, rdx
	mov	rdx, rax
	imul	rdx, 8
	mov	rax, rdx
	mov	rdi, rax
	call	malloc
	mov	rbx, rax
	mov	qword [rbx], rax
	mov	rdx, rax
	add	rdx, 8
	mov	rax, rdx
	mov	qword [ cond_ass__ ], rax
	mov	rax, 0
	mov	rdi, rax
	call	dfs
	mov	rax, 0
	mov	rdi, rax
	call	print_last_cond
	mov	rax, qword [ myHash__ ]
	mov	rdi, rax
	call	toString
	mov	rdi, rax
	call	println
	mov	rax, 0
	jmp	Label_67
Label_67:
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
	push    rbp
	mov     rbp, rsp
	sub     rsp, 16
	call    getchar
	mov     byte [rbp-5H], al
	mov     dword [rbp-4H], 0
	jmp     Lint_002
Lint_001:  mov     edx, dword [rbp-4H]
	mov     eax, edx
	shl     eax, 2
	add     eax, edx
	add     eax, eax
	mov     edx, eax
	movsx   eax, byte [rbp-5H]
	add     eax, edx
	sub     eax, 48
	mov     dword [rbp-4H], eax
	call    getchar
	mov     byte [rbp-5H], al
Lint_002:  cmp     byte [rbp-5H], 47
	jle     Lint_003
	cmp     byte [rbp-5H], 57
	jle     Lint_001
Lint_003:  mov     eax, dword [rbp-4H]
	leave
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
