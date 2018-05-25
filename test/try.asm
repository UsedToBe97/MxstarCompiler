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
	sub	rsp, 120
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	qword [ head__ ], 0
	mov	qword [ tail__ ], 0
	mov	rax, qword [rbp - 8]
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
	mov	rax, qword [rbp - 8]
	mov	rbx, qword [rbp - 24]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 24]
	add	rdx, 8
	mov	qword [rbp - 24], rdx
	mov	rax, qword [rbp - 24]
	mov	qword [ step__ ], rax
	mov	qword [ i__ ], 0
Label_4:
	mov	rcx, qword [ i__ ]
	cmp	rcx, qword [rbp - 8]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	cmp	rax, 1
	je	Label_3
	jmp	Label_2
Label_3:
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 40], rax
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 8]
	mov	qword [rbp - 56], rax
	mov	rdx, qword [rbp - 56]
	add	rdx, 1
	mov	qword [rbp - 56], rdx
	mov	rdx, qword [rbp - 56]
	imul	rdx, 8
	mov	qword [rbp - 56], rdx
	mov	rax, qword [rbp - 56]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 64], rax
	mov	rax, qword [rbp - 8]
	mov	rbx, qword [rbp - 64]
	mov	qword [rbx], rax
	mov	rdx, qword [rbp - 64]
	add	rdx, 8
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	mov	rbx, qword [rbp - 48]
	imul	rbx, 8
	add	rbx, qword [rbp - 40]
	mov	qword [rbx], rax
	mov	qword [ j__ ], 0
Label_8:
	mov	rcx, qword [ j__ ]
	cmp	rcx, qword [rbp - 8]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 72], rcx
	mov	rax, qword [rbp - 72]
	cmp	rax, 1
	je	Label_7
	jmp	Label_6
Label_7:
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 80], rax
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 88], rax
	mov	rbx, qword [rbp - 88]
	imul	rbx, 8
	add	rbx, qword [rbp - 80]
	mov	rax, qword [rbx]
	mov	qword [rbp - 96], rax
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 104], rax
	mov	rbx, qword [rbp - 104]
	imul	rbx, 8
	add	rbx, qword [rbp - 96]
	mov	qword [rbx], 0
Label_5:
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 112], rax
	mov	rdx, qword [ j__ ]
	add	rdx, 1
	mov	qword [ j__ ], rdx
	jmp	Label_8
Label_6:
Label_1:
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 120], rax
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
	sub	rsp, 32
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [ N__ ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 24], rcx
	mov	rax, qword [rbp - 24]
	cmp	rax, 1
	je	Label_10
	mov	qword [rbp - 16], 0
	jmp	Label_11
Label_10:
	mov	rcx, qword [rbp - 8]
	cmp	rcx, 0
	setge	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 16], rax
Label_11:
	mov	rax, qword [rbp - 16]
	jmp	Label_9
Label_9:
	mov	rsp, rbp
	pop	rbp
	ret
addList:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 168
	mov	rax, rdi
	mov	qword [rbp - 8], rax
	mov	rax, rsi
	mov	qword [rbp - 16], rax
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	check
	mov	qword [rbp - 40], rax
	mov	rax, qword [rbp - 40]
	cmp	rax, 1
	je	Label_16
	mov	qword [rbp - 32], 0
	jmp	Label_17
Label_16:
	mov	rax, qword [rbp - 16]
	mov	rdi, rax
	call	check
	mov	qword [rbp - 48], rax
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 32], rax
Label_17:
	mov	rax, qword [rbp - 32]
	cmp	rax, 1
	je	Label_18
	mov	qword [rbp - 24], 0
	jmp	Label_19
Label_18:
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 64], rax
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 64]
	mov	rax, qword [rbx]
	mov	qword [rbp - 72], rax
	mov	qword [rbp - 80], 1
	neg	qword [rbp - 80]
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 72]
	mov	rcx, qword [rbx]
	cmp	rcx, qword [rbp - 80]
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 56], rcx
	mov	rax, qword [rbp - 56]
	mov	qword [rbp - 24], rax
Label_19:
	mov	rax, qword [rbp - 24]
	cmp	rax, 1
	je	Label_14
	jmp	Label_15
Label_14:
	mov	rax, qword [ tail__ ]
	mov	qword [rbp - 88], rax
	mov	rdx, qword [ tail__ ]
	add	rdx, 1
	mov	qword [ tail__ ], rdx
	mov	rax, qword [ xlist__ ]
	mov	qword [rbp - 96], rax
	mov	rax, qword [ tail__ ]
	mov	qword [rbp - 104], rax
	mov	rax, qword [rbp - 8]
	mov	rbx, qword [rbp - 104]
	imul	rbx, 8
	add	rbx, qword [rbp - 96]
	mov	qword [rbx], rax
	mov	rax, qword [ ylist__ ]
	mov	qword [rbp - 112], rax
	mov	rax, qword [ tail__ ]
	mov	qword [rbp - 120], rax
	mov	rax, qword [rbp - 16]
	mov	rbx, qword [rbp - 120]
	imul	rbx, 8
	add	rbx, qword [rbp - 112]
	mov	qword [rbx], rax
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 128], rax
	mov	rbx, qword [rbp - 8]
	imul	rbx, 8
	add	rbx, qword [rbp - 128]
	mov	rax, qword [rbx]
	mov	qword [rbp - 136], rax
	mov	rdx, qword [ now__ ]
	add	rdx, 1
	mov	qword [rbp - 144], rdx
	mov	rax, qword [rbp - 144]
	mov	rbx, qword [rbp - 16]
	imul	rbx, 8
	add	rbx, qword [rbp - 136]
	mov	qword [rbx], rax
	mov	rcx, qword [rbp - 8]
	cmp	rcx, qword [ targetx__ ]
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 160], rcx
	mov	rax, qword [rbp - 160]
	cmp	rax, 1
	je	Label_23
	mov	qword [rbp - 152], 0
	jmp	Label_24
Label_23:
	mov	rcx, qword [rbp - 16]
	cmp	rcx, qword [ targety__ ]
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 168], rcx
	mov	rax, qword [rbp - 168]
	mov	qword [rbp - 152], rax
Label_24:
	mov	rax, qword [rbp - 152]
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
	sub	rsp, 704
	mov	qword [rbp - 8], 12000
	mov	rdx, qword [rbp - 8]
	add	rdx, 1
	mov	qword [rbp - 8], rdx
	mov	rdx, qword [rbp - 8]
	imul	rdx, 8
	mov	qword [rbp - 8], rdx
	mov	rax, qword [rbp - 8]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 16], rax
	mov	rbx, qword [rbp - 16]
	mov	qword [rbx], 12000
	mov	rdx, qword [rbp - 16]
	add	rdx, 8
	mov	qword [rbp - 16], rdx
	mov	rax, qword [rbp - 16]
	mov	qword [ xlist__ ], rax
	mov	qword [rbp - 24], 12000
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
	mov	rbx, qword [rbp - 32]
	mov	qword [rbx], 12000
	mov	rdx, qword [rbp - 32]
	add	rdx, 8
	mov	qword [rbp - 32], rdx
	mov	rax, qword [rbp - 32]
	mov	qword [ ylist__ ], rax
	mov	qword [rbp - 40], 8
	mov	rdx, qword [rbp - 40]
	add	rdx, 1
	mov	qword [rbp - 40], rdx
	mov	rdx, qword [rbp - 40]
	imul	rdx, 8
	mov	qword [rbp - 40], rdx
	mov	rax, qword [rbp - 40]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 48], rax
	mov	rbx, qword [rbp - 48]
	mov	qword [rbx], 8
	mov	rdx, qword [rbp - 48]
	add	rdx, 8
	mov	qword [rbp - 48], rdx
	mov	rax, qword [rbp - 48]
	mov	qword [ dx__ ], rax
	mov	qword [rbp - 56], 9
	mov	rdx, qword [rbp - 56]
	add	rdx, 1
	mov	qword [rbp - 56], rdx
	mov	rdx, qword [rbp - 56]
	imul	rdx, 8
	mov	qword [rbp - 56], rdx
	mov	rax, qword [rbp - 56]
	mov	rdi, rax
	call	malloc
	mov	qword [rbp - 64], rax
	mov	rbx, qword [rbp - 64]
	mov	qword [rbx], 9
	mov	rdx, qword [rbp - 64]
	add	rdx, 8
	mov	qword [rbp - 64], rdx
	mov	rax, qword [rbp - 64]
	mov	qword [ dy__ ], rax
	mov	rdi, 106
	call	origin
	mov	qword [rbp - 72], rax
	call	getInt
	mov	qword [rbp - 80], rax
	mov	rax, qword [rbp - 80]
	mov	qword [ N__ ], rax
	mov	rdx, qword [ N__ ]
	sub	rdx, 1
	mov	qword [rbp - 88], rdx
	mov	rax, qword [rbp - 88]
	mov	qword [ targety__ ], rax
	mov	rax, qword [ targety__ ]
	mov	qword [ targetx__ ], rax
	mov	qword [ i__ ], 0
Label_29:
	mov	rcx, qword [ i__ ]
	cmp	rcx, qword [ N__ ]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 96], rcx
	mov	rax, qword [rbp - 96]
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
	mov	qword [rbp - 104], rcx
	mov	rax, qword [rbp - 104]
	cmp	rax, 1
	je	Label_32
	jmp	Label_31
Label_32:
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 112], rax
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 120], rax
	mov	rbx, qword [rbp - 120]
	imul	rbx, 8
	add	rbx, qword [rbp - 112]
	mov	rax, qword [rbx]
	mov	qword [rbp - 128], rax
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 136], rax
	mov	qword [rbp - 144], 1
	neg	qword [rbp - 144]
	mov	rax, qword [rbp - 144]
	mov	rbx, qword [rbp - 136]
	imul	rbx, 8
	add	rbx, qword [rbp - 128]
	mov	qword [rbx], rax
Label_30:
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 152], rax
	mov	rdx, qword [ j__ ]
	add	rdx, 1
	mov	qword [ j__ ], rdx
	jmp	Label_33
Label_31:
Label_26:
	mov	rax, qword [ i__ ]
	mov	qword [rbp - 160], rax
	mov	rdx, qword [ i__ ]
	add	rdx, 1
	mov	qword [ i__ ], rdx
	jmp	Label_29
Label_27:
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 168], rax
	mov	qword [rbp - 176], 0
	mov	qword [rbp - 184], 2
	neg	qword [rbp - 184]
	mov	rax, qword [rbp - 184]
	mov	rbx, qword [rbp - 176]
	imul	rbx, 8
	add	rbx, qword [rbp - 168]
	mov	qword [rbx], rax
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 192], rax
	mov	qword [rbp - 200], 0
	mov	qword [rbp - 208], 1
	neg	qword [rbp - 208]
	mov	rax, qword [rbp - 208]
	mov	rbx, qword [rbp - 200]
	imul	rbx, 8
	add	rbx, qword [rbp - 192]
	mov	qword [rbx], rax
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 216], rax
	mov	qword [rbp - 224], 1
	mov	qword [rbp - 232], 2
	neg	qword [rbp - 232]
	mov	rax, qword [rbp - 232]
	mov	rbx, qword [rbp - 224]
	imul	rbx, 8
	add	rbx, qword [rbp - 216]
	mov	qword [rbx], rax
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 240], rax
	mov	qword [rbp - 248], 1
	mov	rbx, qword [rbp - 248]
	imul	rbx, 8
	add	rbx, qword [rbp - 240]
	mov	qword [rbx], 1
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 256], rax
	mov	qword [rbp - 264], 2
	mov	rbx, qword [rbp - 264]
	imul	rbx, 8
	add	rbx, qword [rbp - 256]
	mov	qword [rbx], 2
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 272], rax
	mov	qword [rbp - 280], 2
	mov	qword [rbp - 288], 1
	neg	qword [rbp - 288]
	mov	rax, qword [rbp - 288]
	mov	rbx, qword [rbp - 280]
	imul	rbx, 8
	add	rbx, qword [rbp - 272]
	mov	qword [rbx], rax
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 296], rax
	mov	qword [rbp - 304], 3
	mov	rbx, qword [rbp - 304]
	imul	rbx, 8
	add	rbx, qword [rbp - 296]
	mov	qword [rbx], 2
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 312], rax
	mov	qword [rbp - 320], 3
	mov	rbx, qword [rbp - 320]
	imul	rbx, 8
	add	rbx, qword [rbp - 312]
	mov	qword [rbx], 1
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 328], rax
	mov	qword [rbp - 336], 4
	mov	qword [rbp - 344], 1
	neg	qword [rbp - 344]
	mov	rax, qword [rbp - 344]
	mov	rbx, qword [rbp - 336]
	imul	rbx, 8
	add	rbx, qword [rbp - 328]
	mov	qword [rbx], rax
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 352], rax
	mov	qword [rbp - 360], 4
	mov	qword [rbp - 368], 2
	neg	qword [rbp - 368]
	mov	rax, qword [rbp - 368]
	mov	rbx, qword [rbp - 360]
	imul	rbx, 8
	add	rbx, qword [rbp - 352]
	mov	qword [rbx], rax
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 376], rax
	mov	qword [rbp - 384], 5
	mov	qword [rbp - 392], 1
	neg	qword [rbp - 392]
	mov	rax, qword [rbp - 392]
	mov	rbx, qword [rbp - 384]
	imul	rbx, 8
	add	rbx, qword [rbp - 376]
	mov	qword [rbx], rax
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 400], rax
	mov	qword [rbp - 408], 5
	mov	rbx, qword [rbp - 408]
	imul	rbx, 8
	add	rbx, qword [rbp - 400]
	mov	qword [rbx], 2
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 416], rax
	mov	qword [rbp - 424], 6
	mov	rbx, qword [rbp - 424]
	imul	rbx, 8
	add	rbx, qword [rbp - 416]
	mov	qword [rbx], 1
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 432], rax
	mov	qword [rbp - 440], 6
	mov	qword [rbp - 448], 2
	neg	qword [rbp - 448]
	mov	rax, qword [rbp - 448]
	mov	rbx, qword [rbp - 440]
	imul	rbx, 8
	add	rbx, qword [rbp - 432]
	mov	qword [rbx], rax
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 456], rax
	mov	qword [rbp - 464], 7
	mov	rbx, qword [rbp - 464]
	imul	rbx, 8
	add	rbx, qword [rbp - 456]
	mov	qword [rbx], 1
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 472], rax
	mov	qword [rbp - 480], 7
	mov	rbx, qword [rbp - 480]
	imul	rbx, 8
	add	rbx, qword [rbp - 472]
	mov	qword [rbx], 2
Label_37:
	mov	rcx, qword [ head__ ]
	cmp	rcx, qword [ tail__ ]
	setle	cl
	movzx	rcx, cl
	mov	qword [rbp - 488], rcx
	mov	rax, qword [rbp - 488]
	cmp	rax, 1
	je	Label_36
	jmp	Label_35
Label_36:
	mov	rax, qword [ xlist__ ]
	mov	qword [rbp - 496], rax
	mov	rax, qword [ head__ ]
	mov	qword [rbp - 504], rax
	mov	rbx, qword [rbp - 504]
	imul	rbx, 8
	add	rbx, qword [rbp - 496]
	mov	rax, qword [rbx]
	mov	qword [ x__ ], rax
	mov	rax, qword [ ylist__ ]
	mov	qword [rbp - 512], rax
	mov	rax, qword [ head__ ]
	mov	qword [rbp - 520], rax
	mov	rbx, qword [rbp - 520]
	imul	rbx, 8
	add	rbx, qword [rbp - 512]
	mov	rax, qword [rbx]
	mov	qword [ y__ ], rax
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 528], rax
	mov	rax, qword [ x__ ]
	mov	qword [rbp - 536], rax
	mov	rbx, qword [rbp - 536]
	imul	rbx, 8
	add	rbx, qword [rbp - 528]
	mov	rax, qword [rbx]
	mov	qword [rbp - 544], rax
	mov	rax, qword [ y__ ]
	mov	qword [rbp - 552], rax
	mov	rbx, qword [rbp - 552]
	imul	rbx, 8
	add	rbx, qword [rbp - 544]
	mov	rax, qword [rbx]
	mov	qword [ now__ ], rax
	mov	qword [ j__ ], 0
Label_41:
	mov	rcx, qword [ j__ ]
	cmp	rcx, 8
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 560], rcx
	mov	rax, qword [rbp - 560]
	cmp	rax, 1
	je	Label_40
	jmp	Label_39
Label_40:
	mov	rax, qword [ dx__ ]
	mov	qword [rbp - 576], rax
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 584], rax
	mov	rcx, qword [rbp - 584]
	imul	rcx, 8
	add	rcx, qword [rbp - 576]
	mov	rdx, qword [ x__ ]
	add	rdx, qword [rcx]
	mov	qword [rbp - 568], rdx
	mov	rax, qword [ dy__ ]
	mov	qword [rbp - 600], rax
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 608], rax
	mov	rcx, qword [rbp - 608]
	imul	rcx, 8
	add	rcx, qword [rbp - 600]
	mov	rdx, qword [ y__ ]
	add	rdx, qword [rcx]
	mov	qword [rbp - 592], rdx
	mov	rax, qword [rbp - 568]
	mov	rdi, rax
	mov	rax, qword [rbp - 592]
	mov	rsi, rax
	call	addList
	mov	qword [rbp - 616], rax
Label_38:
	mov	rax, qword [ j__ ]
	mov	qword [rbp - 624], rax
	mov	rdx, qword [ j__ ]
	add	rdx, 1
	mov	qword [ j__ ], rdx
	jmp	Label_41
Label_39:
	mov	rcx, qword [ ok__ ]
	cmp	rcx, 1
	sete	cl
	movzx	rcx, cl
	mov	qword [rbp - 632], rcx
	mov	rax, qword [rbp - 632]
	cmp	rax, 1
	je	Label_43
	jmp	Label_44
Label_43:
	jmp	Label_35
	jmp	Label_42
Label_44:
Label_42:
	mov	rax, qword [ head__ ]
	mov	qword [rbp - 640], rax
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
	mov	qword [rbp - 648], rcx
	mov	rax, qword [rbp - 648]
	cmp	rax, 1
	je	Label_46
	jmp	Label_47
Label_46:
	mov	rax, qword [ step__ ]
	mov	qword [rbp - 656], rax
	mov	rax, qword [ targetx__ ]
	mov	qword [rbp - 664], rax
	mov	rbx, qword [rbp - 664]
	imul	rbx, 8
	add	rbx, qword [rbp - 656]
	mov	rax, qword [rbx]
	mov	qword [rbp - 672], rax
	mov	rax, qword [ targety__ ]
	mov	qword [rbp - 680], rax
	mov	rbx, qword [rbp - 680]
	imul	rbx, 8
	add	rbx, qword [rbp - 672]
	mov	rax, qword [rbx]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 688], rax
	mov	rax, qword [rbp - 688]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 696], rax
	jmp	Label_45
Label_47:
	mov	rax, str__0
	mov	rdi, rax
	call	print
	mov	qword [rbp - 704], rax
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
