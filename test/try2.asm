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
	dq	13
str__0:
	db	110, 111, 32, 115, 111, 108, 117, 116, 105, 111, 110, 33, 10, 0
N__:
	dq	0
head__:
	dq	0
startx__:
	dq	0
starty__:
	dq	0
targetx__:
	dq	0
targety__:
	dq	0
x__:
	dq	0
y__:
	dq	0
xlist__:
	dq	0
ylist__:
	dq	0
tail__:
	dq	0
ok__:
	dq	0
now__:
	dq	0
dx__:
	dq	0
dy__:
	dq	0
step__:
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
	sub	rsp, 40
	mov	rax, rdi
	mov	r10, rax
	mov	qword [ head__ ], 0
	mov	qword [ tail__ ], 0
	mov	rax, r10
	mov	r11, rax
	mov	rdx, r11
	add	rdx, 1
	mov	r11, rdx
	mov	rdx, r11
	imul	rdx, 8
	mov	r11, rdx
	mov	rax, r11
	mov	rdi, rax
	call	malloc
	mov	r12, rax
	mov	rax, r10
	mov	rax, r12
	mov	qword [rax], rax
	mov	rdx, r12
	add	rdx, 8
	mov	r12, rdx
	mov	rax, r12
	mov	qword [ step__ ], rax
	mov	qword [ i__ ], 0
Label_4:
	mov	rcx, qword [ i__ ]
	cmp	rcx, r10
	setl	cl
	movzx	rcx, cl
	mov	r13, rcx
	cmp	r13, 1
	je	Label_3
	jmp	Label_2
Label_3:
	mov	rax, qword [ step__ ]
	mov	r14, rax
	mov	rax, qword [ i__ ]
	mov	r15, rax
	mov	rax, r10
	mov	r8, rax
	mov	rdx, r8
	add	rdx, 1
	mov	r8, rdx
	mov	rdx, r8
	imul	rdx, 8
	mov	r8, rdx
	mov	rax, r8
	mov	rdi, rax
	call	malloc
	mov	r9, rax
	mov	rax, r10
	mov	rax, r9
	mov	qword [rax], rax
	mov	rdx, r9
	add	rdx, 8
	mov	r9, rdx
	mov	rax, r9
	mov	qword [r14 + r15 * 8], rax
	mov	qword [ j__ ], 0
Label_8:
	mov	rcx, qword [ j__ ]
	cmp	rcx, r10
	setl	cl
	movzx	rcx, cl
	mov	rsi, rcx
	cmp	rsi, 1
	je	Label_7
	jmp	Label_6
Label_7:
	mov	rax, qword [ step__ ]
	mov	rbx, rax
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 8], rax
	mov	rax, qword [rbp - 8]
	imul	rax, 8
	add	rax, rbx
	mov	rax, qword [rax]
	mov	qword [rbp - 16], rax
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 24], rax
	mov	rax, qword [rbp - 24]
	imul	rax, 8
	add	rax, qword [rbp - 16]
	mov	qword [rax], 0
Label_5:
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 32], rax
	mov	rdx, qword [ j__ ]
	add	rdx, 1
	mov	qword [ j__ ], rdx
	jmp	Label_8
Label_6:
Label_1:
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 40], rax
	mov	rdx, qword [ i__ ]
	add	rdx, 1
	mov	qword [ i__ ], rdx
	jmp	Label_4
Label_2:
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
check:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0
	mov	rax, rdi
	mov	r10, rax
	mov	rcx, r10
	cmp	rcx, qword [ N__ ]
	setl	cl
	movzx	rcx, cl
	mov	r12, rcx
	cmp	r12, 1
	je	Label_10
	mov	r11, 0
	jmp	Label_11
Label_10:
	mov	rcx, r10
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	r13, rcx
	mov	rax, r13
	mov	r11, rax
Label_11:
	mov	rax, r11
	jmp	Label_9
Label_9:
	mov	rsp, rbp
	pop	rbp
	ret
addList:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 88
	mov	rax, rdi
	mov	r10, rax
	mov	rax, rsi
	mov	r11, rax
	mov	rax, r10
	mov	rdi, rax
	call	check
	mov	r14, rax
	cmp	r14, 1
	je	Label_16
	mov	r13, 0
	jmp	Label_17
Label_16:
	mov	rax, r11
	mov	rdi, rax
	call	check
	mov	r15, rax
	mov	rax, r15
	mov	r13, rax
Label_17:
	cmp	r13, 1
	je	Label_18
	mov	r12, 0
	jmp	Label_19
Label_18:
	mov	rax, qword [ step__ ]
	mov	r9, rax
	mov	rax, qword [r9 + r10 * 8]
	mov	rsi, rax
	mov	rbx, 1
	neg	rbx
	mov	rcx, qword [rsi + r11 * 8]
	cmp	rcx, rbx
	sete	cl
	movzx	rcx, cl
	mov	r8, rcx
	mov	rax, r8
	mov	r12, rax
Label_19:
	cmp	r12, 1
	je	Label_14
	jmp	Label_15
Label_14:
	mov	rax, qword [ tail__ ]
	mov	qword [rbp - 8], rax
	mov	rdx, qword [ tail__ ]
	add	rdx, 1
	mov	qword [ tail__ ], rdx
	mov	rax, qword [ xlist__ ]
	mov	qword [rbp - 16], rax
	mov	rax, qword [ tail__ ]
	mov	qword [rbp - 24], rax
	mov	rax, r10
	mov	rax, qword [rbp - 24]
	imul	rax, 8
	add	rax, qword [rbp - 16]
	mov	qword [rax], rax
	mov	rax, qword [ ylist__ ]
	mov	qword [rbp - 32], rax
	mov	rax, qword [ tail__ ]
	mov	qword [rbp - 40], rax
	mov	rax, r11
	mov	rax, qword [rbp - 40]
	imul	rax, 8
	add	rax, qword [rbp - 32]
	mov	qword [rax], rax
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 48], rax
	mov	rax, r10
	imul	rax, 8
	add	rax, qword [rbp - 48]
	mov	rax, qword [rax]
	mov	qword [rbp - 56], rax
	mov	rdx, qword [ now__ ]
	add	rdx, 1
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	mov	rax, r11
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	qword [rax], rax
	mov	rcx, r10
	cmp	rcx, qword [ targetx__ ]
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 80], rcx
	mov	rax, qword [rbp - 80]
	cmp	rax, 1
	je	Label_23
	mov	qword [rbp - 72], 0
	jmp	Label_24
Label_23:
	mov	rcx, r11
	cmp	rcx, qword [ targety__ ]
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 88], rcx
	mov	rax, qword [rbp - 88]
	mov	qword [rbp - 72], rax
Label_24:
	mov	rax, qword [rbp - 72]
	cmp	rax, 1
	je	Label_21
	jmp	Label_22
Label_21:
	mov	qword [ ok__ ], 1
	jmp	Label_20
Label_22:
Label_20:
	jmp	Label_13
Label_15:
Label_13:
Label_12:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 624
	mov	r10, 12000
	mov	rdx, r10
	add	rdx, 1
	mov	r10, rdx
	mov	rdx, r10
	imul	rdx, 8
	mov	r10, rdx
	mov	rax, r10
	mov	rdi, rax
	call	malloc
	mov	r11, rax
	mov	rax, r11
	mov	qword [rax], 12000
	mov	rdx, r11
	add	rdx, 8
	mov	r11, rdx
	mov	rax, r11
	mov	qword [ xlist__ ], rax
	mov	r12, 12000
	mov	rdx, r12
	add	rdx, 1
	mov	r12, rdx
	mov	rdx, r12
	imul	rdx, 8
	mov	r12, rdx
	mov	rax, r12
	mov	rdi, rax
	call	malloc
	mov	r13, rax
	mov	rax, r13
	mov	qword [rax], 12000
	mov	rdx, r13
	add	rdx, 8
	mov	r13, rdx
	mov	rax, r13
	mov	qword [ ylist__ ], rax
	mov	r14, 8
	mov	rdx, r14
	add	rdx, 1
	mov	r14, rdx
	mov	rdx, r14
	imul	rdx, 8
	mov	r14, rdx
	mov	rax, r14
	mov	rdi, rax
	call	malloc
	mov	r15, rax
	mov	rax, r15
	mov	qword [rax], 8
	mov	rdx, r15
	add	rdx, 8
	mov	r15, rdx
	mov	rax, r15
	mov	qword [ dx__ ], rax
	mov	r8, 9
	mov	rdx, r8
	add	rdx, 1
	mov	r8, rdx
	mov	rdx, r8
	imul	rdx, 8
	mov	r8, rdx
	mov	rax, r8
	mov	rdi, rax
	call	malloc
	mov	r9, rax
	mov	rax, r9
	mov	qword [rax], 9
	mov	rdx, r9
	add	rdx, 8
	mov	r9, rdx
	mov	rax, r9
	mov	qword [ dy__ ], rax
	mov	rdi, 106
	call	origin
	mov	rbx, rax
	call	getInt
	mov	qword [rbp - 8], rax
	mov	rax, qword [rbp - 8]
	mov	qword [ N__ ], rax
	mov	rdx, qword [ N__ ]
	sub	rdx, 1
	mov	qword [rbp - 16], rdx
	mov	rax, qword [rbp - 16]
	mov	qword [ targety__ ], rax
	mov	rax, qword [ targety__ ]
	mov	qword [ targetx__ ], rax
	mov	qword [ i__ ], 0
Label_29:
	mov	rcx, qword [ i__ ]
	cmp	rcx, qword [ N__ ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 24], rcx
	mov	rax, qword [rbp - 24]
	cmp	rax, 1
	je	Label_28
	jmp	Label_27
Label_28:
	mov	qword [ j__ ], 0
Label_33:
	mov	rcx, qword [ j__ ]
	cmp	rcx, qword [ N__ ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	cmp	rax, 1
	je	Label_32
	jmp	Label_31
Label_32:
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 40], rax
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 48]
	imul	rax, 8
	add	rax, qword [rbp - 40]
	mov	rax, qword [rax]
	mov	qword [rbp - 56], rax
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 64], rax
	mov	qword [rbp - 72], 1
	neg	qword [rbp - 72]
	mov	rax, qword [rbp - 72]
	mov	rax, qword [rbp - 64]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	qword [rax], rax
Label_30:
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 80], rax
	mov	rdx, qword [ j__ ]
	add	rdx, 1
	mov	qword [ j__ ], rdx
	jmp	Label_33
Label_31:
Label_26:
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 88], rax
	mov	rdx, qword [ i__ ]
	add	rdx, 1
	mov	qword [ i__ ], rdx
	jmp	Label_29
Label_27:
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 96], rax
	mov	qword [rbp - 104], 0
	mov	qword [rbp - 112], 2
	neg	qword [rbp - 112]
	mov	rax, qword [rbp - 112]
	mov	rax, qword [rbp - 104]
	imul	rax, 8
	add	rax, qword [rbp - 96]
	mov	qword [rax], rax
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 120], rax
	mov	qword [rbp - 128], 0
	mov	qword [rbp - 136], 1
	neg	qword [rbp - 136]
	mov	rax, qword [rbp - 136]
	mov	rax, qword [rbp - 128]
	imul	rax, 8
	add	rax, qword [rbp - 120]
	mov	qword [rax], rax
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 144], rax
	mov	qword [rbp - 152], 1
	mov	qword [rbp - 160], 2
	neg	qword [rbp - 160]
	mov	rax, qword [rbp - 160]
	mov	rax, qword [rbp - 152]
	imul	rax, 8
	add	rax, qword [rbp - 144]
	mov	qword [rax], rax
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 168], rax
	mov	qword [rbp - 176], 1
	mov	rax, qword [rbp - 176]
	imul	rax, 8
	add	rax, qword [rbp - 168]
	mov	qword [rax], 1
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 184], rax
	mov	qword [rbp - 192], 2
	mov	rax, qword [rbp - 192]
	imul	rax, 8
	add	rax, qword [rbp - 184]
	mov	qword [rax], 2
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 200], rax
	mov	qword [rbp - 208], 2
	mov	qword [rbp - 216], 1
	neg	qword [rbp - 216]
	mov	rax, qword [rbp - 216]
	mov	rax, qword [rbp - 208]
	imul	rax, 8
	add	rax, qword [rbp - 200]
	mov	qword [rax], rax
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 224], rax
	mov	qword [rbp - 232], 3
	mov	rax, qword [rbp - 232]
	imul	rax, 8
	add	rax, qword [rbp - 224]
	mov	qword [rax], 2
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 240], rax
	mov	qword [rbp - 248], 3
	mov	rax, qword [rbp - 248]
	imul	rax, 8
	add	rax, qword [rbp - 240]
	mov	qword [rax], 1
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 256], rax
	mov	qword [rbp - 264], 4
	mov	qword [rbp - 272], 1
	neg	qword [rbp - 272]
	mov	rax, qword [rbp - 272]
	mov	rax, qword [rbp - 264]
	imul	rax, 8
	add	rax, qword [rbp - 256]
	mov	qword [rax], rax
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 280], rax
	mov	qword [rbp - 288], 4
	mov	qword [rbp - 296], 2
	neg	qword [rbp - 296]
	mov	rax, qword [rbp - 296]
	mov	rax, qword [rbp - 288]
	imul	rax, 8
	add	rax, qword [rbp - 280]
	mov	qword [rax], rax
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 304], rax
	mov	qword [rbp - 312], 5
	mov	qword [rbp - 320], 1
	neg	qword [rbp - 320]
	mov	rax, qword [rbp - 320]
	mov	rax, qword [rbp - 312]
	imul	rax, 8
	add	rax, qword [rbp - 304]
	mov	qword [rax], rax
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 328], rax
	mov	qword [rbp - 336], 5
	mov	rax, qword [rbp - 336]
	imul	rax, 8
	add	rax, qword [rbp - 328]
	mov	qword [rax], 2
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 344], rax
	mov	qword [rbp - 352], 6
	mov	rax, qword [rbp - 352]
	imul	rax, 8
	add	rax, qword [rbp - 344]
	mov	qword [rax], 1
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 360], rax
	mov	qword [rbp - 368], 6
	mov	qword [rbp - 376], 2
	neg	qword [rbp - 376]
	mov	rax, qword [rbp - 376]
	mov	rax, qword [rbp - 368]
	imul	rax, 8
	add	rax, qword [rbp - 360]
	mov	qword [rax], rax
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 384], rax
	mov	qword [rbp - 392], 7
	mov	rax, qword [rbp - 392]
	imul	rax, 8
	add	rax, qword [rbp - 384]
	mov	qword [rax], 1
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 400], rax
	mov	qword [rbp - 408], 7
	mov	rax, qword [rbp - 408]
	imul	rax, 8
	add	rax, qword [rbp - 400]
	mov	qword [rax], 2
Label_37:
	mov	rcx, qword [ head__ ]
	cmp	rcx, qword [ tail__ ]
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 416], rcx
	mov	rax, qword [rbp - 416]
	cmp	rax, 1
	je	Label_36
	jmp	Label_35
Label_36:
	mov	rax, qword [ xlist__ ]
	mov	qword [rbp - 424], rax
	mov	rax, qword [ head__ ]
	mov	qword [rbp - 432], rax
	mov	rax, qword [rbp - 432]
	imul	rax, 8
	add	rax, qword [rbp - 424]
	mov	rax, qword [rax]
	mov	qword [ x__ ], rax
	mov	rax, qword [ ylist__ ]
	mov	qword [rbp - 440], rax
	mov	rax, qword [ head__ ]
	mov	qword [rbp - 448], rax
	mov	rax, qword [rbp - 448]
	imul	rax, 8
	add	rax, qword [rbp - 440]
	mov	rax, qword [rax]
	mov	qword [ y__ ], rax
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 456], rax
	mov	rax, qword [ x__ ]
	mov	qword [rbp - 464], rax
	mov	rax, qword [rbp - 464]
	imul	rax, 8
	add	rax, qword [rbp - 456]
	mov	rax, qword [rax]
	mov	qword [rbp - 472], rax
	mov	rax, qword [ y__ ]
	mov	qword [rbp - 480], rax
	mov	rax, qword [rbp - 480]
	imul	rax, 8
	add	rax, qword [rbp - 472]
	mov	rax, qword [rax]
	mov	qword [ now__ ], rax
	mov	qword [ j__ ], 0
Label_41:
	mov	rcx, qword [ j__ ]
	cmp	rcx, 8
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 488], rcx
	mov	rax, qword [rbp - 488]
	cmp	rax, 1
	je	Label_40
	jmp	Label_39
Label_40:
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 504], rax
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 512], rax
	mov	rcx, qword [rbp - 512]
	imul	rcx, 8
	add	rcx, qword [rbp - 504]
	mov	rdx, qword [ x__ ]
	add	rdx, qword [rcx]
	mov	qword [rbp - 496], rdx
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 528], rax
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 536], rax
	mov	rcx, qword [rbp - 536]
	imul	rcx, 8
	add	rcx, qword [rbp - 528]
	mov	rdx, qword [ y__ ]
	add	rdx, qword [rcx]
	mov	qword [rbp - 520], rdx
	mov	rax, qword [rbp - 496]
	mov	rdi, rax
	mov	rax, qword [rbp - 520]
	mov	rsi, rax
	call	addList
	mov	qword [rbp - 544], rax
Label_38:
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 552], rax
	mov	rdx, qword [ j__ ]
	add	rdx, 1
	mov	qword [ j__ ], rdx
	jmp	Label_41
Label_39:
	mov	rcx, qword [ ok__ ]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 560], rcx
	mov	rax, qword [rbp - 560]
	cmp	rax, 1
	je	Label_43
	jmp	Label_44
Label_43:
	jmp	Label_35
	jmp	Label_42
Label_44:
Label_42:
	mov	rax, qword [ head__ ]
	mov	qword [rbp - 568], rax
	mov	rdx, qword [ head__ ]
	add	rdx, 1
	mov	qword [ head__ ], rdx
Label_34:
	jmp	Label_37
Label_35:
	mov	rcx, qword [ ok__ ]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 576], rcx
	mov	rax, qword [rbp - 576]
	cmp	rax, 1
	je	Label_46
	jmp	Label_47
Label_46:
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 584], rax
	mov	rax, qword [ targetx__ ]
	mov	qword [rbp - 592], rax
	mov	rax, qword [rbp - 592]
	imul	rax, 8
	add	rax, qword [rbp - 584]
	mov	rax, qword [rax]
	mov	qword [rbp - 600], rax
	mov	rax, qword [ targety__ ]
	mov	qword [rbp - 608], rax
	mov	rax, qword [rbp - 608]
	imul	rax, 8
	add	rax, qword [rbp - 600]
	mov	rax, qword [rax]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 616], rax
	mov	rax, qword [rbp - 616]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 624], rax
	jmp	Label_45
Label_47:
	mov	rax, str__0
	mov	rdi, rax
	call	print
	mov	qword [rbp - 584], rax
Label_45:
	mov	rax, 0
	jmp	Label_25
Label_25:
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
