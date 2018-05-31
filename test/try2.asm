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
	dq	1
str__2:
	db	10, 0
make__:
	dq	0
color__:
	dq	0
count__:
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
	mov	qword [ make__ ], rdi
	mov	rax, 0
	mov	qword [ i__ ], rax
Label_4:
	mov	rax, qword [ i__ ]
	cmp	rax, rsi
	jl	Label_3
	jmp	Label_2
Label_3:
	mov	r10, qword [ make__ ]
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
	mov	rdi, qword [ make__ ]
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
search:
	push	rbp
	mov	rbp, rsp
	push	r12
	sub	rbp, 8
	mov	r10, rdi
	mov	r11, rsi
	mov	r8, rdx
	cmp	r11, 0
	jg	Label_13
	mov	rcx, r11
	cmp	rcx, 0
	setl	cl
	movzx	rcx, cl
	mov	rdi, rcx
	jmp	Label_14
Label_13:
	mov	rdi, 1
Label_14:
	cmp	rdi, 1
	je	Label_15
	mov	rcx, r10
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	jmp	Label_16
Label_15:
	mov	rdi, 1
Label_16:
	cmp	rdi, 1
	je	Label_17
	mov	rdi, qword [ make__ ]
	mov	rcx, r10
	sub	rcx, 1
	mov	rsi, rcx
	mov	rdi, qword [rdi + rsi * 8]
	mov	rsi, 0
	mov	r9, qword [ make__ ]
	mov	rcx, r10
	sub	rcx, 1
	mov	r12, rcx
	mov	r9, qword [r9 + r12 * 8]
	mov	r12, 1
	mov	rcx, qword [rdi + rsi * 8]
	add	rcx, qword [r9 + r12 * 8]
	mov	rdi, rcx
	mov	rsi, qword [ make__ ]
	mov	rcx, r10
	sub	rcx, 1
	mov	r9, rcx
	mov	rsi, qword [rsi + r9 * 8]
	mov	r9, 2
	add	rdi, qword [rsi + r9 * 8]
	mov	rcx, rdi
	cmp	rcx, 15
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	jmp	Label_18
Label_17:
	mov	rdi, 1
Label_18:
	cmp	rdi, 1
	je	Label_11
	jmp	Label_12
Label_11:
	cmp	r10, 2
	je	Label_22
	mov	rdi, 0
	jmp	Label_23
Label_22:
	mov	rcx, r11
	cmp	rcx, 2
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_23:
	cmp	rdi, 1
	je	Label_20
	jmp	Label_21
Label_20:
	mov	rdi, qword [ make__ ]
	mov	rsi, 2
	mov	rdi, qword [rdi + rsi * 8]
	mov	rsi, 2
	mov	rcx, 45
	sub	rcx, r8
	mov	r10, rcx
	mov	qword [rdi + rsi * 8], r10
	mov	rdi, qword [ make__ ]
	mov	rsi, 0
	mov	rdi, qword [rdi + rsi * 8]
	mov	rsi, 0
	mov	r10, qword [ make__ ]
	mov	r11, 0
	mov	r10, qword [r10 + r11 * 8]
	mov	r11, 1
	mov	rcx, qword [rdi + rsi * 8]
	add	rcx, qword [r10 + r11 * 8]
	mov	rdi, rcx
	mov	rsi, qword [ make__ ]
	mov	r10, 0
	mov	rsi, qword [rsi + r10 * 8]
	mov	r10, 2
	add	rdi, qword [rsi + r10 * 8]
	mov	rsi, qword [ make__ ]
	mov	r10, 1
	mov	rsi, qword [rsi + r10 * 8]
	mov	r10, 0
	mov	r11, qword [ make__ ]
	mov	r8, 1
	mov	r11, qword [r11 + r8 * 8]
	mov	r8, 1
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, qword [r11 + r8 * 8]
	mov	rsi, rcx
	mov	r10, qword [ make__ ]
	mov	r11, 1
	mov	r10, qword [r10 + r11 * 8]
	mov	r11, 2
	add	rsi, qword [r10 + r11 * 8]
	cmp	rsi, rdi
	je	Label_27
	mov	rsi, 0
	jmp	Label_28
Label_27:
	mov	rsi, qword [ make__ ]
	mov	r10, 2
	mov	rsi, qword [rsi + r10 * 8]
	mov	r10, 0
	mov	r11, qword [ make__ ]
	mov	r8, 2
	mov	r11, qword [r11 + r8 * 8]
	mov	r8, 1
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, qword [r11 + r8 * 8]
	mov	rsi, rcx
	mov	r10, qword [ make__ ]
	mov	r11, 2
	mov	r10, qword [r10 + r11 * 8]
	mov	r11, 2
	add	rsi, qword [r10 + r11 * 8]
	mov	rcx, rsi
	cmp	rcx, rdi
	sete	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_28:
	cmp	rsi, 1
	je	Label_29
	mov	rsi, 0
	jmp	Label_30
Label_29:
	mov	rsi, qword [ make__ ]
	mov	r10, 0
	mov	rsi, qword [rsi + r10 * 8]
	mov	r10, 0
	mov	r11, qword [ make__ ]
	mov	r8, 1
	mov	r11, qword [r11 + r8 * 8]
	mov	r8, 0
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, qword [r11 + r8 * 8]
	mov	rsi, rcx
	mov	r10, qword [ make__ ]
	mov	r11, 2
	mov	r10, qword [r10 + r11 * 8]
	mov	r11, 0
	add	rsi, qword [r10 + r11 * 8]
	mov	rcx, rsi
	cmp	rcx, rdi
	sete	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_30:
	cmp	rsi, 1
	je	Label_31
	mov	rsi, 0
	jmp	Label_32
Label_31:
	mov	rsi, qword [ make__ ]
	mov	r10, 0
	mov	rsi, qword [rsi + r10 * 8]
	mov	r10, 1
	mov	r11, qword [ make__ ]
	mov	r8, 1
	mov	r11, qword [r11 + r8 * 8]
	mov	r8, 1
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, qword [r11 + r8 * 8]
	mov	rsi, rcx
	mov	r10, qword [ make__ ]
	mov	r11, 2
	mov	r10, qword [r10 + r11 * 8]
	mov	r11, 1
	add	rsi, qword [r10 + r11 * 8]
	mov	rcx, rsi
	cmp	rcx, rdi
	sete	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_32:
	cmp	rsi, 1
	je	Label_33
	mov	rsi, 0
	jmp	Label_34
Label_33:
	mov	rsi, qword [ make__ ]
	mov	r10, 0
	mov	rsi, qword [rsi + r10 * 8]
	mov	r10, 2
	mov	r11, qword [ make__ ]
	mov	r8, 1
	mov	r11, qword [r11 + r8 * 8]
	mov	r8, 2
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, qword [r11 + r8 * 8]
	mov	rsi, rcx
	mov	r10, qword [ make__ ]
	mov	r11, 2
	mov	r10, qword [r10 + r11 * 8]
	mov	r11, 2
	add	rsi, qword [r10 + r11 * 8]
	mov	rcx, rsi
	cmp	rcx, rdi
	sete	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_34:
	cmp	rsi, 1
	je	Label_35
	mov	rsi, 0
	jmp	Label_36
Label_35:
	mov	rsi, qword [ make__ ]
	mov	r10, 0
	mov	rsi, qword [rsi + r10 * 8]
	mov	r10, 0
	mov	r11, qword [ make__ ]
	mov	r8, 1
	mov	r11, qword [r11 + r8 * 8]
	mov	r8, 1
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, qword [r11 + r8 * 8]
	mov	rsi, rcx
	mov	r10, qword [ make__ ]
	mov	r11, 2
	mov	r10, qword [r10 + r11 * 8]
	mov	r11, 2
	add	rsi, qword [r10 + r11 * 8]
	mov	rcx, rsi
	cmp	rcx, rdi
	sete	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_36:
	cmp	rsi, 1
	je	Label_37
	mov	rdi, 0
	jmp	Label_38
Label_37:
	mov	rsi, qword [ make__ ]
	mov	r10, 2
	mov	rsi, qword [rsi + r10 * 8]
	mov	r10, 0
	mov	r11, qword [ make__ ]
	mov	r8, 1
	mov	r11, qword [r11 + r8 * 8]
	mov	r8, 1
	mov	rcx, qword [rsi + r10 * 8]
	add	rcx, qword [r11 + r8 * 8]
	mov	rsi, rcx
	mov	r10, qword [ make__ ]
	mov	r11, 0
	mov	r10, qword [r10 + r11 * 8]
	mov	r11, 2
	add	rsi, qword [r10 + r11 * 8]
	mov	rcx, rsi
	cmp	rcx, rdi
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_38:
	cmp	rdi, 1
	je	Label_25
	jmp	Label_26
Label_25:
	mov	rdi, qword [ count__ ]
	mov	rsi, 0
	mov	r10, qword [ count__ ]
	mov	r11, 0
	mov	rcx, qword [r10 + r11 * 8]
	add	rcx, 1
	mov	r10, rcx
	mov	qword [rdi + rsi * 8], r10
	mov	r9, 0
Label_42:
	cmp	r9, 2
	jle	Label_41
	jmp	Label_40
Label_41:
	mov	rsi, 0
Label_46:
	cmp	rsi, 2
	jle	Label_45
	jmp	Label_44
Label_45:
	mov	rdi, qword [ make__ ]
	mov	rdi, qword [rdi + r9 * 8]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rdi + rsi * 8]
	call	toString
	pop	r9
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
	push	r9
	call	print
	pop	r9
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
	push	r9
	mov	rdi, str__0
	call	print
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
Label_43:
	mov	rdi, rsi
	add	rsi, 1
	jmp	Label_46
Label_44:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, str__1
	call	print
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
Label_39:
	mov	rdi, r9
	add	r9, 1
	jmp	Label_42
Label_40:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, str__2
	call	print
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_24
Label_26:
Label_24:
	jmp	Label_19
Label_21:
	cmp	r11, 2
	je	Label_48
	jmp	Label_49
Label_48:
	mov	rdi, qword [ make__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	rsi, qword [ make__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	r9, 0
	mov	rcx, 15
	sub	rcx, qword [rsi + r9 * 8]
	mov	rsi, rcx
	mov	r9, qword [ make__ ]
	mov	r9, qword [r9 + r10 * 8]
	mov	r12, 1
	sub	rsi, qword [r9 + r12 * 8]
	mov	qword [rdi + r11 * 8], rsi
	mov	rdi, qword [ make__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	rax, qword [rdi + r11 * 8]
	cmp	rax, 0
	jg	Label_53
	mov	rdi, 0
	jmp	Label_54
Label_53:
	mov	rdi, qword [ make__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	rcx, qword [rdi + r11 * 8]
	cmp	rcx, 10
	setl	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_54:
	cmp	rdi, 1
	je	Label_55
	mov	rdi, 0
	jmp	Label_56
Label_55:
	mov	rdi, qword [ color__ ]
	mov	rsi, qword [ make__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	rsi, qword [rsi + r11 * 8]
	mov	rcx, qword [rdi + rsi * 8]
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_56:
	cmp	rdi, 1
	je	Label_51
	jmp	Label_52
Label_51:
	mov	rdi, qword [ color__ ]
	mov	rsi, qword [ make__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	rsi, qword [rsi + r11 * 8]
	mov	rax, 1
	mov	qword [rdi + rsi * 8], rax
	cmp	r11, 2
	je	Label_58
	jmp	Label_59
Label_58:
	mov	rcx, r10
	add	rcx, 1
	mov	rdi, rcx
	mov	rsi, qword [ make__ ]
	mov	rsi, qword [rsi + r10 * 8]
	add	r8, qword [rsi + r11 * 8]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, 0
	mov	rdx, r8
	call	search
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_57
Label_59:
	mov	rcx, r11
	add	rcx, 1
	mov	rsi, rcx
	mov	rdi, qword [ make__ ]
	mov	rdi, qword [rdi + r10 * 8]
	add	r8, qword [rdi + r11 * 8]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	mov	rdx, r8
	call	search
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
Label_57:
	mov	rdi, qword [ color__ ]
	mov	rsi, qword [ make__ ]
	mov	rsi, qword [rsi + r10 * 8]
	mov	rsi, qword [rsi + r11 * 8]
	mov	rax, 0
	mov	qword [rdi + rsi * 8], rax
	jmp	Label_50
Label_52:
Label_50:
	jmp	Label_47
Label_49:
	mov	r9, 1
Label_63:
	cmp	r9, 9
	jle	Label_62
	jmp	Label_61
Label_62:
	mov	rdi, qword [ color__ ]
	mov	rax, qword [rdi + r9 * 8]
	cmp	rax, 0
	je	Label_65
	jmp	Label_66
Label_65:
	mov	rdi, qword [ color__ ]
	mov	rax, 1
	mov	qword [rdi + r9 * 8], rax
	mov	rdi, qword [ make__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	qword [rdi + r11 * 8], r9
	cmp	r11, 2
	je	Label_68
	jmp	Label_69
Label_68:
	mov	rcx, r10
	add	rcx, 1
	mov	rdi, rcx
	mov	rcx, r8
	add	rcx, r9
	mov	r12, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, 0
	mov	rdx, r12
	call	search
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_67
Label_69:
	mov	rcx, r11
	add	rcx, 1
	mov	rsi, rcx
	mov	rcx, r8
	add	rcx, r9
	mov	r12, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	mov	rdx, r12
	call	search
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
Label_67:
	mov	rdi, qword [ make__ ]
	mov	rdi, qword [rdi + r10 * 8]
	mov	rax, 0
	mov	qword [rdi + r11 * 8], rax
	mov	rdi, qword [ color__ ]
	mov	rax, 0
	mov	qword [rdi + r9 * 8], rax
	jmp	Label_64
Label_66:
Label_64:
Label_60:
	mov	rdi, r9
	add	r9, 1
	jmp	Label_63
Label_61:
Label_47:
Label_19:
	jmp	Label_10
Label_12:
Label_10:
Label_9:
	add	rbp, 8
	pop	r12
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	mov	rdi, 10
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	call	malloc
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, 10
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ color__ ], rdi
	mov	rdi, 1
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	call	malloc
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, 1
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ count__ ], rdi
	push	rdi
	push	rsi
	mov	rdi, 3
	call	origin
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	mov	rdi, 0
	mov	rsi, 0
	mov	rdx, 0
	call	search
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rdi, qword [ count__ ]
	mov	rsi, 0
	push	rdi
	push	rsi
	mov	rdi, qword [rdi + rsi * 8]
	call	toString
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	call	println
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, 0
	jmp	Label_70
Label_70:
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
