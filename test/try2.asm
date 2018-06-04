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
b__:
	dq	0
now__:
	dq	0
t__:
	dq	0
a__:
	dq	0
n__:
	dq	0
m__:
	dq	0
p__:
	dq	0
op__:
	dq	0
L__:
	dq	0
flag__:
	dq	0
s__:
	dq	0
sum__:
	dq	0
ans__:
	dq	0
aa__:
	dq	0
bb__:
	dq	0
MOD__:
	dq	0
no__:
	dq	0
pl__:
	dq	0
pr__:
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
square:
	push	rbp
	mov	rbp, rsp
	mov	ecx, dword [ p__ ]
	mov	eax, edi
	cdq
	idiv	ecx
	mov	esi, edx
	mov	ecx, dword [ p__ ]
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	rcx, rsi
	imul	rcx, rdi
	mov	rdi, rcx
	mov	rax, rdi
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
gcd:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	rdi, rsi
	cmp	rdi, 0
	je	Label_3
	jmp	Label_4
Label_3:
	mov	rax, r10
	jmp	Label_5
Label_4:
	cmp	r10, rdi
	jl	Label_6
	jmp	Label_7
Label_6:
	push	rdi
	push	rsi
	push	r10
	mov	rsi, r10
	call	gcd
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, rdi
	jmp	Label_5
Label_7:
	mov	ecx, edi
	mov	eax, r10d
	cdq
	idiv	ecx
	mov	esi, edx
	push	rdi
	push	rsi
	push	r10
	call	gcd
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, rdi
	jmp	Label_5
Label_5:
	mov	rsp, rbp
	pop	rbp
	ret
lcm:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	r11, rsi
	push	rdi
	push	r10
	push	r11
	mov	rdi, r10
	mov	rsi, r11
	call	gcd
	pop	r11
	pop	r10
	pop	rdi
	mov	ecx, eax
	mov	eax, r10d
	cdq
	idiv	ecx
	mov	edi, eax
	imul	rdi, r11
	mov	rax, rdi
	jmp	Label_8
Label_8:
	mov	rsp, rbp
	pop	rbp
	ret
Rand:
	push	rbp
	mov	rbp, rsp
	mov	rdi, 1
	mov	rdi, 1
Label_13:
	cmp	rdi, 3
	jl	Label_12
	jmp	Label_11
Label_12:
	mov	rcx, qword [ no__ ]
	imul	rcx, qword [ aa__ ]
	mov	rsi, rcx
	add	rsi, qword [ bb__ ]
	mov	ecx, dword [ MOD__ ]
	mov	eax, esi
	cdq
	idiv	ecx
	mov	esi, edx
	mov	qword [ no__ ], rsi
	add	rdi, 1
	jmp	Label_13
Label_11:
	mov	rax, qword [ no__ ]
	cmp	rax, 0
	jl	Label_15
	jmp	Label_16
Label_15:
	mov	rdi, qword [ no__ ]
	neg	rdi
	mov	qword [ no__ ], rdi
	jmp	Label_16
Label_16:
	mov	rax, qword [ no__ ]
	jmp	Label_9
Label_9:
	mov	rsp, rbp
	pop	rbp
	ret
RandRange:
	push	rbp
	mov	rbp, rsp
	push	rdi
	push	rsi
	push	r10
	call	Rand
	pop	r10
	pop	rsi
	pop	rdi
	mov	r10, rax
	sub	rsi, rdi
	add	rsi, 1
	mov	ecx, esi
	mov	eax, r10d
	cdq
	idiv	ecx
	mov	esi, edx
	add	rdi, rsi
	add	rdi, 1
	mov	rax, rdi
	jmp	Label_17
Label_17:
	mov	rsp, rbp
	pop	rbp
	ret
init:
	push	rbp
	mov	rbp, rsp
	mov	rdi, 140005
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
	mov	rcx, 140005
	mov	qword [rdi], rcx
	add	rdi, 8
	mov	r10, rdi
	mov	r11, 0
	mov	rdi, 0
	mov	r11, 2
Label_22:
	cmp	r11, qword [ p__ ]
	jl	Label_21
	jmp	Label_20
Label_21:
	mov	qword [r10 + r11 * 8], r11
	add	r11, 1
	jmp	Label_22
Label_20:
	mov	r11, 2
Label_26:
	cmp	r11, qword [ p__ ]
	jl	Label_25
	jmp	Label_24
Label_25:
	mov	rdi, 1
Label_30:
	cmp	rdi, 15
	jle	Label_29
	jmp	Label_28
Label_29:
	mov	ecx, dword [ p__ ]
	mov	eax, dword [r10 + r11 * 8]
	cdq
	idiv	ecx
	mov	esi, edx
	mov	ecx, dword [ p__ ]
	mov	eax, dword [r10 + r11 * 8]
	cdq
	idiv	ecx
	mov	r8d, edx
	imul	rsi, r8
	mov	ecx, dword [ p__ ]
	mov	eax, esi
	cdq
	idiv	ecx
	mov	esi, edx
	mov	qword [r10 + r11 * 8], rsi
	add	rdi, 1
	jmp	Label_30
Label_28:
	add	r11, 1
	jmp	Label_26
Label_24:
	mov	r11, 2
Label_34:
	cmp	r11, qword [ p__ ]
	jl	Label_33
	jmp	Label_32
Label_33:
	mov	rdi, qword [r10 + r11 * 8]
	mov	r8, 1
Label_38:
Label_37:
	mov	ecx, dword [ p__ ]
	mov	eax, edi
	cdq
	idiv	ecx
	mov	esi, edx
	mov	ecx, dword [ p__ ]
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	rcx, rsi
	imul	rcx, rdi
	mov	rdi, rcx
	mov	ecx, dword [ p__ ]
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	rsi, qword [ b__ ]
	mov	rcx, 1
	mov	qword [rsi + rdi * 8], rcx
	cmp	rdi, qword [r10 + r11 * 8]
	je	Label_40
	jmp	Label_41
Label_40:
	jmp	Label_36
Label_41:
	add	r8, 1
	jmp	Label_38
Label_36:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, qword [ L__ ]
	mov	rsi, r8
	call	gcd
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	ecx, eax
	mov	eax, dword [ L__ ]
	cdq
	idiv	ecx
	mov	edi, eax
	imul	rdi, r8
	mov	qword [ L__ ], rdi
	add	r11, 1
	jmp	Label_34
Label_32:
	mov	rdi, qword [ b__ ]
	mov	rsi, 0
	mov	rcx, 1
	mov	qword [rdi + rsi * 8], rcx
	mov	rdi, qword [ b__ ]
	mov	rsi, 1
	mov	rcx, 1
	mov	qword [rdi + rsi * 8], rcx
	mov	rsp, rbp
	pop	rbp
	ret
build:
	push	rbp
	mov	rbp, rsp
	push	r12
	sub	rbp, 8
	mov	r10, rdi
	mov	r11, rdx
	mov	rdi, 0
	cmp	rsi, r11
	je	Label_44
	jmp	Label_45
Label_44:
	mov	rdi, qword [ sum__ ]
	mov	r11, qword [ a__ ]
	mov	rcx, qword [r11 + rsi * 8]
	mov	qword [rdi + r10 * 8], rcx
	mov	rdi, qword [ a__ ]
	mov	rax, qword [rdi + rsi * 8]
	cmp	rax, qword [ p__ ]
	jl	Label_49
	mov	rdi, 0
	jmp	Label_50
Label_49:
	mov	rdi, qword [ a__ ]
	mov	rax, qword [rdi + rsi * 8]
	cmp	rax, 0
	jge	Label_51
	mov	rdi, 0
	jmp	Label_52
Label_51:
	mov	rdi, qword [ b__ ]
	mov	r11, qword [ a__ ]
	mov	ecx, dword [ p__ ]
	mov	eax, dword [r11 + rsi * 8]
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	rcx, qword [rdi + r11 * 8]
	cmp	rcx, 0
	setg	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_52:
Label_50:
	cmp	rdi, 1
	je	Label_47
	jmp	Label_48
Label_47:
	mov	rdi, qword [ flag__ ]
	mov	rcx, 1
	mov	qword [rdi + r10 * 8], rcx
	mov	rdi, qword [ s__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	r11, 0
	mov	r8, qword [ a__ ]
	mov	rcx, qword [r8 + rsi * 8]
	mov	qword [rdi + r11 * 8], rcx
	mov	rdi, 1
Label_56:
	cmp	rdi, qword [ L__ ]
	jl	Label_55
	jmp	Label_54
Label_55:
	mov	rsi, qword [ s__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	r11, qword [ s__ ]
	mov	r11, qword [r11 + r10 * 8]
	mov	rcx, rdi
	sub	rcx, 1
	mov	r8, rcx
	mov	ecx, dword [ p__ ]
	mov	eax, dword [r11 + r8 * 8]
	cdq
	idiv	ecx
	mov	r9d, edx
	mov	ecx, dword [ p__ ]
	mov	eax, dword [r11 + r8 * 8]
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	rcx, r9
	imul	rcx, r11
	mov	r11, rcx
	mov	ecx, dword [ p__ ]
	mov	eax, r11d
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	qword [rsi + rdi * 8], r11
	add	rdi, 1
	jmp	Label_56
Label_54:
Label_48:
	mov	rdi, qword [ now__ ]
	mov	rcx, 0
	mov	qword [rdi + r10 * 8], rcx
	jmp	Label_59
Label_45:
	mov	rcx, r10
	imul	rcx, 2
	mov	rdi, rcx
	mov	r8, rdi
	mov	rcx, r10
	imul	rcx, 2
	mov	rdi, rcx
	add	rdi, 1
	mov	r9, rdi
	mov	rcx, rsi
	add	rcx, r11
	mov	rdi, rcx
	mov	ecx, 2
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, eax
	mov	r12, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r8
	mov	rdx, r12
	call	build
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rcx, r12
	add	rcx, 1
	mov	rsi, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r9
	mov	rdx, r11
	call	build
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, qword [ sum__ ]
	mov	rsi, qword [ sum__ ]
	mov	r11, qword [ sum__ ]
	mov	rcx, qword [rsi + r8 * 8]
	add	rcx, qword [r11 + r9 * 8]
	mov	rsi, rcx
	mov	qword [rdi + r10 * 8], rsi
	mov	rdi, qword [ flag__ ]
	mov	rsi, qword [ flag__ ]
	mov	r11, qword [ flag__ ]
	mov	rcx, qword [rsi + r8 * 8]
	and	rcx, qword [r11 + r9 * 8]
	mov	rsi, rcx
	mov	qword [rdi + r10 * 8], rsi
	mov	rdi, qword [ flag__ ]
	mov	rax, qword [rdi + r10 * 8]
	cmp	rax, 0
	jg	Label_58
	jmp	Label_59
Label_58:
	mov	rdi, 0
Label_63:
	cmp	rdi, qword [ L__ ]
	jl	Label_62
	jmp	Label_61
Label_62:
	mov	rsi, qword [ s__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	r11, qword [ s__ ]
	mov	r11, qword [r11 + r8 * 8]
	mov	r12, qword [ s__ ]
	mov	r12, qword [r12 + r9 * 8]
	mov	rcx, qword [r11 + rdi * 8]
	add	rcx, qword [r12 + rdi * 8]
	mov	r11, rcx
	mov	qword [rsi + rdi * 8], r11
	add	rdi, 1
	jmp	Label_63
Label_61:
	mov	rdi, qword [ now__ ]
	mov	rsi, 0
	mov	rcx, 0
	mov	qword [rdi + rsi * 8], rcx
	jmp	Label_59
Label_59:
	add	rbp, 8
	pop	r12
	mov	rsp, rbp
	pop	rbp
	ret
pushdown:
	push	rbp
	mov	rbp, rsp
	mov	rsi, qword [ t__ ]
	mov	rax, qword [rsi + rdi * 8]
	cmp	rax, 0
	jg	Label_66
	jmp	Label_67
Label_66:
	mov	rcx, rdi
	imul	rcx, 2
	mov	rsi, rcx
	mov	rcx, rdi
	imul	rcx, 2
	mov	r10, rcx
	add	r10, 1
	mov	r11, qword [ now__ ]
	mov	r8, qword [ now__ ]
	mov	r9, qword [ t__ ]
	mov	rcx, qword [r8 + rsi * 8]
	add	rcx, qword [r9 + rdi * 8]
	mov	r8, rcx
	mov	ecx, dword [ L__ ]
	mov	eax, r8d
	cdq
	idiv	ecx
	mov	r8d, edx
	mov	qword [r11 + rsi * 8], r8
	mov	r11, qword [ sum__ ]
	mov	r8, qword [ s__ ]
	mov	r8, qword [r8 + rsi * 8]
	mov	r9, qword [ now__ ]
	mov	r9, qword [r9 + rsi * 8]
	mov	rcx, qword [r8 + r9 * 8]
	mov	qword [r11 + rsi * 8], rcx
	mov	r11, qword [ t__ ]
	mov	r8, qword [ t__ ]
	mov	r9, qword [ t__ ]
	mov	rcx, qword [r8 + rsi * 8]
	add	rcx, qword [r9 + rdi * 8]
	mov	r8, rcx
	mov	ecx, dword [ L__ ]
	mov	eax, r8d
	cdq
	idiv	ecx
	mov	r8d, edx
	mov	qword [r11 + rsi * 8], r8
	mov	rsi, qword [ now__ ]
	mov	r11, qword [ now__ ]
	mov	r8, qword [ t__ ]
	mov	rcx, qword [r11 + r10 * 8]
	add	rcx, qword [r8 + rdi * 8]
	mov	r11, rcx
	mov	ecx, dword [ L__ ]
	mov	eax, r11d
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	qword [rsi + r10 * 8], r11
	mov	rsi, qword [ sum__ ]
	mov	r11, qword [ s__ ]
	mov	r11, qword [r11 + r10 * 8]
	mov	r8, qword [ now__ ]
	mov	r8, qword [r8 + r10 * 8]
	mov	rcx, qword [r11 + r8 * 8]
	mov	qword [rsi + r10 * 8], rcx
	mov	rsi, qword [ t__ ]
	mov	r11, qword [ t__ ]
	mov	r8, qword [ t__ ]
	mov	rcx, qword [r11 + r10 * 8]
	add	rcx, qword [r8 + rdi * 8]
	mov	r11, rcx
	mov	ecx, dword [ L__ ]
	mov	eax, r11d
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	qword [rsi + r10 * 8], r11
	mov	rsi, qword [ t__ ]
	mov	rcx, 0
	mov	qword [rsi + rdi * 8], rcx
	jmp	Label_67
Label_67:
	mov	rsp, rbp
	pop	rbp
	ret
update:
	push	rbp
	mov	rbp, rsp
	push	r12
	push	r13
	push	r14
	sub	rbp, 24
	mov	r10, rdi
	mov	r11, rdx
	mov	rax, qword [ pl__ ]
	cmp	rax, rsi
	jle	Label_72
	mov	rdi, 0
	jmp	Label_73
Label_72:
	mov	rax, qword [ pr__ ]
	cmp	rax, r11
	jge	Label_74
	mov	rdi, 0
	jmp	Label_75
Label_74:
	mov	rdi, qword [ flag__ ]
	mov	rcx, qword [rdi + r10 * 8]
	cmp	rcx, 0
	setg	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_75:
Label_73:
	cmp	rdi, 1
	je	Label_70
	jmp	Label_71
Label_70:
	mov	rdi, qword [ now__ ]
	mov	rsi, qword [ now__ ]
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, 1
	mov	rsi, rcx
	mov	ecx, dword [ L__ ]
	mov	eax, esi
	cdq
	idiv	ecx
	mov	esi, edx
	mov	qword [rdi + r10 * 8], rsi
	mov	rdi, qword [ sum__ ]
	mov	rsi, qword [ s__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	r11, qword [ now__ ]
	mov	r11, qword [r11 + r10 * 8]
	mov	rcx, qword [rsi + r11 * 8]
	mov	qword [rdi + r10 * 8], rcx
	mov	rdi, qword [ t__ ]
	mov	rsi, qword [ t__ ]
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, 1
	mov	rsi, rcx
	mov	ecx, dword [ L__ ]
	mov	eax, esi
	cdq
	idiv	ecx
	mov	esi, edx
	mov	qword [rdi + r10 * 8], rsi
	jmp	Label_97
Label_71:
	cmp	rsi, r11
	je	Label_77
	jmp	Label_78
Label_77:
	mov	rdi, qword [ sum__ ]
	mov	rsi, qword [ sum__ ]
	mov	ecx, dword [ p__ ]
	mov	eax, dword [rsi + r10 * 8]
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	ecx, dword [ p__ ]
	mov	eax, dword [rsi + r10 * 8]
	cdq
	idiv	ecx
	mov	esi, edx
	mov	rcx, r11
	imul	rcx, rsi
	mov	rsi, rcx
	mov	ecx, dword [ p__ ]
	mov	eax, esi
	cdq
	idiv	ecx
	mov	esi, edx
	mov	qword [rdi + r10 * 8], rsi
	mov	rdi, qword [ b__ ]
	mov	rsi, qword [ sum__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	rax, qword [rdi + rsi * 8]
	cmp	rax, 0
	jg	Label_80
	jmp	Label_81
Label_80:
	mov	rdi, qword [ flag__ ]
	mov	rcx, 1
	mov	qword [rdi + r10 * 8], rcx
	mov	rdi, qword [ s__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	rsi, 0
	mov	r11, qword [ sum__ ]
	mov	rcx, qword [r11 + r10 * 8]
	mov	qword [rdi + rsi * 8], rcx
	mov	rdi, 0
	mov	rdi, 1
Label_85:
	cmp	rdi, qword [ L__ ]
	jl	Label_84
	jmp	Label_83
Label_84:
	mov	rsi, qword [ s__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	r11, qword [ s__ ]
	mov	r11, qword [r11 + r10 * 8]
	mov	rcx, rdi
	sub	rcx, 1
	mov	r8, rcx
	mov	ecx, dword [ p__ ]
	mov	eax, dword [r11 + r8 * 8]
	cdq
	idiv	ecx
	mov	r9d, edx
	mov	ecx, dword [ p__ ]
	mov	eax, dword [r11 + r8 * 8]
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	rcx, r9
	imul	rcx, r11
	mov	r11, rcx
	mov	ecx, dword [ p__ ]
	mov	eax, r11d
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	qword [rsi + rdi * 8], r11
	add	rdi, 1
	jmp	Label_85
Label_83:
	jmp	Label_81
Label_81:
	jmp	Label_97
Label_78:
	mov	rdi, qword [ t__ ]
	mov	rax, qword [rdi + r10 * 8]
	cmp	rax, 0
	jg	Label_87
	jmp	Label_88
Label_87:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	call	pushdown
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	jmp	Label_88
Label_88:
	mov	rcx, r10
	imul	rcx, 2
	mov	rdi, rcx
	mov	r8, rdi
	mov	rcx, r10
	imul	rcx, 2
	mov	rdi, rcx
	add	rdi, 1
	mov	r9, rdi
	mov	rcx, rsi
	add	rcx, r11
	mov	rdi, rcx
	mov	ecx, 2
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, eax
	mov	r12, rdi
	mov	rax, qword [ pl__ ]
	cmp	rax, r12
	jle	Label_90
	jmp	Label_91
Label_90:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r8
	mov	rdx, r12
	call	update
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	jmp	Label_91
Label_91:
	mov	rcx, r12
	add	rcx, 1
	mov	rdi, rcx
	mov	rax, qword [ pr__ ]
	cmp	rax, rdi
	jge	Label_93
	jmp	Label_94
Label_93:
	mov	rcx, r12
	add	rcx, 1
	mov	rsi, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r9
	mov	rdx, r11
	call	update
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
Label_94:
	mov	rdi, qword [ sum__ ]
	mov	rsi, qword [ sum__ ]
	mov	r11, qword [ sum__ ]
	mov	rcx, qword [rsi + r8 * 8]
	add	rcx, qword [r11 + r9 * 8]
	mov	rsi, rcx
	mov	qword [rdi + r10 * 8], rsi
	mov	rdi, qword [ flag__ ]
	mov	rsi, qword [ flag__ ]
	mov	r11, qword [ flag__ ]
	mov	rcx, qword [rsi + r8 * 8]
	and	rcx, qword [r11 + r9 * 8]
	mov	rsi, rcx
	mov	qword [rdi + r10 * 8], rsi
	mov	rdi, qword [ flag__ ]
	mov	rax, qword [rdi + r10 * 8]
	cmp	rax, 0
	jg	Label_96
	jmp	Label_97
Label_96:
	mov	rdi, 0
	mov	rdi, 0
Label_101:
	cmp	rdi, qword [ L__ ]
	jl	Label_100
	jmp	Label_99
Label_100:
	mov	rsi, qword [ s__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	r11, qword [ s__ ]
	mov	r11, qword [r11 + r8 * 8]
	mov	r12, qword [ now__ ]
	mov	rcx, rdi
	add	rcx, qword [r12 + r8 * 8]
	mov	r12, rcx
	mov	ecx, dword [ L__ ]
	mov	eax, r12d
	cdq
	idiv	ecx
	mov	r12d, edx
	mov	r13, qword [ s__ ]
	mov	r13, qword [r13 + r9 * 8]
	mov	r14, qword [ now__ ]
	mov	rcx, rdi
	add	rcx, qword [r14 + r9 * 8]
	mov	r14, rcx
	mov	ecx, dword [ L__ ]
	mov	eax, r14d
	cdq
	idiv	ecx
	mov	r14d, edx
	mov	rcx, qword [r11 + r12 * 8]
	add	rcx, qword [r13 + r14 * 8]
	mov	r11, rcx
	mov	qword [rsi + rdi * 8], r11
	add	rdi, 1
	jmp	Label_101
Label_99:
	mov	rdi, qword [ now__ ]
	mov	rcx, 0
	mov	qword [rdi + r10 * 8], rcx
	jmp	Label_97
Label_97:
	add	rbp, 24
	pop	r14
	pop	r13
	pop	r12
	mov	rsp, rbp
	pop	rbp
	ret
query:
	push	rbp
	mov	rbp, rsp
	push	r12
	push	r13
	sub	rbp, 16
	mov	r10, rdx
	mov	rax, qword [ pl__ ]
	cmp	rax, rsi
	jle	Label_106
	mov	r11, 0
	jmp	Label_107
Label_106:
	mov	rcx, qword [ pr__ ]
	cmp	rcx, r10
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_107:
	cmp	r11, 1
	je	Label_104
	jmp	Label_105
Label_104:
	mov	rsi, qword [ sum__ ]
	mov	rax, qword [rsi + rdi * 8]
	jmp	Label_102
Label_105:
	mov	rcx, rdi
	imul	rcx, 2
	mov	r11, rcx
	mov	rcx, rdi
	imul	rcx, 2
	mov	r8, rcx
	add	r8, 1
	mov	rcx, rsi
	add	rcx, r10
	mov	r9, rcx
	mov	ecx, 2
	mov	eax, r9d
	cdq
	idiv	ecx
	mov	r9d, eax
	mov	r12, 0
	mov	r13, qword [ t__ ]
	mov	rax, qword [r13 + rdi * 8]
	cmp	rax, 0
	jg	Label_109
	jmp	Label_110
Label_109:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	call	pushdown
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_110
Label_110:
	mov	rax, qword [ pl__ ]
	cmp	rax, r9
	jle	Label_112
	jmp	Label_113
Label_112:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r11
	mov	rdx, r9
	call	query
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rcx, r12
	add	rcx, rax
	mov	rdi, rcx
	mov	ecx, dword [ MOD__ ]
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	r12, rdi
	jmp	Label_113
Label_113:
	mov	rcx, r9
	add	rcx, 1
	mov	rdi, rcx
	mov	rax, qword [ pr__ ]
	cmp	rax, rdi
	jge	Label_115
	jmp	Label_116
Label_115:
	mov	rcx, r9
	add	rcx, 1
	mov	rsi, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r8
	mov	rdx, r10
	call	query
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rcx, r12
	add	rcx, rax
	mov	rdi, rcx
	mov	ecx, dword [ MOD__ ]
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	r12, rdi
	jmp	Label_116
Label_116:
	mov	rax, r12
	jmp	Label_102
Label_102:
	add	rbp, 16
	pop	r13
	pop	r12
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	mov	rdi, 500005
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
	mov	rcx, 500005
	mov	qword [rdi], rcx
	add	rdi, 8
	mov	qword [ b__ ], rdi
	mov	rdi, 500005
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
	mov	rcx, 500005
	mov	qword [rdi], rcx
	add	rdi, 8
	mov	qword [ now__ ], rdi
	mov	rdi, 500005
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
	mov	rcx, 500005
	mov	qword [rdi], rcx
	add	rdi, 8
	mov	qword [ t__ ], rdi
	mov	rdi, 200005
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
	mov	rcx, 200005
	mov	qword [rdi], rcx
	add	rdi, 8
	mov	qword [ a__ ], rdi
	mov	rcx, 1
	mov	qword [ L__ ], rcx
	mov	rdi, 500005
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
	mov	rcx, 500005
	mov	qword [rdi], rcx
	add	rdi, 8
	mov	qword [ flag__ ], rdi
	mov	rsi, 500005
	add	rsi, 1
	imul	rsi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, rsi
	call	malloc
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r10, rax
	mov	rcx, 500005
	mov	qword [r10], rcx
	add	r10, 8
	mov	rsi, 500005
Label_118:
	sub	rsi, 1
	mov	rdi, 80
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
	mov	rcx, 80
	mov	qword [rdi], rcx
	add	rdi, 8
	mov	qword [r10 + rsi * 8], rdi
	cmp	rsi, 0
	jne	Label_118
	mov	qword [ s__ ], r10
	mov	rdi, 500005
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
	mov	rcx, 500005
	mov	qword [rdi], rcx
	add	rdi, 8
	mov	qword [ sum__ ], rdi
	mov	rcx, 0
	mov	qword [ ans__ ], rcx
	mov	rcx, 13131
	mov	qword [ aa__ ], rcx
	mov	rcx, 5353
	mov	qword [ bb__ ], rcx
	mov	rcx, 32761
	mov	qword [ MOD__ ], rcx
	mov	rcx, 1
	mov	qword [ no__ ], rcx
	mov	rcx, 0
	mov	qword [ pl__ ], rcx
	mov	rcx, 0
	mov	qword [ pr__ ], rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	getInt
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	qword [ n__ ], rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	getInt
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	qword [ m__ ], rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	getInt
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	qword [ p__ ], rax
	mov	rdi, 1
	mov	rdi, 1
Label_122:
	cmp	rdi, qword [ n__ ]
	jle	Label_121
	jmp	Label_120
Label_121:
	mov	rsi, qword [ a__ ]
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	Rand
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r10, rax
	mov	rcx, qword [ p__ ]
	sub	rcx, 0
	mov	r11, rcx
	add	r11, 1
	mov	ecx, r11d
	mov	eax, r10d
	cdq
	idiv	ecx
	mov	r10d, edx
	mov	rcx, 0
	add	rcx, r10
	mov	r10, rcx
	add	r10, 1
	mov	qword [rsi + rdi * 8], r10
	add	rdi, 1
	jmp	Label_122
Label_120:
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	init
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, 1
	mov	rsi, 1
	mov	rdx, qword [ n__ ]
	call	build
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
Label_126:
	mov	rax, qword [ m__ ]
	cmp	rax, 0
	jg	Label_125
	jmp	Label_124
Label_125:
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	Rand
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	ecx, 2
	mov	eax, eax
	cdq
	idiv	ecx
	mov	edi, edx
	mov	qword [ op__ ], rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	Rand
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [ n__ ]
	sub	rcx, 1
	mov	rsi, rcx
	add	rsi, 1
	mov	ecx, esi
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	rcx, 1
	add	rcx, rdi
	mov	rdi, rcx
	add	rdi, 1
	mov	qword [ pl__ ], rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	Rand
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [ n__ ]
	sub	rcx, 1
	mov	rsi, rcx
	add	rsi, 1
	mov	ecx, esi
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	rcx, 1
	add	rcx, rdi
	mov	rdi, rcx
	add	rdi, 1
	mov	qword [ pr__ ], rdi
Label_130:
	mov	rax, qword [ pr__ ]
	cmp	rax, qword [ pl__ ]
	jle	Label_129
	jmp	Label_128
Label_129:
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	Rand
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [ n__ ]
	sub	rcx, 1
	mov	rsi, rcx
	add	rsi, 1
	mov	ecx, esi
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	rcx, 1
	add	rcx, rdi
	mov	rdi, rcx
	add	rdi, 1
	mov	qword [ pr__ ], rdi
	jmp	Label_130
Label_128:
	mov	rax, qword [ op__ ]
	cmp	rax, 0
	je	Label_132
	jmp	Label_133
Label_132:
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, 1
	mov	rsi, 1
	mov	rdx, qword [ n__ ]
	call	update
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_133
Label_133:
	mov	rax, qword [ op__ ]
	cmp	rax, 1
	je	Label_135
	jmp	Label_136
Label_135:
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, 1
	mov	rsi, 1
	mov	rdx, qword [ n__ ]
	call	query
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rcx, qword [ ans__ ]
	add	rcx, rax
	mov	rdi, rcx
	mov	ecx, dword [ MOD__ ]
	mov	eax, edi
	cdq
	idiv	ecx
	mov	edi, edx
	mov	qword [ ans__ ], rdi
	jmp	Label_136
Label_136:
	mov	rdi, qword [ m__ ]
	mov	rcx, qword [ m__ ]
	sub	rcx, 1
	mov	qword [ m__ ], rcx
	jmp	Label_126
Label_124:
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, qword [ ans__ ]
	call	toString
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, rax
	call	print
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rax, 0
	jmp	Label_117
Label_117:
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
