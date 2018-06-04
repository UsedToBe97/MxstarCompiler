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
	dq	2
str__0:
	db	40, 32, 0
	dq	2
str__1:
	db	44, 32, 0
	dq	2
str__2:
	db	32, 41, 0
	dq	10
str__3:
	db	118, 101, 99, 116, 111, 114, 32, 120, 58, 32, 0
	dq	8
str__4:
	db	101, 120, 99, 105, 116, 101, 100, 33, 0
	dq	10
str__5:
	db	118, 101, 99, 116, 111, 114, 32, 121, 58, 32, 0
	dq	7
str__6:
	db	120, 32, 43, 32, 121, 58, 32, 0
	dq	7
str__7:
	db	120, 32, 42, 32, 121, 58, 32, 0
	dq	14
str__8:
	db	40, 49, 32, 60, 60, 32, 51, 41, 32, 42, 32, 121, 58, 32, 0
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
vector.init:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	cmp	rsi, 0
	je	Label_2
	jmp	Label_3
Label_2:
	jmp	Label_5
Label_3:
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
	mov	r11, rax
	mov	rdi, r11
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
	mov	qword [rdi], r11
	add	rdi, 8
	mov	qword [r10], rdi
	mov	r11, 0
Label_7:
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
	jl	Label_6
	jmp	Label_5
Label_6:
	mov	rdi, qword [r10]
	mov	rax, qword [rsi + r11 * 8]
	mov	qword [rdi + r11 * 8], rax
	add	r11, 1
	jmp	Label_7
Label_5:
	mov	rsp, rbp
	pop	rbp
	ret
vector.getDim:
	push	rbp
	mov	rbp, rsp
	mov	rax, qword [rdi]
	cmp	rax, 0
	je	Label_10
	jmp	Label_11
Label_10:
	mov	rax, 0
	jmp	Label_8
Label_11:
	push	rdi
	mov	rdi, qword [rdi]
	call	array.size
	pop	rdi
	mov	rdi, rax
	mov	rax, rdi
	jmp	Label_8
Label_8:
	mov	rsp, rbp
	pop	rbp
	ret
vector.dot:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	r11, 0
	mov	r8, 0
Label_16:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	call	vector.getDim
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jl	Label_15
	jmp	Label_14
Label_15:
	mov	rdi, qword [r10]
	mov	r8, qword [rsi]
	mov	rcx, qword [rdi + r11 * 8]
	imul	rcx, qword [r8 + r11 * 8]
	mov	rdi, rcx
	mov	r8, rdi
	add	r11, 1
	jmp	Label_16
Label_14:
	mov	rax, r8
	jmp	Label_12
Label_12:
	mov	rsp, rbp
	pop	rbp
	ret
vector.scalarInPlaceMultiply:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	rax, qword [r10]
	cmp	rax, 0
	je	Label_19
	jmp	Label_20
Label_19:
	mov	rax, 0
	jmp	Label_17
Label_20:
	mov	r11, 0
Label_24:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	call	vector.getDim
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jl	Label_23
	jmp	Label_22
Label_23:
	mov	rdi, qword [r10]
	mov	r8, qword [r10]
	mov	rcx, rsi
	imul	rcx, qword [r8 + r11 * 8]
	mov	r8, rcx
	mov	qword [rdi + r11 * 8], r8
	add	r11, 1
	jmp	Label_24
Label_22:
	mov	rax, r10
	jmp	Label_17
Label_17:
	mov	rsp, rbp
	pop	rbp
	ret
vector.add:
	push	rbp
	mov	rbp, rsp
	push	r12
	sub	rbp, 8
	mov	r10, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	call	vector.getDim
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r11, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, rsi
	call	vector.getDim
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jne	Label_29
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	call	vector.getDim
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rcx, rdi
	cmp	rcx, 0
	sete	cl
	movzx	rcx, cl
	mov	rdi, rcx
	jmp	Label_30
Label_29:
	mov	rdi, 1
Label_30:
	cmp	rdi, 1
	je	Label_27
	jmp	Label_28
Label_27:
	mov	rax, 0
	jmp	Label_25
Label_28:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, 8
	call	malloc
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r11, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	call	vector.getDim
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r8, rax
	mov	rdi, r8
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
	mov	qword [rdi], r8
	add	rdi, 8
	mov	qword [r11], rdi
	mov	r8, 0
Label_34:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	push	r9
	mov	rdi, r10
	call	vector.getDim
	pop	r9
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r8, rdi
	jl	Label_33
	jmp	Label_32
Label_33:
	mov	rdi, qword [r11]
	mov	r9, qword [r10]
	mov	r12, qword [rsi]
	mov	rcx, qword [r9 + r8 * 8]
	add	rcx, qword [r12 + r8 * 8]
	mov	r9, rcx
	mov	qword [rdi + r8 * 8], r9
	add	r8, 1
	jmp	Label_34
Label_32:
	mov	rax, r11
	jmp	Label_25
Label_25:
	add	rbp, 8
	pop	r12
	mov	rsp, rbp
	pop	rbp
	ret
vector.set:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	r11, rdx
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r10
	call	vector.getDim
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	rdi, rsi
	jl	Label_37
	jmp	Label_38
Label_37:
	mov	rax, 0
	jmp	Label_35
Label_38:
	mov	rdi, qword [r10]
	mov	qword [rdi + rsi * 8], r11
	mov	rax, 1
	jmp	Label_35
Label_35:
	mov	rsp, rbp
	pop	rbp
	ret
vector.tostring:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	mov	rsi, str__0
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	call	vector.getDim
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	rdi, 0
	jg	Label_41
	jmp	Label_42
Label_41:
	mov	rdi, qword [r10]
	mov	r11, 0
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, qword [rdi + r11 * 8]
	call	toString
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r11, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, rsi
	mov	rsi, r11
	call	string.add
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rsi, rdi
	jmp	Label_42
Label_42:
	mov	r11, 1
Label_46:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	call	vector.getDim
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jl	Label_45
	jmp	Label_44
Label_45:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, rsi
	mov	rsi, str__1
	call	string.add
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rsi, rax
	mov	rdi, qword [r10]
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, qword [rdi + r11 * 8]
	call	toString
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
	add	r11, 1
	jmp	Label_46
Label_44:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, rsi
	mov	rsi, str__2
	call	string.add
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	rsi, rdi
	mov	rax, rsi
	jmp	Label_39
Label_39:
	mov	rsp, rbp
	pop	rbp
	ret
vector.copy:
	push	rbp
	mov	rbp, rsp
	mov	r10, rdi
	cmp	rsi, 0
	je	Label_49
	jmp	Label_50
Label_49:
	mov	rax, 0
	jmp	Label_47
Label_50:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, rsi
	call	vector.getDim
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	rdi, 0
	je	Label_52
	jmp	Label_53
Label_52:
	mov	rax, 0
	mov	qword [r10], rax
	jmp	Label_55
Label_53:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, rsi
	call	vector.getDim
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	r11, rax
	mov	rdi, r11
	add	rdi, 1
	imul	rdi, 8
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	call	malloc
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	qword [rdi], r11
	add	rdi, 8
	mov	qword [r10], rdi
	mov	r11, 0
Label_57:
	push	rdi
	push	rsi
	push	r10
	push	r11
	push	r8
	mov	rdi, r10
	call	vector.getDim
	pop	r8
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	r11, rdi
	jl	Label_56
	jmp	Label_55
Label_56:
	mov	rdi, qword [r10]
	mov	r8, qword [rsi]
	mov	rax, qword [r8 + r11 * 8]
	mov	qword [rdi + r11 * 8], rax
	add	r11, 1
	jmp	Label_57
Label_55:
	mov	rax, 1
	jmp	Label_47
Label_47:
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, 8
	call	malloc
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r10, rdi
	mov	rdi, 10
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
	mov	rax, 10
	mov	qword [rdi], rax
	add	rdi, 8
	mov	rsi, rdi
	mov	rdi, 0
Label_62:
	cmp	rdi, 10
	jl	Label_61
	jmp	Label_60
Label_61:
	mov	rcx, 9
	sub	rcx, rdi
	mov	r11, rcx
	mov	qword [rsi + rdi * 8], r11
	add	rdi, 1
	jmp	Label_62
Label_60:
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r10
	call	vector.init
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, str__3
	call	print
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r10
	call	vector.tostring
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	println
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, 8
	call	malloc
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	mov	r11, rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r11
	mov	rsi, r10
	call	vector.copy
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r11
	mov	rsi, 3
	mov	rdx, 817
	call	vector.set
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	cmp	rdi, 1
	je	Label_64
	jmp	Label_65
Label_64:
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, str__4
	call	println
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
Label_65:
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, str__5
	call	print
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r11
	call	vector.tostring
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	println
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, str__6
	call	print
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r10
	mov	rsi, r11
	call	vector.add
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	vector.tostring
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	println
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, str__7
	call	print
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r10
	mov	rsi, r11
	call	vector.dot
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	toString
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	println
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, str__8
	call	print
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	push	rdi
	push	rsi
	push	r10
	push	r11
	mov	rdi, r11
	mov	rsi, 8
	call	vector.scalarInPlaceMultiply
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	vector.tostring
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rdi, rax
	push	rdi
	push	rsi
	push	r10
	push	r11
	call	println
	pop	r11
	pop	r10
	pop	rsi
	pop	rdi
	mov	rax, 0
	jmp	Label_58
Label_58:
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
