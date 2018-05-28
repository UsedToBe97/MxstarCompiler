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
hilo:
	push	rbp
	mov	rbp, rsp
	mov	rax, rdi
	mov	rcx, 16
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, rsi
	or	rcx, rdi
	mov	rdi, rcx
	mov	rax, rdi
	jmp	Label_0
Label_0:
	mov	rsp, rbp
	pop	rbp
	ret
shift_l:
	push	rbp
	mov	rbp, rsp
	mov	rax, rdi
	mov	rcx, rsi
	shl	rax, cl
	mov	rdi, rax
	mov	rax, 32767
	mov	rcx, 16
	shl	rax, cl
	mov	rsi, rax
	mov	rcx, 65535
	or	rcx, rsi
	mov	rsi, rcx
	and	rdi, rsi
	mov	rax, rdi
	jmp	Label_1
Label_1:
	mov	rsp, rbp
	pop	rbp
	ret
shift_r:
	push	rbp
	mov	rbp, rsp
	mov	rax, 32767
	mov	rcx, 16
	shl	rax, cl
	mov	r10, rax
	mov	rcx, 65535
	or	rcx, r10
	mov	r10, rcx
	mov	rax, r10
	mov	rcx, rsi
	shr	rax, cl
	mov	r10, rax
	mov	rax, r10
	mov	rcx, 1
	shl	rax, cl
	mov	r10, rax
	add	r10, 1
	mov	rax, rdi
	mov	rcx, rsi
	shr	rax, cl
	mov	rdi, rax
	mov	rcx, r10
	and	rcx, rdi
	mov	rdi, rcx
	mov	r10, rdi
	mov	rax, 32767
	mov	rcx, 16
	shl	rax, cl
	mov	rdi, rax
	mov	rcx, 65535
	or	rcx, rdi
	mov	rdi, rcx
	mov	rcx, r10
	and	rcx, rdi
	mov	rdi, rcx
	mov	rax, rdi
	jmp	Label_2
Label_2:
	mov	rsp, rbp
	pop	rbp
	ret
xorshift:
	push	rbp
	mov	rbp, rsp
	mov	r10, rsi
	add	rdi, 1
	mov	r11, rdi
	mov	r8, 0
Label_7:
	mov	rcx, r10
	imul	rcx, 10
	mov	rdi, rcx
	cmp	r8, rdi
	jl	Label_6
	jmp	Label_5
Label_6:
	mov	rax, r11
	mov	rcx, 13
	shl	rax, cl
	mov	rdi, rax
	mov	rax, 32767
	mov	rcx, 16
	shl	rax, cl
	mov	rsi, rax
	mov	rcx, 65535
	or	rcx, rsi
	mov	rsi, rcx
	and	rdi, rsi
	mov	rcx, r11
	xor	rcx, rdi
	mov	rdi, rcx
	mov	r11, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r11
	mov	rsi, 17
	call	shift_r
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rcx, r11
	xor	rcx, rdi
	mov	rdi, rcx
	mov	r11, rdi
	mov	rax, r11
	mov	rcx, 5
	shl	rax, cl
	mov	rdi, rax
	mov	rax, 32767
	mov	rcx, 16
	shl	rax, cl
	mov	rsi, rax
	mov	rcx, 65535
	or	rcx, rsi
	mov	rsi, rcx
	and	rdi, rsi
	mov	rcx, r11
	xor	rcx, rdi
	mov	rdi, rcx
	mov	r11, rdi
Label_4:
	mov	rdi, r8
	add	r8, 1
	jmp	Label_7
Label_5:
	mov	rcx, r11
	xor	rcx, 123456789
	mov	rdi, rcx
	mov	rax, rdi
	jmp	Label_3
Label_3:
	mov	rsp, rbp
	pop	rbp
	ret
int2chr:
	push	rbp
	mov	rbp, rsp
	cmp	rdi, 32
	jge	Label_12
	mov	rsi, 0
	jmp	Label_13
Label_12:
	mov	rcx, rdi
	cmp	rcx, 126
	setle	cl
	movzx	rcx, cl
	mov	rsi, rcx
Label_13:
	cmp	rsi, 1
	je	Label_10
	jmp	Label_11
Label_10:
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
	mov	r10, rdi
	mov	rsi, str__1
	mov	r11, 28
Label_18:
	cmp	r11, 0
	jge	Label_17
	jmp	Label_16
Label_17:
	mov	rax, r10
	mov	rcx, r11
	shr	rax, cl
	mov	rdi, rax
	and	rdi, 15
	cmp	rdi, 10
	jl	Label_20
	jmp	Label_21
Label_20:
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
	jmp	Label_19
Label_21:
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
Label_19:
Label_15:
	mov	rcx, r11
	sub	rcx, 4
	mov	rdi, rcx
	mov	r11, rdi
	jmp	Label_18
Label_16:
	mov	rax, rsi
	jmp	Label_14
Label_14:
	mov	rsp, rbp
	pop	rbp
	ret
getnumber:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdx
	and	r10, 31
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	xorshift
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rax, rdi
	mov	rcx, r10
	shl	rax, cl
	mov	rsi, rax
	mov	rax, 32767
	mov	rcx, 16
	shl	rax, cl
	mov	r11, rax
	mov	rcx, 65535
	or	rcx, r11
	mov	r11, rcx
	mov	rcx, rsi
	and	rcx, r11
	mov	r11, rcx
	mov	rcx, 32
	sub	rcx, r10
	mov	rsi, rcx
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	shift_r
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rcx, r11
	or	rcx, rdi
	mov	rdi, rcx
	mov	rax, rdi
	jmp	Label_22
Label_22:
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
	sub	rsp, 88
	mov	rax, str__2
	mov	qword [ asciiTable__ ], rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	getInt
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	r10, rdi
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	getInt
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	r11, rdi
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	getInt
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	r8, rdi
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	getInt
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	r9, rdi
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	getInt
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	r12, rdi
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	getInt
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	r13, rdi
	mov	rax, 30
	mov	qword [rbp - 16], rax
	mov	rax, 0
	mov	qword [rbp - 24], rax
	mov	rax, 0
	mov	qword [rbp - 32], rax
	mov	rax, 0
	mov	qword [rbp - 40], rax
	mov	rax, 0
	mov	qword [rbp - 48], rax
	mov	r14, r10
Label_27:
	cmp	r14, r11
	jl	Label_26
	jmp	Label_25
Label_26:
	mov	r15, r8
Label_31:
	cmp	r15, r9
	jl	Label_30
	jmp	Label_29
Label_30:
	mov	qword [rbp - 8], r12
Label_35:
	mov	rax, qword [rbp - 8]
	cmp	rax, r13
	jl	Label_34
	jmp	Label_33
Label_34:
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	mov	rsi, qword [rbp - 16]
	mov	rdx, qword [rbp - 8]
	call	getnumber
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	qword [rbp - 56], rdi
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r14
	mov	rsi, qword [rbp - 16]
	mov	rdx, qword [rbp - 8]
	call	getnumber
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	qword [rbp - 64], rdi
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r15
	mov	rsi, qword [rbp - 16]
	mov	rdx, qword [rbp - 8]
	call	getnumber
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	qword [rbp - 72], rdi
	mov	rcx, r14
	xor	rcx, r15
	mov	rdi, rcx
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, qword [rbp - 16]
	mov	rdx, qword [rbp - 8]
	call	getnumber
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	qword [rbp - 80], rdi
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rbp - 8]
	mov	rsi, 1
	call	xorshift
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	qword [rbp - 88], rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r15
	mov	rsi, 1
	call	xorshift
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [rbp - 88]
	xor	rcx, rdi
	mov	qword [rbp - 88], rcx
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r14
	mov	rsi, 1
	call	xorshift
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [rbp - 88]
	xor	rcx, rdi
	mov	rdi, rcx
	mov	qword [rbp - 88], rdi
	mov	rcx, qword [rbp - 56]
	xor	rcx, qword [rbp - 88]
	mov	rdi, rcx
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, 1
	call	xorshift
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [rbp - 24]
	add	rcx, rdi
	mov	rdi, rcx
	mov	qword [rbp - 24], rdi
	mov	rcx, qword [rbp - 64]
	xor	rcx, qword [rbp - 88]
	mov	rdi, rcx
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, 1
	call	xorshift
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [rbp - 32]
	add	rcx, rdi
	mov	rdi, rcx
	mov	qword [rbp - 32], rdi
	mov	rcx, qword [rbp - 72]
	xor	rcx, qword [rbp - 88]
	mov	rdi, rcx
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, 1
	call	xorshift
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [rbp - 40]
	add	rcx, rdi
	mov	rdi, rcx
	mov	qword [rbp - 40], rdi
	mov	rcx, qword [rbp - 80]
	xor	rcx, qword [rbp - 88]
	mov	rdi, rcx
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, 1
	call	xorshift
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	rcx, qword [rbp - 48]
	add	rcx, rdi
	mov	rdi, rcx
	mov	qword [rbp - 48], rdi
Label_32:
	mov	rdi, qword [rbp - 8]
	mov	rcx, qword [rbp - 8]
	add	rcx, 1
	mov	qword [rbp - 8], rcx
	jmp	Label_35
Label_33:
Label_28:
	mov	rdi, r15
	add	r15, 1
	jmp	Label_31
Label_29:
Label_24:
	mov	rdi, r14
	add	r14, 1
	jmp	Label_27
Label_25:
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rbp - 24]
	call	toStringHex
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, str__3
	call	string.add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	print
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rbp - 32]
	call	toStringHex
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, str__4
	call	string.add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	print
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rbp - 40]
	call	toStringHex
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, str__5
	call	string.add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	print
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, qword [rbp - 48]
	call	toStringHex
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rsi, str__6
	call	string.add
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	call	print
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, str__7
	call	println
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rdi
	mov	rdi, rax
	mov	rax, 0
	jmp	Label_23
Label_23:
	add	rsp, 88
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
