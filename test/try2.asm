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
	cmp	rdi, rsi
	jl	Label_1
	mov	rdi, 0
	jmp	Label_2
Label_1:
	mov	rcx, rdi
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_2:
	mov	rax, rdi
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r12
	push	r13
	push	r14
	sub	rbp, 32
	sub	rsp, 40
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
	mov	rsi, rdi
	mov	r10, 0
	mov	r13, 0
	mov	r11, 0
	mov	r8, 0
	mov	rcx, rsi
	sub	rcx, 1
	mov	rdi, rcx
	mov	r9, rdi
	mov	rcx, rsi
	sub	rcx, 1
	mov	rdi, rcx
	mov	r12, rdi
	mov	r15, 0
	mov	rax, 0
	mov	qword [rbp - 8], rax
	mov	rdi, 0
	mov	r14, 0
	mov	rcx, rsi
	imul	rcx, rsi
	mov	r15, rcx
	mov	rdi, r15
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	call	malloc
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], r15
	add	rdi, 8
	mov	qword [rbp - 16], rdi
	mov	r15, 0
Label_7:
	mov	rcx, rsi
	imul	rcx, rsi
	mov	rdi, rcx
	cmp	r15, rdi
	jl	Label_6
	jmp	Label_5
Label_6:
	mov	rbx, r15
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	rax, 0
	mov	qword [rbx], rax
Label_4:
	mov	rdi, r15
	add	r15, 1
	jmp	Label_7
Label_5:
	mov	rcx, rsi
	imul	rcx, rsi
	mov	r15, rcx
	mov	rdi, r15
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	call	malloc
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], r15
	add	rdi, 8
	mov	qword [rbp - 24], rdi
	mov	r15, 0
Label_11:
	mov	rcx, rsi
	imul	rcx, rsi
	mov	rdi, rcx
	cmp	r15, rdi
	jl	Label_10
	jmp	Label_9
Label_10:
	mov	rbx, r15
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, 0
	mov	qword [rbx], rax
Label_8:
	mov	rdi, r15
	add	r15, 1
	jmp	Label_11
Label_9:
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	call	malloc
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	qword [rbp - 32], rdi
	mov	r15, 0
Label_15:
	cmp	r15, rsi
	jl	Label_14
	jmp	Label_13
Label_14:
	mov	rdi, rsi
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	call	malloc
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], rsi
	add	rdi, 8
	mov	rbx, r15
	imul	rbx, 8
	add	rbx, qword [rbp - 32]
	mov	qword [rbx], rdi
	mov	rdi, 0
Label_19:
	cmp	rdi, rsi
	jl	Label_18
	jmp	Label_17
Label_18:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	rax, qword [rax]
	mov	qword [rbp - 8], rax
	mov	rax, 1
	mov	qword [rbp - 40], rax
	neg	qword [rbp - 40]
	mov	rbx, rdi
	imul	rbx, 8
	add	rbx, qword [rbp - 8]
	mov	rax, qword [rbp - 40]
	mov	qword [rbx], rax
Label_16:
	mov	qword [rbp - 8], rdi
	add	rdi, 1
	jmp	Label_19
Label_17:
Label_12:
	mov	rdi, r15
	add	r15, 1
	jmp	Label_15
Label_13:
	mov	rdi, 0
	mov	rbx, rdi
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r11
	mov	rdi, 0
	mov	rbx, rdi
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	qword [rbx], r8
	mov	rax, r11
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	rdi, qword [rax]
	mov	rax, 0
	mov	qword [rdi + r8 * 8], rax
Label_23:
	cmp	r10, r13
	jle	Label_22
	jmp	Label_21
Label_22:
	mov	rax, r10
	imul	rax, 8
	add	rax, qword [rbp - 16]
	mov	rdi, qword [rax]
	mov	rax, rdi
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	rdi, qword [rax]
	mov	rax, r10
	imul	rax, 8
	add	rax, qword [rbp - 24]
	mov	r11, qword [rax]
	mov	rdi, qword [rdi + r11 * 8]
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 16]
	mov	rcx, qword [rcx]
	sub	rcx, 1
	mov	r11, rcx
	mov	r15, r11
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 24]
	mov	rcx, qword [rcx]
	sub	rcx, 2
	mov	r11, rcx
	mov	qword [rbp - 8], r11
	cmp	r15, rsi
	jl	Label_27
	mov	r11, 0
	jmp	Label_28
Label_27:
	mov	rcx, r15
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_28:
	cmp	r11, 1
	je	Label_29
	mov	r11, 0
	jmp	Label_30
Label_29:
	mov	rax, qword [rbp - 8]
	cmp	rax, rsi
	jl	Label_31
	mov	r11, 0
	jmp	Label_32
Label_31:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_32:
Label_30:
	cmp	r11, 1
	je	Label_33
	mov	r11, 0
	jmp	Label_34
Label_33:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	r8, 1
	neg	r8
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, r11
	mov	rcx, qword [rax]
	cmp	rcx, r8
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_34:
	cmp	r11, 1
	je	Label_25
	jmp	Label_26
Label_25:
	mov	rcx, r13
	add	rcx, 1
	mov	r11, rcx
	mov	r13, r11
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r15
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	rcx, rdi
	add	rcx, 1
	mov	r8, rcx
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, r11
	mov	qword [rbx], r8
	cmp	r15, r9
	je	Label_38
	mov	r11, 0
	jmp	Label_39
Label_38:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, r12
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_39:
	cmp	r11, 1
	je	Label_36
	jmp	Label_37
Label_36:
	mov	r14, 1
	jmp	Label_35
Label_37:
Label_35:
	jmp	Label_24
Label_26:
Label_24:
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 16]
	mov	rcx, qword [rcx]
	sub	rcx, 1
	mov	r11, rcx
	mov	r15, r11
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 24]
	mov	rcx, qword [rcx]
	add	rcx, 2
	mov	r11, rcx
	mov	qword [rbp - 8], r11
	cmp	r15, rsi
	jl	Label_43
	mov	r11, 0
	jmp	Label_44
Label_43:
	mov	rcx, r15
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_44:
	cmp	r11, 1
	je	Label_45
	mov	r11, 0
	jmp	Label_46
Label_45:
	mov	rax, qword [rbp - 8]
	cmp	rax, rsi
	jl	Label_47
	mov	r11, 0
	jmp	Label_48
Label_47:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_48:
Label_46:
	cmp	r11, 1
	je	Label_49
	mov	r11, 0
	jmp	Label_50
Label_49:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	r8, 1
	neg	r8
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, r11
	mov	rcx, qword [rax]
	cmp	rcx, r8
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_50:
	cmp	r11, 1
	je	Label_41
	jmp	Label_42
Label_41:
	mov	rcx, r13
	add	rcx, 1
	mov	r11, rcx
	mov	r13, r11
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r15
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	rcx, rdi
	add	rcx, 1
	mov	r8, rcx
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, r11
	mov	qword [rbx], r8
	cmp	r15, r9
	je	Label_54
	mov	r11, 0
	jmp	Label_55
Label_54:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, r12
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_55:
	cmp	r11, 1
	je	Label_52
	jmp	Label_53
Label_52:
	mov	r14, 1
	jmp	Label_51
Label_53:
Label_51:
	jmp	Label_40
Label_42:
Label_40:
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 16]
	mov	rcx, qword [rcx]
	add	rcx, 1
	mov	r11, rcx
	mov	r15, r11
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 24]
	mov	rcx, qword [rcx]
	sub	rcx, 2
	mov	r11, rcx
	mov	qword [rbp - 8], r11
	cmp	r15, rsi
	jl	Label_59
	mov	r11, 0
	jmp	Label_60
Label_59:
	mov	rcx, r15
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_60:
	cmp	r11, 1
	je	Label_61
	mov	r11, 0
	jmp	Label_62
Label_61:
	mov	rax, qword [rbp - 8]
	cmp	rax, rsi
	jl	Label_63
	mov	r11, 0
	jmp	Label_64
Label_63:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_64:
Label_62:
	cmp	r11, 1
	je	Label_65
	mov	r11, 0
	jmp	Label_66
Label_65:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	r8, 1
	neg	r8
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, r11
	mov	rcx, qword [rax]
	cmp	rcx, r8
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_66:
	cmp	r11, 1
	je	Label_57
	jmp	Label_58
Label_57:
	mov	rcx, r13
	add	rcx, 1
	mov	r11, rcx
	mov	r13, r11
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r15
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	rcx, rdi
	add	rcx, 1
	mov	r8, rcx
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, r11
	mov	qword [rbx], r8
	cmp	r15, r9
	je	Label_70
	mov	r11, 0
	jmp	Label_71
Label_70:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, r12
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_71:
	cmp	r11, 1
	je	Label_68
	jmp	Label_69
Label_68:
	mov	r14, 1
	jmp	Label_67
Label_69:
Label_67:
	jmp	Label_56
Label_58:
Label_56:
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 16]
	mov	rcx, qword [rcx]
	add	rcx, 1
	mov	r11, rcx
	mov	r15, r11
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 24]
	mov	rcx, qword [rcx]
	add	rcx, 2
	mov	r11, rcx
	mov	qword [rbp - 8], r11
	cmp	r15, rsi
	jl	Label_75
	mov	r11, 0
	jmp	Label_76
Label_75:
	mov	rcx, r15
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_76:
	cmp	r11, 1
	je	Label_77
	mov	r11, 0
	jmp	Label_78
Label_77:
	mov	rax, qword [rbp - 8]
	cmp	rax, rsi
	jl	Label_79
	mov	r11, 0
	jmp	Label_80
Label_79:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_80:
Label_78:
	cmp	r11, 1
	je	Label_81
	mov	r11, 0
	jmp	Label_82
Label_81:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	r8, 1
	neg	r8
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, r11
	mov	rcx, qword [rax]
	cmp	rcx, r8
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_82:
	cmp	r11, 1
	je	Label_73
	jmp	Label_74
Label_73:
	mov	rcx, r13
	add	rcx, 1
	mov	r11, rcx
	mov	r13, r11
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r15
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	rcx, rdi
	add	rcx, 1
	mov	r8, rcx
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, r11
	mov	qword [rbx], r8
	cmp	r15, r9
	je	Label_86
	mov	r11, 0
	jmp	Label_87
Label_86:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, r12
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_87:
	cmp	r11, 1
	je	Label_84
	jmp	Label_85
Label_84:
	mov	r14, 1
	jmp	Label_83
Label_85:
Label_83:
	jmp	Label_72
Label_74:
Label_72:
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 16]
	mov	rcx, qword [rcx]
	sub	rcx, 2
	mov	r11, rcx
	mov	r15, r11
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 24]
	mov	rcx, qword [rcx]
	sub	rcx, 1
	mov	r11, rcx
	mov	qword [rbp - 8], r11
	cmp	r15, rsi
	jl	Label_91
	mov	r11, 0
	jmp	Label_92
Label_91:
	mov	rcx, r15
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_92:
	cmp	r11, 1
	je	Label_93
	mov	r11, 0
	jmp	Label_94
Label_93:
	mov	rax, qword [rbp - 8]
	cmp	rax, rsi
	jl	Label_95
	mov	r11, 0
	jmp	Label_96
Label_95:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_96:
Label_94:
	cmp	r11, 1
	je	Label_97
	mov	r11, 0
	jmp	Label_98
Label_97:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	r8, 1
	neg	r8
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, r11
	mov	rcx, qword [rax]
	cmp	rcx, r8
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_98:
	cmp	r11, 1
	je	Label_89
	jmp	Label_90
Label_89:
	mov	rcx, r13
	add	rcx, 1
	mov	r11, rcx
	mov	r13, r11
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r15
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	rcx, rdi
	add	rcx, 1
	mov	r8, rcx
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, r11
	mov	qword [rbx], r8
	cmp	r15, r9
	je	Label_102
	mov	r11, 0
	jmp	Label_103
Label_102:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, r12
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_103:
	cmp	r11, 1
	je	Label_100
	jmp	Label_101
Label_100:
	mov	r14, 1
	jmp	Label_99
Label_101:
Label_99:
	jmp	Label_88
Label_90:
Label_88:
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 16]
	mov	rcx, qword [rcx]
	sub	rcx, 2
	mov	r11, rcx
	mov	r15, r11
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 24]
	mov	rcx, qword [rcx]
	add	rcx, 1
	mov	r11, rcx
	mov	qword [rbp - 8], r11
	cmp	r15, rsi
	jl	Label_107
	mov	r11, 0
	jmp	Label_108
Label_107:
	mov	rcx, r15
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_108:
	cmp	r11, 1
	je	Label_109
	mov	r11, 0
	jmp	Label_110
Label_109:
	mov	rax, qword [rbp - 8]
	cmp	rax, rsi
	jl	Label_111
	mov	r11, 0
	jmp	Label_112
Label_111:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_112:
Label_110:
	cmp	r11, 1
	je	Label_113
	mov	r11, 0
	jmp	Label_114
Label_113:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	r8, 1
	neg	r8
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, r11
	mov	rcx, qword [rax]
	cmp	rcx, r8
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_114:
	cmp	r11, 1
	je	Label_105
	jmp	Label_106
Label_105:
	mov	rcx, r13
	add	rcx, 1
	mov	r11, rcx
	mov	r13, r11
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r15
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	rcx, rdi
	add	rcx, 1
	mov	r8, rcx
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, r11
	mov	qword [rbx], r8
	cmp	r15, r9
	je	Label_118
	mov	r11, 0
	jmp	Label_119
Label_118:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, r12
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_119:
	cmp	r11, 1
	je	Label_116
	jmp	Label_117
Label_116:
	mov	r14, 1
	jmp	Label_115
Label_117:
Label_115:
	jmp	Label_104
Label_106:
Label_104:
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 16]
	mov	rcx, qword [rcx]
	add	rcx, 2
	mov	r11, rcx
	mov	r15, r11
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 24]
	mov	rcx, qword [rcx]
	sub	rcx, 1
	mov	r11, rcx
	mov	qword [rbp - 8], r11
	cmp	r15, rsi
	jl	Label_123
	mov	r11, 0
	jmp	Label_124
Label_123:
	mov	rcx, r15
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_124:
	cmp	r11, 1
	je	Label_125
	mov	r11, 0
	jmp	Label_126
Label_125:
	mov	rax, qword [rbp - 8]
	cmp	rax, rsi
	jl	Label_127
	mov	r11, 0
	jmp	Label_128
Label_127:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_128:
Label_126:
	cmp	r11, 1
	je	Label_129
	mov	r11, 0
	jmp	Label_130
Label_129:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	r8, 1
	neg	r8
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, r11
	mov	rcx, qword [rax]
	cmp	rcx, r8
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_130:
	cmp	r11, 1
	je	Label_121
	jmp	Label_122
Label_121:
	mov	rcx, r13
	add	rcx, 1
	mov	r11, rcx
	mov	r13, r11
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r15
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	rcx, rdi
	add	rcx, 1
	mov	r8, rcx
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, r11
	mov	qword [rbx], r8
	cmp	r15, r9
	je	Label_134
	mov	r11, 0
	jmp	Label_135
Label_134:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, r12
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_135:
	cmp	r11, 1
	je	Label_132
	jmp	Label_133
Label_132:
	mov	r14, 1
	jmp	Label_131
Label_133:
Label_131:
	jmp	Label_120
Label_122:
Label_120:
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 16]
	mov	rcx, qword [rcx]
	add	rcx, 2
	mov	r11, rcx
	mov	r15, r11
	mov	rcx, r10
	imul	rcx, 8
	add	rcx, qword [rbp - 24]
	mov	rcx, qword [rcx]
	add	rcx, 1
	mov	r11, rcx
	mov	qword [rbp - 8], r11
	cmp	r15, rsi
	jl	Label_139
	mov	r11, 0
	jmp	Label_140
Label_139:
	mov	rcx, r15
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_140:
	cmp	r11, 1
	je	Label_141
	mov	r11, 0
	jmp	Label_142
Label_141:
	mov	rax, qword [rbp - 8]
	cmp	rax, rsi
	jl	Label_143
	mov	r11, 0
	jmp	Label_144
Label_143:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_144:
Label_142:
	cmp	r11, 1
	je	Label_145
	mov	r11, 0
	jmp	Label_146
Label_145:
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	mov	r8, 1
	neg	r8
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, r11
	mov	rcx, qword [rax]
	cmp	rcx, r8
	sete	cl
	movzx	rcx, cl
	mov	r11, rcx
Label_146:
	cmp	r11, 1
	je	Label_137
	jmp	Label_138
Label_137:
	mov	rcx, r13
	add	rcx, 1
	mov	r11, rcx
	mov	r13, r11
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 16]
	mov	qword [rbx], r15
	mov	rbx, r13
	imul	rbx, 8
	add	rbx, qword [rbp - 24]
	mov	rax, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, r15
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	r11, qword [rax]
	add	rdi, 1
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, r11
	mov	qword [rbx], rdi
	cmp	r15, r9
	je	Label_150
	mov	rdi, 0
	jmp	Label_151
Label_150:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, r12
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
Label_151:
	cmp	rdi, 1
	je	Label_148
	jmp	Label_149
Label_148:
	mov	r14, 1
	jmp	Label_147
Label_149:
Label_147:
	jmp	Label_136
Label_138:
Label_136:
	cmp	r14, 1
	je	Label_153
	jmp	Label_154
Label_153:
	jmp	Label_21
	jmp	Label_152
Label_154:
Label_152:
	mov	rcx, r10
	add	rcx, 1
	mov	rdi, rcx
	mov	r10, rdi
Label_20:
	jmp	Label_23
Label_21:
	cmp	r14, 1
	je	Label_156
	jmp	Label_157
Label_156:
	mov	rax, r9
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	rdi, qword [rax]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rdi + r12 * 8]
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
	call	println
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_155
Label_157:
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
Label_155:
	mov	rax, 0
	jmp	Label_3
Label_3:
	add	rsp, 40
	add	rbp, 32
	pop	r14
	pop	r13
	pop	r12
	pop	r15
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
