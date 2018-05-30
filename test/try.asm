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
func:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	qword [rbp - 8], rdi
	mov	qword [rbp - 16], rsi
	mov	qword [rbp - 24], rdx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 48], rcx
	mov	rcx, qword [rbp - 48]
	add	rcx, qword [rbp - 24]
	mov	qword [rbp - 40], rcx
	mov	rax, 1
	mov	rcx, 30
	shl	rax, cl
	mov	qword [rbp - 64], rax
	mov	rcx, qword [rbp - 64]
	sub	rcx, 1
	mov	qword [rbp - 56], rcx
	mov	rcx, qword [rbp - 40]
	and	rcx, qword [rbp - 56]
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	jmp	Label_0
Label_0:
	add	rsp, 64
	mov	rsp, rbp
	pop	rbp
	ret
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 592
	call	getInt
	mov	qword [rbp - 8], rax
	mov	rax, qword [rbp - 8]
	mov	qword [rbp - 16], rax
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 24], rax
	mov	rcx, qword [rbp - 24]
	add	rcx, 1
	mov	qword [rbp - 24], rcx
	mov	rcx, qword [rbp - 24]
	imul	rcx, 8
	mov	qword [rbp - 24], rcx
	mov	rdi, qword [rbp - 24]
	call	malloc
	mov	qword [rbp - 32], rax
	mov	rbx, qword [rbp - 32]
	mov	rax, qword [rbp - 16]
	mov	qword [rbx], rax
	mov	rcx, qword [rbp - 32]
	add	rcx, 8
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 24], rax
Label_2:
	mov	rcx, qword [rbp - 24]
	sub	rcx, 1
	mov	qword [rbp - 24], rcx
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 40], rax
	mov	rcx, qword [rbp - 40]
	add	rcx, 1
	mov	qword [rbp - 40], rcx
	mov	rcx, qword [rbp - 40]
	imul	rcx, 8
	mov	qword [rbp - 40], rcx
	mov	rdi, qword [rbp - 40]
	call	malloc
	mov	qword [rbp - 48], rax
	mov	rbx, qword [rbp - 48]
	mov	rax, qword [rbp - 16]
	mov	qword [rbx], rax
	mov	rcx, qword [rbp - 48]
	add	rcx, 8
	mov	qword [rbp - 48], rcx
	mov	rbx, qword [rbp - 24]
	imul	rbx, 8
	add	rbx, qword [rbp - 32]
	mov	rax, qword [rbp - 48]
	mov	qword [rbx], rax
	mov	rax, qword [rbp - 24]
	cmp	rax, 0
	jne	Label_2
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 56], rax
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 64], rax
	mov	rcx, qword [rbp - 64]
	add	rcx, 1
	mov	qword [rbp - 64], rcx
	mov	rcx, qword [rbp - 64]
	imul	rcx, 8
	mov	qword [rbp - 64], rcx
	mov	rdi, qword [rbp - 64]
	call	malloc
	mov	qword [rbp - 72], rax
	mov	rbx, qword [rbp - 72]
	mov	rax, qword [rbp - 16]
	mov	qword [rbx], rax
	mov	rcx, qword [rbp - 72]
	add	rcx, 8
	mov	qword [rbp - 72], rcx
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 64], rax
Label_3:
	mov	rcx, qword [rbp - 64]
	sub	rcx, 1
	mov	qword [rbp - 64], rcx
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 80], rax
	mov	rcx, qword [rbp - 80]
	add	rcx, 1
	mov	qword [rbp - 80], rcx
	mov	rcx, qword [rbp - 80]
	imul	rcx, 8
	mov	qword [rbp - 80], rcx
	mov	rdi, qword [rbp - 80]
	call	malloc
	mov	qword [rbp - 88], rax
	mov	rbx, qword [rbp - 88]
	mov	rax, qword [rbp - 16]
	mov	qword [rbx], rax
	mov	rcx, qword [rbp - 88]
	add	rcx, 8
	mov	qword [rbp - 88], rcx
	mov	rbx, qword [rbp - 64]
	imul	rbx, 8
	add	rbx, qword [rbp - 72]
	mov	rax, qword [rbp - 88]
	mov	qword [rbx], rax
	mov	rax, qword [rbp - 64]
	cmp	rax, 0
	jne	Label_3
	mov	rax, qword [rbp - 72]
	mov	qword [rbp - 96], rax
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 104], rax
	mov	rcx, qword [rbp - 104]
	add	rcx, 1
	mov	qword [rbp - 104], rcx
	mov	rcx, qword [rbp - 104]
	imul	rcx, 8
	mov	qword [rbp - 104], rcx
	mov	rdi, qword [rbp - 104]
	call	malloc
	mov	qword [rbp - 112], rax
	mov	rbx, qword [rbp - 112]
	mov	rax, qword [rbp - 16]
	mov	qword [rbx], rax
	mov	rcx, qword [rbp - 112]
	add	rcx, 8
	mov	qword [rbp - 112], rcx
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 104], rax
Label_4:
	mov	rcx, qword [rbp - 104]
	sub	rcx, 1
	mov	qword [rbp - 104], rcx
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 120], rax
	mov	rcx, qword [rbp - 120]
	add	rcx, 1
	mov	qword [rbp - 120], rcx
	mov	rcx, qword [rbp - 120]
	imul	rcx, 8
	mov	qword [rbp - 120], rcx
	mov	rdi, qword [rbp - 120]
	call	malloc
	mov	qword [rbp - 128], rax
	mov	rbx, qword [rbp - 128]
	mov	rax, qword [rbp - 16]
	mov	qword [rbx], rax
	mov	rcx, qword [rbp - 128]
	add	rcx, 8
	mov	qword [rbp - 128], rcx
	mov	rbx, qword [rbp - 104]
	imul	rbx, 8
	add	rbx, qword [rbp - 112]
	mov	rax, qword [rbp - 128]
	mov	qword [rbx], rax
	mov	rax, qword [rbp - 104]
	cmp	rax, 0
	jne	Label_4
	mov	rax, qword [rbp - 112]
	mov	qword [rbp - 136], rax
	mov	rax, 0
	mov	qword [rbp - 144], rax
Label_8:
	mov	rax, qword [rbp - 144]
	cmp	rax, qword [rbp - 16]
	jl	Label_7
	jmp	Label_6
Label_7:
	mov	rax, 0
	mov	qword [rbp - 152], rax
Label_12:
	mov	rax, qword [rbp - 152]
	cmp	rax, qword [rbp - 16]
	jl	Label_11
	jmp	Label_10
Label_11:
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 184], rax
	mov	rcx, qword [rbp - 144]
	add	rcx, qword [rbp - 152]
	mov	qword [rbp - 192], rcx
	mov	rbx, qword [rbp - 152]
	imul	rbx, 8
	add	rbx, qword [rbp - 184]
	mov	rax, qword [rbp - 192]
	mov	qword [rbx], rax
Label_9:
	mov	rcx, qword [rbp - 152]
	add	rcx, 1
	mov	qword [rbp - 152], rcx
	jmp	Label_12
Label_10:
Label_5:
	mov	rcx, qword [rbp - 144]
	add	rcx, 1
	mov	qword [rbp - 144], rcx
	jmp	Label_8
Label_6:
	mov	rax, 0
	mov	qword [rbp - 144], rax
Label_16:
	mov	rax, qword [rbp - 144]
	cmp	rax, qword [rbp - 16]
	jl	Label_15
	jmp	Label_14
Label_15:
	mov	rax, 0
	mov	qword [rbp - 152], rax
Label_20:
	mov	rax, qword [rbp - 152]
	cmp	rax, qword [rbp - 16]
	jl	Label_19
	jmp	Label_18
Label_19:
	mov	rax, 0
	mov	qword [rbp - 160], rax
Label_24:
	mov	rax, qword [rbp - 160]
	cmp	rax, qword [rbp - 16]
	jl	Label_23
	jmp	Label_22
Label_23:
	mov	rax, qword [rbp - 152]
	cmp	rax, qword [rbp - 144]
	jge	Label_26
	jmp	Label_27
Label_26:
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 96]
	mov	rax, qword [rax]
	mov	qword [rbp - 232], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 96]
	mov	rax, qword [rax]
	mov	qword [rbp - 240], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 248], rax
	mov	rax, qword [rbp - 160]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 256], rax
	mov	rcx, qword [rbp - 152]
	imul	rcx, 8
	add	rcx, qword [rbp - 240]
	mov	rax, qword [rbp - 160]
	imul	rax, 8
	add	rax, qword [rbp - 248]
	mov	rcx, qword [rcx]
	add	rcx, qword [rax]
	mov	qword [rbp - 280], rcx
	mov	rax, qword [rbp - 152]
	imul	rax, 8
	add	rax, qword [rbp - 256]
	mov	rcx, qword [rbp - 280]
	add	rcx, qword [rax]
	mov	qword [rbp - 272], rcx
	mov	rax, 1
	mov	rcx, 30
	shl	rax, cl
	mov	qword [rbp - 296], rax
	mov	rcx, qword [rbp - 296]
	sub	rcx, 1
	mov	qword [rbp - 288], rcx
	mov	rcx, qword [rbp - 272]
	and	rcx, qword [rbp - 288]
	mov	qword [rbp - 264], rcx
	mov	rbx, qword [rbp - 152]
	imul	rbx, 8
	add	rbx, qword [rbp - 232]
	mov	rax, qword [rbp - 264]
	mov	qword [rbx], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 136]
	mov	rax, qword [rax]
	mov	qword [rbp - 304], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 96]
	mov	rax, qword [rax]
	mov	qword [rbp - 312], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 320], rax
	mov	rax, qword [rbp - 160]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 328], rax
	mov	rcx, qword [rbp - 152]
	imul	rcx, 8
	add	rcx, qword [rbp - 312]
	mov	rax, qword [rbp - 160]
	imul	rax, 8
	add	rax, qword [rbp - 320]
	mov	rcx, qword [rcx]
	add	rcx, qword [rax]
	mov	qword [rbp - 352], rcx
	mov	rax, qword [rbp - 152]
	imul	rax, 8
	add	rax, qword [rbp - 328]
	mov	rcx, qword [rbp - 352]
	add	rcx, qword [rax]
	mov	qword [rbp - 344], rcx
	mov	rax, 1
	mov	rcx, 30
	shl	rax, cl
	mov	qword [rbp - 368], rax
	mov	rcx, qword [rbp - 368]
	sub	rcx, 1
	mov	qword [rbp - 360], rcx
	mov	rcx, qword [rbp - 344]
	and	rcx, qword [rbp - 360]
	mov	qword [rbp - 336], rcx
	mov	rbx, qword [rbp - 152]
	imul	rbx, 8
	add	rbx, qword [rbp - 304]
	mov	rax, qword [rbp - 336]
	mov	qword [rbx], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 136]
	mov	rax, qword [rax]
	mov	qword [rbp - 376], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 96]
	mov	rax, qword [rax]
	mov	qword [rbp - 384], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 392], rax
	mov	rax, qword [rbp - 160]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 400], rax
	mov	rcx, qword [rbp - 152]
	imul	rcx, 8
	add	rcx, qword [rbp - 384]
	mov	rax, qword [rbp - 160]
	imul	rax, 8
	add	rax, qword [rbp - 392]
	mov	rcx, qword [rcx]
	add	rcx, qword [rax]
	mov	qword [rbp - 424], rcx
	mov	rax, qword [rbp - 152]
	imul	rax, 8
	add	rax, qword [rbp - 400]
	mov	rcx, qword [rbp - 424]
	add	rcx, qword [rax]
	mov	qword [rbp - 416], rcx
	mov	rax, 1
	mov	rcx, 30
	shl	rax, cl
	mov	qword [rbp - 440], rax
	mov	rcx, qword [rbp - 440]
	sub	rcx, 1
	mov	qword [rbp - 432], rcx
	mov	rcx, qword [rbp - 416]
	and	rcx, qword [rbp - 432]
	mov	qword [rbp - 408], rcx
	mov	rbx, qword [rbp - 152]
	imul	rbx, 8
	add	rbx, qword [rbp - 376]
	mov	rax, qword [rbp - 408]
	mov	qword [rbx], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 136]
	mov	rax, qword [rax]
	mov	qword [rbp - 448], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 96]
	mov	rax, qword [rax]
	mov	qword [rbp - 456], rax
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 464], rax
	mov	rax, qword [rbp - 160]
	imul	rax, 8
	add	rax, qword [rbp - 56]
	mov	rax, qword [rax]
	mov	qword [rbp - 472], rax
	mov	rcx, qword [rbp - 152]
	imul	rcx, 8
	add	rcx, qword [rbp - 456]
	mov	rax, qword [rbp - 160]
	imul	rax, 8
	add	rax, qword [rbp - 464]
	mov	rcx, qword [rcx]
	add	rcx, qword [rax]
	mov	qword [rbp - 496], rcx
	mov	rax, qword [rbp - 152]
	imul	rax, 8
	add	rax, qword [rbp - 472]
	mov	rcx, qword [rbp - 496]
	add	rcx, qword [rax]
	mov	qword [rbp - 488], rcx
	mov	rax, 1
	mov	rcx, 30
	shl	rax, cl
	mov	qword [rbp - 512], rax
	mov	rcx, qword [rbp - 512]
	sub	rcx, 1
	mov	qword [rbp - 504], rcx
	mov	rcx, qword [rbp - 488]
	and	rcx, qword [rbp - 504]
	mov	qword [rbp - 480], rcx
	mov	rbx, qword [rbp - 152]
	imul	rbx, 8
	add	rbx, qword [rbp - 448]
	mov	rax, qword [rbp - 480]
	mov	qword [rbx], rax
	jmp	Label_25
Label_27:
Label_25:
Label_21:
	mov	rcx, qword [rbp - 160]
	add	rcx, 1
	mov	qword [rbp - 160], rcx
	jmp	Label_24
Label_22:
Label_17:
	mov	rcx, qword [rbp - 152]
	add	rcx, 1
	mov	qword [rbp - 152], rcx
	jmp	Label_20
Label_18:
Label_13:
	mov	rcx, qword [rbp - 144]
	add	rcx, 1
	mov	qword [rbp - 144], rcx
	jmp	Label_16
Label_14:
	mov	rax, 0
	mov	qword [rbp - 520], rax
	mov	rax, 0
	mov	qword [rbp - 144], rax
Label_31:
	mov	rax, qword [rbp - 144]
	cmp	rax, qword [rbp - 16]
	jl	Label_30
	jmp	Label_29
Label_30:
	mov	rax, 0
	mov	qword [rbp - 152], rax
Label_35:
	mov	rax, qword [rbp - 152]
	cmp	rax, qword [rbp - 16]
	jl	Label_34
	jmp	Label_33
Label_34:
	mov	rax, qword [rbp - 144]
	imul	rax, 8
	add	rax, qword [rbp - 96]
	mov	rax, qword [rax]
	mov	qword [rbp - 560], rax
	mov	rax, qword [rbp - 152]
	imul	rax, 8
	add	rax, qword [rbp - 560]
	mov	rcx, qword [rbp - 520]
	add	rcx, qword [rax]
	mov	qword [rbp - 552], rcx
	mov	rax, 1
	mov	rcx, 30
	shl	rax, cl
	mov	qword [rbp - 576], rax
	mov	rcx, qword [rbp - 576]
	sub	rcx, 1
	mov	qword [rbp - 568], rcx
	mov	rcx, qword [rbp - 552]
	and	rcx, qword [rbp - 568]
	mov	qword [rbp - 544], rcx
	mov	rax, qword [rbp - 544]
	mov	qword [rbp - 520], rax
Label_32:
	mov	rcx, qword [rbp - 152]
	add	rcx, 1
	mov	qword [rbp - 152], rcx
	jmp	Label_35
Label_33:
Label_28:
	mov	rcx, qword [rbp - 144]
	add	rcx, 1
	mov	qword [rbp - 144], rcx
	jmp	Label_31
Label_29:
	mov	rdi, qword [rbp - 520]
	call	toString
	mov	qword [rbp - 584], rax
	mov	rdi, qword [rbp - 584]
	call	print
	mov	qword [rbp - 592], rax
	mov	rax, 0
	jmp	Label_1
Label_1:
	add	rsp, 592
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
