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
	dq	1
str__0:
	db	32, 0
	dq	1
str__1:
	db	32, 0
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
	sub	rsp, 6288
	mov	rcx, 0
	mov	qword [rbp - 32], rcx
	call	getInt
	mov	qword [rbp - 40], rax
	mov	rcx, qword [rbp - 40]
	mov	qword [rbp - 48], rcx
Label_4:
	mov	rax, qword [rbp - 32]
	cmp	rax, qword [rbp - 48]
	jl	Label_3
	jmp	Label_2
Label_3:
	mov	rcx, qword [rbp - 32]
	add	rcx, 1
	mov	qword [rbp - 64], rcx
	mov	rcx, qword [rbp - 64]
	mov	qword [rbp - 8], rcx
	mov	rcx, qword [rbp - 32]
	add	rcx, 1
	mov	qword [rbp - 72], rcx
	mov	rcx, qword [rbp - 72]
	mov	qword [rbp - 16], rcx
	mov	rcx, qword [rbp - 32]
	add	rcx, 1
	mov	qword [rbp - 80], rcx
	mov	rcx, qword [rbp - 80]
	mov	qword [rbp - 24], rcx
Label_8:
	mov	rax, qword [rbp - 24]
	cmp	rax, 536870912
	jl	Label_9
	mov	rcx, 0
	mov	qword [rbp - 88], rcx
	jmp	Label_10
Label_9:
	mov	rcx, 536870912
	mov	qword [rbp - 128], rcx
	neg	qword [rbp - 128]
	mov	rcx, qword [rbp - 24]
	cmp	rcx, qword [rbp - 128]
	setg	cl
	movzx	rcx, cl
	mov	qword [rbp - 112], rcx
	mov	rcx, qword [rbp - 112]
	mov	qword [rbp - 88], rcx
Label_10:
	mov	rax, qword [rbp - 88]
	cmp	rax, 1
	je	Label_7
	jmp	Label_6
Label_7:
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 200], rcx
	mov	rcx, qword [rbp - 200]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 192], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 208], rcx
	mov	rcx, qword [rbp - 192]
	sub	rcx, qword [rbp - 208]
	mov	qword [rbp - 184], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 232], rcx
	mov	rcx, qword [rbp - 232]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 224], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 240], rcx
	mov	rcx, qword [rbp - 224]
	sub	rcx, qword [rbp - 240]
	mov	qword [rbp - 216], rcx
	mov	rcx, qword [rbp - 184]
	add	rcx, qword [rbp - 216]
	mov	qword [rbp - 176], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 272], rcx
	mov	rcx, qword [rbp - 272]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 264], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 280], rcx
	mov	rcx, qword [rbp - 264]
	sub	rcx, qword [rbp - 280]
	mov	qword [rbp - 256], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 296], rcx
	mov	rcx, qword [rbp - 296]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 288], rcx
	mov	rcx, qword [rbp - 256]
	add	rcx, qword [rbp - 288]
	mov	qword [rbp - 248], rcx
	mov	rcx, qword [rbp - 176]
	add	rcx, qword [rbp - 248]
	mov	qword [rbp - 168], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 328], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 344], rcx
	mov	rcx, qword [rbp - 344]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 336], rcx
	mov	rcx, qword [rbp - 328]
	add	rcx, qword [rbp - 336]
	mov	qword [rbp - 320], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 352], rcx
	mov	rcx, qword [rbp - 320]
	sub	rcx, qword [rbp - 352]
	mov	qword [rbp - 312], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 384], rcx
	mov	rcx, qword [rbp - 384]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 376], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 392], rcx
	mov	rcx, qword [rbp - 376]
	sub	rcx, qword [rbp - 392]
	mov	qword [rbp - 368], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 408], rcx
	mov	rcx, qword [rbp - 408]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 400], rcx
	mov	rcx, qword [rbp - 368]
	add	rcx, qword [rbp - 400]
	mov	qword [rbp - 360], rcx
	mov	rcx, qword [rbp - 312]
	add	rcx, qword [rbp - 360]
	mov	qword [rbp - 304], rcx
	mov	rcx, qword [rbp - 168]
	sub	rcx, qword [rbp - 304]
	mov	qword [rbp - 160], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 448], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 464], rcx
	mov	rcx, qword [rbp - 464]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 456], rcx
	mov	rcx, qword [rbp - 448]
	add	rcx, qword [rbp - 456]
	mov	qword [rbp - 440], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 480], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 496], rcx
	mov	rcx, qword [rbp - 496]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 488], rcx
	mov	rcx, qword [rbp - 480]
	add	rcx, qword [rbp - 488]
	mov	qword [rbp - 472], rcx
	mov	rcx, qword [rbp - 440]
	sub	rcx, qword [rbp - 472]
	mov	qword [rbp - 432], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 520], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 536], rcx
	mov	rcx, qword [rbp - 536]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 528], rcx
	mov	rcx, qword [rbp - 520]
	add	rcx, qword [rbp - 528]
	mov	qword [rbp - 512], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 544], rcx
	mov	rcx, qword [rbp - 512]
	sub	rcx, qword [rbp - 544]
	mov	qword [rbp - 504], rcx
	mov	rcx, qword [rbp - 432]
	sub	rcx, qword [rbp - 504]
	mov	qword [rbp - 424], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 584], rcx
	mov	rcx, qword [rbp - 584]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 576], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 592], rcx
	mov	rcx, qword [rbp - 576]
	sub	rcx, qword [rbp - 592]
	mov	qword [rbp - 568], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 608], rcx
	mov	rcx, qword [rbp - 608]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 600], rcx
	mov	rcx, qword [rbp - 568]
	add	rcx, qword [rbp - 600]
	mov	qword [rbp - 560], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 632], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 648], rcx
	mov	rcx, qword [rbp - 648]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 640], rcx
	mov	rcx, qword [rbp - 632]
	add	rcx, qword [rbp - 640]
	mov	qword [rbp - 624], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 656], rcx
	mov	rcx, qword [rbp - 624]
	sub	rcx, qword [rbp - 656]
	mov	qword [rbp - 616], rcx
	mov	rcx, qword [rbp - 560]
	sub	rcx, qword [rbp - 616]
	mov	qword [rbp - 552], rcx
	mov	rcx, qword [rbp - 424]
	add	rcx, qword [rbp - 552]
	mov	qword [rbp - 416], rcx
	mov	rcx, qword [rbp - 160]
	sub	rcx, qword [rbp - 416]
	mov	qword [rbp - 152], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 712], rcx
	mov	rcx, qword [rbp - 712]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 704], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 720], rcx
	mov	rcx, qword [rbp - 704]
	sub	rcx, qword [rbp - 720]
	mov	qword [rbp - 696], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 744], rcx
	mov	rcx, qword [rbp - 744]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 736], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 752], rcx
	mov	rcx, qword [rbp - 736]
	sub	rcx, qword [rbp - 752]
	mov	qword [rbp - 728], rcx
	mov	rcx, qword [rbp - 696]
	add	rcx, qword [rbp - 728]
	mov	qword [rbp - 688], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 784], rcx
	mov	rcx, qword [rbp - 784]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 776], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 792], rcx
	mov	rcx, qword [rbp - 776]
	sub	rcx, qword [rbp - 792]
	mov	qword [rbp - 768], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 808], rcx
	mov	rcx, qword [rbp - 808]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 800], rcx
	mov	rcx, qword [rbp - 768]
	add	rcx, qword [rbp - 800]
	mov	qword [rbp - 760], rcx
	mov	rcx, qword [rbp - 688]
	add	rcx, qword [rbp - 760]
	mov	qword [rbp - 680], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 840], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 856], rcx
	mov	rcx, qword [rbp - 856]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 848], rcx
	mov	rcx, qword [rbp - 840]
	add	rcx, qword [rbp - 848]
	mov	qword [rbp - 832], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 864], rcx
	mov	rcx, qword [rbp - 832]
	sub	rcx, qword [rbp - 864]
	mov	qword [rbp - 824], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 896], rcx
	mov	rcx, qword [rbp - 896]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 888], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 904], rcx
	mov	rcx, qword [rbp - 888]
	sub	rcx, qword [rbp - 904]
	mov	qword [rbp - 880], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 920], rcx
	mov	rcx, qword [rbp - 920]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 912], rcx
	mov	rcx, qword [rbp - 880]
	add	rcx, qword [rbp - 912]
	mov	qword [rbp - 872], rcx
	mov	rcx, qword [rbp - 824]
	add	rcx, qword [rbp - 872]
	mov	qword [rbp - 816], rcx
	mov	rcx, qword [rbp - 680]
	sub	rcx, qword [rbp - 816]
	mov	qword [rbp - 672], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 960], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 976], rcx
	mov	rcx, qword [rbp - 976]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 968], rcx
	mov	rcx, qword [rbp - 960]
	add	rcx, qword [rbp - 968]
	mov	qword [rbp - 952], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 984], rcx
	mov	rcx, qword [rbp - 952]
	sub	rcx, qword [rbp - 984]
	mov	qword [rbp - 944], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1016], rcx
	mov	rcx, qword [rbp - 1016]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1008], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1024], rcx
	mov	rcx, qword [rbp - 1008]
	sub	rcx, qword [rbp - 1024]
	mov	qword [rbp - 1000], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1040], rcx
	mov	rcx, qword [rbp - 1040]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1032], rcx
	mov	rcx, qword [rbp - 1000]
	add	rcx, qword [rbp - 1032]
	mov	qword [rbp - 992], rcx
	mov	rcx, qword [rbp - 944]
	add	rcx, qword [rbp - 992]
	mov	qword [rbp - 936], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1072], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1088], rcx
	mov	rcx, qword [rbp - 1088]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1080], rcx
	mov	rcx, qword [rbp - 1072]
	add	rcx, qword [rbp - 1080]
	mov	qword [rbp - 1064], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1096], rcx
	mov	rcx, qword [rbp - 1064]
	sub	rcx, qword [rbp - 1096]
	mov	qword [rbp - 1056], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1128], rcx
	mov	rcx, qword [rbp - 1128]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1120], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1136], rcx
	mov	rcx, qword [rbp - 1120]
	sub	rcx, qword [rbp - 1136]
	mov	qword [rbp - 1112], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1152], rcx
	mov	rcx, qword [rbp - 1152]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1144], rcx
	mov	rcx, qword [rbp - 1112]
	add	rcx, qword [rbp - 1144]
	mov	qword [rbp - 1104], rcx
	mov	rcx, qword [rbp - 1056]
	add	rcx, qword [rbp - 1104]
	mov	qword [rbp - 1048], rcx
	mov	rcx, qword [rbp - 936]
	sub	rcx, qword [rbp - 1048]
	mov	qword [rbp - 928], rcx
	mov	rcx, qword [rbp - 672]
	sub	rcx, qword [rbp - 928]
	mov	qword [rbp - 664], rcx
	mov	rcx, qword [rbp - 152]
	add	rcx, qword [rbp - 664]
	mov	qword [rbp - 144], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1208], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1224], rcx
	mov	rcx, qword [rbp - 1224]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1216], rcx
	mov	rcx, qword [rbp - 1208]
	add	rcx, qword [rbp - 1216]
	mov	qword [rbp - 1200], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1240], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1256], rcx
	mov	rcx, qword [rbp - 1256]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1248], rcx
	mov	rcx, qword [rbp - 1240]
	add	rcx, qword [rbp - 1248]
	mov	qword [rbp - 1232], rcx
	mov	rcx, qword [rbp - 1200]
	sub	rcx, qword [rbp - 1232]
	mov	qword [rbp - 1192], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1280], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1296], rcx
	mov	rcx, qword [rbp - 1296]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1288], rcx
	mov	rcx, qword [rbp - 1280]
	add	rcx, qword [rbp - 1288]
	mov	qword [rbp - 1272], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1304], rcx
	mov	rcx, qword [rbp - 1272]
	sub	rcx, qword [rbp - 1304]
	mov	qword [rbp - 1264], rcx
	mov	rcx, qword [rbp - 1192]
	sub	rcx, qword [rbp - 1264]
	mov	qword [rbp - 1184], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1344], rcx
	mov	rcx, qword [rbp - 1344]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1336], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1352], rcx
	mov	rcx, qword [rbp - 1336]
	sub	rcx, qword [rbp - 1352]
	mov	qword [rbp - 1328], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1368], rcx
	mov	rcx, qword [rbp - 1368]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1360], rcx
	mov	rcx, qword [rbp - 1328]
	add	rcx, qword [rbp - 1360]
	mov	qword [rbp - 1320], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1392], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1408], rcx
	mov	rcx, qword [rbp - 1408]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1400], rcx
	mov	rcx, qword [rbp - 1392]
	add	rcx, qword [rbp - 1400]
	mov	qword [rbp - 1384], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1416], rcx
	mov	rcx, qword [rbp - 1384]
	sub	rcx, qword [rbp - 1416]
	mov	qword [rbp - 1376], rcx
	mov	rcx, qword [rbp - 1320]
	sub	rcx, qword [rbp - 1376]
	mov	qword [rbp - 1312], rcx
	mov	rcx, qword [rbp - 1184]
	add	rcx, qword [rbp - 1312]
	mov	qword [rbp - 1176], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1464], rcx
	mov	rcx, qword [rbp - 1464]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1456], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1472], rcx
	mov	rcx, qword [rbp - 1456]
	sub	rcx, qword [rbp - 1472]
	mov	qword [rbp - 1448], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1488], rcx
	mov	rcx, qword [rbp - 1488]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1480], rcx
	mov	rcx, qword [rbp - 1448]
	add	rcx, qword [rbp - 1480]
	mov	qword [rbp - 1440], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1512], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1528], rcx
	mov	rcx, qword [rbp - 1528]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1520], rcx
	mov	rcx, qword [rbp - 1512]
	add	rcx, qword [rbp - 1520]
	mov	qword [rbp - 1504], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1536], rcx
	mov	rcx, qword [rbp - 1504]
	sub	rcx, qword [rbp - 1536]
	mov	qword [rbp - 1496], rcx
	mov	rcx, qword [rbp - 1440]
	sub	rcx, qword [rbp - 1496]
	mov	qword [rbp - 1432], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1576], rcx
	mov	rcx, qword [rbp - 1576]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1568], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1584], rcx
	mov	rcx, qword [rbp - 1568]
	sub	rcx, qword [rbp - 1584]
	mov	qword [rbp - 1560], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1600], rcx
	mov	rcx, qword [rbp - 1600]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1592], rcx
	mov	rcx, qword [rbp - 1560]
	add	rcx, qword [rbp - 1592]
	mov	qword [rbp - 1552], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1624], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1640], rcx
	mov	rcx, qword [rbp - 1640]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1632], rcx
	mov	rcx, qword [rbp - 1624]
	add	rcx, qword [rbp - 1632]
	mov	qword [rbp - 1616], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1648], rcx
	mov	rcx, qword [rbp - 1616]
	sub	rcx, qword [rbp - 1648]
	mov	qword [rbp - 1608], rcx
	mov	rcx, qword [rbp - 1552]
	sub	rcx, qword [rbp - 1608]
	mov	qword [rbp - 1544], rcx
	mov	rcx, qword [rbp - 1432]
	add	rcx, qword [rbp - 1544]
	mov	qword [rbp - 1424], rcx
	mov	rcx, qword [rbp - 1176]
	add	rcx, qword [rbp - 1424]
	mov	qword [rbp - 1168], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1704], rcx
	mov	rcx, qword [rbp - 1704]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1696], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1712], rcx
	mov	rcx, qword [rbp - 1696]
	sub	rcx, qword [rbp - 1712]
	mov	qword [rbp - 1688], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1736], rcx
	mov	rcx, qword [rbp - 1736]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1728], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1744], rcx
	mov	rcx, qword [rbp - 1728]
	sub	rcx, qword [rbp - 1744]
	mov	qword [rbp - 1720], rcx
	mov	rcx, qword [rbp - 1688]
	add	rcx, qword [rbp - 1720]
	mov	qword [rbp - 1680], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1776], rcx
	mov	rcx, qword [rbp - 1776]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1768], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1784], rcx
	mov	rcx, qword [rbp - 1768]
	sub	rcx, qword [rbp - 1784]
	mov	qword [rbp - 1760], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1800], rcx
	mov	rcx, qword [rbp - 1800]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1792], rcx
	mov	rcx, qword [rbp - 1760]
	add	rcx, qword [rbp - 1792]
	mov	qword [rbp - 1752], rcx
	mov	rcx, qword [rbp - 1680]
	add	rcx, qword [rbp - 1752]
	mov	qword [rbp - 1672], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1832], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1848], rcx
	mov	rcx, qword [rbp - 1848]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1840], rcx
	mov	rcx, qword [rbp - 1832]
	add	rcx, qword [rbp - 1840]
	mov	qword [rbp - 1824], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1856], rcx
	mov	rcx, qword [rbp - 1824]
	sub	rcx, qword [rbp - 1856]
	mov	qword [rbp - 1816], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1888], rcx
	mov	rcx, qword [rbp - 1888]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1880], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1896], rcx
	mov	rcx, qword [rbp - 1880]
	sub	rcx, qword [rbp - 1896]
	mov	qword [rbp - 1872], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1912], rcx
	mov	rcx, qword [rbp - 1912]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1904], rcx
	mov	rcx, qword [rbp - 1872]
	add	rcx, qword [rbp - 1904]
	mov	qword [rbp - 1864], rcx
	mov	rcx, qword [rbp - 1816]
	add	rcx, qword [rbp - 1864]
	mov	qword [rbp - 1808], rcx
	mov	rcx, qword [rbp - 1672]
	sub	rcx, qword [rbp - 1808]
	mov	qword [rbp - 1664], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1952], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 1968], rcx
	mov	rcx, qword [rbp - 1968]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1960], rcx
	mov	rcx, qword [rbp - 1952]
	add	rcx, qword [rbp - 1960]
	mov	qword [rbp - 1944], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 1976], rcx
	mov	rcx, qword [rbp - 1944]
	sub	rcx, qword [rbp - 1976]
	mov	qword [rbp - 1936], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2008], rcx
	mov	rcx, qword [rbp - 2008]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2000], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2016], rcx
	mov	rcx, qword [rbp - 2000]
	sub	rcx, qword [rbp - 2016]
	mov	qword [rbp - 1992], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2032], rcx
	mov	rcx, qword [rbp - 2032]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2024], rcx
	mov	rcx, qword [rbp - 1992]
	add	rcx, qword [rbp - 2024]
	mov	qword [rbp - 1984], rcx
	mov	rcx, qword [rbp - 1936]
	add	rcx, qword [rbp - 1984]
	mov	qword [rbp - 1928], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2064], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2080], rcx
	mov	rcx, qword [rbp - 2080]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2072], rcx
	mov	rcx, qword [rbp - 2064]
	add	rcx, qword [rbp - 2072]
	mov	qword [rbp - 2056], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2088], rcx
	mov	rcx, qword [rbp - 2056]
	sub	rcx, qword [rbp - 2088]
	mov	qword [rbp - 2048], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2120], rcx
	mov	rcx, qword [rbp - 2120]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2112], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2128], rcx
	mov	rcx, qword [rbp - 2112]
	sub	rcx, qword [rbp - 2128]
	mov	qword [rbp - 2104], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2144], rcx
	mov	rcx, qword [rbp - 2144]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2136], rcx
	mov	rcx, qword [rbp - 2104]
	add	rcx, qword [rbp - 2136]
	mov	qword [rbp - 2096], rcx
	mov	rcx, qword [rbp - 2048]
	add	rcx, qword [rbp - 2096]
	mov	qword [rbp - 2040], rcx
	mov	rcx, qword [rbp - 1928]
	sub	rcx, qword [rbp - 2040]
	mov	qword [rbp - 1920], rcx
	mov	rcx, qword [rbp - 1664]
	sub	rcx, qword [rbp - 1920]
	mov	qword [rbp - 1656], rcx
	mov	rcx, qword [rbp - 1168]
	add	rcx, qword [rbp - 1656]
	mov	qword [rbp - 1160], rcx
	mov	rcx, qword [rbp - 144]
	sub	rcx, qword [rbp - 1160]
	mov	qword [rbp - 136], rcx
	mov	rcx, qword [rbp - 136]
	mov	qword [rbp - 8], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2216], rcx
	mov	rcx, qword [rbp - 2216]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2208], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2224], rcx
	mov	rcx, qword [rbp - 2208]
	sub	rcx, qword [rbp - 2224]
	mov	qword [rbp - 2200], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2248], rcx
	mov	rcx, qword [rbp - 2248]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2240], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2256], rcx
	mov	rcx, qword [rbp - 2240]
	sub	rcx, qword [rbp - 2256]
	mov	qword [rbp - 2232], rcx
	mov	rcx, qword [rbp - 2200]
	add	rcx, qword [rbp - 2232]
	mov	qword [rbp - 2192], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2288], rcx
	mov	rcx, qword [rbp - 2288]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2280], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2296], rcx
	mov	rcx, qword [rbp - 2280]
	sub	rcx, qword [rbp - 2296]
	mov	qword [rbp - 2272], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2312], rcx
	mov	rcx, qword [rbp - 2312]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2304], rcx
	mov	rcx, qword [rbp - 2272]
	add	rcx, qword [rbp - 2304]
	mov	qword [rbp - 2264], rcx
	mov	rcx, qword [rbp - 2192]
	add	rcx, qword [rbp - 2264]
	mov	qword [rbp - 2184], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2344], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2360], rcx
	mov	rcx, qword [rbp - 2360]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2352], rcx
	mov	rcx, qword [rbp - 2344]
	add	rcx, qword [rbp - 2352]
	mov	qword [rbp - 2336], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2368], rcx
	mov	rcx, qword [rbp - 2336]
	sub	rcx, qword [rbp - 2368]
	mov	qword [rbp - 2328], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2400], rcx
	mov	rcx, qword [rbp - 2400]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2392], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2408], rcx
	mov	rcx, qword [rbp - 2392]
	sub	rcx, qword [rbp - 2408]
	mov	qword [rbp - 2384], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2424], rcx
	mov	rcx, qword [rbp - 2424]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2416], rcx
	mov	rcx, qword [rbp - 2384]
	add	rcx, qword [rbp - 2416]
	mov	qword [rbp - 2376], rcx
	mov	rcx, qword [rbp - 2328]
	add	rcx, qword [rbp - 2376]
	mov	qword [rbp - 2320], rcx
	mov	rcx, qword [rbp - 2184]
	sub	rcx, qword [rbp - 2320]
	mov	qword [rbp - 2176], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2464], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2480], rcx
	mov	rcx, qword [rbp - 2480]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2472], rcx
	mov	rcx, qword [rbp - 2464]
	add	rcx, qword [rbp - 2472]
	mov	qword [rbp - 2456], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2496], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2512], rcx
	mov	rcx, qword [rbp - 2512]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2504], rcx
	mov	rcx, qword [rbp - 2496]
	add	rcx, qword [rbp - 2504]
	mov	qword [rbp - 2488], rcx
	mov	rcx, qword [rbp - 2456]
	sub	rcx, qword [rbp - 2488]
	mov	qword [rbp - 2448], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2536], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2552], rcx
	mov	rcx, qword [rbp - 2552]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2544], rcx
	mov	rcx, qword [rbp - 2536]
	add	rcx, qword [rbp - 2544]
	mov	qword [rbp - 2528], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2560], rcx
	mov	rcx, qword [rbp - 2528]
	sub	rcx, qword [rbp - 2560]
	mov	qword [rbp - 2520], rcx
	mov	rcx, qword [rbp - 2448]
	sub	rcx, qword [rbp - 2520]
	mov	qword [rbp - 2440], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2600], rcx
	mov	rcx, qword [rbp - 2600]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2592], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2608], rcx
	mov	rcx, qword [rbp - 2592]
	sub	rcx, qword [rbp - 2608]
	mov	qword [rbp - 2584], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2624], rcx
	mov	rcx, qword [rbp - 2624]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2616], rcx
	mov	rcx, qword [rbp - 2584]
	add	rcx, qword [rbp - 2616]
	mov	qword [rbp - 2576], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2648], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2664], rcx
	mov	rcx, qword [rbp - 2664]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2656], rcx
	mov	rcx, qword [rbp - 2648]
	add	rcx, qword [rbp - 2656]
	mov	qword [rbp - 2640], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2672], rcx
	mov	rcx, qword [rbp - 2640]
	sub	rcx, qword [rbp - 2672]
	mov	qword [rbp - 2632], rcx
	mov	rcx, qword [rbp - 2576]
	sub	rcx, qword [rbp - 2632]
	mov	qword [rbp - 2568], rcx
	mov	rcx, qword [rbp - 2440]
	add	rcx, qword [rbp - 2568]
	mov	qword [rbp - 2432], rcx
	mov	rcx, qword [rbp - 2176]
	sub	rcx, qword [rbp - 2432]
	mov	qword [rbp - 2168], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2728], rcx
	mov	rcx, qword [rbp - 2728]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2720], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2736], rcx
	mov	rcx, qword [rbp - 2720]
	sub	rcx, qword [rbp - 2736]
	mov	qword [rbp - 2712], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2760], rcx
	mov	rcx, qword [rbp - 2760]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2752], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2768], rcx
	mov	rcx, qword [rbp - 2752]
	sub	rcx, qword [rbp - 2768]
	mov	qword [rbp - 2744], rcx
	mov	rcx, qword [rbp - 2712]
	add	rcx, qword [rbp - 2744]
	mov	qword [rbp - 2704], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2800], rcx
	mov	rcx, qword [rbp - 2800]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2792], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2808], rcx
	mov	rcx, qword [rbp - 2792]
	sub	rcx, qword [rbp - 2808]
	mov	qword [rbp - 2784], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2824], rcx
	mov	rcx, qword [rbp - 2824]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2816], rcx
	mov	rcx, qword [rbp - 2784]
	add	rcx, qword [rbp - 2816]
	mov	qword [rbp - 2776], rcx
	mov	rcx, qword [rbp - 2704]
	add	rcx, qword [rbp - 2776]
	mov	qword [rbp - 2696], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2856], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2872], rcx
	mov	rcx, qword [rbp - 2872]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2864], rcx
	mov	rcx, qword [rbp - 2856]
	add	rcx, qword [rbp - 2864]
	mov	qword [rbp - 2848], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2880], rcx
	mov	rcx, qword [rbp - 2848]
	sub	rcx, qword [rbp - 2880]
	mov	qword [rbp - 2840], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2912], rcx
	mov	rcx, qword [rbp - 2912]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2904], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2920], rcx
	mov	rcx, qword [rbp - 2904]
	sub	rcx, qword [rbp - 2920]
	mov	qword [rbp - 2896], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2936], rcx
	mov	rcx, qword [rbp - 2936]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2928], rcx
	mov	rcx, qword [rbp - 2896]
	add	rcx, qword [rbp - 2928]
	mov	qword [rbp - 2888], rcx
	mov	rcx, qword [rbp - 2840]
	add	rcx, qword [rbp - 2888]
	mov	qword [rbp - 2832], rcx
	mov	rcx, qword [rbp - 2696]
	sub	rcx, qword [rbp - 2832]
	mov	qword [rbp - 2688], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2976], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 2992], rcx
	mov	rcx, qword [rbp - 2992]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 2984], rcx
	mov	rcx, qword [rbp - 2976]
	add	rcx, qword [rbp - 2984]
	mov	qword [rbp - 2968], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3000], rcx
	mov	rcx, qword [rbp - 2968]
	sub	rcx, qword [rbp - 3000]
	mov	qword [rbp - 2960], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3032], rcx
	mov	rcx, qword [rbp - 3032]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3024], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3040], rcx
	mov	rcx, qword [rbp - 3024]
	sub	rcx, qword [rbp - 3040]
	mov	qword [rbp - 3016], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3056], rcx
	mov	rcx, qword [rbp - 3056]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3048], rcx
	mov	rcx, qword [rbp - 3016]
	add	rcx, qword [rbp - 3048]
	mov	qword [rbp - 3008], rcx
	mov	rcx, qword [rbp - 2960]
	add	rcx, qword [rbp - 3008]
	mov	qword [rbp - 2952], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3088], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3104], rcx
	mov	rcx, qword [rbp - 3104]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3096], rcx
	mov	rcx, qword [rbp - 3088]
	add	rcx, qword [rbp - 3096]
	mov	qword [rbp - 3080], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3112], rcx
	mov	rcx, qword [rbp - 3080]
	sub	rcx, qword [rbp - 3112]
	mov	qword [rbp - 3072], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3144], rcx
	mov	rcx, qword [rbp - 3144]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3136], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3152], rcx
	mov	rcx, qword [rbp - 3136]
	sub	rcx, qword [rbp - 3152]
	mov	qword [rbp - 3128], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3168], rcx
	mov	rcx, qword [rbp - 3168]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3160], rcx
	mov	rcx, qword [rbp - 3128]
	add	rcx, qword [rbp - 3160]
	mov	qword [rbp - 3120], rcx
	mov	rcx, qword [rbp - 3072]
	add	rcx, qword [rbp - 3120]
	mov	qword [rbp - 3064], rcx
	mov	rcx, qword [rbp - 2952]
	sub	rcx, qword [rbp - 3064]
	mov	qword [rbp - 2944], rcx
	mov	rcx, qword [rbp - 2688]
	sub	rcx, qword [rbp - 2944]
	mov	qword [rbp - 2680], rcx
	mov	rcx, qword [rbp - 2168]
	add	rcx, qword [rbp - 2680]
	mov	qword [rbp - 2160], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3224], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3240], rcx
	mov	rcx, qword [rbp - 3240]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3232], rcx
	mov	rcx, qword [rbp - 3224]
	add	rcx, qword [rbp - 3232]
	mov	qword [rbp - 3216], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3256], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3272], rcx
	mov	rcx, qword [rbp - 3272]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3264], rcx
	mov	rcx, qword [rbp - 3256]
	add	rcx, qword [rbp - 3264]
	mov	qword [rbp - 3248], rcx
	mov	rcx, qword [rbp - 3216]
	sub	rcx, qword [rbp - 3248]
	mov	qword [rbp - 3208], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3296], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3312], rcx
	mov	rcx, qword [rbp - 3312]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3304], rcx
	mov	rcx, qword [rbp - 3296]
	add	rcx, qword [rbp - 3304]
	mov	qword [rbp - 3288], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3320], rcx
	mov	rcx, qword [rbp - 3288]
	sub	rcx, qword [rbp - 3320]
	mov	qword [rbp - 3280], rcx
	mov	rcx, qword [rbp - 3208]
	sub	rcx, qword [rbp - 3280]
	mov	qword [rbp - 3200], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3360], rcx
	mov	rcx, qword [rbp - 3360]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3352], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3368], rcx
	mov	rcx, qword [rbp - 3352]
	sub	rcx, qword [rbp - 3368]
	mov	qword [rbp - 3344], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3384], rcx
	mov	rcx, qword [rbp - 3384]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3376], rcx
	mov	rcx, qword [rbp - 3344]
	add	rcx, qword [rbp - 3376]
	mov	qword [rbp - 3336], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3408], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3424], rcx
	mov	rcx, qword [rbp - 3424]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3416], rcx
	mov	rcx, qword [rbp - 3408]
	add	rcx, qword [rbp - 3416]
	mov	qword [rbp - 3400], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3432], rcx
	mov	rcx, qword [rbp - 3400]
	sub	rcx, qword [rbp - 3432]
	mov	qword [rbp - 3392], rcx
	mov	rcx, qword [rbp - 3336]
	sub	rcx, qword [rbp - 3392]
	mov	qword [rbp - 3328], rcx
	mov	rcx, qword [rbp - 3200]
	add	rcx, qword [rbp - 3328]
	mov	qword [rbp - 3192], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3480], rcx
	mov	rcx, qword [rbp - 3480]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3472], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3488], rcx
	mov	rcx, qword [rbp - 3472]
	sub	rcx, qword [rbp - 3488]
	mov	qword [rbp - 3464], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3504], rcx
	mov	rcx, qword [rbp - 3504]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3496], rcx
	mov	rcx, qword [rbp - 3464]
	add	rcx, qword [rbp - 3496]
	mov	qword [rbp - 3456], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3528], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3544], rcx
	mov	rcx, qword [rbp - 3544]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3536], rcx
	mov	rcx, qword [rbp - 3528]
	add	rcx, qword [rbp - 3536]
	mov	qword [rbp - 3520], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3552], rcx
	mov	rcx, qword [rbp - 3520]
	sub	rcx, qword [rbp - 3552]
	mov	qword [rbp - 3512], rcx
	mov	rcx, qword [rbp - 3456]
	sub	rcx, qword [rbp - 3512]
	mov	qword [rbp - 3448], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3592], rcx
	mov	rcx, qword [rbp - 3592]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3584], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3600], rcx
	mov	rcx, qword [rbp - 3584]
	sub	rcx, qword [rbp - 3600]
	mov	qword [rbp - 3576], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3616], rcx
	mov	rcx, qword [rbp - 3616]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3608], rcx
	mov	rcx, qword [rbp - 3576]
	add	rcx, qword [rbp - 3608]
	mov	qword [rbp - 3568], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3640], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3656], rcx
	mov	rcx, qword [rbp - 3656]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3648], rcx
	mov	rcx, qword [rbp - 3640]
	add	rcx, qword [rbp - 3648]
	mov	qword [rbp - 3632], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3664], rcx
	mov	rcx, qword [rbp - 3632]
	sub	rcx, qword [rbp - 3664]
	mov	qword [rbp - 3624], rcx
	mov	rcx, qword [rbp - 3568]
	sub	rcx, qword [rbp - 3624]
	mov	qword [rbp - 3560], rcx
	mov	rcx, qword [rbp - 3448]
	add	rcx, qword [rbp - 3560]
	mov	qword [rbp - 3440], rcx
	mov	rcx, qword [rbp - 3192]
	add	rcx, qword [rbp - 3440]
	mov	qword [rbp - 3184], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3720], rcx
	mov	rcx, qword [rbp - 3720]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3712], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3728], rcx
	mov	rcx, qword [rbp - 3712]
	sub	rcx, qword [rbp - 3728]
	mov	qword [rbp - 3704], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3752], rcx
	mov	rcx, qword [rbp - 3752]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3744], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3760], rcx
	mov	rcx, qword [rbp - 3744]
	sub	rcx, qword [rbp - 3760]
	mov	qword [rbp - 3736], rcx
	mov	rcx, qword [rbp - 3704]
	add	rcx, qword [rbp - 3736]
	mov	qword [rbp - 3696], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3792], rcx
	mov	rcx, qword [rbp - 3792]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3784], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3800], rcx
	mov	rcx, qword [rbp - 3784]
	sub	rcx, qword [rbp - 3800]
	mov	qword [rbp - 3776], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3816], rcx
	mov	rcx, qword [rbp - 3816]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3808], rcx
	mov	rcx, qword [rbp - 3776]
	add	rcx, qword [rbp - 3808]
	mov	qword [rbp - 3768], rcx
	mov	rcx, qword [rbp - 3696]
	add	rcx, qword [rbp - 3768]
	mov	qword [rbp - 3688], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3848], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3864], rcx
	mov	rcx, qword [rbp - 3864]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3856], rcx
	mov	rcx, qword [rbp - 3848]
	add	rcx, qword [rbp - 3856]
	mov	qword [rbp - 3840], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3872], rcx
	mov	rcx, qword [rbp - 3840]
	sub	rcx, qword [rbp - 3872]
	mov	qword [rbp - 3832], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3904], rcx
	mov	rcx, qword [rbp - 3904]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3896], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3912], rcx
	mov	rcx, qword [rbp - 3896]
	sub	rcx, qword [rbp - 3912]
	mov	qword [rbp - 3888], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3928], rcx
	mov	rcx, qword [rbp - 3928]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3920], rcx
	mov	rcx, qword [rbp - 3888]
	add	rcx, qword [rbp - 3920]
	mov	qword [rbp - 3880], rcx
	mov	rcx, qword [rbp - 3832]
	add	rcx, qword [rbp - 3880]
	mov	qword [rbp - 3824], rcx
	mov	rcx, qword [rbp - 3688]
	sub	rcx, qword [rbp - 3824]
	mov	qword [rbp - 3680], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3968], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 3984], rcx
	mov	rcx, qword [rbp - 3984]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3976], rcx
	mov	rcx, qword [rbp - 3968]
	add	rcx, qword [rbp - 3976]
	mov	qword [rbp - 3960], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 3992], rcx
	mov	rcx, qword [rbp - 3960]
	sub	rcx, qword [rbp - 3992]
	mov	qword [rbp - 3952], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4024], rcx
	mov	rcx, qword [rbp - 4024]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4016], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4032], rcx
	mov	rcx, qword [rbp - 4016]
	sub	rcx, qword [rbp - 4032]
	mov	qword [rbp - 4008], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4048], rcx
	mov	rcx, qword [rbp - 4048]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4040], rcx
	mov	rcx, qword [rbp - 4008]
	add	rcx, qword [rbp - 4040]
	mov	qword [rbp - 4000], rcx
	mov	rcx, qword [rbp - 3952]
	add	rcx, qword [rbp - 4000]
	mov	qword [rbp - 3944], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4080], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4096], rcx
	mov	rcx, qword [rbp - 4096]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4088], rcx
	mov	rcx, qword [rbp - 4080]
	add	rcx, qword [rbp - 4088]
	mov	qword [rbp - 4072], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4104], rcx
	mov	rcx, qword [rbp - 4072]
	sub	rcx, qword [rbp - 4104]
	mov	qword [rbp - 4064], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4136], rcx
	mov	rcx, qword [rbp - 4136]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4128], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4144], rcx
	mov	rcx, qword [rbp - 4128]
	sub	rcx, qword [rbp - 4144]
	mov	qword [rbp - 4120], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4160], rcx
	mov	rcx, qword [rbp - 4160]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4152], rcx
	mov	rcx, qword [rbp - 4120]
	add	rcx, qword [rbp - 4152]
	mov	qword [rbp - 4112], rcx
	mov	rcx, qword [rbp - 4064]
	add	rcx, qword [rbp - 4112]
	mov	qword [rbp - 4056], rcx
	mov	rcx, qword [rbp - 3944]
	sub	rcx, qword [rbp - 4056]
	mov	qword [rbp - 3936], rcx
	mov	rcx, qword [rbp - 3680]
	sub	rcx, qword [rbp - 3936]
	mov	qword [rbp - 3672], rcx
	mov	rcx, qword [rbp - 3184]
	add	rcx, qword [rbp - 3672]
	mov	qword [rbp - 3176], rcx
	mov	rcx, qword [rbp - 2160]
	sub	rcx, qword [rbp - 3176]
	mov	qword [rbp - 2152], rcx
	mov	rcx, qword [rbp - 2152]
	mov	qword [rbp - 16], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4232], rcx
	mov	rcx, qword [rbp - 4232]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4224], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4240], rcx
	mov	rcx, qword [rbp - 4224]
	sub	rcx, qword [rbp - 4240]
	mov	qword [rbp - 4216], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4264], rcx
	mov	rcx, qword [rbp - 4264]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4256], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4272], rcx
	mov	rcx, qword [rbp - 4256]
	sub	rcx, qword [rbp - 4272]
	mov	qword [rbp - 4248], rcx
	mov	rcx, qword [rbp - 4216]
	add	rcx, qword [rbp - 4248]
	mov	qword [rbp - 4208], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4304], rcx
	mov	rcx, qword [rbp - 4304]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4296], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4312], rcx
	mov	rcx, qword [rbp - 4296]
	sub	rcx, qword [rbp - 4312]
	mov	qword [rbp - 4288], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4328], rcx
	mov	rcx, qword [rbp - 4328]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4320], rcx
	mov	rcx, qword [rbp - 4288]
	add	rcx, qword [rbp - 4320]
	mov	qword [rbp - 4280], rcx
	mov	rcx, qword [rbp - 4208]
	add	rcx, qword [rbp - 4280]
	mov	qword [rbp - 4200], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4360], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4376], rcx
	mov	rcx, qword [rbp - 4376]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4368], rcx
	mov	rcx, qword [rbp - 4360]
	add	rcx, qword [rbp - 4368]
	mov	qword [rbp - 4352], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4384], rcx
	mov	rcx, qword [rbp - 4352]
	sub	rcx, qword [rbp - 4384]
	mov	qword [rbp - 4344], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4416], rcx
	mov	rcx, qword [rbp - 4416]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4408], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4424], rcx
	mov	rcx, qword [rbp - 4408]
	sub	rcx, qword [rbp - 4424]
	mov	qword [rbp - 4400], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4440], rcx
	mov	rcx, qword [rbp - 4440]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4432], rcx
	mov	rcx, qword [rbp - 4400]
	add	rcx, qword [rbp - 4432]
	mov	qword [rbp - 4392], rcx
	mov	rcx, qword [rbp - 4344]
	add	rcx, qword [rbp - 4392]
	mov	qword [rbp - 4336], rcx
	mov	rcx, qword [rbp - 4200]
	sub	rcx, qword [rbp - 4336]
	mov	qword [rbp - 4192], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4480], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4496], rcx
	mov	rcx, qword [rbp - 4496]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4488], rcx
	mov	rcx, qword [rbp - 4480]
	add	rcx, qword [rbp - 4488]
	mov	qword [rbp - 4472], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4512], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4528], rcx
	mov	rcx, qword [rbp - 4528]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4520], rcx
	mov	rcx, qword [rbp - 4512]
	add	rcx, qword [rbp - 4520]
	mov	qword [rbp - 4504], rcx
	mov	rcx, qword [rbp - 4472]
	sub	rcx, qword [rbp - 4504]
	mov	qword [rbp - 4464], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4552], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4568], rcx
	mov	rcx, qword [rbp - 4568]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4560], rcx
	mov	rcx, qword [rbp - 4552]
	add	rcx, qword [rbp - 4560]
	mov	qword [rbp - 4544], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4576], rcx
	mov	rcx, qword [rbp - 4544]
	sub	rcx, qword [rbp - 4576]
	mov	qword [rbp - 4536], rcx
	mov	rcx, qword [rbp - 4464]
	sub	rcx, qword [rbp - 4536]
	mov	qword [rbp - 4456], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4616], rcx
	mov	rcx, qword [rbp - 4616]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4608], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4624], rcx
	mov	rcx, qword [rbp - 4608]
	sub	rcx, qword [rbp - 4624]
	mov	qword [rbp - 4600], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4640], rcx
	mov	rcx, qword [rbp - 4640]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4632], rcx
	mov	rcx, qword [rbp - 4600]
	add	rcx, qword [rbp - 4632]
	mov	qword [rbp - 4592], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4664], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4680], rcx
	mov	rcx, qword [rbp - 4680]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4672], rcx
	mov	rcx, qword [rbp - 4664]
	add	rcx, qword [rbp - 4672]
	mov	qword [rbp - 4656], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4688], rcx
	mov	rcx, qword [rbp - 4656]
	sub	rcx, qword [rbp - 4688]
	mov	qword [rbp - 4648], rcx
	mov	rcx, qword [rbp - 4592]
	sub	rcx, qword [rbp - 4648]
	mov	qword [rbp - 4584], rcx
	mov	rcx, qword [rbp - 4456]
	add	rcx, qword [rbp - 4584]
	mov	qword [rbp - 4448], rcx
	mov	rcx, qword [rbp - 4192]
	sub	rcx, qword [rbp - 4448]
	mov	qword [rbp - 4184], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4744], rcx
	mov	rcx, qword [rbp - 4744]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4736], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4752], rcx
	mov	rcx, qword [rbp - 4736]
	sub	rcx, qword [rbp - 4752]
	mov	qword [rbp - 4728], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4776], rcx
	mov	rcx, qword [rbp - 4776]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4768], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4784], rcx
	mov	rcx, qword [rbp - 4768]
	sub	rcx, qword [rbp - 4784]
	mov	qword [rbp - 4760], rcx
	mov	rcx, qword [rbp - 4728]
	add	rcx, qword [rbp - 4760]
	mov	qword [rbp - 4720], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4816], rcx
	mov	rcx, qword [rbp - 4816]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4808], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4824], rcx
	mov	rcx, qword [rbp - 4808]
	sub	rcx, qword [rbp - 4824]
	mov	qword [rbp - 4800], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4840], rcx
	mov	rcx, qword [rbp - 4840]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4832], rcx
	mov	rcx, qword [rbp - 4800]
	add	rcx, qword [rbp - 4832]
	mov	qword [rbp - 4792], rcx
	mov	rcx, qword [rbp - 4720]
	add	rcx, qword [rbp - 4792]
	mov	qword [rbp - 4712], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4872], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4888], rcx
	mov	rcx, qword [rbp - 4888]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4880], rcx
	mov	rcx, qword [rbp - 4872]
	add	rcx, qword [rbp - 4880]
	mov	qword [rbp - 4864], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4896], rcx
	mov	rcx, qword [rbp - 4864]
	sub	rcx, qword [rbp - 4896]
	mov	qword [rbp - 4856], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4928], rcx
	mov	rcx, qword [rbp - 4928]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4920], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4936], rcx
	mov	rcx, qword [rbp - 4920]
	sub	rcx, qword [rbp - 4936]
	mov	qword [rbp - 4912], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 4952], rcx
	mov	rcx, qword [rbp - 4952]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4944], rcx
	mov	rcx, qword [rbp - 4912]
	add	rcx, qword [rbp - 4944]
	mov	qword [rbp - 4904], rcx
	mov	rcx, qword [rbp - 4856]
	add	rcx, qword [rbp - 4904]
	mov	qword [rbp - 4848], rcx
	mov	rcx, qword [rbp - 4712]
	sub	rcx, qword [rbp - 4848]
	mov	qword [rbp - 4704], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 4992], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5008], rcx
	mov	rcx, qword [rbp - 5008]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5000], rcx
	mov	rcx, qword [rbp - 4992]
	add	rcx, qword [rbp - 5000]
	mov	qword [rbp - 4984], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5016], rcx
	mov	rcx, qword [rbp - 4984]
	sub	rcx, qword [rbp - 5016]
	mov	qword [rbp - 4976], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5048], rcx
	mov	rcx, qword [rbp - 5048]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5040], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5056], rcx
	mov	rcx, qword [rbp - 5040]
	sub	rcx, qword [rbp - 5056]
	mov	qword [rbp - 5032], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5072], rcx
	mov	rcx, qword [rbp - 5072]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5064], rcx
	mov	rcx, qword [rbp - 5032]
	add	rcx, qword [rbp - 5064]
	mov	qword [rbp - 5024], rcx
	mov	rcx, qword [rbp - 4976]
	add	rcx, qword [rbp - 5024]
	mov	qword [rbp - 4968], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5104], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5120], rcx
	mov	rcx, qword [rbp - 5120]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5112], rcx
	mov	rcx, qword [rbp - 5104]
	add	rcx, qword [rbp - 5112]
	mov	qword [rbp - 5096], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5128], rcx
	mov	rcx, qword [rbp - 5096]
	sub	rcx, qword [rbp - 5128]
	mov	qword [rbp - 5088], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5160], rcx
	mov	rcx, qword [rbp - 5160]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5152], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5168], rcx
	mov	rcx, qword [rbp - 5152]
	sub	rcx, qword [rbp - 5168]
	mov	qword [rbp - 5144], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5184], rcx
	mov	rcx, qword [rbp - 5184]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5176], rcx
	mov	rcx, qword [rbp - 5144]
	add	rcx, qword [rbp - 5176]
	mov	qword [rbp - 5136], rcx
	mov	rcx, qword [rbp - 5088]
	add	rcx, qword [rbp - 5136]
	mov	qword [rbp - 5080], rcx
	mov	rcx, qword [rbp - 4968]
	sub	rcx, qword [rbp - 5080]
	mov	qword [rbp - 4960], rcx
	mov	rcx, qword [rbp - 4704]
	sub	rcx, qword [rbp - 4960]
	mov	qword [rbp - 4696], rcx
	mov	rcx, qword [rbp - 4184]
	add	rcx, qword [rbp - 4696]
	mov	qword [rbp - 4176], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5240], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5256], rcx
	mov	rcx, qword [rbp - 5256]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5248], rcx
	mov	rcx, qword [rbp - 5240]
	add	rcx, qword [rbp - 5248]
	mov	qword [rbp - 5232], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5272], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5288], rcx
	mov	rcx, qword [rbp - 5288]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5280], rcx
	mov	rcx, qword [rbp - 5272]
	add	rcx, qword [rbp - 5280]
	mov	qword [rbp - 5264], rcx
	mov	rcx, qword [rbp - 5232]
	sub	rcx, qword [rbp - 5264]
	mov	qword [rbp - 5224], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5312], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5328], rcx
	mov	rcx, qword [rbp - 5328]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5320], rcx
	mov	rcx, qword [rbp - 5312]
	add	rcx, qword [rbp - 5320]
	mov	qword [rbp - 5304], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5336], rcx
	mov	rcx, qword [rbp - 5304]
	sub	rcx, qword [rbp - 5336]
	mov	qword [rbp - 5296], rcx
	mov	rcx, qword [rbp - 5224]
	sub	rcx, qword [rbp - 5296]
	mov	qword [rbp - 5216], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5376], rcx
	mov	rcx, qword [rbp - 5376]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5368], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5384], rcx
	mov	rcx, qword [rbp - 5368]
	sub	rcx, qword [rbp - 5384]
	mov	qword [rbp - 5360], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5400], rcx
	mov	rcx, qword [rbp - 5400]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5392], rcx
	mov	rcx, qword [rbp - 5360]
	add	rcx, qword [rbp - 5392]
	mov	qword [rbp - 5352], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5424], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5440], rcx
	mov	rcx, qword [rbp - 5440]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5432], rcx
	mov	rcx, qword [rbp - 5424]
	add	rcx, qword [rbp - 5432]
	mov	qword [rbp - 5416], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5448], rcx
	mov	rcx, qword [rbp - 5416]
	sub	rcx, qword [rbp - 5448]
	mov	qword [rbp - 5408], rcx
	mov	rcx, qword [rbp - 5352]
	sub	rcx, qword [rbp - 5408]
	mov	qword [rbp - 5344], rcx
	mov	rcx, qword [rbp - 5216]
	add	rcx, qword [rbp - 5344]
	mov	qword [rbp - 5208], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5496], rcx
	mov	rcx, qword [rbp - 5496]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5488], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5504], rcx
	mov	rcx, qword [rbp - 5488]
	sub	rcx, qword [rbp - 5504]
	mov	qword [rbp - 5480], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5520], rcx
	mov	rcx, qword [rbp - 5520]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5512], rcx
	mov	rcx, qword [rbp - 5480]
	add	rcx, qword [rbp - 5512]
	mov	qword [rbp - 5472], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5544], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5560], rcx
	mov	rcx, qword [rbp - 5560]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5552], rcx
	mov	rcx, qword [rbp - 5544]
	add	rcx, qword [rbp - 5552]
	mov	qword [rbp - 5536], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5568], rcx
	mov	rcx, qword [rbp - 5536]
	sub	rcx, qword [rbp - 5568]
	mov	qword [rbp - 5528], rcx
	mov	rcx, qword [rbp - 5472]
	sub	rcx, qword [rbp - 5528]
	mov	qword [rbp - 5464], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5608], rcx
	mov	rcx, qword [rbp - 5608]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5600], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5616], rcx
	mov	rcx, qword [rbp - 5600]
	sub	rcx, qword [rbp - 5616]
	mov	qword [rbp - 5592], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5632], rcx
	mov	rcx, qword [rbp - 5632]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5624], rcx
	mov	rcx, qword [rbp - 5592]
	add	rcx, qword [rbp - 5624]
	mov	qword [rbp - 5584], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5656], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5672], rcx
	mov	rcx, qword [rbp - 5672]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5664], rcx
	mov	rcx, qword [rbp - 5656]
	add	rcx, qword [rbp - 5664]
	mov	qword [rbp - 5648], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5680], rcx
	mov	rcx, qword [rbp - 5648]
	sub	rcx, qword [rbp - 5680]
	mov	qword [rbp - 5640], rcx
	mov	rcx, qword [rbp - 5584]
	sub	rcx, qword [rbp - 5640]
	mov	qword [rbp - 5576], rcx
	mov	rcx, qword [rbp - 5464]
	add	rcx, qword [rbp - 5576]
	mov	qword [rbp - 5456], rcx
	mov	rcx, qword [rbp - 5208]
	add	rcx, qword [rbp - 5456]
	mov	qword [rbp - 5200], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5736], rcx
	mov	rcx, qword [rbp - 5736]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5728], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5744], rcx
	mov	rcx, qword [rbp - 5728]
	sub	rcx, qword [rbp - 5744]
	mov	qword [rbp - 5720], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5768], rcx
	mov	rcx, qword [rbp - 5768]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5760], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5776], rcx
	mov	rcx, qword [rbp - 5760]
	sub	rcx, qword [rbp - 5776]
	mov	qword [rbp - 5752], rcx
	mov	rcx, qword [rbp - 5720]
	add	rcx, qword [rbp - 5752]
	mov	qword [rbp - 5712], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5808], rcx
	mov	rcx, qword [rbp - 5808]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5800], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5816], rcx
	mov	rcx, qword [rbp - 5800]
	sub	rcx, qword [rbp - 5816]
	mov	qword [rbp - 5792], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5832], rcx
	mov	rcx, qword [rbp - 5832]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5824], rcx
	mov	rcx, qword [rbp - 5792]
	add	rcx, qword [rbp - 5824]
	mov	qword [rbp - 5784], rcx
	mov	rcx, qword [rbp - 5712]
	add	rcx, qword [rbp - 5784]
	mov	qword [rbp - 5704], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5864], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5880], rcx
	mov	rcx, qword [rbp - 5880]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5872], rcx
	mov	rcx, qword [rbp - 5864]
	add	rcx, qword [rbp - 5872]
	mov	qword [rbp - 5856], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5888], rcx
	mov	rcx, qword [rbp - 5856]
	sub	rcx, qword [rbp - 5888]
	mov	qword [rbp - 5848], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5920], rcx
	mov	rcx, qword [rbp - 5920]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5912], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5928], rcx
	mov	rcx, qword [rbp - 5912]
	sub	rcx, qword [rbp - 5928]
	mov	qword [rbp - 5904], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 5944], rcx
	mov	rcx, qword [rbp - 5944]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5936], rcx
	mov	rcx, qword [rbp - 5904]
	add	rcx, qword [rbp - 5936]
	mov	qword [rbp - 5896], rcx
	mov	rcx, qword [rbp - 5848]
	add	rcx, qword [rbp - 5896]
	mov	qword [rbp - 5840], rcx
	mov	rcx, qword [rbp - 5704]
	sub	rcx, qword [rbp - 5840]
	mov	qword [rbp - 5696], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5984], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 6000], rcx
	mov	rcx, qword [rbp - 6000]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 5992], rcx
	mov	rcx, qword [rbp - 5984]
	add	rcx, qword [rbp - 5992]
	mov	qword [rbp - 5976], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6008], rcx
	mov	rcx, qword [rbp - 5976]
	sub	rcx, qword [rbp - 6008]
	mov	qword [rbp - 5968], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 6040], rcx
	mov	rcx, qword [rbp - 6040]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6032], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6048], rcx
	mov	rcx, qword [rbp - 6032]
	sub	rcx, qword [rbp - 6048]
	mov	qword [rbp - 6024], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 6064], rcx
	mov	rcx, qword [rbp - 6064]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6056], rcx
	mov	rcx, qword [rbp - 6024]
	add	rcx, qword [rbp - 6056]
	mov	qword [rbp - 6016], rcx
	mov	rcx, qword [rbp - 5968]
	add	rcx, qword [rbp - 6016]
	mov	qword [rbp - 5960], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6096], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 6112], rcx
	mov	rcx, qword [rbp - 6112]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6104], rcx
	mov	rcx, qword [rbp - 6096]
	add	rcx, qword [rbp - 6104]
	mov	qword [rbp - 6088], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6120], rcx
	mov	rcx, qword [rbp - 6088]
	sub	rcx, qword [rbp - 6120]
	mov	qword [rbp - 6080], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 6152], rcx
	mov	rcx, qword [rbp - 6152]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6144], rcx
	mov	rcx, qword [rbp - 8]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6160], rcx
	mov	rcx, qword [rbp - 6144]
	sub	rcx, qword [rbp - 6160]
	mov	qword [rbp - 6136], rcx
	mov	rcx, qword [rbp - 24]
	sub	rcx, qword [rbp - 8]
	mov	qword [rbp - 6176], rcx
	mov	rcx, qword [rbp - 6176]
	add	rcx, qword [rbp - 16]
	mov	qword [rbp - 6168], rcx
	mov	rcx, qword [rbp - 6136]
	add	rcx, qword [rbp - 6168]
	mov	qword [rbp - 6128], rcx
	mov	rcx, qword [rbp - 6080]
	add	rcx, qword [rbp - 6128]
	mov	qword [rbp - 6072], rcx
	mov	rcx, qword [rbp - 5960]
	sub	rcx, qword [rbp - 6072]
	mov	qword [rbp - 5952], rcx
	mov	rcx, qword [rbp - 5696]
	sub	rcx, qword [rbp - 5952]
	mov	qword [rbp - 5688], rcx
	mov	rcx, qword [rbp - 5200]
	add	rcx, qword [rbp - 5688]
	mov	qword [rbp - 5192], rcx
	mov	rcx, qword [rbp - 4176]
	sub	rcx, qword [rbp - 5192]
	mov	qword [rbp - 4168], rcx
	mov	rcx, qword [rbp - 4168]
	mov	qword [rbp - 24], rcx
	jmp	Label_8
Label_6:
	mov	ecx, 1000
	mov	eax, dword [rbp - 32]
	cdq
	idiv	ecx
	mov	dword [rbp - 6192], edx
	mov	rax, qword [rbp - 6192]
	cmp	rax, 0
	je	Label_12
	jmp	Label_13
Label_12:
	mov	rdi, qword [rbp - 8]
	call	toString
	mov	qword [rbp - 6264], rax
	mov	rdi, qword [rbp - 6264]
	mov	rsi, str__0
	call	string.add
	mov	qword [rbp - 6256], rax
	mov	rdi, qword [rbp - 16]
	call	toString
	mov	qword [rbp - 6272], rax
	mov	rdi, qword [rbp - 6256]
	mov	rsi, qword [rbp - 6272]
	call	string.add
	mov	qword [rbp - 6240], rax
	mov	rdi, qword [rbp - 6240]
	mov	rsi, str__1
	call	string.add
	mov	qword [rbp - 6224], rax
	mov	rdi, qword [rbp - 24]
	call	toString
	mov	qword [rbp - 6280], rax
	mov	rdi, qword [rbp - 6224]
	mov	rsi, qword [rbp - 6280]
	call	string.add
	mov	qword [rbp - 6208], rax
	mov	rdi, qword [rbp - 6208]
	call	println
	mov	qword [rbp - 6288], rax
	jmp	Label_13
Label_13:
	mov	rcx, qword [rbp - 32]
	add	rcx, 1
	mov	qword [rbp - 32], rcx
	jmp	Label_4
Label_2:
	mov	rax, 0
	jmp	Label_0
Label_0:
	add	rsp, 6288
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
