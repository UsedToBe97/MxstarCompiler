global main

extern puts
extern getchar
extern putchar
extern __stack_chk_fail
extern malloc
extern __isoc99_scanf
section .data
	dq	1
str__0:
	db	32, 0
	dq	0
str__1:
	db	0
	dq	79
str__2:
	db	83, 111, 114, 114, 121, 44, 32, 116, 104, 101, 32, 110, 117, 109, 98, 101, 114, 32, 110, 32, 109, 117, 115, 116, 32, 98, 101, 32, 97, 32, 110, 117, 109, 98, 101, 114, 32, 115, 46, 116, 46, 32, 116, 104, 101, 114, 101, 32, 101, 120, 105, 115, 116, 115, 32, 105, 32, 115, 97, 116, 105, 115, 102, 121, 105, 110, 103, 32, 110, 61, 49, 43, 50, 43, 46, 46, 46, 43, 105, 0
	dq	12
str__3:
	db	76, 101, 116, 39, 115, 32, 115, 116, 97, 114, 116, 33, 0
	dq	5
str__4:
	db	115, 116, 101, 112, 32, 0
	dq	1
str__5:
	db	58, 0
	dq	7
str__6:
	db	84, 111, 116, 97, 108, 58, 32, 0
	dq	8
str__7:
	db	32, 115, 116, 101, 112, 40, 115, 41, 0
n:
	dq	0
h:
	dq	0
now:
	dq	0
a:
	dq	0
A:
	dq	0
M:
	dq	0
Q:
	dq	0
R:
	dq	0
seed:
	dq	0
section .text
random:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	rax, qword [ seed ]
	mov	rcx, qword [ Q ]
	cqo
	idiv	rcx
	mov	qword [rbp - 24], rdx
	mov	rdx, qword [ A ]
	imul	rdx, qword [rbp - 24]
	mov	qword [rbp - 16], rdx
	mov	rax, qword [ seed ]
	mov	rcx, qword [ Q ]
	cqo
	idiv	rcx
	mov	qword [rbp - 40], rax
	mov	rdx, qword [ R ]
	imul	rdx, qword [rbp - 40]
	mov	qword [rbp - 32], rdx
	mov	rdx, qword [rbp - 16]
	sub	rdx, qword [rbp - 32]
	mov	qword [rbp - 8], rdx
	mov	rax, qword [rbp - 8]
	mov	qword [rbp - 48], rax
	mov	rcx, qword [rbp - 48]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 56], rcx
	cmp	qword [rbp - 56], 1
	je	Label_2
	jmp	Label_3
Label_2:
	mov	rax, qword [rbp - 48]
	mov	qword [ seed ], rax
	jmp	Label_1
Label_3:
	mov	rdx, qword [rbp - 48]
	add	rdx, qword [ M ]
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	mov	qword [ seed ], rax
Label_1:
	mov	rax, qword [ seed ]
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
initialize:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 8
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, qword [rbp - 8]
	mov	qword [ seed ], rax
Label_4:
	mov	rsp, rbp
	pop	rbp
	ret
swap:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 56
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rax, qword [ a ]
	mov	qword [rbp - 24], rax
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbx]
	mov	qword [rbp - 32], rax
	mov	rax, qword [ a ]
	mov	qword [rbp - 40], rax
	mov	rax, qword [ a ]
	mov	qword [rbp - 48], rax
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 48]
	mov	rax, qword [rbx]
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
	mov	rax, qword [ a ]
	mov	qword [rbp - 56], rax
	mov	rax, qword [rbp - 32]
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 56]
	mov	qword [rbx], rax
Label_5:
	mov	rsp, rbp
	pop	rbp
	ret
pd:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	rax, rdi
	mov	qword [rbp - 8], rax
Label_10:
	mov	rcx, qword [ h ]
	cmp	rcx, qword [rbp - 8]
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 16], rcx
	cmp	qword [rbp - 16], 1
	je	Label_9
	jmp	Label_8
Label_9:
	mov	rdx, qword [ h ]
	add	rdx, 1
	mov	qword [rbp - 48], rdx
	mov	rdx, qword [ h ]
	imul	rdx, qword [rbp - 48]
	mov	qword [rbp - 40], rdx
	mov	rax, qword [rbp - 40]
	mov	rcx, 2
	cqo
	idiv	rcx
	mov	qword [rbp - 32], rax
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [rbp - 32]
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 24], rcx
	cmp	qword [rbp - 24], 1
	je	Label_12
	jmp	Label_13
Label_12:
	mov	rax, 1
	jmp	Label_6
	jmp	Label_11
Label_13:
Label_11:
Label_7:
	mov	rdx, qword [ h ]
	add	rdx, 1
	mov	qword [ h ], rdx
	jmp	Label_10
Label_8:
	mov	rax, 0
	jmp	Label_6
Label_6:
	mov	rsp, rbp
	pop	rbp
	ret
show:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	rax, 0
	mov	qword [rbp - 8], rax
Label_18:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [ now ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 16], rcx
	cmp	qword [rbp - 16], 1
	je	Label_17
	jmp	Label_16
Label_17:
	mov	rax, qword [ a ]
	mov	qword [rbp - 40], rax
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	rax, qword [rbx]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 48]
	mov	rdi, rax
	mov	rax, str__0
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 32], rax
	mov	rax, qword [rbp - 32]
	mov	rdi, rax
	call	print
	mov	qword [rbp - 56], rax
Label_15:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 8], rdx
	jmp	Label_18
Label_16:
	mov	rax, str__1
	mov	rdi, rax
	call	println
	mov	qword [rbp - 64], rax
Label_14:
	mov	rsp, rbp
	pop	rbp
	ret
win:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 136
	mov	rax, 100
	mov	qword [rbp - 24], rax
	mov	rdx, qword [rbp - 24]
	add	rdx, 1
	mov	qword [rbp - 24], rdx
	mov	rdx, qword [rbp - 24]
	imul	rdx, 8
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 32], rax
	mov	rax, 100
	mov	rbx, qword [rbp - 32]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 32]
	add	rdx, 8
	mov	qword [rbp - 32], rdx
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 40], rax
	mov	rcx, qword [ now ]
	cmp	rcx, qword [ h ]
	setne	cl
	movzx	rcx, cl
	mov	qword [rbp - 56], rcx
	cmp	qword [rbp - 56], 1
	je	Label_21
	jmp	Label_22
Label_21:
	mov	rax, 0
	jmp	Label_19
	jmp	Label_20
Label_22:
Label_20:
	mov	rax, 0
	mov	qword [rbp - 16], rax
Label_26:
	mov	rcx, qword [rbp - 16]
	cmp	rcx, qword [ now ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 64], rcx
	cmp	qword [rbp - 64], 1
	je	Label_25
	jmp	Label_24
Label_25:
	mov	rax, qword [ a ]
	mov	qword [rbp - 72], rax
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 72]
	mov	rax, qword [rbx]
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
Label_23:
	mov	rdx, qword [rbp - 16]
	add	rdx, 1
	mov	qword [rbp - 16], rdx
	jmp	Label_26
Label_24:
	mov	rax, 0
	mov	qword [rbp - 8], rax
Label_30:
	mov	rdx, qword [ now ]
	sub	rdx, 1
	mov	qword [rbp - 88], rdx
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [rbp - 88]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 80], rcx
	cmp	qword [rbp - 80], 1
	je	Label_29
	jmp	Label_28
Label_29:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 96], rdx
	mov	rax, qword [rbp - 96]
	mov	qword [rbp - 16], rax
Label_34:
	mov	rcx, qword [rbp - 16]
	cmp	rcx, qword [ now ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 104], rcx
	cmp	qword [rbp - 104], 1
	je	Label_33
	jmp	Label_32
Label_33:
	mov	r9, qword [rbp - 8]
	imul	r9, 8
	add	r9, qword [rbp - 40]
	mov	r8, qword [rbp - 16]
	imul	r8, 8
	add	r8, qword [rbp - 40]
	mov	rcx, qword [r9]
	cmp	rcx, qword [r8]
	setg	cl
	movzx	rcx, cl
	mov	qword [rbp - 112], rcx
	cmp	qword [rbp - 112], 1
	je	Label_36
	jmp	Label_37
Label_36:
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	rax, qword [rbx]
	mov	qword [rbp - 48], rax
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	rax, qword [rbx]
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
	mov	rax, qword [rbp - 48]
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
	jmp	Label_35
Label_37:
Label_35:
Label_31:
	mov	rdx, qword [rbp - 16]
	add	rdx, 1
	mov	qword [rbp - 16], rdx
	jmp	Label_34
Label_32:
Label_27:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 8], rdx
	jmp	Label_30
Label_28:
	mov	rax, 0
	mov	qword [rbp - 8], rax
Label_41:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [ now ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 120], rcx
	cmp	qword [rbp - 120], 1
	je	Label_40
	jmp	Label_39
Label_40:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 136], rdx
	mov	r9, qword [rbp - 8]
	imul	r9, 8
	add	r9, qword [rbp - 40]
	mov	rcx, qword [r9]
	cmp	rcx, qword [rbp - 136]
	setne	cl
	movzx	rcx, cl
	mov	qword [rbp - 128], rcx
	cmp	qword [rbp - 128], 1
	je	Label_43
	jmp	Label_44
Label_43:
	mov	rax, 0
	jmp	Label_19
	jmp	Label_42
Label_44:
Label_42:
Label_38:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 8], rdx
	jmp	Label_41
Label_39:
	mov	rax, 1
	jmp	Label_19
Label_19:
	mov	rsp, rbp
	pop	rbp
	ret
merge:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 104
	mov	rax, 0
	mov	qword [rbp - 8], rax
Label_49:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [ now ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 16], rcx
	cmp	qword [rbp - 16], 1
	je	Label_48
	jmp	Label_47
Label_48:
	mov	rax, qword [ a ]
	mov	qword [rbp - 32], rax
	mov	r9, qword [rbp - 8]
	imul	r9, 8
	add	r9, qword [rbp - 32]
	mov	rcx, qword [r9]
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 24], rcx
	cmp	qword [rbp - 24], 1
	je	Label_51
	jmp	Label_52
Label_51:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 48], rdx
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 40], rax
Label_56:
	mov	rcx, qword [rbp - 40]
	cmp	rcx, qword [ now ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 56], rcx
	cmp	qword [rbp - 56], 1
	je	Label_55
	jmp	Label_54
Label_55:
	mov	rax, qword [ a ]
	mov	qword [rbp - 72], rax
	mov	r9, qword [rbp - 40]
	imul	r9, 8
	add	r9, qword [rbp - 72]
	mov	rcx, qword [r9]
	cmp	rcx, 0
	setne	cl
	movzx	rcx, cl
	mov	qword [rbp - 64], rcx
	cmp	qword [rbp - 64], 1
	je	Label_58
	jmp	Label_59
Label_58:
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	mov	rax, qword [rbp - 40]
	mov	rsi, rax
	call	swap
	mov	qword [rbp - 80], rax
	jmp	Label_54
	jmp	Label_57
Label_59:
Label_57:
Label_53:
	mov	rdx, qword [rbp - 40]
	add	rdx, 1
	mov	qword [rbp - 40], rdx
	jmp	Label_56
Label_54:
	jmp	Label_50
Label_52:
Label_50:
Label_46:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 8], rdx
	jmp	Label_49
Label_47:
	mov	rax, 0
	mov	qword [rbp - 8], rax
Label_63:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [ now ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 88], rcx
	cmp	qword [rbp - 88], 1
	je	Label_62
	jmp	Label_61
Label_62:
	mov	rax, qword [ a ]
	mov	qword [rbp - 104], rax
	mov	r9, qword [rbp - 8]
	imul	r9, 8
	add	r9, qword [rbp - 104]
	mov	rcx, qword [r9]
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 96], rcx
	cmp	qword [rbp - 96], 1
	je	Label_65
	jmp	Label_66
Label_65:
	mov	rax, qword [rbp - 8]
	mov	qword [ now ], rax
	jmp	Label_61
	jmp	Label_64
Label_66:
Label_64:
Label_60:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 8], rdx
	jmp	Label_63
Label_61:
Label_45:
	mov	rsp, rbp
	pop	rbp
	ret
move:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 56
	mov	rax, 0
	mov	qword [rbp - 8], rax
Label_71:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [ now ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 16], rcx
	cmp	qword [rbp - 16], 1
	je	Label_70
	jmp	Label_69
Label_70:
	mov	rax, qword [ a ]
	mov	qword [rbp - 24], rax
	mov	r9, qword [rbp - 8]
	imul	r9, 8
	add	r9, qword [rbp - 24]
	mov	r10, qword [rbp - 8]
	imul	r10, 8
	add	r10, qword [rbp - 24]
	mov	rdx, qword [r9]
	sub	rdx, 1
	mov	qword [r10], rdx
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 32], rdx
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 8], rax
Label_68:
	jmp	Label_71
Label_69:
	mov	rax, qword [ a ]
	mov	qword [rbp - 40], rax
	mov	rax, qword [ now ]
	mov	qword [rbp - 48], rax
	mov	rax, qword [ now ]
	mov	rbx, qword [rbp - 48]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
	mov	rax, qword [ now ]
	mov	qword [rbp - 56], rax
	mov	rdx, qword [ now ]
	add	rdx, 1
	mov	qword [ now ], rdx
Label_67:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 448
	mov	rax, 48271
	mov	qword [ A ], rax
	mov	rax, 2147483647
	mov	qword [ M ], rax
	mov	rax, 1
	mov	qword [ seed ], rax
	mov	rax, 0
	mov	qword [rbp - 8], rax
	mov	rax, 0
	mov	qword [rbp - 16], rax
	mov	rax, 0
	mov	qword [rbp - 24], rax
	mov	rdx, 3
	imul	rdx, 7
	mov	qword [rbp - 40], rdx
	mov	rdx, qword [rbp - 40]
	imul	rdx, 10
	mov	qword [rbp - 32], rdx
	mov	rax, qword [rbp - 32]
	mov	qword [ n ], rax
	mov	rax, 0
	mov	qword [ h ], rax
	mov	rax, 100
	mov	qword [rbp - 48], rax
	mov	rdx, qword [rbp - 48]
	add	rdx, 1
	mov	qword [rbp - 48], rdx
	mov	rdx, qword [rbp - 48]
	imul	rdx, 8
	mov	qword [rbp - 48], rdx
	mov	rax, qword [rbp - 48]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 56], rax
	mov	rax, 100
	mov	rbx, qword [rbp - 56]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 56]
	add	rdx, 8
	mov	qword [rbp - 56], rdx
	mov	rax, qword [rbp - 56]
	mov	qword [ a ], rax
	mov	rax, qword [ M ]
	mov	rcx, qword [ A ]
	cqo
	idiv	rcx
	mov	qword [rbp - 64], rax
	mov	rax, qword [rbp - 64]
	mov	qword [ Q ], rax
	mov	rax, qword [ M ]
	mov	rcx, qword [ A ]
	cqo
	idiv	rcx
	mov	qword [rbp - 72], rdx
	mov	rax, qword [rbp - 72]
	mov	qword [ R ], rax
	mov	rax, qword [ n ]
	mov	rdi, rax
	call	pd
	mov	qword [rbp - 80], rax
	mov	rax, qword [rbp - 80]
	mov	qword [rbp - 88], rax
	xor	qword [rbp - 88], 1
	cmp	qword [rbp - 88], 1
	je	Label_74
	jmp	Label_75
Label_74:
	mov	rax, str__2
	mov	rdi, rax
	call	println
	mov	qword [rbp - 96], rax
	mov	rax, 1
	jmp	Label_72
	jmp	Label_73
Label_75:
Label_73:
	mov	rax, str__3
	mov	rdi, rax
	call	println
	mov	qword [rbp - 104], rax
	mov	rax, 3654898
	mov	rdi, rax
	call	initialize
	mov	qword [rbp - 112], rax
	call	random
	mov	qword [rbp - 136], rax
	mov	rax, qword [rbp - 136]
	mov	rcx, 10
	cqo
	idiv	rcx
	mov	qword [rbp - 128], rdx
	mov	rdx, qword [rbp - 128]
	add	rdx, 1
	mov	qword [rbp - 120], rdx
	mov	rax, qword [rbp - 120]
	mov	qword [ now ], rax
	mov	rax, qword [ now ]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 144], rax
	mov	rax, qword [rbp - 144]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 152], rax
Label_79:
	mov	rdx, qword [ now ]
	sub	rdx, 1
	mov	qword [rbp - 168], rdx
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [rbp - 168]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 160], rcx
	cmp	qword [rbp - 160], 1
	je	Label_78
	jmp	Label_77
Label_78:
	mov	rax, qword [ a ]
	mov	qword [rbp - 176], rax
	call	random
	mov	qword [rbp - 200], rax
	mov	rax, qword [rbp - 200]
	mov	rcx, 10
	cqo
	idiv	rcx
	mov	qword [rbp - 192], rdx
	mov	rdx, qword [rbp - 192]
	add	rdx, 1
	mov	qword [rbp - 184], rdx
	mov	rax, qword [rbp - 184]
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 176]
	mov	qword [rbx], rax
Label_83:
	mov	rax, qword [ a ]
	mov	qword [rbp - 224], rax
	mov	r9, qword [rbp - 8]
	imul	r9, 8
	add	r9, qword [rbp - 224]
	mov	rdx, qword [r9]
	add	rdx, qword [rbp - 16]
	mov	qword [rbp - 216], rdx
	mov	rcx, qword [rbp - 216]
	cmp	rcx, qword [ n ]
	setg	cl
	movzx	rcx, cl
	mov	qword [rbp - 208], rcx
	cmp	qword [rbp - 208], 1
	je	Label_82
	jmp	Label_81
Label_82:
	mov	rax, qword [ a ]
	mov	qword [rbp - 232], rax
	call	random
	mov	qword [rbp - 256], rax
	mov	rax, qword [rbp - 256]
	mov	rcx, 10
	cqo
	idiv	rcx
	mov	qword [rbp - 248], rdx
	mov	rdx, qword [rbp - 248]
	add	rdx, 1
	mov	qword [rbp - 240], rdx
	mov	rax, qword [rbp - 240]
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 232]
	mov	qword [rbx], rax
Label_80:
	jmp	Label_83
Label_81:
	mov	rax, qword [ a ]
	mov	qword [rbp - 272], rax
	mov	r8, qword [rbp - 8]
	imul	r8, 8
	add	r8, qword [rbp - 272]
	mov	rdx, qword [rbp - 16]
	add	rdx, qword [r8]
	mov	qword [rbp - 264], rdx
	mov	rax, qword [rbp - 264]
	mov	qword [rbp - 16], rax
Label_76:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 8], rdx
	jmp	Label_79
Label_77:
	mov	rax, qword [ a ]
	mov	qword [rbp - 280], rax
	mov	rdx, qword [ now ]
	sub	rdx, 1
	mov	qword [rbp - 288], rdx
	mov	rdx, qword [ n ]
	sub	rdx, qword [rbp - 16]
	mov	qword [rbp - 296], rdx
	mov	rax, qword [rbp - 296]
	mov	rbx, qword [rbp - 288]
	imul	rbx, 8
	add	rbx, qword [rbp - 280]
	mov	qword [rbx], rax
	call	show
	mov	qword [rbp - 304], rax
	call	merge
	mov	qword [rbp - 312], rax
Label_87:
	call	win
	mov	qword [rbp - 320], rax
	mov	rax, qword [rbp - 320]
	mov	qword [rbp - 328], rax
	xor	qword [rbp - 328], 1
	cmp	qword [rbp - 328], 1
	je	Label_86
	jmp	Label_85
Label_86:
	mov	rdx, qword [rbp - 24]
	add	rdx, 1
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 368], rax
	mov	rax, str__4
	mov	rdi, rax
	mov	rax, qword [rbp - 368]
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 360], rax
	mov	rax, qword [rbp - 360]
	mov	rdi, rax
	mov	rax, str__5
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 344], rax
	mov	rax, qword [rbp - 344]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 376], rax
	call	move
	mov	qword [rbp - 384], rax
	call	merge
	mov	qword [rbp - 392], rax
	call	show
	mov	qword [rbp - 400], rax
Label_84:
	jmp	Label_87
Label_85:
	mov	rax, qword [rbp - 24]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 440], rax
	mov	rax, str__6
	mov	rdi, rax
	mov	rax, qword [rbp - 440]
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 432], rax
	mov	rax, qword [rbp - 432]
	mov	rdi, rax
	mov	rax, str__7
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 416], rax
	mov	rax, qword [rbp - 416]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 448], rax
	mov	rax, 0
	jmp	Label_72
Label_72:
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
	mov     dword [rbp-4H], 0
	jmp     Lprt_002
Lprt_001:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	mov     edi, eax
	call    putchar
	add     dword [rbp-4H], 1
Lprt_002:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jnz     Lprt_001
	nop
	        leave
	ret
