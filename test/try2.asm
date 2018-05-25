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
check:
	push	rbp
	mov	rbp, rsp
	mov	rdi, 0
Label_4:
	mov	rcx, rdi
	cmp	rcx, qword [ m__ ]
	setl	cl
	movzx	rcx, cl
	mov	rsi, rcx
	cmp	rsi, 1
	je	Label_3
	jmp	Label_2
Label_3:
	mov	r10, 0
	mov	rsi, 0
Label_8:
	mov	rcx, rsi
	cmp	rcx, 3
	setl	cl
	movzx	rcx, cl
	mov	r11, rcx
	cmp	r11, 1
	je	Label_7
	jmp	Label_6
Label_7:
	mov	r11, qword [ sat__ ]
	mov	r11, qword [r11 + rdi * 8]
	mov	r11, qword [r11 + rsi * 8]
	mov	rcx, r11
	cmp	rcx, 0
	setg	cl
	movzx	rcx, cl
	mov	r8, rcx
	cmp	r8, 1
	je	Label_12
	mov	r8, 0
	jmp	Label_13
Label_12:
	mov	r8, qword [ assignment__ ]
	mov	rcx, qword [r8 + r11 * 8]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	r8, rcx
Label_13:
	cmp	r8, 1
	je	Label_10
	jmp	Label_11
Label_10:
	mov	r10, 1
	jmp	Label_9
Label_11:
Label_9:
	mov	rcx, r11
	cmp	rcx, 0
	setl	cl
	movzx	rcx, cl
	mov	r8, rcx
	cmp	r8, 1
	je	Label_17
	mov	r11, 0
	jmp	Label_18
Label_17:
	mov	r8, qword [ assignment__ ]
	neg	r11
	mov	rcx, qword [r8 + r11 * 8]
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_18:
	cmp	r11, 1
	je	Label_15
	jmp	Label_16
Label_15:
	mov	r10, 1
	jmp	Label_14
Label_16:
Label_14:
Label_5:
	add	rsi, 1
	jmp	Label_8
Label_6:
	mov	rcx, r10
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rsi, rcx
	cmp	rsi, 1
	je	Label_20
	jmp	Label_21
Label_20:
	mov	rax, 0
	jmp	Label_0
	jmp	Label_19
Label_21:
Label_19:
Label_1:
	add	rdi, 1
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
	mov	r10, rdi
	mov	r11, 0
Label_26:
	push	r10
	push	rdi
	push	r11
	mov	rdi, r10
	call	string.length
	pop	r11
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rcx, r11
	cmp	rcx, rdi
	setl	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_25
	jmp	Label_24
Label_25:
	push	r10
	push	rdi
	push	r11
	mov	rdi, r10
	mov	rsi, r11
	call	string.ord
	pop	r11
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rcx, qword [ myHash__ ]
	add	rcx, rdi
	mov	rdi, rcx
	mov	qword [ myHash__ ], rdi
Label_23:
	add	r11, 1
	jmp	Label_26
Label_24:
Label_22:
	mov	rsp, rbp
	pop	rbp
	ret
payoff:
	push	rbp
	mov	rbp, rsp
	mov	r10, 0
	mov	r11, 0
Label_31:
	mov	rcx, r11
	cmp	rcx, 3
	setl	cl
	movzx	rcx, cl
	mov	r8, rcx
	cmp	r8, 1
	je	Label_30
	jmp	Label_29
Label_30:
	mov	rcx, qword [rdi + r11 * 8]
	cmp	rcx, qword [rsi + r11 * 8]
	setne	cl
	movzx	rcx, cl
	mov	r8, rcx
	cmp	r8, 1
	je	Label_33
	jmp	Label_34
Label_33:
	mov	r8, r10
	add	r10, 1
	jmp	Label_32
Label_34:
Label_32:
Label_28:
	add	r11, 1
	jmp	Label_31
Label_29:
	mov	rax, r10
	jmp	Label_27
Label_27:
	mov	rsp, rbp
	pop	rbp
	ret
print_cond:
	push	rbp
	mov	rbp, rsp
	mov	rsi, rdi
	mov	rcx, rsi
	cmp	rcx, qword [ n__ ]
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_37
	jmp	Label_38
Label_37:
	push	r10
	push	rdi
	push	rsi
	mov	rdi, qword [ cond_ass__ ]
	mov	rsi, qword [ assignment__ ]
	call	payoff
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	call	toString
	pop	rsi
	pop	rdi
	pop	r10
	mov	rsi, rax
	push	r10
	push	rdi
	push	rsi
	mov	rdi, str__0
	call	string.add
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	mov	rsi, str__1
	call	string.add
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	call	myprint
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rsi, 0
Label_42:
	mov	rcx, rsi
	cmp	rcx, qword [ n__ ]
	setl	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_41
	jmp	Label_40
Label_41:
	mov	rax, rsi
	mov	rcx, 10
	cqo
	idiv	rcx
	mov	rdi, rdx
	mov	rcx, rdi
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_44
	jmp	Label_45
Label_44:
	mov	rdi, qword [ cond_ass__ ]
	mov	rcx, rsi
	add	rcx, 1
	mov	r10, rcx
	push	r10
	push	rdi
	push	rsi
	mov	rdi, qword [rdi + r10 * 8]
	call	toString
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	call	myprint
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	jmp	Label_43
Label_45:
Label_43:
Label_39:
	add	rsi, 1
	jmp	Label_42
Label_40:
	jmp	Label_35
	jmp	Label_36
Label_38:
Label_36:
	mov	rdi, qword [ cond_ass__ ]
	mov	rcx, rsi
	add	rcx, 1
	mov	r10, rcx
	mov	rax, 1
	mov	qword [rdi + r10 * 8], rax
	mov	rcx, rsi
	add	rcx, 1
	mov	rdi, rcx
	push	r10
	push	rdi
	push	rsi
	call	print_cond
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rdi, qword [ cond_ass__ ]
	mov	rcx, rsi
	add	rcx, 1
	mov	r10, rcx
	mov	rax, 0
	mov	qword [rdi + r10 * 8], rax
	mov	rcx, rsi
	add	rcx, 1
	mov	rdi, rcx
	push	r10
	push	rdi
	push	rsi
	call	print_cond
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
Label_35:
	mov	rsp, rbp
	pop	rbp
	ret
dfs:
	push	rbp
	mov	rbp, rsp
	mov	rsi, rdi
	mov	rcx, rsi
	cmp	rcx, qword [ n__ ]
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_48
	jmp	Label_49
Label_48:
	push	r10
	push	rdi
	push	rsi
	call	check
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rcx, rdi
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_51
	jmp	Label_52
Label_51:
	push	r10
	push	rdi
	push	rsi
	mov	rdi, str__2
	call	myprint
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	mov	rdi, 0
	call	print_cond
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	mov	rdi, str__3
	call	myprint
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	jmp	Label_50
Label_52:
Label_50:
	jmp	Label_46
	jmp	Label_47
Label_49:
Label_47:
	mov	rdi, qword [ assignment__ ]
	mov	rcx, rsi
	add	rcx, 1
	mov	r10, rcx
	mov	rax, 1
	mov	qword [rdi + r10 * 8], rax
	mov	rcx, rsi
	add	rcx, 1
	mov	rdi, rcx
	push	r10
	push	rdi
	push	rsi
	call	dfs
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rdi, qword [ assignment__ ]
	mov	rcx, rsi
	add	rcx, 1
	mov	r10, rcx
	mov	rax, 0
	mov	qword [rdi + r10 * 8], rax
	mov	rcx, rsi
	add	rcx, 1
	mov	rdi, rcx
	push	r10
	push	rdi
	push	rsi
	call	dfs
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
Label_46:
	mov	rsp, rbp
	pop	rbp
	ret
print_last_cond:
	push	rbp
	mov	rbp, rsp
	mov	rsi, rdi
	mov	rcx, rsi
	cmp	rcx, qword [ n__ ]
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_55
	jmp	Label_56
Label_55:
	push	r10
	push	rdi
	push	rsi
	push	r11
	mov	rdi, str__4
	call	myprint
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rsi, 1
	mov	r10, 0
Label_60:
	mov	rcx, r10
	cmp	rcx, qword [ n__ ]
	setl	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_59
	jmp	Label_58
Label_59:
	mov	rdi, qword [ assignment__ ]
	mov	rcx, r10
	add	rcx, 1
	mov	r11, rcx
	mov	rcx, qword [rdi + r11 * 8]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_62
	jmp	Label_63
Label_62:
	mov	rsi, 0
	jmp	Label_61
Label_63:
Label_61:
	mov	rdi, qword [ assignment__ ]
	mov	rcx, r10
	add	rcx, 1
	mov	r11, rcx
	push	r10
	push	rdi
	push	rsi
	push	r11
	mov	rdi, qword [rdi + r11 * 8]
	call	toString
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	myprint
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
Label_57:
	add	r10, 1
	jmp	Label_60
Label_58:
	mov	rcx, rsi
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_65
	jmp	Label_66
Label_65:
	push	r10
	push	rdi
	push	rsi
	push	r11
	mov	rdi, str__5
	call	myprint
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	jmp	Label_64
Label_66:
	push	r10
	push	rdi
	push	rsi
	push	r11
	mov	rdi, str__6
	call	myprint
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
Label_64:
	jmp	Label_53
	jmp	Label_54
Label_56:
Label_54:
	mov	rdi, qword [ assignment__ ]
	mov	rcx, rsi
	add	rcx, 1
	mov	r10, rcx
	mov	rax, 1
	mov	qword [rdi + r10 * 8], rax
	mov	rcx, rsi
	add	rcx, 1
	mov	rdi, rcx
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	print_last_cond
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rdi, qword [ assignment__ ]
	mov	rcx, rsi
	add	rcx, 1
	mov	r10, rcx
	mov	rax, 0
	mov	qword [rdi + r10 * 8], rax
	mov	rcx, rsi
	add	rcx, 1
	mov	rdi, rcx
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	print_last_cond
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
Label_53:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	mov	rax, 0
	mov	qword [ myHash__ ], rax
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	getInt
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	qword [ k__ ], rdi
	mov	rcx, 2
	imul	rcx, qword [ k__ ]
	mov	rdi, rcx
	add	rdi, 1
	mov	qword [ n__ ], rdi
	mov	rax, qword [ k__ ]
	mov	qword [ m__ ], rax
	mov	rax, 1
	mov	qword [ last__ ], rax
	push	r10
	push	rdi
	push	rsi
	push	r11
	mov	rdi, str__7
	call	myprint
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rdi, qword [ m__ ]
	add	rdi, 1
	imul	rdi, 8
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	malloc
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rax, qword [ m__ ]
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ sat__ ], rdi
	mov	rsi, 0
Label_71:
	mov	rcx, rsi
	cmp	rcx, qword [ m__ ]
	setl	cl
	movzx	rcx, cl
	mov	rdi, rcx
	cmp	rdi, 1
	je	Label_70
	jmp	Label_69
Label_70:
	mov	rdi, 3
	add	rdi, 1
	imul	rdi, 8
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	malloc
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rax, 3
	mov	qword [rdi], rax
	add	rdi, 8
	mov	r10, 0
	mov	rax, qword [ last__ ]
	mov	qword [rdi + r10 * 8], rax
	mov	r10, 1
	mov	rcx, qword [ last__ ]
	add	rcx, 1
	mov	r11, rcx
	mov	qword [rdi + r10 * 8], r11
	mov	r10, 2
	mov	rcx, qword [ last__ ]
	add	rcx, 2
	mov	r11, rcx
	neg	r11
	mov	qword [rdi + r10 * 8], r11
	mov	rcx, qword [ last__ ]
	add	rcx, 2
	mov	r10, rcx
	mov	qword [ last__ ], r10
	mov	r10, qword [ sat__ ]
	mov	qword [r10 + rsi * 8], rdi
Label_68:
	add	rsi, 1
	jmp	Label_71
Label_69:
	mov	rcx, qword [ n__ ]
	add	rcx, 1
	mov	rsi, rcx
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	malloc
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	qword [ assignment__ ], rdi
	mov	rcx, qword [ n__ ]
	add	rcx, 1
	mov	rsi, rcx
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	malloc
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	qword [ cond_ass__ ], rdi
	push	r10
	push	rdi
	push	rsi
	push	r11
	mov	rdi, 0
	call	dfs
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	push	r11
	mov	rdi, 0
	call	print_last_cond
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	push	r11
	mov	rdi, qword [ myHash__ ]
	call	toString
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	push	r10
	push	rdi
	push	rsi
	push	r11
	call	println
	pop	r11
	pop	rsi
	pop	rdi
	pop	r10
	mov	rdi, rax
	mov	rax, 0
	jmp	Label_67
Label_67:
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
push    rbp
mov     rbp, rsp
sub     rsp, 32
mov     qword [rbp-18H], rdi
mov     qword [rbp-20H], rsi
mov     edi, 256
call    malloc
mov     qword [rbp-8H], rax
mov     dword [rbp-10H], 0
mov     dword [rbp-0CH], 0
jmp     Ladd_002
Ladd_001:  mov     eax, dword [rbp-10H]
movsxd  rdx, eax
mov     rax, qword [rbp-8H]
add     rdx, rax
mov     eax, dword [rbp-10H]
movsxd  rcx, eax
mov     rax, qword [rbp-18H]
add     rax, rcx
movzx   eax, byte [rax]
mov     byte [rdx], al
add     dword [rbp-10H], 1
Ladd_002:  mov     eax, dword [rbp-10H]
movsxd  rdx, eax
mov     rax, qword [rbp-18H]
add     rax, rdx
movzx   eax, byte [rax]
test    al, al
jnz     Ladd_001
jmp     Ladd_004
Ladd_003:  mov     edx, dword [rbp-0CH]
mov     eax, dword [rbp-10H]
add     eax, edx
movsxd  rdx, eax
mov     rax, qword [rbp-8H]
add     rdx, rax
mov     eax, dword [rbp-0CH]
movsxd  rcx, eax
mov     rax, qword [rbp-20H]
add     rax, rcx
movzx   eax, byte [rax]
mov     byte [rdx], al
add     dword [rbp-0CH], 1
Ladd_004:  mov     eax, dword [rbp-0CH]
movsxd  rdx, eax
mov     rax, qword [rbp-20H]
add     rax, rdx
movzx   eax, byte [rax]
test    al, al
jnz     Ladd_003
mov     edx, dword [rbp-10H]
mov     eax, dword [rbp-0CH]
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
