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
	db	32, 0
A__:
	dq	0
B__:
	dq	0
C__:
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
main:
	push	rbp
	mov	rbp, rsp
	push	r12
	push	r13
	push	r14
	sub	rbp, 24
	mov	r10, 0
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	call	getInt
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r11, rdi
Label_4:
	cmp	r10, r11
	jl	Label_3
	jmp	Label_2
Label_3:
	mov	rcx, r10
	add	rcx, 1
	mov	rdi, rcx
	mov	qword [ A__ ], rdi
	mov	rcx, r10
	add	rcx, 1
	mov	rdi, rcx
	mov	qword [ B__ ], rdi
	mov	rcx, r10
	add	rcx, 1
	mov	rdi, rcx
	mov	qword [ C__ ], rdi
Label_8:
	mov	rax, 1
	mov	rcx, 29
	shl	rax, cl
	mov	rdi, rax
	mov	rax, qword [ C__ ]
	cmp	rax, rdi
	jl	Label_9
	mov	rdi, 0
	jmp	Label_10
Label_9:
	mov	rax, 1
	mov	rcx, 29
	shl	rax, cl
	mov	rdi, rax
	neg	rdi
	mov	rcx, qword [ C__ ]
	cmp	rcx, rdi
	setg	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_10:
	cmp	rdi, 1
	je	Label_7
	jmp	Label_6
Label_7:
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rdi, rcx
	add	rdi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	sub	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	sub	r8, r9
	sub	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	sub	r9, r12
	add	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	add	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	sub	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r14, rcx
	sub	r13, r14
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r14, rcx
	add	r14, qword [ B__ ]
	add	r13, r14
	add	r12, r13
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	qword [ A__ ], rdi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rdi, rcx
	add	rdi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	sub	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	sub	r8, r9
	sub	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	sub	r9, r12
	add	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	add	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	sub	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r14, rcx
	sub	r13, r14
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r14, rcx
	add	r14, qword [ B__ ]
	add	r13, r14
	add	r12, r13
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	qword [ B__ ], rdi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rdi, rcx
	add	rdi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	sub	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	rsi, rcx
	add	rsi, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	sub	r8, r9
	sub	rsi, r8
	add	rdi, rsi
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	rsi, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	add	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r8, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	sub	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	sub	r9, r12
	add	r8, r9
	add	rsi, r8
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r8, rcx
	add	r8, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	sub	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	add	r8, r9
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r9, rcx
	add	r9, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	add	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	sub	r8, r9
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r9, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	sub	r9, r12
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r12, rcx
	add	r12, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	add	r9, r12
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r12, rcx
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	add	r12, r13
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r13, rcx
	sub	r12, r13
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r13, rcx
	add	r13, qword [ B__ ]
	mov	rcx, qword [ A__ ]
	add	rcx, qword [ B__ ]
	mov	r14, rcx
	sub	r13, r14
	mov	rcx, qword [ C__ ]
	sub	rcx, qword [ A__ ]
	mov	r14, rcx
	add	r14, qword [ B__ ]
	add	r13, r14
	add	r12, r13
	sub	r9, r12
	sub	r8, r9
	add	rsi, r8
	sub	rdi, rsi
	mov	qword [ C__ ], rdi
Label_5:
	jmp	Label_8
Label_6:
	mov	eax, r10d
	mov	ecx, 1000
	cdq
	idiv	ecx
	mov	edi, edx
	cmp	rdi, 0
	je	Label_12
	jmp	Label_13
Label_12:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [ A__ ]
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
	mov	rsi, str__0
	call	string.add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rsi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [ B__ ]
	call	toString
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r8, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, rsi
	mov	rsi, r8
	call	string.add
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
	mov	rsi, str__1
	call	string.add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rsi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [ C__ ]
	call	toString
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r8, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, rsi
	mov	rsi, r8
	call	string.add
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
	call	println
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_11
Label_13:
Label_11:
Label_1:
	add	r10, 1
	jmp	Label_4
Label_2:
	mov	rax, 0
	jmp	Label_0
Label_0:
	add	rbp, 24
	pop	r14
	pop	r13
	pop	r12
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
