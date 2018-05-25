global main

extern puts
extern getchar
extern putchar
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
	sub	rsp, 224
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, 0
	mov	qword [rbp - 24], rax
	mov	rax, 0
	mov	qword [rbp - 16], rax
Label_4:
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	string.length
	mov	qword [rbp - 40], rax
	mov	rcx, qword [rbp - 16]
	cmp	rcx, qword [rbp - 40]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	cmp	rax, 1
	je	Label_3
	jmp	Label_2
Label_3:
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	mov	rax, qword [rbp - 16]
	mov	rsi, rax
	call	string.ord
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 56], rax
	mov	rcx, qword [rbp - 56]
	cmp	rcx, 48
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 72], rcx
	mov	rax, qword [rbp - 72]
	cmp	rax, 1
	je	Label_8
	mov	rax, 0
	mov	qword [rbp - 64], rax
	jmp	Label_9
Label_8:
	mov	rcx, qword [rbp - 56]
	cmp	rcx, 57
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 80], rcx
	mov	rax, qword [rbp - 80]
	mov	qword [rbp - 64], rax
Label_9:
	mov	rax, qword [rbp - 64]
	cmp	rax, 1
	je	Label_6
	jmp	Label_7
Label_6:
	mov	rdx, qword [rbp - 24]
	imul	rdx, 16
	mov	qword [rbp - 104], rdx
	mov	rdx, qword [rbp - 104]
	add	rdx, qword [rbp - 56]
	mov	qword [rbp - 96], rdx
	mov	rdx, qword [rbp - 96]
	sub	rdx, 48
	mov	qword [rbp - 88], rdx
	mov	rax, qword [rbp - 88]
	mov	qword [rbp - 24], rax
	jmp	Label_5
Label_7:
	mov	rcx, qword [rbp - 56]
	cmp	rcx, 65
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 120], rcx
	mov	rax, qword [rbp - 120]
	cmp	rax, 1
	je	Label_12
	mov	rax, 0
	mov	qword [rbp - 112], rax
	jmp	Label_13
Label_12:
	mov	rcx, qword [rbp - 56]
	cmp	rcx, 70
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 128], rcx
	mov	rax, qword [rbp - 128]
	mov	qword [rbp - 112], rax
Label_13:
	mov	rax, qword [rbp - 112]
	cmp	rax, 1
	je	Label_10
	jmp	Label_11
Label_10:
	mov	rdx, qword [rbp - 24]
	imul	rdx, 16
	mov	qword [rbp - 160], rdx
	mov	rdx, qword [rbp - 160]
	add	rdx, qword [rbp - 56]
	mov	qword [rbp - 152], rdx
	mov	rdx, qword [rbp - 152]
	sub	rdx, 65
	mov	qword [rbp - 144], rdx
	mov	rdx, qword [rbp - 144]
	add	rdx, 10
	mov	qword [rbp - 136], rdx
	mov	rax, qword [rbp - 136]
	mov	qword [rbp - 24], rax
	jmp	Label_5
Label_11:
	mov	rcx, qword [rbp - 56]
	cmp	rcx, 97
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 176], rcx
	mov	rax, qword [rbp - 176]
	cmp	rax, 1
	je	Label_16
	mov	rax, 0
	mov	qword [rbp - 168], rax
	jmp	Label_17
Label_16:
	mov	rcx, qword [rbp - 56]
	cmp	rcx, 102
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 184], rcx
	mov	rax, qword [rbp - 184]
	mov	qword [rbp - 168], rax
Label_17:
	mov	rax, qword [rbp - 168]
	cmp	rax, 1
	je	Label_14
	jmp	Label_15
Label_14:
	mov	rdx, qword [rbp - 24]
	imul	rdx, 16
	mov	qword [rbp - 216], rdx
	mov	rdx, qword [rbp - 216]
	add	rdx, qword [rbp - 56]
	mov	qword [rbp - 208], rdx
	mov	rdx, qword [rbp - 208]
	sub	rdx, 97
	mov	qword [rbp - 200], rdx
	mov	rdx, qword [rbp - 200]
	add	rdx, 10
	mov	qword [rbp - 192], rdx
	mov	rax, qword [rbp - 192]
	mov	qword [rbp - 24], rax
	jmp	Label_5
Label_15:
	mov	rax, 0
	jmp	Label_0
Label_5:
Label_1:
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 224], rax
	mov	rdx, qword [rbp - 16]
	add	rdx, 1
	mov	qword [rbp - 16], rdx
	jmp	Label_4
Label_2:
	mov	rax, qword [rbp - 24]
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
int2chr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 56
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 32
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 24], rcx
	mov	rax, qword [rbp - 24]
	cmp	rax, 1
	je	Label_22
	mov	rax, 0
	mov	qword [rbp - 16], rax
	jmp	Label_23
Label_22:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 126
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 16], rax
Label_23:
	mov	rax, qword [rbp - 16]
	cmp	rax, 1
	je	Label_20
	jmp	Label_21
Label_20:
	mov	rdx, qword [rbp - 8]
	sub	rdx, 32
	mov	qword [rbp - 40], rdx
	mov	rdx, qword [rbp - 8]
	sub	rdx, 32
	mov	qword [rbp - 48], rdx
	mov	rax, qword [ asciiTable__ ]
	mov	rdi, rax
	mov	rax, qword [rbp - 40]
	mov	rsi, rax
	mov	rax, qword [rbp - 48]
	mov	rdx, rax
	call	string.substring
	mov	qword [rbp - 56], rax
	mov	rax, qword [rbp - 56]
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
	sub	rsp, 144
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, str__1
	mov	qword [rbp - 16], rax
	mov	rax, 28
	mov	qword [rbp - 24], rax
Label_28:
	mov	rcx, qword [rbp - 24]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	cmp	rax, 1
	je	Label_27
	jmp	Label_26
Label_27:
	mov	rax, qword [rbp - 8]
	mov	rcx, qword [rbp - 24]
	shr	rax, cl
	mov	qword [rbp - 48], rax
	mov	rdx, qword [rbp - 48]
	and	rdx, 15
	mov	qword [rbp - 40], rdx
	mov	rax, qword [rbp - 40]
	mov	qword [rbp - 56], rax
	mov	rcx, qword [rbp - 56]
	cmp	rcx, 10
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 64], rcx
	mov	rax, qword [rbp - 64]
	cmp	rax, 1
	je	Label_30
	jmp	Label_31
Label_30:
	mov	rdx, 48
	add	rdx, qword [rbp - 56]
	mov	qword [rbp - 88], rdx
	mov	rax, qword [rbp - 88]
	mov	rdi, rax
	call	int2chr
	mov	qword [rbp - 96], rax
	mov	rax, qword [rbp - 16]
	mov	rdi, rax
	mov	rax, qword [rbp - 96]
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 80], rax
	mov	rax, qword [rbp - 80]
	mov	qword [rbp - 16], rax
	jmp	Label_29
Label_31:
	mov	rdx, 65
	add	rdx, qword [rbp - 56]
	mov	qword [rbp - 128], rdx
	mov	rdx, qword [rbp - 128]
	sub	rdx, 10
	mov	qword [rbp - 120], rdx
	mov	rax, qword [rbp - 120]
	mov	rdi, rax
	call	int2chr
	mov	qword [rbp - 136], rax
	mov	rax, qword [rbp - 16]
	mov	rdi, rax
	mov	rax, qword [rbp - 136]
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 112], rax
	mov	rax, qword [rbp - 112]
	mov	qword [rbp - 16], rax
Label_29:
Label_25:
	mov	rdx, qword [rbp - 24]
	sub	rdx, 4
	mov	qword [rbp - 144], rdx
	mov	rax, qword [rbp - 144]
	mov	qword [rbp - 24], rax
	jmp	Label_28
Label_26:
	mov	rax, qword [rbp - 16]
	jmp	Label_24
Label_24:
	mov	rsp, rbp
	pop	rbp
	ret
rotate_left:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 200
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rcx, qword [rbp - 16]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 24], rcx
	mov	rax, qword [rbp - 24]
	cmp	rax, 1
	je	Label_34
	jmp	Label_35
Label_34:
	mov	rdx, qword [rbp - 8]
	and	rdx, 2147483647
	mov	qword [rbp - 48], rdx
	mov	rax, qword [rbp - 48]
	mov	rcx, 1
	shl	rax, cl
	mov	qword [rbp - 40], rax
	mov	rax, qword [rbp - 8]
	mov	rcx, 31
	shr	rax, cl
	mov	qword [rbp - 64], rax
	mov	rdx, qword [rbp - 64]
	and	rdx, 1
	mov	qword [rbp - 56], rdx
	mov	rdx, qword [rbp - 40]
	or	rdx, qword [rbp - 56]
	mov	qword [rbp - 32], rdx
	mov	rax, qword [rbp - 32]
	jmp	Label_32
	jmp	Label_33
Label_35:
Label_33:
	mov	rcx, qword [rbp - 16]
	cmp	rcx, 31
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 72], rcx
	mov	rax, qword [rbp - 72]
	cmp	rax, 1
	je	Label_37
	jmp	Label_38
Label_37:
	mov	rdx, qword [rbp - 8]
	and	rdx, 1
	mov	qword [rbp - 96], rdx
	mov	rax, qword [rbp - 96]
	mov	rcx, 31
	shl	rax, cl
	mov	qword [rbp - 88], rax
	mov	rax, qword [rbp - 8]
	mov	rcx, 1
	shr	rax, cl
	mov	qword [rbp - 112], rax
	mov	rdx, qword [rbp - 112]
	and	rdx, 2147483647
	mov	qword [rbp - 104], rdx
	mov	rdx, qword [rbp - 88]
	or	rdx, qword [rbp - 104]
	mov	qword [rbp - 80], rdx
	mov	rax, qword [rbp - 80]
	jmp	Label_32
	jmp	Label_36
Label_38:
Label_36:
	mov	rdx, 32
	sub	rdx, qword [rbp - 16]
	mov	qword [rbp - 160], rdx
	mov	rax, 1
	mov	rcx, qword [rbp - 160]
	shl	rax, cl
	mov	qword [rbp - 152], rax
	mov	rdx, qword [rbp - 152]
	sub	rdx, 1
	mov	qword [rbp - 144], rdx
	mov	rdx, qword [rbp - 8]
	and	rdx, qword [rbp - 144]
	mov	qword [rbp - 136], rdx
	mov	rax, qword [rbp - 136]
	mov	rcx, qword [rbp - 16]
	shl	rax, cl
	mov	qword [rbp - 128], rax
	mov	rdx, 32
	sub	rdx, qword [rbp - 16]
	mov	qword [rbp - 184], rdx
	mov	rax, qword [rbp - 8]
	mov	rcx, qword [rbp - 184]
	shr	rax, cl
	mov	qword [rbp - 176], rax
	mov	rax, 1
	mov	rcx, qword [rbp - 16]
	shl	rax, cl
	mov	qword [rbp - 200], rax
	mov	rdx, qword [rbp - 200]
	sub	rdx, 1
	mov	qword [rbp - 192], rdx
	mov	rdx, qword [rbp - 176]
	and	rdx, qword [rbp - 192]
	mov	qword [rbp - 168], rdx
	mov	rdx, qword [rbp - 128]
	or	rdx, qword [rbp - 168]
	mov	qword [rbp - 120], rdx
	mov	rax, qword [rbp - 120]
	jmp	Label_32
Label_32:
	mov	rsp, rbp
	pop	rbp
	ret
add:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 144
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rdx, qword [rbp - 8]
	and	rdx, 65535
	mov	qword [rbp - 32], rdx
	mov	rdx, qword [rbp - 16]
	and	rdx, 65535
	mov	qword [rbp - 40], rdx
	mov	rdx, qword [rbp - 32]
	add	rdx, qword [rbp - 40]
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 8]
	mov	rcx, 16
	shr	rax, cl
	mov	qword [rbp - 88], rax
	mov	rdx, qword [rbp - 88]
	and	rdx, 65535
	mov	qword [rbp - 80], rdx
	mov	rax, qword [rbp - 16]
	mov	rcx, 16
	shr	rax, cl
	mov	qword [rbp - 104], rax
	mov	rdx, qword [rbp - 104]
	and	rdx, 65535
	mov	qword [rbp - 96], rdx
	mov	rdx, qword [rbp - 80]
	add	rdx, qword [rbp - 96]
	mov	qword [rbp - 72], rdx
	mov	rax, qword [rbp - 48]
	mov	rcx, 16
	shr	rax, cl
	mov	qword [rbp - 112], rax
	mov	rdx, qword [rbp - 72]
	add	rdx, qword [rbp - 112]
	mov	qword [rbp - 64], rdx
	mov	rdx, qword [rbp - 64]
	and	rdx, 65535
	mov	qword [rbp - 56], rdx
	mov	rax, qword [rbp - 56]
	mov	qword [rbp - 120], rax
	mov	rax, qword [rbp - 120]
	mov	rcx, 16
	shl	rax, cl
	mov	qword [rbp - 136], rax
	mov	rdx, qword [rbp - 48]
	and	rdx, 65535
	mov	qword [rbp - 144], rdx
	mov	rdx, qword [rbp - 136]
	or	rdx, qword [rbp - 144]
	mov	qword [rbp - 128], rdx
	mov	rax, qword [rbp - 128]
	jmp	Label_39
Label_39:
	mov	rsp, rbp
	pop	rbp
	ret
lohi:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rax, qword [rbp - 16]
	mov	rcx, 16
	shl	rax, cl
	mov	qword [rbp - 32], rax
	mov	rdx, qword [rbp - 8]
	or	rdx, qword [rbp - 32]
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	jmp	Label_40
Label_40:
	mov	rsp, rbp
	pop	rbp
	ret
sha1:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 1128
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rdx, qword [rbp - 16]
	add	rdx, 64
	mov	qword [rbp - 48], rdx
	mov	rdx, qword [rbp - 48]
	sub	rdx, 56
	mov	qword [rbp - 40], rdx
	mov	rax, qword [rbp - 40]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 32], rax
	mov	rdx, qword [rbp - 32]
	add	rdx, 1
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 56], rax
	mov	rcx, qword [rbp - 56]
	cmp	rcx, qword [ MAXCHUNK__ ]
	setg	cl
	movzx	rcx, cl
	mov	qword [rbp - 64], rcx
	mov	rax, qword [rbp - 64]
	cmp	rax, 1
	je	Label_43
	jmp	Label_44
Label_43:
	mov	rax, str__2
	mov	rdi, rax
	call	println
	mov	qword [rbp - 72], rax
	mov	rax, 0
	jmp	Label_41
	jmp	Label_42
Label_44:
Label_42:
	mov	rax, 0
	mov	qword [rbp - 80], rax
Label_48:
	mov	rcx, qword [rbp - 80]
	cmp	rcx, qword [rbp - 56]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 96], rcx
	mov	rax, qword [rbp - 96]
	cmp	rax, 1
	je	Label_47
	jmp	Label_46
Label_47:
	mov	rax, 0
	mov	qword [rbp - 88], rax
Label_52:
	mov	rcx, qword [rbp - 88]
	cmp	rcx, 80
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 104], rcx
	mov	rax, qword [rbp - 104]
	cmp	rax, 1
	je	Label_51
	jmp	Label_50
Label_51:
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 112], rax
	mov	rbx, qword [rbp - 80]
	imul	rbx, 8
	add	rbx, qword [rbp - 112]
	mov	rax, qword [rbx]
	mov	qword [rbp - 120], rax
	mov	rax, 0
	mov	rbx, qword [rbp - 88]
	imul	rbx, 8
	add	rbx, qword [rbp - 120]
	mov	qword [rbx], rax
Label_49:
	mov	rax, qword [rbp - 88]
	mov	qword [rbp - 128], rax
	mov	rdx, qword [rbp - 88]
	add	rdx, 1
	mov	qword [rbp - 88], rdx
	jmp	Label_52
Label_50:
Label_45:
	mov	rax, qword [rbp - 80]
	mov	qword [rbp - 136], rax
	mov	rdx, qword [rbp - 80]
	add	rdx, 1
	mov	qword [rbp - 80], rdx
	jmp	Label_48
Label_46:
	mov	rax, 0
	mov	qword [rbp - 80], rax
Label_56:
	mov	rcx, qword [rbp - 80]
	cmp	rcx, qword [rbp - 16]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 144], rcx
	mov	rax, qword [rbp - 144]
	cmp	rax, 1
	je	Label_55
	jmp	Label_54
Label_55:
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 152], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 160], rax
	mov	rbx, qword [rbp - 160]
	imul	rbx, 8
	add	rbx, qword [rbp - 152]
	mov	rax, qword [rbx]
	mov	qword [rbp - 168], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 184], rdx
	mov	rax, qword [rbp - 184]
	mov	rcx, 4
	cqo
	idiv	rcx
	mov	qword [rbp - 176], rax
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 200], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 208], rax
	mov	rbx, qword [rbp - 208]
	imul	rbx, 8
	add	rbx, qword [rbp - 200]
	mov	rax, qword [rbx]
	mov	qword [rbp - 216], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 232], rdx
	mov	rax, qword [rbp - 232]
	mov	rcx, 4
	cqo
	idiv	rcx
	mov	qword [rbp - 224], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 4
	cqo
	idiv	rcx
	mov	qword [rbp - 264], rdx
	mov	rdx, 3
	sub	rdx, qword [rbp - 264]
	mov	qword [rbp - 256], rdx
	mov	rdx, qword [rbp - 256]
	imul	rdx, 8
	mov	qword [rbp - 248], rdx
	mov	r10, qword [rbp - 80]
	imul	r10, 8
	add	r10, qword [rbp - 8]
	mov	rax, qword [r10]
	mov	rcx, qword [rbp - 248]
	shl	rax, cl
	mov	qword [rbp - 240], rax
	mov	r10, qword [rbp - 224]
	imul	r10, 8
	add	r10, qword [rbp - 216]
	mov	rdx, qword [r10]
	or	rdx, qword [rbp - 240]
	mov	qword [rbp - 192], rdx
	mov	rax, qword [rbp - 192]
	mov	rbx, qword [rbp - 176]
	imul	rbx, 8
	add	rbx, qword [rbp - 168]
	mov	qword [rbx], rax
Label_53:
	mov	rax, qword [rbp - 80]
	mov	qword [rbp - 272], rax
	mov	rdx, qword [rbp - 80]
	add	rdx, 1
	mov	qword [rbp - 80], rdx
	jmp	Label_56
Label_54:
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 280], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 288], rax
	mov	rbx, qword [rbp - 288]
	imul	rbx, 8
	add	rbx, qword [rbp - 280]
	mov	rax, qword [rbx]
	mov	qword [rbp - 296], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 312], rdx
	mov	rax, qword [rbp - 312]
	mov	rcx, 4
	cqo
	idiv	rcx
	mov	qword [rbp - 304], rax
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 328], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 336], rax
	mov	rbx, qword [rbp - 336]
	imul	rbx, 8
	add	rbx, qword [rbp - 328]
	mov	rax, qword [rbx]
	mov	qword [rbp - 344], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 64
	cqo
	idiv	rcx
	mov	qword [rbp - 360], rdx
	mov	rax, qword [rbp - 360]
	mov	rcx, 4
	cqo
	idiv	rcx
	mov	qword [rbp - 352], rax
	mov	rax, qword [rbp - 80]
	mov	rcx, 4
	cqo
	idiv	rcx
	mov	qword [rbp - 392], rdx
	mov	rdx, 3
	sub	rdx, qword [rbp - 392]
	mov	qword [rbp - 384], rdx
	mov	rdx, qword [rbp - 384]
	imul	rdx, 8
	mov	qword [rbp - 376], rdx
	mov	rax, 128
	mov	rcx, qword [rbp - 376]
	shl	rax, cl
	mov	qword [rbp - 368], rax
	mov	r10, qword [rbp - 352]
	imul	r10, 8
	add	r10, qword [rbp - 344]
	mov	rdx, qword [r10]
	or	rdx, qword [rbp - 368]
	mov	qword [rbp - 320], rdx
	mov	rax, qword [rbp - 320]
	mov	rbx, qword [rbp - 304]
	imul	rbx, 8
	add	rbx, qword [rbp - 296]
	mov	qword [rbx], rax
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 400], rax
	mov	rdx, qword [rbp - 56]
	sub	rdx, 1
	mov	qword [rbp - 408], rdx
	mov	rbx, qword [rbp - 408]
	imul	rbx, 8
	add	rbx, qword [rbp - 400]
	mov	rax, qword [rbx]
	mov	qword [rbp - 416], rax
	mov	rax, 15
	mov	qword [rbp - 424], rax
	mov	rax, qword [rbp - 16]
	mov	rcx, 3
	shl	rax, cl
	mov	qword [rbp - 432], rax
	mov	rax, qword [rbp - 432]
	mov	rbx, qword [rbp - 424]
	imul	rbx, 8
	add	rbx, qword [rbp - 416]
	mov	qword [rbx], rax
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 440], rax
	mov	rdx, qword [rbp - 56]
	sub	rdx, 1
	mov	qword [rbp - 448], rdx
	mov	rbx, qword [rbp - 448]
	imul	rbx, 8
	add	rbx, qword [rbp - 440]
	mov	rax, qword [rbx]
	mov	qword [rbp - 456], rax
	mov	rax, 14
	mov	qword [rbp - 464], rax
	mov	rax, qword [rbp - 16]
	mov	rcx, 29
	shr	rax, cl
	mov	qword [rbp - 480], rax
	mov	rdx, qword [rbp - 480]
	and	rdx, 7
	mov	qword [rbp - 472], rdx
	mov	rax, qword [rbp - 472]
	mov	rbx, qword [rbp - 464]
	imul	rbx, 8
	add	rbx, qword [rbp - 456]
	mov	qword [rbx], rax
	mov	rax, 1732584193
	mov	qword [rbp - 488], rax
	mov	rax, 43913
	mov	rdi, rax
	mov	rax, 61389
	mov	rsi, rax
	call	lohi
	mov	qword [rbp - 496], rax
	mov	rax, qword [rbp - 496]
	mov	qword [rbp - 504], rax
	mov	rax, 56574
	mov	rdi, rax
	mov	rax, 39098
	mov	rsi, rax
	call	lohi
	mov	qword [rbp - 512], rax
	mov	rax, qword [rbp - 512]
	mov	qword [rbp - 520], rax
	mov	rax, 271733878
	mov	qword [rbp - 528], rax
	mov	rax, 57840
	mov	rdi, rax
	mov	rax, 50130
	mov	rsi, rax
	call	lohi
	mov	qword [rbp - 536], rax
	mov	rax, qword [rbp - 536]
	mov	qword [rbp - 544], rax
	mov	rax, 0
	mov	qword [rbp - 80], rax
Label_60:
	mov	rcx, qword [rbp - 80]
	cmp	rcx, qword [rbp - 56]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 552], rcx
	mov	rax, qword [rbp - 552]
	cmp	rax, 1
	je	Label_59
	jmp	Label_58
Label_59:
	mov	rax, 16
	mov	qword [rbp - 88], rax
Label_64:
	mov	rcx, qword [rbp - 88]
	cmp	rcx, 80
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 560], rcx
	mov	rax, qword [rbp - 560]
	cmp	rax, 1
	je	Label_63
	jmp	Label_62
Label_63:
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 568], rax
	mov	rbx, qword [rbp - 80]
	imul	rbx, 8
	add	rbx, qword [rbp - 568]
	mov	rax, qword [rbx]
	mov	qword [rbp - 576], rax
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 608], rax
	mov	rbx, qword [rbp - 80]
	imul	rbx, 8
	add	rbx, qword [rbp - 608]
	mov	rax, qword [rbx]
	mov	qword [rbp - 616], rax
	mov	rdx, qword [rbp - 88]
	sub	rdx, 3
	mov	qword [rbp - 624], rdx
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 632], rax
	mov	rbx, qword [rbp - 80]
	imul	rbx, 8
	add	rbx, qword [rbp - 632]
	mov	rax, qword [rbx]
	mov	qword [rbp - 640], rax
	mov	rdx, qword [rbp - 88]
	sub	rdx, 8
	mov	qword [rbp - 648], rdx
	mov	r10, qword [rbp - 624]
	imul	r10, 8
	add	r10, qword [rbp - 616]
	mov	r11, qword [rbp - 648]
	imul	r11, 8
	add	r11, qword [rbp - 640]
	mov	rdx, qword [r10]
	xor	rdx, qword [r11]
	mov	qword [rbp - 600], rdx
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 656], rax
	mov	rbx, qword [rbp - 80]
	imul	rbx, 8
	add	rbx, qword [rbp - 656]
	mov	rax, qword [rbx]
	mov	qword [rbp - 664], rax
	mov	rdx, qword [rbp - 88]
	sub	rdx, 14
	mov	qword [rbp - 672], rdx
	mov	r11, qword [rbp - 672]
	imul	r11, 8
	add	r11, qword [rbp - 664]
	mov	rdx, qword [rbp - 600]
	xor	rdx, qword [r11]
	mov	qword [rbp - 592], rdx
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 680], rax
	mov	rbx, qword [rbp - 80]
	imul	rbx, 8
	add	rbx, qword [rbp - 680]
	mov	rax, qword [rbx]
	mov	qword [rbp - 688], rax
	mov	rdx, qword [rbp - 88]
	sub	rdx, 16
	mov	qword [rbp - 696], rdx
	mov	r11, qword [rbp - 696]
	imul	r11, 8
	add	r11, qword [rbp - 688]
	mov	rdx, qword [rbp - 592]
	xor	rdx, qword [r11]
	mov	qword [rbp - 584], rdx
	mov	rax, qword [rbp - 584]
	mov	rdi, rax
	mov	rax, 1
	mov	rsi, rax
	call	rotate_left
	mov	qword [rbp - 704], rax
	mov	rax, qword [rbp - 704]
	mov	rbx, qword [rbp - 88]
	imul	rbx, 8
	add	rbx, qword [rbp - 576]
	mov	qword [rbx], rax
Label_61:
	mov	rax, qword [rbp - 88]
	mov	qword [rbp - 712], rax
	mov	rdx, qword [rbp - 88]
	add	rdx, 1
	mov	qword [rbp - 88], rdx
	jmp	Label_64
Label_62:
	mov	rax, qword [rbp - 488]
	mov	qword [rbp - 720], rax
	mov	rax, qword [rbp - 504]
	mov	qword [rbp - 728], rax
	mov	rax, qword [rbp - 520]
	mov	qword [rbp - 736], rax
	mov	rax, qword [rbp - 528]
	mov	qword [rbp - 744], rax
	mov	rax, qword [rbp - 544]
	mov	qword [rbp - 752], rax
	mov	rax, 0
	mov	qword [rbp - 88], rax
Label_68:
	mov	rcx, qword [rbp - 88]
	cmp	rcx, 80
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 760], rcx
	mov	rax, qword [rbp - 760]
	cmp	rax, 1
	je	Label_67
	jmp	Label_66
Label_67:
	mov	rcx, qword [rbp - 88]
	cmp	rcx, 20
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 784], rcx
	mov	rax, qword [rbp - 784]
	cmp	rax, 1
	je	Label_70
	jmp	Label_71
Label_70:
	mov	rdx, qword [rbp - 728]
	and	rdx, qword [rbp - 736]
	mov	qword [rbp - 800], rdx
	mov	rax, qword [rbp - 728]
	mov	qword [rbp - 816], rax
	not	qword [rbp - 816]
	mov	rdx, qword [rbp - 816]
	and	rdx, qword [rbp - 744]
	mov	qword [rbp - 808], rdx
	mov	rdx, qword [rbp - 800]
	or	rdx, qword [rbp - 808]
	mov	qword [rbp - 792], rdx
	mov	rax, qword [rbp - 792]
	mov	qword [rbp - 768], rax
	mov	rax, 1518500249
	mov	qword [rbp - 776], rax
	jmp	Label_69
Label_71:
	mov	rcx, qword [rbp - 88]
	cmp	rcx, 40
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 824], rcx
	mov	rax, qword [rbp - 824]
	cmp	rax, 1
	je	Label_72
	jmp	Label_73
Label_72:
	mov	rdx, qword [rbp - 728]
	xor	rdx, qword [rbp - 736]
	mov	qword [rbp - 840], rdx
	mov	rdx, qword [rbp - 840]
	xor	rdx, qword [rbp - 744]
	mov	qword [rbp - 832], rdx
	mov	rax, qword [rbp - 832]
	mov	qword [rbp - 768], rax
	mov	rax, 1859775393
	mov	qword [rbp - 776], rax
	jmp	Label_69
Label_73:
	mov	rcx, qword [rbp - 88]
	cmp	rcx, 60
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 848], rcx
	mov	rax, qword [rbp - 848]
	cmp	rax, 1
	je	Label_74
	jmp	Label_75
Label_74:
	mov	rdx, qword [rbp - 728]
	and	rdx, qword [rbp - 736]
	mov	qword [rbp - 872], rdx
	mov	rdx, qword [rbp - 728]
	and	rdx, qword [rbp - 744]
	mov	qword [rbp - 880], rdx
	mov	rdx, qword [rbp - 872]
	or	rdx, qword [rbp - 880]
	mov	qword [rbp - 864], rdx
	mov	rdx, qword [rbp - 736]
	and	rdx, qword [rbp - 744]
	mov	qword [rbp - 888], rdx
	mov	rdx, qword [rbp - 864]
	or	rdx, qword [rbp - 888]
	mov	qword [rbp - 856], rdx
	mov	rax, qword [rbp - 856]
	mov	qword [rbp - 768], rax
	mov	rax, 48348
	mov	rdi, rax
	mov	rax, 36635
	mov	rsi, rax
	call	lohi
	mov	qword [rbp - 896], rax
	mov	rax, qword [rbp - 896]
	mov	qword [rbp - 776], rax
	jmp	Label_69
Label_75:
	mov	rdx, qword [rbp - 728]
	xor	rdx, qword [rbp - 736]
	mov	qword [rbp - 912], rdx
	mov	rdx, qword [rbp - 912]
	xor	rdx, qword [rbp - 744]
	mov	qword [rbp - 904], rdx
	mov	rax, qword [rbp - 904]
	mov	qword [rbp - 768], rax
	mov	rax, 49622
	mov	rdi, rax
	mov	rax, 51810
	mov	rsi, rax
	call	lohi
	mov	qword [rbp - 920], rax
	mov	rax, qword [rbp - 920]
	mov	qword [rbp - 776], rax
Label_69:
	mov	rax, qword [rbp - 720]
	mov	rdi, rax
	mov	rax, 5
	mov	rsi, rax
	call	rotate_left
	mov	qword [rbp - 928], rax
	mov	rax, qword [rbp - 928]
	mov	rdi, rax
	mov	rax, qword [rbp - 752]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 936], rax
	mov	rax, qword [rbp - 768]
	mov	rdi, rax
	mov	rax, qword [rbp - 776]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 944], rax
	mov	rax, qword [rbp - 936]
	mov	rdi, rax
	mov	rax, qword [rbp - 944]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 952], rax
	mov	rax, qword [ chunks__ ]
	mov	qword [rbp - 960], rax
	mov	rbx, qword [rbp - 80]
	imul	rbx, 8
	add	rbx, qword [rbp - 960]
	mov	rax, qword [rbx]
	mov	qword [rbp - 968], rax
	mov	rax, qword [rbp - 952]
	mov	rdi, rax
	mov	rbx, qword [rbp - 88]
	imul	rbx, 8
	add	rbx, qword [rbp - 968]
	mov	rax, qword [rbx]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 976], rax
	mov	rax, qword [rbp - 976]
	mov	qword [rbp - 984], rax
	mov	rax, qword [rbp - 744]
	mov	qword [rbp - 752], rax
	mov	rax, qword [rbp - 736]
	mov	qword [rbp - 744], rax
	mov	rax, qword [rbp - 728]
	mov	rdi, rax
	mov	rax, 30
	mov	rsi, rax
	call	rotate_left
	mov	qword [rbp - 992], rax
	mov	rax, qword [rbp - 992]
	mov	qword [rbp - 736], rax
	mov	rax, qword [rbp - 720]
	mov	qword [rbp - 728], rax
	mov	rax, qword [rbp - 984]
	mov	qword [rbp - 720], rax
Label_65:
	mov	rax, qword [rbp - 88]
	mov	qword [rbp - 1000], rax
	mov	rdx, qword [rbp - 88]
	add	rdx, 1
	mov	qword [rbp - 88], rdx
	jmp	Label_68
Label_66:
	mov	rax, qword [rbp - 488]
	mov	rdi, rax
	mov	rax, qword [rbp - 720]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 1008], rax
	mov	rax, qword [rbp - 1008]
	mov	qword [rbp - 488], rax
	mov	rax, qword [rbp - 504]
	mov	rdi, rax
	mov	rax, qword [rbp - 728]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 1016], rax
	mov	rax, qword [rbp - 1016]
	mov	qword [rbp - 504], rax
	mov	rax, qword [rbp - 520]
	mov	rdi, rax
	mov	rax, qword [rbp - 736]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 1024], rax
	mov	rax, qword [rbp - 1024]
	mov	qword [rbp - 520], rax
	mov	rax, qword [rbp - 528]
	mov	rdi, rax
	mov	rax, qword [rbp - 744]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 1032], rax
	mov	rax, qword [rbp - 1032]
	mov	qword [rbp - 528], rax
	mov	rax, qword [rbp - 544]
	mov	rdi, rax
	mov	rax, qword [rbp - 752]
	mov	rsi, rax
	call	add
	mov	qword [rbp - 1040], rax
	mov	rax, qword [rbp - 1040]
	mov	qword [rbp - 544], rax
Label_57:
	mov	rax, qword [rbp - 80]
	mov	qword [rbp - 1048], rax
	mov	rdx, qword [rbp - 80]
	add	rdx, 1
	mov	qword [rbp - 80], rdx
	jmp	Label_60
Label_58:
	mov	rax, qword [ outputBuffer__ ]
	mov	qword [rbp - 1056], rax
	mov	rax, 0
	mov	qword [rbp - 1064], rax
	mov	rax, qword [rbp - 488]
	mov	rbx, qword [rbp - 1064]
	imul	rbx, 8
	add	rbx, qword [rbp - 1056]
	mov	qword [rbx], rax
	mov	rax, qword [ outputBuffer__ ]
	mov	qword [rbp - 1072], rax
	mov	rax, 1
	mov	qword [rbp - 1080], rax
	mov	rax, qword [rbp - 504]
	mov	rbx, qword [rbp - 1080]
	imul	rbx, 8
	add	rbx, qword [rbp - 1072]
	mov	qword [rbx], rax
	mov	rax, qword [ outputBuffer__ ]
	mov	qword [rbp - 1088], rax
	mov	rax, 2
	mov	qword [rbp - 1096], rax
	mov	rax, qword [rbp - 520]
	mov	rbx, qword [rbp - 1096]
	imul	rbx, 8
	add	rbx, qword [rbp - 1088]
	mov	qword [rbx], rax
	mov	rax, qword [ outputBuffer__ ]
	mov	qword [rbp - 1104], rax
	mov	rax, 3
	mov	qword [rbp - 1112], rax
	mov	rax, qword [rbp - 528]
	mov	rbx, qword [rbp - 1112]
	imul	rbx, 8
	add	rbx, qword [rbp - 1104]
	mov	qword [rbx], rax
	mov	rax, qword [ outputBuffer__ ]
	mov	qword [rbp - 1120], rax
	mov	rax, 4
	mov	qword [rbp - 1128], rax
	mov	rax, qword [rbp - 544]
	mov	rbx, qword [rbp - 1128]
	imul	rbx, 8
	add	rbx, qword [rbp - 1120]
	mov	qword [rbx], rax
	mov	rax, qword [ outputBuffer__ ]
	jmp	Label_41
Label_41:
	mov	rsp, rbp
	pop	rbp
	ret
computeSHA1:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 128
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, 0
	mov	qword [rbp - 16], rax
Label_80:
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	string.length
	mov	qword [rbp - 32], rax
	mov	rcx, qword [rbp - 16]
	cmp	rcx, qword [rbp - 32]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 24], rcx
	mov	rax, qword [rbp - 24]
	cmp	rax, 1
	je	Label_79
	jmp	Label_78
Label_79:
	mov	rax, qword [ inputBuffer__ ]
	mov	qword [rbp - 40], rax
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	mov	rax, qword [rbp - 16]
	mov	rsi, rax
	call	string.ord
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 48]
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
Label_77:
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 56], rax
	mov	rdx, qword [rbp - 16]
	add	rdx, 1
	mov	qword [rbp - 16], rdx
	jmp	Label_80
Label_78:
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	string.length
	mov	qword [rbp - 64], rax
	mov	rax, qword [ inputBuffer__ ]
	mov	rdi, rax
	mov	rax, qword [rbp - 64]
	mov	rsi, rax
	call	sha1
	mov	qword [rbp - 72], rax
	mov	rax, qword [rbp - 72]
	mov	qword [rbp - 80], rax
	mov	rax, 0
	mov	qword [rbp - 16], rax
Label_84:
	mov	rax, qword [rbp - 80]
	mov	rdi, rax
	call	array.size
	mov	qword [rbp - 96], rax
	mov	rcx, qword [rbp - 16]
	cmp	rcx, qword [rbp - 96]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 88], rcx
	mov	rax, qword [rbp - 88]
	cmp	rax, 1
	je	Label_83
	jmp	Label_82
Label_83:
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 80]
	mov	rax, qword [rbx]
	mov	rdi, rax
	call	toStringHex
	mov	qword [rbp - 104], rax
	mov	rax, qword [rbp - 104]
	mov	rdi, rax
	call	print
	mov	qword [rbp - 112], rax
Label_81:
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 120], rax
	mov	rdx, qword [rbp - 16]
	add	rdx, 1
	mov	qword [rbp - 16], rdx
	jmp	Label_84
Label_82:
	mov	rax, str__3
	mov	rdi, rax
	call	println
	mov	qword [rbp - 128], rax
Label_76:
	mov	rsp, rbp
	pop	rbp
	ret
nextLetter:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 122
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 16], rcx
	mov	rax, qword [rbp - 16]
	cmp	rax, 1
	je	Label_87
	jmp	Label_88
Label_87:
	mov	rax, 1
	mov	qword [rbp - 24], rax
	neg	qword [rbp - 24]
	mov	rax, qword [rbp - 24]
	jmp	Label_85
	jmp	Label_86
Label_88:
Label_86:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 90
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	cmp	rax, 1
	je	Label_90
	jmp	Label_91
Label_90:
	mov	rax, 97
	jmp	Label_85
	jmp	Label_89
Label_91:
Label_89:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 57
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 40], rcx
	mov	rax, qword [rbp - 40]
	cmp	rax, 1
	je	Label_93
	jmp	Label_94
Label_93:
	mov	rax, 65
	jmp	Label_85
	jmp	Label_92
Label_94:
Label_92:
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 48], rdx
	mov	rax, qword [rbp - 48]
	jmp	Label_85
Label_85:
	mov	rsp, rbp
	pop	rbp
	ret
nextText:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 72
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rdx, qword [rbp - 16]
	sub	rdx, 1
	mov	qword [rbp - 32], rdx
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 24], rax
Label_99:
	mov	rcx, qword [rbp - 24]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 40], rcx
	mov	rax, qword [rbp - 40]
	cmp	rax, 1
	je	Label_98
	jmp	Label_97
Label_98:
	mov	rbx, qword [rbp - 24]
	imul	rbx, 8
	add	rbx, qword [rbp - 8]
	mov	rax, qword [rbx]
	mov	rdi, rax
	call	nextLetter
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 48]
	mov	rbx, qword [rbp - 24]
	imul	rbx, 8
	add	rbx, qword [rbp - 8]
	mov	qword [rbx], rax
	mov	rax, 1
	mov	qword [rbp - 64], rax
	neg	qword [rbp - 64]
	mov	r10, qword [rbp - 24]
	imul	r10, 8
	add	r10, qword [rbp - 8]
	mov	rcx, qword [r10]
	cmp	rcx, qword [rbp - 64]
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 56], rcx
	mov	rax, qword [rbp - 56]
	cmp	rax, 1
	je	Label_101
	jmp	Label_102
Label_101:
	mov	rax, 48
	mov	rbx, qword [rbp - 24]
	imul	rbx, 8
	add	rbx, qword [rbp - 8]
	mov	qword [rbx], rax
	jmp	Label_100
Label_102:
	mov	rax, 1
	jmp	Label_95
Label_100:
Label_96:
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 72], rax
	mov	rdx, qword [rbp - 24]
	sub	rdx, 1
	mov	qword [rbp - 24], rdx
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
	sub	rsp, 80
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	array.size
	mov	qword [rbp - 32], rax
	mov	rax, qword [rbp - 16]
	mov	rdi, rax
	call	array.size
	mov	qword [rbp - 40], rax
	mov	rcx, qword [rbp - 32]
	cmp	rcx, qword [rbp - 40]
	setne	cl
	movzx	rcx, cl
	mov	qword [rbp - 24], rcx
	mov	rax, qword [rbp - 24]
	cmp	rax, 1
	je	Label_105
	jmp	Label_106
Label_105:
	mov	rax, 0
	jmp	Label_103
	jmp	Label_104
Label_106:
Label_104:
	mov	rax, 0
	mov	qword [rbp - 48], rax
Label_110:
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	array.size
	mov	qword [rbp - 64], rax
	mov	rcx, qword [rbp - 48]
	cmp	rcx, qword [rbp - 64]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 56], rcx
	mov	rax, qword [rbp - 56]
	cmp	rax, 1
	je	Label_109
	jmp	Label_108
Label_109:
	mov	r10, qword [rbp - 48]
	imul	r10, 8
	add	r10, qword [rbp - 8]
	mov	r11, qword [rbp - 48]
	imul	r11, 8
	add	r11, qword [rbp - 16]
	mov	rcx, qword [r10]
	cmp	rcx, qword [r11]
	setne	cl
	movzx	rcx, cl
	mov	qword [rbp - 72], rcx
	mov	rax, qword [rbp - 72]
	cmp	rax, 1
	je	Label_112
	jmp	Label_113
Label_112:
	mov	rax, 0
	jmp	Label_103
	jmp	Label_111
Label_113:
Label_111:
Label_107:
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 80], rax
	mov	rdx, qword [rbp - 48]
	add	rdx, 1
	mov	qword [rbp - 48], rdx
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
	sub	rsp, 336
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, 5
	mov	qword [rbp - 16], rax
	mov	rdx, qword [rbp - 16]
	add	rdx, 1
	mov	qword [rbp - 16], rdx
	mov	rdx, qword [rbp - 16]
	imul	rdx, 8
	mov	qword [rbp - 16], rdx
	mov	rax, qword [rbp - 16]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 24], rax
	mov	rax, 5
	mov	rbx, qword [rbp - 24]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 24]
	add	rdx, 8
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 32], rax
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	string.length
	mov	qword [rbp - 48], rax
	mov	rcx, qword [rbp - 48]
	cmp	rcx, 40
	setne	cl
	movzx	rcx, cl
	mov	qword [rbp - 40], rcx
	mov	rax, qword [rbp - 40]
	cmp	rax, 1
	je	Label_116
	jmp	Label_117
Label_116:
	mov	rax, str__4
	mov	rdi, rax
	call	println
	mov	qword [rbp - 56], rax
	jmp	Label_114
	jmp	Label_115
Label_117:
Label_115:
	mov	rax, 0
	mov	qword [rbp - 64], rax
Label_121:
	mov	rcx, qword [rbp - 64]
	cmp	rcx, 5
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 72], rcx
	mov	rax, qword [rbp - 72]
	cmp	rax, 1
	je	Label_120
	jmp	Label_119
Label_120:
	mov	rax, 0
	mov	rbx, qword [rbp - 64]
	imul	rbx, 8
	add	rbx, qword [rbp - 32]
	mov	qword [rbx], rax
Label_118:
	mov	rax, qword [rbp - 64]
	mov	qword [rbp - 80], rax
	mov	rdx, qword [rbp - 64]
	add	rdx, 1
	mov	qword [rbp - 64], rdx
	jmp	Label_121
Label_119:
	mov	rax, 0
	mov	qword [rbp - 64], rax
Label_125:
	mov	rcx, qword [rbp - 64]
	cmp	rcx, 40
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 88], rcx
	mov	rax, qword [rbp - 88]
	cmp	rax, 1
	je	Label_124
	jmp	Label_123
Label_124:
	mov	rax, qword [rbp - 64]
	mov	rcx, 8
	cqo
	idiv	rcx
	mov	qword [rbp - 96], rax
	mov	rax, qword [rbp - 64]
	mov	rcx, 8
	cqo
	idiv	rcx
	mov	qword [rbp - 112], rax
	mov	rdx, qword [rbp - 64]
	add	rdx, 3
	mov	qword [rbp - 128], rdx
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	mov	rax, qword [rbp - 64]
	mov	rsi, rax
	mov	rax, qword [rbp - 128]
	mov	rdx, rax
	call	string.substring
	mov	qword [rbp - 136], rax
	mov	rax, qword [rbp - 136]
	mov	rdi, rax
	call	hex2int
	mov	qword [rbp - 144], rax
	mov	rax, qword [rbp - 64]
	mov	rcx, 4
	cqo
	idiv	rcx
	mov	qword [rbp - 176], rax
	mov	rax, qword [rbp - 176]
	mov	rcx, 2
	cqo
	idiv	rcx
	mov	qword [rbp - 168], rdx
	mov	rdx, 1
	sub	rdx, qword [rbp - 168]
	mov	qword [rbp - 160], rdx
	mov	rdx, qword [rbp - 160]
	imul	rdx, 16
	mov	qword [rbp - 152], rdx
	mov	rax, qword [rbp - 144]
	mov	rcx, qword [rbp - 152]
	shl	rax, cl
	mov	qword [rbp - 120], rax
	mov	r10, qword [rbp - 112]
	imul	r10, 8
	add	r10, qword [rbp - 32]
	mov	rdx, qword [r10]
	or	rdx, qword [rbp - 120]
	mov	qword [rbp - 104], rdx
	mov	rax, qword [rbp - 104]
	mov	rbx, qword [rbp - 96]
	imul	rbx, 8
	add	rbx, qword [rbp - 32]
	mov	qword [rbx], rax
Label_122:
	mov	rdx, qword [rbp - 64]
	add	rdx, 4
	mov	qword [rbp - 184], rdx
	mov	rax, qword [rbp - 184]
	mov	qword [rbp - 64], rax
	jmp	Label_125
Label_123:
	mov	rax, 4
	mov	qword [rbp - 192], rax
	mov	rax, 1
	mov	qword [rbp - 200], rax
Label_129:
	mov	rcx, qword [rbp - 200]
	cmp	rcx, qword [rbp - 192]
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 208], rcx
	mov	rax, qword [rbp - 208]
	cmp	rax, 1
	je	Label_128
	jmp	Label_127
Label_128:
	mov	rax, 0
	mov	qword [rbp - 64], rax
Label_133:
	mov	rcx, qword [rbp - 64]
	cmp	rcx, qword [rbp - 200]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 216], rcx
	mov	rax, qword [rbp - 216]
	cmp	rax, 1
	je	Label_132
	jmp	Label_131
Label_132:
	mov	rax, qword [ inputBuffer__ ]
	mov	qword [rbp - 224], rax
	mov	rax, 48
	mov	rbx, qword [rbp - 64]
	imul	rbx, 8
	add	rbx, qword [rbp - 224]
	mov	qword [rbx], rax
Label_130:
	mov	rax, qword [rbp - 64]
	mov	qword [rbp - 232], rax
	mov	rdx, qword [rbp - 64]
	add	rdx, 1
	mov	qword [rbp - 64], rdx
	jmp	Label_133
Label_131:
Label_137:
	mov	rax, 1
	cmp	rax, 1
	je	Label_136
	jmp	Label_135
Label_136:
	mov	rax, qword [ inputBuffer__ ]
	mov	rdi, rax
	mov	rax, qword [rbp - 200]
	mov	rsi, rax
	call	sha1
	mov	qword [rbp - 240], rax
	mov	rax, qword [rbp - 240]
	mov	qword [rbp - 248], rax
	mov	rax, qword [rbp - 248]
	mov	rdi, rax
	mov	rax, qword [rbp - 32]
	mov	rsi, rax
	call	array_equal
	mov	qword [rbp - 256], rax
	mov	rax, qword [rbp - 256]
	cmp	rax, 1
	je	Label_139
	jmp	Label_140
Label_139:
	mov	rax, 0
	mov	qword [rbp - 64], rax
Label_144:
	mov	rcx, qword [rbp - 64]
	cmp	rcx, qword [rbp - 200]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 264], rcx
	mov	rax, qword [rbp - 264]
	cmp	rax, 1
	je	Label_143
	jmp	Label_142
Label_143:
	mov	rax, qword [ inputBuffer__ ]
	mov	qword [rbp - 272], rax
	mov	rbx, qword [rbp - 64]
	imul	rbx, 8
	add	rbx, qword [rbp - 272]
	mov	rax, qword [rbx]
	mov	rdi, rax
	call	int2chr
	mov	qword [rbp - 280], rax
	mov	rax, qword [rbp - 280]
	mov	rdi, rax
	call	print
	mov	qword [rbp - 288], rax
Label_141:
	mov	rax, qword [rbp - 64]
	mov	qword [rbp - 296], rax
	mov	rdx, qword [rbp - 64]
	add	rdx, 1
	mov	qword [rbp - 64], rdx
	jmp	Label_144
Label_142:
	mov	rax, str__5
	mov	rdi, rax
	call	println
	mov	qword [rbp - 304], rax
	jmp	Label_114
	jmp	Label_138
Label_140:
Label_138:
	mov	rax, qword [ inputBuffer__ ]
	mov	rdi, rax
	mov	rax, qword [rbp - 200]
	mov	rsi, rax
	call	nextText
	mov	qword [rbp - 312], rax
	mov	rax, qword [rbp - 312]
	mov	qword [rbp - 320], rax
	xor	qword [rbp - 320], 1
	mov	rax, qword [rbp - 320]
	cmp	rax, 1
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
	mov	rax, qword [rbp - 200]
	mov	qword [rbp - 328], rax
	mov	rdx, qword [rbp - 200]
	add	rdx, 1
	mov	qword [rbp - 200], rdx
	jmp	Label_129
Label_127:
	mov	rax, str__6
	mov	rdi, rax
	call	println
	mov	qword [rbp - 336], rax
Label_114:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 168
	mov	rax, str__7
	mov	qword [ asciiTable__ ], rax
	mov	rax, 100
	mov	qword [ MAXCHUNK__ ], rax
	mov	rdx, qword [ MAXCHUNK__ ]
	sub	rdx, 1
	mov	qword [rbp - 24], rdx
	mov	rdx, qword [rbp - 24]
	imul	rdx, 64
	mov	qword [rbp - 16], rdx
	mov	rdx, qword [rbp - 16]
	sub	rdx, 16
	mov	qword [rbp - 8], rdx
	mov	rax, qword [rbp - 8]
	mov	qword [ MAXLENGTH__ ], rax
	mov	rax, qword [ MAXCHUNK__ ]
	mov	qword [rbp - 32], rax
	mov	rdx, qword [rbp - 32]
	add	rdx, 1
	mov	qword [rbp - 32], rdx
	mov	rdx, qword [rbp - 32]
	imul	rdx, 8
	mov	qword [rbp - 32], rdx
	mov	rax, qword [rbp - 32]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 40], rax
	mov	rax, qword [ MAXCHUNK__ ]
	mov	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 40]
	add	rdx, 8
	mov	qword [rbp - 40], rdx
	mov	rax, qword [ MAXCHUNK__ ]
	mov	qword [rbp - 32], rax
Label_149:
	mov	rdx, qword [rbp - 32]
	sub	rdx, 1
	mov	qword [rbp - 32], rdx
	mov	rax, 80
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
	mov	rax, 80
	mov	rbx, qword [rbp - 56]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 56]
	add	rdx, 8
	mov	qword [rbp - 56], rdx
	mov	rax, qword [rbp - 56]
	mov	rbx, qword [rbp - 32]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
	mov	rax, qword [rbp - 32]
	cmp	rax, 0
	jne	Label_149
	mov	rax, qword [rbp - 40]
	mov	qword [ chunks__ ], rax
	mov	rax, qword [ MAXLENGTH__ ]
	mov	qword [rbp - 64], rax
	mov	rdx, qword [rbp - 64]
	add	rdx, 1
	mov	qword [rbp - 64], rdx
	mov	rdx, qword [rbp - 64]
	imul	rdx, 8
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 72], rax
	mov	rax, qword [ MAXLENGTH__ ]
	mov	rbx, qword [rbp - 72]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 72]
	add	rdx, 8
	mov	qword [rbp - 72], rdx
	mov	rax, qword [rbp - 72]
	mov	qword [ inputBuffer__ ], rax
	mov	rax, 5
	mov	qword [rbp - 80], rax
	mov	rdx, qword [rbp - 80]
	add	rdx, 1
	mov	qword [rbp - 80], rdx
	mov	rdx, qword [rbp - 80]
	imul	rdx, 8
	mov	qword [rbp - 80], rdx
	mov	rax, qword [rbp - 80]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 88], rax
	mov	rax, 5
	mov	rbx, qword [rbp - 88]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 88]
	add	rdx, 8
	mov	qword [rbp - 88], rdx
	mov	rax, qword [rbp - 88]
	mov	qword [ outputBuffer__ ], rax
Label_153:
	mov	rax, 1
	cmp	rax, 1
	je	Label_152
	jmp	Label_151
Label_152:
	call	getInt
	mov	qword [rbp - 112], rax
	mov	rax, qword [rbp - 112]
	mov	qword [rbp - 96], rax
	mov	rcx, qword [rbp - 96]
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 120], rcx
	mov	rax, qword [rbp - 120]
	cmp	rax, 1
	je	Label_155
	jmp	Label_156
Label_155:
	jmp	Label_151
	jmp	Label_154
Label_156:
Label_154:
	mov	rcx, qword [rbp - 96]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 128], rcx
	mov	rax, qword [rbp - 128]
	cmp	rax, 1
	je	Label_158
	jmp	Label_159
Label_158:
	call	getString
	mov	qword [rbp - 136], rax
	mov	rax, qword [rbp - 136]
	mov	qword [rbp - 104], rax
	mov	rax, qword [rbp - 104]
	mov	rdi, rax
	call	computeSHA1
	mov	qword [rbp - 144], rax
	jmp	Label_157
Label_159:
	mov	rcx, qword [rbp - 96]
	cmp	rcx, 2
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 152], rcx
	mov	rax, qword [rbp - 152]
	cmp	rax, 1
	je	Label_160
	jmp	Label_161
Label_160:
	call	getString
	mov	qword [rbp - 160], rax
	mov	rax, qword [rbp - 160]
	mov	qword [rbp - 104], rax
	mov	rax, qword [rbp - 104]
	mov	rdi, rax
	call	crackSHA1
	mov	qword [rbp - 168], rax
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
