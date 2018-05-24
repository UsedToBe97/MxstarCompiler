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
	dq	0
str__0:
	db	0
	dq	0
str__1:
	db	0
	dq	95
str__2:
	db	32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 0
	dq	1
str__3:
	db	32, 0
	dq	1
str__4:
	db	32, 0
	dq	1
str__5:
	db	32, 0
	dq	1
str__6:
	db	32, 0
	dq	0
str__7:
	db	0
asciiTable__:
	dq	0
section .text
hilo:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rax, qword [rbp - 8]
	mov	rcx, 16
	shl	rax, cl
	mov	qword [rbp - 32], rax
	mov	rdx, qword [rbp - 16]
	or	rdx, qword [rbp - 32]
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
shift_l:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 40
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rax, qword [rbp - 8]
	mov	rcx, qword [rbp - 16]
	shl	rax, cl
	mov	qword [rbp - 32], rax
	mov	rax, 65535
	mov	rdi, rax
	mov	rax, 65535
	mov	rsi, rax
	call	hilo
	mov	qword [rbp - 40], rax
	mov	rdx, qword [rbp - 32]
	and	rdx, qword [rbp - 40]
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	jmp	Label_1
Label_1:
	mov	rsp, rbp
	pop	rbp
	ret
shift_r:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 88
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rax, 32767
	mov	rdi, rax
	mov	rax, 65535
	mov	rsi, rax
	call	hilo
	mov	qword [rbp - 24], rax
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 32], rax
	mov	rax, qword [rbp - 32]
	mov	rcx, qword [rbp - 16]
	shr	rax, cl
	mov	qword [rbp - 56], rax
	mov	rax, qword [rbp - 56]
	mov	rcx, 1
	shl	rax, cl
	mov	qword [rbp - 48], rax
	mov	rdx, qword [rbp - 48]
	add	rdx, 1
	mov	qword [rbp - 40], rdx
	mov	rax, qword [rbp - 40]
	mov	qword [rbp - 32], rax
	mov	rax, qword [rbp - 8]
	mov	rcx, qword [rbp - 16]
	shr	rax, cl
	mov	qword [rbp - 72], rax
	mov	rdx, qword [rbp - 32]
	and	rdx, qword [rbp - 72]
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	mov	qword [rbp - 32], rax
	mov	rax, 65535
	mov	rdi, rax
	mov	rax, 65535
	mov	rsi, rax
	call	hilo
	mov	qword [rbp - 88], rax
	mov	rdx, qword [rbp - 32]
	and	rdx, qword [rbp - 88]
	mov	qword [rbp - 80], rdx
	mov	rax, qword [rbp - 80]
	jmp	Label_2
Label_2:
	mov	rsp, rbp
	pop	rbp
	ret
xorshift:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 120
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 32], rax
	mov	rax, 0
	mov	qword [rbp - 40], rax
Label_7:
	mov	rdx, qword [rbp - 16]
	imul	rdx, 10
	mov	qword [rbp - 56], rdx
	mov	rcx, qword [rbp - 40]
	cmp	rcx, qword [rbp - 56]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 48], rcx
	cmp	qword [rbp - 48], 1
	je	Label_6
	jmp	Label_5
Label_6:
	mov	rax, qword [rbp - 32]
	mov	rdi, rax
	mov	rax, 13
	mov	rsi, rax
	call	shift_l
	mov	qword [rbp - 72], rax
	mov	rdx, qword [rbp - 32]
	xor	rdx, qword [rbp - 72]
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	mov	qword [rbp - 32], rax
	mov	rax, qword [rbp - 32]
	mov	rdi, rax
	mov	rax, 17
	mov	rsi, rax
	call	shift_r
	mov	qword [rbp - 88], rax
	mov	rdx, qword [rbp - 32]
	xor	rdx, qword [rbp - 88]
	mov	qword [rbp - 80], rdx
	mov	rax, qword [rbp - 80]
	mov	qword [rbp - 32], rax
	mov	rax, qword [rbp - 32]
	mov	rdi, rax
	mov	rax, 5
	mov	rsi, rax
	call	shift_l
	mov	qword [rbp - 104], rax
	mov	rdx, qword [rbp - 32]
	xor	rdx, qword [rbp - 104]
	mov	qword [rbp - 96], rdx
	mov	rax, qword [rbp - 96]
	mov	qword [rbp - 32], rax
Label_4:
	mov	rax, qword [rbp - 40]
	mov	qword [rbp - 112], rax
	mov	rdx, qword [rbp - 40]
	add	rdx, 1
	mov	qword [rbp - 40], rdx
	jmp	Label_7
Label_5:
	mov	rdx, qword [rbp - 32]
	xor	rdx, 123456789
	mov	qword [rbp - 120], rdx
	mov	rax, qword [rbp - 120]
	jmp	Label_3
Label_3:
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
	cmp	qword [rbp - 24], 1
	je	Label_12
	mov	rax, 0
	mov	qword [rbp - 16], rax
	jmp	Label_13
Label_12:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 126
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 16], rax
Label_13:
	cmp	qword [rbp - 16], 1
	je	Label_10
	jmp	Label_11
Label_10:
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
	jmp	Label_8
	jmp	Label_9
Label_11:
Label_9:
	mov	rax, str__0
	jmp	Label_8
Label_8:
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
Label_18:
	mov	rcx, qword [rbp - 24]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	cmp	qword [rbp - 32], 1
	je	Label_17
	jmp	Label_16
Label_17:
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
	cmp	qword [rbp - 64], 1
	je	Label_20
	jmp	Label_21
Label_20:
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
	jmp	Label_19
Label_21:
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
Label_19:
Label_15:
	mov	rdx, qword [rbp - 24]
	sub	rdx, 4
	mov	qword [rbp - 144], rdx
	mov	rax, qword [rbp - 144]
	mov	qword [rbp - 24], rax
	jmp	Label_18
Label_16:
	mov	rax, qword [rbp - 16]
	jmp	Label_14
Label_14:
	mov	rsp, rbp
	pop	rbp
	ret
getnumber:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 88
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rax, rdx
	mov	qword [rbp - 24], rax
	mov	rdx, qword [rbp - 24]
	and	rdx, 31
	mov	qword [rbp - 32], rdx
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 40], rax
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	mov	rax, qword [rbp - 16]
	mov	rsi, rax
	call	xorshift
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 56], rax
	mov	rax, qword [rbp - 56]
	mov	rdi, rax
	mov	rax, qword [rbp - 40]
	mov	rsi, rax
	call	shift_l
	mov	qword [rbp - 72], rax
	mov	rdx, 32
	sub	rdx, qword [rbp - 40]
	mov	qword [rbp - 80], rdx
	mov	rax, qword [rbp - 56]
	mov	rdi, rax
	mov	rax, qword [rbp - 80]
	mov	rsi, rax
	call	shift_r
	mov	qword [rbp - 88], rax
	mov	rdx, qword [rbp - 72]
	or	rdx, qword [rbp - 88]
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	jmp	Label_22
Label_22:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 560
	mov	rax, str__2
	mov	qword [ asciiTable__ ], rax
	call	getInt
	mov	qword [rbp - 80], rax
	mov	rax, qword [rbp - 80]
	mov	qword [rbp - 8], rax
	call	getInt
	mov	qword [rbp - 88], rax
	mov	rax, qword [rbp - 88]
	mov	qword [rbp - 16], rax
	call	getInt
	mov	qword [rbp - 96], rax
	mov	rax, qword [rbp - 96]
	mov	qword [rbp - 24], rax
	call	getInt
	mov	qword [rbp - 104], rax
	mov	rax, qword [rbp - 104]
	mov	qword [rbp - 32], rax
	call	getInt
	mov	qword [rbp - 112], rax
	mov	rax, qword [rbp - 112]
	mov	qword [rbp - 40], rax
	call	getInt
	mov	qword [rbp - 120], rax
	mov	rax, qword [rbp - 120]
	mov	qword [rbp - 48], rax
	mov	rax, 30
	mov	qword [rbp - 128], rax
	mov	rax, 0
	mov	qword [rbp - 136], rax
	mov	rax, 0
	mov	qword [rbp - 144], rax
	mov	rax, 0
	mov	qword [rbp - 152], rax
	mov	rax, 0
	mov	qword [rbp - 160], rax
	mov	rax, qword [rbp - 8]
	mov	qword [rbp - 56], rax
Label_27:
	mov	rcx, qword [rbp - 56]
	cmp	rcx, qword [rbp - 16]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 168], rcx
	cmp	qword [rbp - 168], 1
	je	Label_26
	jmp	Label_25
Label_26:
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 64], rax
Label_31:
	mov	rcx, qword [rbp - 64]
	cmp	rcx, qword [rbp - 32]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 176], rcx
	cmp	qword [rbp - 176], 1
	je	Label_30
	jmp	Label_29
Label_30:
	mov	rax, qword [rbp - 40]
	mov	qword [rbp - 72], rax
Label_35:
	mov	rcx, qword [rbp - 72]
	cmp	rcx, qword [rbp - 48]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 184], rcx
	cmp	qword [rbp - 184], 1
	je	Label_34
	jmp	Label_33
Label_34:
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	mov	rax, qword [rbp - 128]
	mov	rsi, rax
	mov	rax, qword [rbp - 72]
	mov	rdx, rax
	call	getnumber
	mov	qword [rbp - 192], rax
	mov	rax, qword [rbp - 192]
	mov	qword [rbp - 200], rax
	mov	rax, qword [rbp - 56]
	mov	rdi, rax
	mov	rax, qword [rbp - 128]
	mov	rsi, rax
	mov	rax, qword [rbp - 72]
	mov	rdx, rax
	call	getnumber
	mov	qword [rbp - 208], rax
	mov	rax, qword [rbp - 208]
	mov	qword [rbp - 216], rax
	mov	rax, qword [rbp - 64]
	mov	rdi, rax
	mov	rax, qword [rbp - 128]
	mov	rsi, rax
	mov	rax, qword [rbp - 72]
	mov	rdx, rax
	call	getnumber
	mov	qword [rbp - 224], rax
	mov	rax, qword [rbp - 224]
	mov	qword [rbp - 232], rax
	mov	rdx, qword [rbp - 56]
	xor	rdx, qword [rbp - 64]
	mov	qword [rbp - 240], rdx
	mov	rax, qword [rbp - 240]
	mov	rdi, rax
	mov	rax, qword [rbp - 128]
	mov	rsi, rax
	mov	rax, qword [rbp - 72]
	mov	rdx, rax
	call	getnumber
	mov	qword [rbp - 248], rax
	mov	rax, qword [rbp - 248]
	mov	qword [rbp - 256], rax
	mov	rax, qword [rbp - 72]
	mov	rdi, rax
	mov	rax, 1
	mov	rsi, rax
	call	xorshift
	mov	qword [rbp - 280], rax
	mov	rax, qword [rbp - 64]
	mov	rdi, rax
	mov	rax, 1
	mov	rsi, rax
	call	xorshift
	mov	qword [rbp - 288], rax
	mov	rdx, qword [rbp - 280]
	xor	rdx, qword [rbp - 288]
	mov	qword [rbp - 272], rdx
	mov	rax, qword [rbp - 56]
	mov	rdi, rax
	mov	rax, 1
	mov	rsi, rax
	call	xorshift
	mov	qword [rbp - 296], rax
	mov	rdx, qword [rbp - 272]
	xor	rdx, qword [rbp - 296]
	mov	qword [rbp - 264], rdx
	mov	rax, qword [rbp - 264]
	mov	qword [rbp - 304], rax
	mov	rdx, qword [rbp - 200]
	xor	rdx, qword [rbp - 304]
	mov	qword [rbp - 320], rdx
	mov	rax, qword [rbp - 320]
	mov	rdi, rax
	mov	rax, 1
	mov	rsi, rax
	call	xorshift
	mov	qword [rbp - 328], rax
	mov	rdx, qword [rbp - 136]
	add	rdx, qword [rbp - 328]
	mov	qword [rbp - 312], rdx
	mov	rax, qword [rbp - 312]
	mov	qword [rbp - 136], rax
	mov	rdx, qword [rbp - 216]
	xor	rdx, qword [rbp - 304]
	mov	qword [rbp - 344], rdx
	mov	rax, qword [rbp - 344]
	mov	rdi, rax
	mov	rax, 1
	mov	rsi, rax
	call	xorshift
	mov	qword [rbp - 352], rax
	mov	rdx, qword [rbp - 144]
	add	rdx, qword [rbp - 352]
	mov	qword [rbp - 336], rdx
	mov	rax, qword [rbp - 336]
	mov	qword [rbp - 144], rax
	mov	rdx, qword [rbp - 232]
	xor	rdx, qword [rbp - 304]
	mov	qword [rbp - 368], rdx
	mov	rax, qword [rbp - 368]
	mov	rdi, rax
	mov	rax, 1
	mov	rsi, rax
	call	xorshift
	mov	qword [rbp - 376], rax
	mov	rdx, qword [rbp - 152]
	add	rdx, qword [rbp - 376]
	mov	qword [rbp - 360], rdx
	mov	rax, qword [rbp - 360]
	mov	qword [rbp - 152], rax
	mov	rdx, qword [rbp - 256]
	xor	rdx, qword [rbp - 304]
	mov	qword [rbp - 392], rdx
	mov	rax, qword [rbp - 392]
	mov	rdi, rax
	mov	rax, 1
	mov	rsi, rax
	call	xorshift
	mov	qword [rbp - 400], rax
	mov	rdx, qword [rbp - 160]
	add	rdx, qword [rbp - 400]
	mov	qword [rbp - 384], rdx
	mov	rax, qword [rbp - 384]
	mov	qword [rbp - 160], rax
Label_32:
	mov	rax, qword [rbp - 72]
	mov	qword [rbp - 408], rax
	mov	rdx, qword [rbp - 72]
	add	rdx, 1
	mov	qword [rbp - 72], rdx
	jmp	Label_35
Label_33:
Label_28:
	mov	rax, qword [rbp - 64]
	mov	qword [rbp - 416], rax
	mov	rdx, qword [rbp - 64]
	add	rdx, 1
	mov	qword [rbp - 64], rdx
	jmp	Label_31
Label_29:
Label_24:
	mov	rax, qword [rbp - 56]
	mov	qword [rbp - 424], rax
	mov	rdx, qword [rbp - 56]
	add	rdx, 1
	mov	qword [rbp - 56], rdx
	jmp	Label_27
Label_25:
	mov	rax, qword [rbp - 136]
	mov	rdi, rax
	call	toStringHex
	mov	qword [rbp - 448], rax
	mov	rax, qword [rbp - 448]
	mov	rdi, rax
	mov	rax, str__3
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 440], rax
	mov	rax, qword [rbp - 440]
	mov	rdi, rax
	call	print
	mov	qword [rbp - 456], rax
	mov	rax, qword [rbp - 144]
	mov	rdi, rax
	call	toStringHex
	mov	qword [rbp - 480], rax
	mov	rax, qword [rbp - 480]
	mov	rdi, rax
	mov	rax, str__4
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 472], rax
	mov	rax, qword [rbp - 472]
	mov	rdi, rax
	call	print
	mov	qword [rbp - 488], rax
	mov	rax, qword [rbp - 152]
	mov	rdi, rax
	call	toStringHex
	mov	qword [rbp - 512], rax
	mov	rax, qword [rbp - 512]
	mov	rdi, rax
	mov	rax, str__5
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 504], rax
	mov	rax, qword [rbp - 504]
	mov	rdi, rax
	call	print
	mov	qword [rbp - 520], rax
	mov	rax, qword [rbp - 160]
	mov	rdi, rax
	call	toStringHex
	mov	qword [rbp - 544], rax
	mov	rax, qword [rbp - 544]
	mov	rdi, rax
	mov	rax, str__6
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 536], rax
	mov	rax, qword [rbp - 536]
	mov	rdi, rax
	call	print
	mov	qword [rbp - 552], rax
	mov	rax, str__7
	mov	rdi, rax
	call	println
	mov	qword [rbp - 560], rax
	mov	rax, 0
	jmp	Label_23
Label_23:
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
