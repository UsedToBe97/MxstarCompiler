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
	dq	0
str__0:
	db	0
	dq	0
str__1:
	db	0
	dq	18
str__2:
	db	110, 67, 104, 117, 110, 107, 32, 62, 32, 77, 65, 88, 67, 72, 85, 78, 75, 33, 0
	dq	0
str__3:
	db	0
	dq	13
str__4:
	db	73, 110, 118, 97, 108, 105, 100, 32, 105, 110, 112, 117, 116, 0
	dq	0
str__5:
	db	0
	dq	10
str__6:
	db	78, 111, 116, 32, 70, 111, 117, 110, 100, 33, 0
	dq	95
str__7:
	db	32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 0
asciiTable__:
	dq	0
MAXCHUNK__:
	dq	0
MAXLENGTH__:
	dq	0
chunks__:
	dq	0
inputBuffer__:
	dq	0
outputBuffer__:
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
hex2int:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	r8, 0
	mov	r11, 0
Label_4:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	call	string.length
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jl	Label_3
	jmp	Label_2
Label_3:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	mov	rsi, r11
	call	string.ord
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	rdi, 48
	jge	Label_8
	mov	rsi, 0
	jmp	Label_9
Label_8:
	mov	rcx, rdi
	cmp	rcx, 57
	setle	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_9:
	cmp	rsi, 1
	je	Label_6
	jmp	Label_7
Label_6:
	mov	rcx, r8
	imul	rcx, 16
	mov	rsi, rcx
	mov	rcx, rsi
	add	rcx, rdi
	mov	rdi, rcx
	sub	rdi, 48
	mov	r8, rdi
	jmp	Label_5
Label_7:
	cmp	rdi, 65
	jge	Label_12
	mov	rsi, 0
	jmp	Label_13
Label_12:
	mov	rcx, rdi
	cmp	rcx, 70
	setle	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_13:
	cmp	rsi, 1
	je	Label_10
	jmp	Label_11
Label_10:
	mov	rcx, r8
	imul	rcx, 16
	mov	rsi, rcx
	mov	rcx, rsi
	add	rcx, rdi
	mov	rdi, rcx
	sub	rdi, 65
	add	rdi, 10
	mov	r8, rdi
	jmp	Label_5
Label_11:
	cmp	rdi, 97
	jge	Label_16
	mov	rsi, 0
	jmp	Label_17
Label_16:
	mov	rcx, rdi
	cmp	rcx, 102
	setle	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_17:
	cmp	rsi, 1
	je	Label_14
	jmp	Label_15
Label_14:
	mov	rcx, r8
	imul	rcx, 16
	mov	rsi, rcx
	mov	rcx, rsi
	add	rcx, rdi
	mov	rdi, rcx
	sub	rdi, 97
	add	rdi, 10
	mov	r8, rdi
	jmp	Label_5
Label_15:
	mov	rax, 0
	jmp	Label_0
Label_5:
Label_1:
	mov	rdi, r11
	add	r11, 1
	jmp	Label_4
Label_2:
	mov	rax, r8
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
int2chr:
	push	rbp
	mov	rbp, rsp
	cmp	rdi, 32
	jge	Label_22
	mov	rsi, 0
	jmp	Label_23
Label_22:
	mov	rcx, rdi
	cmp	rcx, 126
	setle	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_23:
	cmp	rsi, 1
	je	Label_20
	jmp	Label_21
Label_20:
	mov	rcx, rdi
	sub	rcx, 32
	mov	rsi, rcx
	mov	rcx, rdi
	sub	rcx, 32
	mov	r10, rcx
	push	rdi
	push	rsi
	push	r10
	mov	rdi, qword [ asciiTable__ ]
	mov	rdx, r10
	call	string.substring
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, rdi
	jmp	Label_18
	jmp	Label_19
Label_21:
Label_19:
	mov	rax, str__0
	jmp	Label_18
Label_18:
	mov	rsp, rbp
	pop	rbp
	ret
toStringHex:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	rsi, str__1
	mov	r11, 28
Label_28:
	cmp	r11, 0
	jge	Label_27
	jmp	Label_26
Label_27:
	mov	rax, r10
	mov	rcx, r11
	shr	rax, cl
	mov	rdi, rax
	and	rdi, 15
	cmp	rdi, 10
	jl	Label_30
	jmp	Label_31
Label_30:
	mov	rcx, 48
	add	rcx, rdi
	mov	rdi, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	int2chr
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
	mov	rdi, rsi
	mov	rsi, r8
	call	string.add
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rsi, rdi
	jmp	Label_29
Label_31:
	mov	rcx, 65
	add	rcx, rdi
	mov	rdi, rcx
	sub	rdi, 10
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	int2chr
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
	mov	rdi, rsi
	mov	rsi, r8
	call	string.add
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rsi, rdi
Label_29:
Label_25:
	mov	rcx, r11
	sub	rcx, 4
	mov	rdi, rcx
	mov	r11, rdi
	jmp	Label_28
Label_26:
	mov	rax, rsi
	jmp	Label_24
Label_24:
	mov	rsp, rbp
	pop	rbp
	ret
rotate_left:
	push	rbp
	mov	rbp, rsp
	cmp	rsi, 1
	je	Label_34
	jmp	Label_35
Label_34:
	mov	rcx, rdi
	and	rcx, 2147483647
	mov	rsi, rcx
	mov	rax, rsi
	mov	rcx, 1
	shl	rax, cl
	mov	rsi, rax
	mov	rax, rdi
	mov	rcx, 31
	shr	rax, cl
	mov	rdi, rax
	and	rdi, 1
	mov	rcx, rsi
	or	rcx, rdi
	mov	rdi, rcx
	mov	rax, rdi
	jmp	Label_32
	jmp	Label_33
Label_35:
Label_33:
	cmp	rsi, 31
	je	Label_37
	jmp	Label_38
Label_37:
	mov	rcx, rdi
	and	rcx, 1
	mov	rsi, rcx
	mov	rax, rsi
	mov	rcx, 31
	shl	rax, cl
	mov	rsi, rax
	mov	rax, rdi
	mov	rcx, 1
	shr	rax, cl
	mov	rdi, rax
	and	rdi, 2147483647
	mov	rcx, rsi
	or	rcx, rdi
	mov	rdi, rcx
	mov	rax, rdi
	jmp	Label_32
	jmp	Label_36
Label_38:
Label_36:
	mov	rcx, 32
	sub	rcx, rsi
	mov	r10, rcx
	mov	rax, 1
	mov	rcx, r10
	shl	rax, cl
	mov	r10, rax
	sub	r10, 1
	mov	rcx, rdi
	and	rcx, r10
	mov	r10, rcx
	mov	rax, r10
	mov	rcx, rsi
	shl	rax, cl
	mov	r10, rax
	mov	rcx, 32
	sub	rcx, rsi
	mov	r11, rcx
	mov	rax, rdi
	mov	rcx, r11
	shr	rax, cl
	mov	rdi, rax
	mov	rax, 1
	mov	rcx, rsi
	shl	rax, cl
	mov	rsi, rax
	sub	rsi, 1
	and	rdi, rsi
	mov	rcx, r10
	or	rcx, rdi
	mov	rdi, rcx
	mov	rax, rdi
	jmp	Label_32
Label_32:
	mov	rsp, rbp
	pop	rbp
	ret
add:
	push	rbp
	mov	rbp, rsp
	mov	rcx, rdi
	and	rcx, 65535
	mov	r10, rcx
	mov	rcx, rsi
	and	rcx, 65535
	mov	r11, rcx
	add	r10, r11
	mov	rax, rdi
	mov	rcx, 16
	shr	rax, cl
	mov	rdi, rax
	and	rdi, 65535
	mov	rax, rsi
	mov	rcx, 16
	shr	rax, cl
	mov	rsi, rax
	and	rsi, 65535
	add	rdi, rsi
	mov	rax, r10
	mov	rcx, 16
	shr	rax, cl
	mov	rsi, rax
	add	rdi, rsi
	and	rdi, 65535
	mov	rax, rdi
	mov	rcx, 16
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, r10
	and	rcx, 65535
	mov	rsi, rcx
	or	rdi, rsi
	mov	rax, rdi
	jmp	Label_39
Label_39:
	mov	rsp, rbp
	pop	rbp
	ret
lohi:
	push	rbp
	mov	rbp, rsp
	mov	rax, rsi
	mov	rcx, 16
	shl	rax, cl
	mov	rsi, rax
	or	rdi, rsi
	mov	rax, rdi
	jmp	Label_40
Label_40:
	mov	rsp, rbp
	pop	rbp
	ret
sha1:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r12
	push	r13
	push	r14
	sub	rbp, 32
	sub	rsp, 56
	mov	rcx, rsi
	add	rcx, 64
	mov	r10, rcx
	sub	r10, 56
	mov	eax, r10d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r10d, eax
	add	r10, 1
	cmp	r10, qword [ MAXCHUNK__ ]
	jg	Label_43
	jmp	Label_44
Label_43:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, str__2
	call	println
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, 0
	jmp	Label_41
	jmp	Label_42
Label_44:
Label_42:
	mov	r11, 0
Label_48:
	cmp	r11, r10
	jl	Label_47
	jmp	Label_46
Label_47:
	mov	r8, 0
Label_52:
	cmp	r8, 80
	jl	Label_51
	jmp	Label_50
Label_51:
	mov	r9, qword [ chunks__ ]
	mov	r9, qword [r9 + r11 * 8]
	mov	rax, 0
	mov	qword [r9 + r8 * 8], rax
Label_49:
	mov	r9, r8
	add	r8, 1
	jmp	Label_52
Label_50:
Label_45:
	mov	r8, r11
	add	r11, 1
	jmp	Label_48
Label_46:
	mov	r11, 0
Label_56:
	cmp	r11, rsi
	jl	Label_55
	jmp	Label_54
Label_55:
	mov	r8, qword [ chunks__ ]
	mov	eax, r11d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r9d, eax
	mov	r8, qword [r8 + r9 * 8]
	mov	eax, r11d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r9d, edx
	mov	eax, r9d
	mov	ecx, 4
	cdq
	idiv	ecx
	mov	r9d, eax
	mov	r12, qword [ chunks__ ]
	mov	eax, r11d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r13d, eax
	mov	r12, qword [r12 + r13 * 8]
	mov	eax, r11d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r13d, edx
	mov	eax, r13d
	mov	ecx, 4
	cdq
	idiv	ecx
	mov	r13d, eax
	mov	eax, r11d
	mov	ecx, 4
	cdq
	idiv	ecx
	mov	r14d, edx
	mov	rcx, 3
	sub	rcx, r14
	mov	r14, rcx
	imul	r14, 8
	mov	rax, qword [rdi + r11 * 8]
	mov	rcx, r14
	shl	rax, cl
	mov	r14, rax
	mov	rcx, qword [r12 + r13 * 8]
	or	rcx, r14
	mov	r12, rcx
	mov	qword [r8 + r9 * 8], r12
Label_53:
	mov	r8, r11
	add	r11, 1
	jmp	Label_56
Label_54:
	mov	rdi, qword [ chunks__ ]
	mov	eax, r11d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r8d, eax
	mov	rdi, qword [rdi + r8 * 8]
	mov	eax, r11d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r8d, edx
	mov	eax, r8d
	mov	ecx, 4
	cdq
	idiv	ecx
	mov	r8d, eax
	mov	r9, qword [ chunks__ ]
	mov	eax, r11d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r12d, eax
	mov	r9, qword [r9 + r12 * 8]
	mov	eax, r11d
	mov	ecx, 64
	cdq
	idiv	ecx
	mov	r12d, edx
	mov	eax, r12d
	mov	ecx, 4
	cdq
	idiv	ecx
	mov	r12d, eax
	mov	eax, r11d
	mov	ecx, 4
	cdq
	idiv	ecx
	mov	r11d, edx
	mov	rcx, 3
	sub	rcx, r11
	mov	r11, rcx
	imul	r11, 8
	mov	rax, 128
	mov	rcx, r11
	shl	rax, cl
	mov	r11, rax
	mov	rcx, qword [r9 + r12 * 8]
	or	rcx, r11
	mov	r11, rcx
	mov	qword [rdi + r8 * 8], r11
	mov	rdi, qword [ chunks__ ]
	mov	rcx, r10
	sub	rcx, 1
	mov	r11, rcx
	mov	rdi, qword [rdi + r11 * 8]
	mov	r11, 15
	mov	rax, rsi
	mov	rcx, 3
	shl	rax, cl
	mov	r8, rax
	mov	qword [rdi + r11 * 8], r8
	mov	rdi, qword [ chunks__ ]
	mov	rcx, r10
	sub	rcx, 1
	mov	r11, rcx
	mov	rdi, qword [rdi + r11 * 8]
	mov	r11, 14
	mov	rax, rsi
	mov	rcx, 29
	shr	rax, cl
	mov	rsi, rax
	and	rsi, 7
	mov	qword [rdi + r11 * 8], rsi
	mov	r9, 1732584193
	mov	rax, 61389
	mov	rcx, 16
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, 43913
	or	rcx, rdi
	mov	rdi, rcx
	mov	r12, rdi
	mov	rax, 39098
	mov	rcx, 16
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, 56574
	or	rcx, rdi
	mov	rdi, rcx
	mov	r13, rdi
	mov	r14, 271733878
	mov	rax, 50130
	mov	rcx, 16
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, 57840
	or	rcx, rdi
	mov	rdi, rcx
	mov	r15, rdi
	mov	r11, 0
Label_60:
	cmp	r11, r10
	jl	Label_59
	jmp	Label_58
Label_59:
	mov	r8, 16
Label_64:
	cmp	r8, 80
	jl	Label_63
	jmp	Label_62
Label_63:
	mov	rdi, qword [ chunks__ ]
	mov	rax, qword [rdi + r11 * 8]
	mov	qword [rbp - 8], rax
	mov	rdi, qword [ chunks__ ]
	mov	rdi, qword [rdi + r11 * 8]
	mov	rcx, r8
	sub	rcx, 3
	mov	rsi, rcx
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 16], rax
	mov	rax, r11
	imul	rax, 8
	add	rax, qword [rbp - 16]
	mov	rax, qword [rax]
	mov	qword [rbp - 16], rax
	mov	rcx, r8
	sub	rcx, 8
	mov	qword [rbp - 24], rcx
	mov	rax, qword [rbp - 24]
	imul	rax, 8
	add	rax, qword [rbp - 16]
	mov	rcx, qword [rdi + rsi * 8]
	xor	rcx, qword [rax]
	mov	rdi, rcx
	mov	rsi, qword [ chunks__ ]
	mov	rsi, qword [rsi + r11 * 8]
	mov	rcx, r8
	sub	rcx, 14
	mov	qword [rbp - 16], rcx
	mov	rcx, qword [rbp - 16]
	imul	rcx, 8
	add	rcx, rsi
	xor	rdi, qword [rcx]
	mov	rsi, qword [ chunks__ ]
	mov	rsi, qword [rsi + r11 * 8]
	mov	rcx, r8
	sub	rcx, 16
	mov	qword [rbp - 16], rcx
	mov	rcx, qword [rbp - 16]
	imul	rcx, 8
	add	rcx, rsi
	xor	rdi, qword [rcx]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, 1
	call	rotate_left
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rbx, r8
	imul	rbx, 8
	add	rbx, qword [rbp - 8]
	mov	qword [rbx], rdi
Label_61:
	mov	rdi, r8
	add	r8, 1
	jmp	Label_64
Label_62:
	mov	qword [rbp - 8], r9
	mov	qword [rbp - 16], r12
	mov	qword [rbp - 24], r13
	mov	qword [rbp - 32], r14
	mov	qword [rbp - 40], r15
	mov	r8, 0
Label_68:
	cmp	r8, 80
	jl	Label_67
	jmp	Label_66
Label_67:
	cmp	r8, 20
	jl	Label_70
	jmp	Label_71
Label_70:
	mov	rcx, qword [rbp - 16]
	and	rcx, qword [rbp - 24]
	mov	rdi, rcx
	mov	rsi, qword [rbp - 16]
	not	rsi
	and	rsi, qword [rbp - 32]
	or	rdi, rsi
	mov	qword [rbp - 48], rdi
	mov	rax, 1518500249
	mov	qword [rbp - 56], rax
	jmp	Label_69
Label_71:
	cmp	r8, 40
	jl	Label_72
	jmp	Label_73
Label_72:
	mov	rcx, qword [rbp - 16]
	xor	rcx, qword [rbp - 24]
	mov	rdi, rcx
	xor	rdi, qword [rbp - 32]
	mov	qword [rbp - 48], rdi
	mov	rax, 1859775393
	mov	qword [rbp - 56], rax
	jmp	Label_69
Label_73:
	cmp	r8, 60
	jl	Label_74
	jmp	Label_75
Label_74:
	mov	rcx, qword [rbp - 16]
	and	rcx, qword [rbp - 24]
	mov	rdi, rcx
	mov	rcx, qword [rbp - 16]
	and	rcx, qword [rbp - 32]
	mov	rsi, rcx
	or	rdi, rsi
	mov	rcx, qword [rbp - 24]
	and	rcx, qword [rbp - 32]
	mov	rsi, rcx
	or	rdi, rsi
	mov	qword [rbp - 48], rdi
	mov	rax, 36635
	mov	rcx, 16
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, 48348
	or	rcx, rdi
	mov	rdi, rcx
	mov	qword [rbp - 56], rdi
	jmp	Label_69
Label_75:
	mov	rcx, qword [rbp - 16]
	xor	rcx, qword [rbp - 24]
	mov	rdi, rcx
	xor	rdi, qword [rbp - 32]
	mov	qword [rbp - 48], rdi
	mov	rax, 51810
	mov	rcx, 16
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, 49622
	or	rcx, rdi
	mov	rdi, rcx
	mov	qword [rbp - 56], rdi
Label_69:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rbp - 8]
	mov	rsi, 5
	call	rotate_left
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
	mov	rsi, qword [rbp - 40]
	call	add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	qword [rbp - 40], rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rbp - 48]
	mov	rsi, qword [rbp - 56]
	call	add
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
	mov	rdi, qword [rbp - 40]
	call	add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rsi, qword [ chunks__ ]
	mov	rsi, qword [rsi + r11 * 8]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, qword [rsi + r8 * 8]
	call	add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rbp - 48], rdi
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 40], rax
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 32], rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rbp - 16]
	mov	rsi, 30
	call	rotate_left
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rbp - 24], rdi
	mov	rax, qword [rbp - 8]
	mov	qword [rbp - 16], rax
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 8], rax
Label_65:
	mov	rdi, r8
	add	r8, 1
	jmp	Label_68
Label_66:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r9
	mov	rsi, qword [rbp - 8]
	call	add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r9, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r12
	mov	rsi, qword [rbp - 16]
	call	add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r12, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r13
	mov	rsi, qword [rbp - 24]
	call	add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r13, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r14
	mov	rsi, qword [rbp - 32]
	call	add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r14, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r15
	mov	rsi, qword [rbp - 40]
	call	add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r15, rdi
Label_57:
	mov	rdi, r11
	add	r11, 1
	jmp	Label_60
Label_58:
	mov	rdi, qword [ outputBuffer__ ]
	mov	rsi, 0
	mov	qword [rdi + rsi * 8], r9
	mov	rdi, qword [ outputBuffer__ ]
	mov	rsi, 1
	mov	qword [rdi + rsi * 8], r12
	mov	rdi, qword [ outputBuffer__ ]
	mov	rsi, 2
	mov	qword [rdi + rsi * 8], r13
	mov	rdi, qword [ outputBuffer__ ]
	mov	rsi, 3
	mov	qword [rdi + rsi * 8], r14
	mov	rdi, qword [ outputBuffer__ ]
	mov	rsi, 4
	mov	qword [rdi + rsi * 8], r15
	mov	rax, qword [ outputBuffer__ ]
	jmp	Label_41
Label_41:
	add	rsp, 56
	add	rbp, 32
	pop	r14
	pop	r13
	pop	r12
	pop	r15
	mov	rsp, rbp
	pop	rbp
	ret
computeSHA1:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	r11, 0
Label_80:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	call	string.length
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jl	Label_79
	jmp	Label_78
Label_79:
	mov	r8, qword [ inputBuffer__ ]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	mov	rsi, r11
	call	string.ord
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [r8 + r11 * 8], rdi
Label_77:
	mov	rdi, r11
	add	r11, 1
	jmp	Label_80
Label_78:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	call	string.length
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
	mov	rdi, qword [ inputBuffer__ ]
	call	sha1
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rsi, rdi
	mov	r11, 0
Label_84:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, rsi
	call	array.size
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jl	Label_83
	jmp	Label_82
Label_83:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, qword [rsi + r11 * 8]
	call	toStringHex
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
	mov	rdi, rax
Label_81:
	mov	rdi, r11
	add	r11, 1
	jmp	Label_84
Label_82:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, str__3
	call	println
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
Label_76:
	mov	rsp, rbp
	pop	rbp
	ret
nextLetter:
	push	rbp
	mov	rbp, rsp
	cmp	rdi, 122
	je	Label_87
	jmp	Label_88
Label_87:
	mov	rdi, 1
	neg	rdi
	mov	rax, rdi
	jmp	Label_85
	jmp	Label_86
Label_88:
Label_86:
	cmp	rdi, 90
	je	Label_90
	jmp	Label_91
Label_90:
	mov	rax, 97
	jmp	Label_85
	jmp	Label_89
Label_91:
Label_89:
	cmp	rdi, 57
	je	Label_93
	jmp	Label_94
Label_93:
	mov	rax, 65
	jmp	Label_85
	jmp	Label_92
Label_94:
Label_92:
	add	rdi, 1
	mov	rax, rdi
	jmp	Label_85
Label_85:
	mov	rsp, rbp
	pop	rbp
	ret
nextText:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	rdi, rsi
	sub	rdi, 1
	mov	rsi, rdi
Label_99:
	cmp	rsi, 0
	jge	Label_98
	jmp	Label_97
Label_98:
	push	rdi
	push	rsi
	push	r10
	mov	rdi, qword [r10 + rsi * 8]
	call	nextLetter
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [r10 + rsi * 8], rdi
	mov	rdi, 1
	neg	rdi
	mov	rax, qword [r10 + rsi * 8]
	cmp	rax, rdi
	je	Label_101
	jmp	Label_102
Label_101:
	mov	rax, 48
	mov	qword [r10 + rsi * 8], rax
	jmp	Label_100
Label_102:
	mov	rax, 1
	jmp	Label_95
Label_100:
Label_96:
	mov	rdi, rsi
	sub	rsi, 1
	jmp	Label_99
Label_97:
	mov	rax, 0
	jmp	Label_95
Label_95:
	mov	rsp, rbp
	pop	rbp
	ret
array_equal:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r10
	call	array.size
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r11, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, rsi
	call	array.size
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jne	Label_105
	jmp	Label_106
Label_105:
	mov	rax, 0
	jmp	Label_103
	jmp	Label_104
Label_106:
Label_104:
	mov	r11, 0
Label_110:
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r10
	call	array.size
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jl	Label_109
	jmp	Label_108
Label_109:
	mov	rax, qword [r10 + r11 * 8]
	cmp	rax, qword [rsi + r11 * 8]
	jne	Label_112
	jmp	Label_113
Label_112:
	mov	rax, 0
	jmp	Label_103
	jmp	Label_111
Label_113:
Label_111:
Label_107:
	mov	rdi, r11
	add	r11, 1
	jmp	Label_110
Label_108:
	mov	rax, 1
	jmp	Label_103
Label_103:
	mov	rsp, rbp
	pop	rbp
	ret
crackSHA1:
	push	rbp
	mov	rbp, rsp
	push	r12
	push	r13
	sub	rbp, 16
	mov	r10, rdi
	mov	rdi, 5
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
	mov	rax, 5
	mov	qword [rdi], rax
	add	rdi, 8
	mov	r11, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	call	string.length
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	rdi, 40
	jne	Label_116
	jmp	Label_117
Label_116:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, str__4
	call	println
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_114
	jmp	Label_115
Label_117:
Label_115:
	mov	r8, 0
Label_121:
	cmp	r8, 5
	jl	Label_120
	jmp	Label_119
Label_120:
	mov	rax, 0
	mov	qword [r11 + r8 * 8], rax
Label_118:
	mov	rdi, r8
	add	r8, 1
	jmp	Label_121
Label_119:
	mov	r8, 0
Label_125:
	cmp	r8, 40
	jl	Label_124
	jmp	Label_123
Label_124:
	mov	eax, r8d
	mov	ecx, 8
	cdq
	idiv	ecx
	mov	r9d, eax
	mov	eax, r8d
	mov	ecx, 8
	cdq
	idiv	ecx
	mov	r12d, eax
	mov	rcx, r8
	add	rcx, 3
	mov	r13, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	mov	rsi, r8
	mov	rdx, r13
	call	string.substring
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
	call	hex2int
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	eax, r8d
	mov	ecx, 4
	cdq
	idiv	ecx
	mov	esi, eax
	mov	eax, esi
	mov	ecx, 2
	cdq
	idiv	ecx
	mov	esi, edx
	mov	rcx, 1
	sub	rcx, rsi
	mov	rsi, rcx
	imul	rsi, 16
	mov	rax, rdi
	mov	rcx, rsi
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, qword [r11 + r12 * 8]
	or	rcx, rdi
	mov	rdi, rcx
	mov	qword [r11 + r9 * 8], rdi
Label_122:
	mov	rcx, r8
	add	rcx, 4
	mov	rdi, rcx
	mov	r8, rdi
	jmp	Label_125
Label_123:
	mov	r10, 4
	mov	r9, 1
Label_129:
	cmp	r9, r10
	jle	Label_128
	jmp	Label_127
Label_128:
	mov	r8, 0
Label_133:
	cmp	r8, r9
	jl	Label_132
	jmp	Label_131
Label_132:
	mov	rdi, qword [ inputBuffer__ ]
	mov	rax, 48
	mov	qword [rdi + r8 * 8], rax
Label_130:
	mov	rdi, r8
	add	r8, 1
	jmp	Label_133
Label_131:
Label_137:
	mov	rax, 1
	cmp	rax, 1
	je	Label_136
	jmp	Label_135
Label_136:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [ inputBuffer__ ]
	mov	rsi, r9
	call	sha1
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
	mov	rsi, r11
	call	array_equal
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	rdi, 1
	je	Label_139
	jmp	Label_140
Label_139:
	mov	r8, 0
Label_144:
	cmp	r8, r9
	jl	Label_143
	jmp	Label_142
Label_143:
	mov	rdi, qword [ inputBuffer__ ]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rdi + r8 * 8]
	call	int2chr
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
Label_141:
	mov	rdi, r8
	add	r8, 1
	jmp	Label_144
Label_142:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, str__5
	call	println
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_114
	jmp	Label_138
Label_140:
Label_138:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [ inputBuffer__ ]
	mov	rsi, r9
	call	nextText
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	xor	rdi, 1
	cmp	rdi, 1
	je	Label_146
	jmp	Label_147
Label_146:
	jmp	Label_135
	jmp	Label_145
Label_147:
Label_145:
Label_134:
	jmp	Label_137
Label_135:
Label_126:
	mov	rdi, r9
	add	r9, 1
	jmp	Label_129
Label_127:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, str__6
	call	println
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
Label_114:
	add	rbp, 16
	pop	r13
	pop	r12
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	mov	rax, str__7
	mov	qword [ asciiTable__ ], rax
	mov	rax, 100
	mov	qword [ MAXCHUNK__ ], rax
	mov	rcx, qword [ MAXCHUNK__ ]
	sub	rcx, 1
	mov	rdi, rcx
	imul	rdi, 64
	sub	rdi, 16
	mov	qword [ MAXLENGTH__ ], rdi
	mov	rsi, qword [ MAXCHUNK__ ]
	add	rsi, 1
	imul	rsi, 8
	push	rdi
	push	rsi
	push	r10
	mov	rdi, rsi
	call	malloc
	pop	r10
	pop	rsi
	pop	rdi
	mov	r10, rax
	mov	rax, qword [ MAXCHUNK__ ]
	mov	qword [r10], rax
	add	r10, 8
	mov	rsi, qword [ MAXCHUNK__ ]
Label_149:
	sub	rsi, 1
	mov	rdi, 80
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
	mov	rax, 80
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [r10 + rsi * 8], rdi
	cmp	rsi, 0
	jne	Label_149
	mov	qword [ chunks__ ], r10
	mov	rdi, qword [ MAXLENGTH__ ]
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
	mov	rax, qword [ MAXLENGTH__ ]
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ inputBuffer__ ], rdi
	mov	rdi, 5
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
	mov	rax, 5
	mov	qword [rdi], rax
	add	rdi, 8
	mov	qword [ outputBuffer__ ], rdi
Label_153:
	mov	rax, 1
	cmp	rax, 1
	je	Label_152
	jmp	Label_151
Label_152:
	push	rdi
	push	rsi
	push	r10
	call	getInt
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	rdi, 0
	je	Label_155
	jmp	Label_156
Label_155:
	jmp	Label_151
	jmp	Label_154
Label_156:
Label_154:
	cmp	rdi, 1
	je	Label_158
	jmp	Label_159
Label_158:
	push	rdi
	push	rsi
	push	r10
	call	getString
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	call	computeSHA1
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_157
Label_159:
	cmp	rdi, 2
	je	Label_160
	jmp	Label_161
Label_160:
	push	rdi
	push	rsi
	push	r10
	call	getString
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	call	crackSHA1
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	jmp	Label_157
Label_161:
Label_157:
Label_150:
	jmp	Label_153
Label_151:
	mov	rax, 0
	jmp	Label_148
Label_148:
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
