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
N__:
	dq	0
h__:
	dq	0
i__:
	dq	0
j__:
	dq	0
k__:
	dq	0
total__:
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
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 824
	mov	rax, 99
	mov	qword [ h__ ], rax
	mov	rax, 100
	mov	qword [ i__ ], rax
	mov	rax, 101
	mov	qword [ j__ ], rax
	mov	rax, 102
	mov	qword [ k__ ], rax
	mov	rax, 0
	mov	qword [ total__ ], rax
	call	getInt
	mov	qword [rbp - 56], rax
	mov	rax, qword [rbp - 56]
	mov	qword [ N__ ], rax
	mov	rax, 1
	mov	qword [rbp - 8], rax
Label_4:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [ N__ ]
	jle	Label_3
	jmp	Label_2
Label_3:
	mov	rax, 1
	mov	qword [rbp - 16], rax
Label_8:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [ N__ ]
	jle	Label_7
	jmp	Label_6
Label_7:
	mov	rax, 1
	mov	qword [rbp - 24], rax
Label_12:
	mov	rax, qword [rbp - 24]
	cmp	rax, qword [ N__ ]
	jle	Label_11
	jmp	Label_10
Label_11:
	mov	rax, 1
	mov	qword [rbp - 32], rax
Label_16:
	mov	rax, qword [rbp - 32]
	cmp	rax, qword [ N__ ]
	jle	Label_15
	jmp	Label_14
Label_15:
	mov	rax, 1
	mov	qword [rbp - 40], rax
Label_20:
	mov	rax, qword [rbp - 40]
	cmp	rax, qword [ N__ ]
	jle	Label_19
	jmp	Label_18
Label_19:
	mov	rax, 1
	mov	qword [rbp - 48], rax
Label_24:
	mov	rax, qword [rbp - 48]
	cmp	rax, qword [ N__ ]
	jle	Label_23
	jmp	Label_22
Label_23:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [rbp - 16]
	jne	Label_28
	mov	rax, 0
	mov	qword [rbp - 112], rax
	jmp	Label_29
Label_28:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [rbp - 24]
	jne	Label_30
	mov	rax, 0
	mov	qword [rbp - 128], rax
	jmp	Label_31
Label_30:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [rbp - 32]
	jne	Label_32
	mov	rax, 0
	mov	qword [rbp - 144], rax
	jmp	Label_33
Label_32:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [rbp - 40]
	jne	Label_34
	mov	rax, 0
	mov	qword [rbp - 160], rax
	jmp	Label_35
Label_34:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [rbp - 48]
	jne	Label_36
	mov	rax, 0
	mov	qword [rbp - 176], rax
	jmp	Label_37
Label_36:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [ h__ ]
	jne	Label_38
	mov	rax, 0
	mov	qword [rbp - 192], rax
	jmp	Label_39
Label_38:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [ i__ ]
	jne	Label_40
	mov	rax, 0
	mov	qword [rbp - 208], rax
	jmp	Label_41
Label_40:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [ j__ ]
	jne	Label_42
	mov	rax, 0
	mov	qword [rbp - 224], rax
	jmp	Label_43
Label_42:
	mov	rax, qword [rbp - 8]
	cmp	rax, qword [ k__ ]
	jne	Label_44
	mov	rax, 0
	mov	qword [rbp - 240], rax
	jmp	Label_45
Label_44:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [rbp - 24]
	jne	Label_46
	mov	rax, 0
	mov	qword [rbp - 256], rax
	jmp	Label_47
Label_46:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [rbp - 32]
	jne	Label_48
	mov	rax, 0
	mov	qword [rbp - 272], rax
	jmp	Label_49
Label_48:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [rbp - 40]
	jne	Label_50
	mov	rax, 0
	mov	qword [rbp - 288], rax
	jmp	Label_51
Label_50:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [rbp - 48]
	jne	Label_52
	mov	rax, 0
	mov	qword [rbp - 304], rax
	jmp	Label_53
Label_52:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [ h__ ]
	jne	Label_54
	mov	rax, 0
	mov	qword [rbp - 320], rax
	jmp	Label_55
Label_54:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [ i__ ]
	jne	Label_56
	mov	rax, 0
	mov	qword [rbp - 336], rax
	jmp	Label_57
Label_56:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [ j__ ]
	jne	Label_58
	mov	rax, 0
	mov	qword [rbp - 352], rax
	jmp	Label_59
Label_58:
	mov	rax, qword [rbp - 16]
	cmp	rax, qword [ k__ ]
	jne	Label_60
	mov	rax, 0
	mov	qword [rbp - 368], rax
	jmp	Label_61
Label_60:
	mov	rax, qword [rbp - 24]
	cmp	rax, qword [rbp - 32]
	jne	Label_62
	mov	rax, 0
	mov	qword [rbp - 384], rax
	jmp	Label_63
Label_62:
	mov	rax, qword [rbp - 24]
	cmp	rax, qword [rbp - 40]
	jne	Label_64
	mov	rax, 0
	mov	qword [rbp - 400], rax
	jmp	Label_65
Label_64:
	mov	rax, qword [rbp - 24]
	cmp	rax, qword [rbp - 48]
	jne	Label_66
	mov	rax, 0
	mov	qword [rbp - 416], rax
	jmp	Label_67
Label_66:
	mov	rax, qword [rbp - 24]
	cmp	rax, qword [ h__ ]
	jne	Label_68
	mov	rax, 0
	mov	qword [rbp - 432], rax
	jmp	Label_69
Label_68:
	mov	rax, qword [rbp - 24]
	cmp	rax, qword [ i__ ]
	jne	Label_70
	mov	rax, 0
	mov	qword [rbp - 448], rax
	jmp	Label_71
Label_70:
	mov	rax, qword [rbp - 24]
	cmp	rax, qword [ j__ ]
	jne	Label_72
	mov	rax, 0
	mov	qword [rbp - 464], rax
	jmp	Label_73
Label_72:
	mov	rax, qword [rbp - 24]
	cmp	rax, qword [ k__ ]
	jne	Label_74
	mov	rax, 0
	mov	qword [rbp - 480], rax
	jmp	Label_75
Label_74:
	mov	rax, qword [rbp - 32]
	cmp	rax, qword [rbp - 40]
	jne	Label_76
	mov	rax, 0
	mov	qword [rbp - 496], rax
	jmp	Label_77
Label_76:
	mov	rax, qword [rbp - 32]
	cmp	rax, qword [rbp - 48]
	jne	Label_78
	mov	rax, 0
	mov	qword [rbp - 512], rax
	jmp	Label_79
Label_78:
	mov	rax, qword [rbp - 32]
	cmp	rax, qword [ h__ ]
	jne	Label_80
	mov	rax, 0
	mov	qword [rbp - 528], rax
	jmp	Label_81
Label_80:
	mov	rax, qword [rbp - 32]
	cmp	rax, qword [ i__ ]
	jne	Label_82
	mov	rax, 0
	mov	qword [rbp - 544], rax
	jmp	Label_83
Label_82:
	mov	rax, qword [rbp - 32]
	cmp	rax, qword [ j__ ]
	jne	Label_84
	mov	rax, 0
	mov	qword [rbp - 560], rax
	jmp	Label_85
Label_84:
	mov	rax, qword [rbp - 32]
	cmp	rax, qword [ k__ ]
	jne	Label_86
	mov	rax, 0
	mov	qword [rbp - 576], rax
	jmp	Label_87
Label_86:
	mov	rax, qword [rbp - 40]
	cmp	rax, qword [rbp - 48]
	jne	Label_88
	mov	rax, 0
	mov	qword [rbp - 592], rax
	jmp	Label_89
Label_88:
	mov	rax, qword [rbp - 40]
	cmp	rax, qword [ h__ ]
	jne	Label_90
	mov	rax, 0
	mov	qword [rbp - 608], rax
	jmp	Label_91
Label_90:
	mov	rax, qword [rbp - 40]
	cmp	rax, qword [ i__ ]
	jne	Label_92
	mov	rax, 0
	mov	qword [rbp - 624], rax
	jmp	Label_93
Label_92:
	mov	rax, qword [rbp - 40]
	cmp	rax, qword [ j__ ]
	jne	Label_94
	mov	rax, 0
	mov	qword [rbp - 640], rax
	jmp	Label_95
Label_94:
	mov	rax, qword [rbp - 40]
	cmp	rax, qword [ k__ ]
	jne	Label_96
	mov	rax, 0
	mov	qword [rbp - 656], rax
	jmp	Label_97
Label_96:
	mov	rax, qword [rbp - 48]
	cmp	rax, qword [ h__ ]
	jne	Label_98
	mov	rax, 0
	mov	qword [rbp - 672], rax
	jmp	Label_99
Label_98:
	mov	rax, qword [rbp - 48]
	cmp	rax, qword [ i__ ]
	jne	Label_100
	mov	rax, 0
	mov	qword [rbp - 688], rax
	jmp	Label_101
Label_100:
	mov	rax, qword [rbp - 48]
	cmp	rax, qword [ j__ ]
	jne	Label_102
	mov	rax, 0
	mov	qword [rbp - 704], rax
	jmp	Label_103
Label_102:
	mov	rax, qword [rbp - 48]
	cmp	rax, qword [ k__ ]
	jne	Label_104
	mov	rax, 0
	mov	qword [rbp - 720], rax
	jmp	Label_105
Label_104:
	mov	rax, qword [ i__ ]
	cmp	rax, qword [ j__ ]
	jne	Label_106
	mov	rax, 0
	mov	qword [rbp - 736], rax
	jmp	Label_107
Label_106:
	mov	rcx, qword [ h__ ]
	cmp	rcx, qword [ k__ ]
	setne	cl
	movzx	rcx, cl
	mov	qword [rbp - 752], rcx
	mov	rax, qword [rbp - 752]
	mov	qword [rbp - 736], rax
Label_107:
	mov	rax, qword [rbp - 736]
	mov	qword [rbp - 720], rax
Label_105:
	mov	rax, qword [rbp - 720]
	mov	qword [rbp - 704], rax
Label_103:
	mov	rax, qword [rbp - 704]
	mov	qword [rbp - 688], rax
Label_101:
	mov	rax, qword [rbp - 688]
	mov	qword [rbp - 672], rax
Label_99:
	mov	rax, qword [rbp - 672]
	mov	qword [rbp - 656], rax
Label_97:
	mov	rax, qword [rbp - 656]
	mov	qword [rbp - 640], rax
Label_95:
	mov	rax, qword [rbp - 640]
	mov	qword [rbp - 624], rax
Label_93:
	mov	rax, qword [rbp - 624]
	mov	qword [rbp - 608], rax
Label_91:
	mov	rax, qword [rbp - 608]
	mov	qword [rbp - 592], rax
Label_89:
	mov	rax, qword [rbp - 592]
	mov	qword [rbp - 576], rax
Label_87:
	mov	rax, qword [rbp - 576]
	mov	qword [rbp - 560], rax
Label_85:
	mov	rax, qword [rbp - 560]
	mov	qword [rbp - 544], rax
Label_83:
	mov	rax, qword [rbp - 544]
	mov	qword [rbp - 528], rax
Label_81:
	mov	rax, qword [rbp - 528]
	mov	qword [rbp - 512], rax
Label_79:
	mov	rax, qword [rbp - 512]
	mov	qword [rbp - 496], rax
Label_77:
	mov	rax, qword [rbp - 496]
	mov	qword [rbp - 480], rax
Label_75:
	mov	rax, qword [rbp - 480]
	mov	qword [rbp - 464], rax
Label_73:
	mov	rax, qword [rbp - 464]
	mov	qword [rbp - 448], rax
Label_71:
	mov	rax, qword [rbp - 448]
	mov	qword [rbp - 432], rax
Label_69:
	mov	rax, qword [rbp - 432]
	mov	qword [rbp - 416], rax
Label_67:
	mov	rax, qword [rbp - 416]
	mov	qword [rbp - 400], rax
Label_65:
	mov	rax, qword [rbp - 400]
	mov	qword [rbp - 384], rax
Label_63:
	mov	rax, qword [rbp - 384]
	mov	qword [rbp - 368], rax
Label_61:
	mov	rax, qword [rbp - 368]
	mov	qword [rbp - 352], rax
Label_59:
	mov	rax, qword [rbp - 352]
	mov	qword [rbp - 336], rax
Label_57:
	mov	rax, qword [rbp - 336]
	mov	qword [rbp - 320], rax
Label_55:
	mov	rax, qword [rbp - 320]
	mov	qword [rbp - 304], rax
Label_53:
	mov	rax, qword [rbp - 304]
	mov	qword [rbp - 288], rax
Label_51:
	mov	rax, qword [rbp - 288]
	mov	qword [rbp - 272], rax
Label_49:
	mov	rax, qword [rbp - 272]
	mov	qword [rbp - 256], rax
Label_47:
	mov	rax, qword [rbp - 256]
	mov	qword [rbp - 240], rax
Label_45:
	mov	rax, qword [rbp - 240]
	mov	qword [rbp - 224], rax
Label_43:
	mov	rax, qword [rbp - 224]
	mov	qword [rbp - 208], rax
Label_41:
	mov	rax, qword [rbp - 208]
	mov	qword [rbp - 192], rax
Label_39:
	mov	rax, qword [rbp - 192]
	mov	qword [rbp - 176], rax
Label_37:
	mov	rax, qword [rbp - 176]
	mov	qword [rbp - 160], rax
Label_35:
	mov	rax, qword [rbp - 160]
	mov	qword [rbp - 144], rax
Label_33:
	mov	rax, qword [rbp - 144]
	mov	qword [rbp - 128], rax
Label_31:
	mov	rax, qword [rbp - 128]
	mov	qword [rbp - 112], rax
Label_29:
	mov	rax, qword [rbp - 112]
	cmp	rax, 1
	je	Label_26
	jmp	Label_27
Label_26:
	mov	rax, qword [ total__ ]
	mov	qword [rbp - 760], rax
	mov	rcx, qword [ total__ ]
	add	rcx, 1
	mov	qword [ total__ ], rcx
	jmp	Label_27
Label_27:
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 768], rax
	mov	rcx, qword [rbp - 48]
	add	rcx, 1
	mov	qword [rbp - 48], rcx
	jmp	Label_24
Label_22:
	mov	rax, qword [rbp - 40]
	mov	qword [rbp - 776], rax
	mov	rcx, qword [rbp - 40]
	add	rcx, 1
	mov	qword [rbp - 40], rcx
	jmp	Label_20
Label_18:
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 784], rax
	mov	rcx, qword [rbp - 32]
	add	rcx, 1
	mov	qword [rbp - 32], rcx
	jmp	Label_16
Label_14:
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 792], rax
	mov	rcx, qword [rbp - 24]
	add	rcx, 1
	mov	qword [rbp - 24], rcx
	jmp	Label_12
Label_10:
	mov	rax, qword [rbp - 16]
	mov	qword [rbp - 800], rax
	mov	rcx, qword [rbp - 16]
	add	rcx, 1
	mov	qword [rbp - 16], rcx
	jmp	Label_8
Label_6:
	mov	rax, qword [rbp - 8]
	mov	qword [rbp - 808], rax
	mov	rcx, qword [rbp - 8]
	add	rcx, 1
	mov	qword [rbp - 8], rcx
	jmp	Label_4
Label_2:
	mov	rdi, qword [ total__ ]
	call	toString
	mov	qword [rbp - 816], rax
	mov	rdi, qword [rbp - 816]
	call	println
	mov	qword [rbp - 824], rax
	mov	rax, 0
	jmp	Label_0
Label_0:
	add	rsp, 824
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
