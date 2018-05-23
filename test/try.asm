global main

extern puts
extern __stack_chk_fail
extern malloc
extern __isoc99_scanf
section .data
	dq	1
str__0:
	db	32, 0
	dq	1
str__1:
	db	32, 0
A:
	dq	0
B:
	dq	0
C:
	dq	0
section .text
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 6240
	mov	rax, 1
	mov	qword [ A ], rax
	mov	rax, 1
	mov	qword [ B ], rax
	mov	rax, 1
	mov	qword [ C ], rax
Label_4:
	mov	rax, 1
	mov	rcx, 29
	shl	rax, cl
	mov	qword [rbp - 24], rax
	mov	rcx, qword [ C ]
	cmp	rcx, qword [rbp - 24]
	setl	cl
	movzx	rcx, cl
	mov	qword [rbp - 16], rcx
	cmp	qword [rbp - 16], 1
	je	Label_5
	mov	rax, 0
	mov	qword [rbp - 8], rax
	jmp	Label_6
Label_5:
	mov	rax, 1
	mov	rcx, 29
	shl	rax, cl
	mov	qword [rbp - 40], rax
	mov	rax, qword [rbp - 40]
	mov	qword [rbp - 48], rax
	neg	qword [rbp - 48]
	mov	rcx, qword [ C ]
	cmp	rcx, qword [rbp - 48]
	setg	cl
	movzx	rcx, cl
	mov	qword [rbp - 32], rcx
	mov	rax, qword [rbp - 32]
	mov	qword [rbp - 8], rax
Label_6:
	cmp	qword [rbp - 8], 1
	je	Label_3
	jmp	Label_2
Label_3:
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 120], rdx
	mov	rdx, qword [rbp - 120]
	add	rdx, qword [ B ]
	mov	qword [rbp - 112], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 128], rdx
	mov	rdx, qword [rbp - 112]
	sub	rdx, qword [rbp - 128]
	mov	qword [rbp - 104], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 152], rdx
	mov	rdx, qword [rbp - 152]
	add	rdx, qword [ B ]
	mov	qword [rbp - 144], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 160], rdx
	mov	rdx, qword [rbp - 144]
	sub	rdx, qword [rbp - 160]
	mov	qword [rbp - 136], rdx
	mov	rdx, qword [rbp - 104]
	add	rdx, qword [rbp - 136]
	mov	qword [rbp - 96], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 192], rdx
	mov	rdx, qword [rbp - 192]
	add	rdx, qword [ B ]
	mov	qword [rbp - 184], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 200], rdx
	mov	rdx, qword [rbp - 184]
	sub	rdx, qword [rbp - 200]
	mov	qword [rbp - 176], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 216], rdx
	mov	rdx, qword [rbp - 216]
	add	rdx, qword [ B ]
	mov	qword [rbp - 208], rdx
	mov	rdx, qword [rbp - 176]
	add	rdx, qword [rbp - 208]
	mov	qword [rbp - 168], rdx
	mov	rdx, qword [rbp - 96]
	add	rdx, qword [rbp - 168]
	mov	qword [rbp - 88], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 248], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 264], rdx
	mov	rdx, qword [rbp - 264]
	add	rdx, qword [ B ]
	mov	qword [rbp - 256], rdx
	mov	rdx, qword [rbp - 248]
	add	rdx, qword [rbp - 256]
	mov	qword [rbp - 240], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 272], rdx
	mov	rdx, qword [rbp - 240]
	sub	rdx, qword [rbp - 272]
	mov	qword [rbp - 232], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 304], rdx
	mov	rdx, qword [rbp - 304]
	add	rdx, qword [ B ]
	mov	qword [rbp - 296], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 312], rdx
	mov	rdx, qword [rbp - 296]
	sub	rdx, qword [rbp - 312]
	mov	qword [rbp - 288], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 328], rdx
	mov	rdx, qword [rbp - 328]
	add	rdx, qword [ B ]
	mov	qword [rbp - 320], rdx
	mov	rdx, qword [rbp - 288]
	add	rdx, qword [rbp - 320]
	mov	qword [rbp - 280], rdx
	mov	rdx, qword [rbp - 232]
	add	rdx, qword [rbp - 280]
	mov	qword [rbp - 224], rdx
	mov	rdx, qword [rbp - 88]
	sub	rdx, qword [rbp - 224]
	mov	qword [rbp - 80], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 368], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 384], rdx
	mov	rdx, qword [rbp - 384]
	add	rdx, qword [ B ]
	mov	qword [rbp - 376], rdx
	mov	rdx, qword [rbp - 368]
	add	rdx, qword [rbp - 376]
	mov	qword [rbp - 360], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 400], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 416], rdx
	mov	rdx, qword [rbp - 416]
	add	rdx, qword [ B ]
	mov	qword [rbp - 408], rdx
	mov	rdx, qword [rbp - 400]
	add	rdx, qword [rbp - 408]
	mov	qword [rbp - 392], rdx
	mov	rdx, qword [rbp - 360]
	sub	rdx, qword [rbp - 392]
	mov	qword [rbp - 352], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 440], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 456], rdx
	mov	rdx, qword [rbp - 456]
	add	rdx, qword [ B ]
	mov	qword [rbp - 448], rdx
	mov	rdx, qword [rbp - 440]
	add	rdx, qword [rbp - 448]
	mov	qword [rbp - 432], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 464], rdx
	mov	rdx, qword [rbp - 432]
	sub	rdx, qword [rbp - 464]
	mov	qword [rbp - 424], rdx
	mov	rdx, qword [rbp - 352]
	sub	rdx, qword [rbp - 424]
	mov	qword [rbp - 344], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 504], rdx
	mov	rdx, qword [rbp - 504]
	add	rdx, qword [ B ]
	mov	qword [rbp - 496], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 512], rdx
	mov	rdx, qword [rbp - 496]
	sub	rdx, qword [rbp - 512]
	mov	qword [rbp - 488], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 528], rdx
	mov	rdx, qword [rbp - 528]
	add	rdx, qword [ B ]
	mov	qword [rbp - 520], rdx
	mov	rdx, qword [rbp - 488]
	add	rdx, qword [rbp - 520]
	mov	qword [rbp - 480], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 552], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 568], rdx
	mov	rdx, qword [rbp - 568]
	add	rdx, qword [ B ]
	mov	qword [rbp - 560], rdx
	mov	rdx, qword [rbp - 552]
	add	rdx, qword [rbp - 560]
	mov	qword [rbp - 544], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 576], rdx
	mov	rdx, qword [rbp - 544]
	sub	rdx, qword [rbp - 576]
	mov	qword [rbp - 536], rdx
	mov	rdx, qword [rbp - 480]
	sub	rdx, qword [rbp - 536]
	mov	qword [rbp - 472], rdx
	mov	rdx, qword [rbp - 344]
	add	rdx, qword [rbp - 472]
	mov	qword [rbp - 336], rdx
	mov	rdx, qword [rbp - 80]
	sub	rdx, qword [rbp - 336]
	mov	qword [rbp - 72], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 632], rdx
	mov	rdx, qword [rbp - 632]
	add	rdx, qword [ B ]
	mov	qword [rbp - 624], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 640], rdx
	mov	rdx, qword [rbp - 624]
	sub	rdx, qword [rbp - 640]
	mov	qword [rbp - 616], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 664], rdx
	mov	rdx, qword [rbp - 664]
	add	rdx, qword [ B ]
	mov	qword [rbp - 656], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 672], rdx
	mov	rdx, qword [rbp - 656]
	sub	rdx, qword [rbp - 672]
	mov	qword [rbp - 648], rdx
	mov	rdx, qword [rbp - 616]
	add	rdx, qword [rbp - 648]
	mov	qword [rbp - 608], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 704], rdx
	mov	rdx, qword [rbp - 704]
	add	rdx, qword [ B ]
	mov	qword [rbp - 696], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 712], rdx
	mov	rdx, qword [rbp - 696]
	sub	rdx, qword [rbp - 712]
	mov	qword [rbp - 688], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 728], rdx
	mov	rdx, qword [rbp - 728]
	add	rdx, qword [ B ]
	mov	qword [rbp - 720], rdx
	mov	rdx, qword [rbp - 688]
	add	rdx, qword [rbp - 720]
	mov	qword [rbp - 680], rdx
	mov	rdx, qword [rbp - 608]
	add	rdx, qword [rbp - 680]
	mov	qword [rbp - 600], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 760], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 776], rdx
	mov	rdx, qword [rbp - 776]
	add	rdx, qword [ B ]
	mov	qword [rbp - 768], rdx
	mov	rdx, qword [rbp - 760]
	add	rdx, qword [rbp - 768]
	mov	qword [rbp - 752], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 784], rdx
	mov	rdx, qword [rbp - 752]
	sub	rdx, qword [rbp - 784]
	mov	qword [rbp - 744], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 816], rdx
	mov	rdx, qword [rbp - 816]
	add	rdx, qword [ B ]
	mov	qword [rbp - 808], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 824], rdx
	mov	rdx, qword [rbp - 808]
	sub	rdx, qword [rbp - 824]
	mov	qword [rbp - 800], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 840], rdx
	mov	rdx, qword [rbp - 840]
	add	rdx, qword [ B ]
	mov	qword [rbp - 832], rdx
	mov	rdx, qword [rbp - 800]
	add	rdx, qword [rbp - 832]
	mov	qword [rbp - 792], rdx
	mov	rdx, qword [rbp - 744]
	add	rdx, qword [rbp - 792]
	mov	qword [rbp - 736], rdx
	mov	rdx, qword [rbp - 600]
	sub	rdx, qword [rbp - 736]
	mov	qword [rbp - 592], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 880], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 896], rdx
	mov	rdx, qword [rbp - 896]
	add	rdx, qword [ B ]
	mov	qword [rbp - 888], rdx
	mov	rdx, qword [rbp - 880]
	add	rdx, qword [rbp - 888]
	mov	qword [rbp - 872], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 904], rdx
	mov	rdx, qword [rbp - 872]
	sub	rdx, qword [rbp - 904]
	mov	qword [rbp - 864], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 936], rdx
	mov	rdx, qword [rbp - 936]
	add	rdx, qword [ B ]
	mov	qword [rbp - 928], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 944], rdx
	mov	rdx, qword [rbp - 928]
	sub	rdx, qword [rbp - 944]
	mov	qword [rbp - 920], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 960], rdx
	mov	rdx, qword [rbp - 960]
	add	rdx, qword [ B ]
	mov	qword [rbp - 952], rdx
	mov	rdx, qword [rbp - 920]
	add	rdx, qword [rbp - 952]
	mov	qword [rbp - 912], rdx
	mov	rdx, qword [rbp - 864]
	add	rdx, qword [rbp - 912]
	mov	qword [rbp - 856], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 992], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1008], rdx
	mov	rdx, qword [rbp - 1008]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1000], rdx
	mov	rdx, qword [rbp - 992]
	add	rdx, qword [rbp - 1000]
	mov	qword [rbp - 984], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1016], rdx
	mov	rdx, qword [rbp - 984]
	sub	rdx, qword [rbp - 1016]
	mov	qword [rbp - 976], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1048], rdx
	mov	rdx, qword [rbp - 1048]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1040], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1056], rdx
	mov	rdx, qword [rbp - 1040]
	sub	rdx, qword [rbp - 1056]
	mov	qword [rbp - 1032], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1072], rdx
	mov	rdx, qword [rbp - 1072]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1064], rdx
	mov	rdx, qword [rbp - 1032]
	add	rdx, qword [rbp - 1064]
	mov	qword [rbp - 1024], rdx
	mov	rdx, qword [rbp - 976]
	add	rdx, qword [rbp - 1024]
	mov	qword [rbp - 968], rdx
	mov	rdx, qword [rbp - 856]
	sub	rdx, qword [rbp - 968]
	mov	qword [rbp - 848], rdx
	mov	rdx, qword [rbp - 592]
	sub	rdx, qword [rbp - 848]
	mov	qword [rbp - 584], rdx
	mov	rdx, qword [rbp - 72]
	add	rdx, qword [rbp - 584]
	mov	qword [rbp - 64], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1128], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1144], rdx
	mov	rdx, qword [rbp - 1144]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1136], rdx
	mov	rdx, qword [rbp - 1128]
	add	rdx, qword [rbp - 1136]
	mov	qword [rbp - 1120], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1160], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1176], rdx
	mov	rdx, qword [rbp - 1176]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1168], rdx
	mov	rdx, qword [rbp - 1160]
	add	rdx, qword [rbp - 1168]
	mov	qword [rbp - 1152], rdx
	mov	rdx, qword [rbp - 1120]
	sub	rdx, qword [rbp - 1152]
	mov	qword [rbp - 1112], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1200], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1216], rdx
	mov	rdx, qword [rbp - 1216]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1208], rdx
	mov	rdx, qword [rbp - 1200]
	add	rdx, qword [rbp - 1208]
	mov	qword [rbp - 1192], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1224], rdx
	mov	rdx, qword [rbp - 1192]
	sub	rdx, qword [rbp - 1224]
	mov	qword [rbp - 1184], rdx
	mov	rdx, qword [rbp - 1112]
	sub	rdx, qword [rbp - 1184]
	mov	qword [rbp - 1104], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1264], rdx
	mov	rdx, qword [rbp - 1264]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1256], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1272], rdx
	mov	rdx, qword [rbp - 1256]
	sub	rdx, qword [rbp - 1272]
	mov	qword [rbp - 1248], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1288], rdx
	mov	rdx, qword [rbp - 1288]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1280], rdx
	mov	rdx, qword [rbp - 1248]
	add	rdx, qword [rbp - 1280]
	mov	qword [rbp - 1240], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1312], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1328], rdx
	mov	rdx, qword [rbp - 1328]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1320], rdx
	mov	rdx, qword [rbp - 1312]
	add	rdx, qword [rbp - 1320]
	mov	qword [rbp - 1304], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1336], rdx
	mov	rdx, qword [rbp - 1304]
	sub	rdx, qword [rbp - 1336]
	mov	qword [rbp - 1296], rdx
	mov	rdx, qword [rbp - 1240]
	sub	rdx, qword [rbp - 1296]
	mov	qword [rbp - 1232], rdx
	mov	rdx, qword [rbp - 1104]
	add	rdx, qword [rbp - 1232]
	mov	qword [rbp - 1096], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1384], rdx
	mov	rdx, qword [rbp - 1384]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1376], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1392], rdx
	mov	rdx, qword [rbp - 1376]
	sub	rdx, qword [rbp - 1392]
	mov	qword [rbp - 1368], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1408], rdx
	mov	rdx, qword [rbp - 1408]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1400], rdx
	mov	rdx, qword [rbp - 1368]
	add	rdx, qword [rbp - 1400]
	mov	qword [rbp - 1360], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1432], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1448], rdx
	mov	rdx, qword [rbp - 1448]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1440], rdx
	mov	rdx, qword [rbp - 1432]
	add	rdx, qword [rbp - 1440]
	mov	qword [rbp - 1424], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1456], rdx
	mov	rdx, qword [rbp - 1424]
	sub	rdx, qword [rbp - 1456]
	mov	qword [rbp - 1416], rdx
	mov	rdx, qword [rbp - 1360]
	sub	rdx, qword [rbp - 1416]
	mov	qword [rbp - 1352], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1496], rdx
	mov	rdx, qword [rbp - 1496]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1488], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1504], rdx
	mov	rdx, qword [rbp - 1488]
	sub	rdx, qword [rbp - 1504]
	mov	qword [rbp - 1480], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1520], rdx
	mov	rdx, qword [rbp - 1520]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1512], rdx
	mov	rdx, qword [rbp - 1480]
	add	rdx, qword [rbp - 1512]
	mov	qword [rbp - 1472], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1544], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1560], rdx
	mov	rdx, qword [rbp - 1560]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1552], rdx
	mov	rdx, qword [rbp - 1544]
	add	rdx, qword [rbp - 1552]
	mov	qword [rbp - 1536], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1568], rdx
	mov	rdx, qword [rbp - 1536]
	sub	rdx, qword [rbp - 1568]
	mov	qword [rbp - 1528], rdx
	mov	rdx, qword [rbp - 1472]
	sub	rdx, qword [rbp - 1528]
	mov	qword [rbp - 1464], rdx
	mov	rdx, qword [rbp - 1352]
	add	rdx, qword [rbp - 1464]
	mov	qword [rbp - 1344], rdx
	mov	rdx, qword [rbp - 1096]
	add	rdx, qword [rbp - 1344]
	mov	qword [rbp - 1088], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1624], rdx
	mov	rdx, qword [rbp - 1624]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1616], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1632], rdx
	mov	rdx, qword [rbp - 1616]
	sub	rdx, qword [rbp - 1632]
	mov	qword [rbp - 1608], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1656], rdx
	mov	rdx, qword [rbp - 1656]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1648], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1664], rdx
	mov	rdx, qword [rbp - 1648]
	sub	rdx, qword [rbp - 1664]
	mov	qword [rbp - 1640], rdx
	mov	rdx, qword [rbp - 1608]
	add	rdx, qword [rbp - 1640]
	mov	qword [rbp - 1600], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1696], rdx
	mov	rdx, qword [rbp - 1696]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1688], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1704], rdx
	mov	rdx, qword [rbp - 1688]
	sub	rdx, qword [rbp - 1704]
	mov	qword [rbp - 1680], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1720], rdx
	mov	rdx, qword [rbp - 1720]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1712], rdx
	mov	rdx, qword [rbp - 1680]
	add	rdx, qword [rbp - 1712]
	mov	qword [rbp - 1672], rdx
	mov	rdx, qword [rbp - 1600]
	add	rdx, qword [rbp - 1672]
	mov	qword [rbp - 1592], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1752], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1768], rdx
	mov	rdx, qword [rbp - 1768]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1760], rdx
	mov	rdx, qword [rbp - 1752]
	add	rdx, qword [rbp - 1760]
	mov	qword [rbp - 1744], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1776], rdx
	mov	rdx, qword [rbp - 1744]
	sub	rdx, qword [rbp - 1776]
	mov	qword [rbp - 1736], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1808], rdx
	mov	rdx, qword [rbp - 1808]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1800], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1816], rdx
	mov	rdx, qword [rbp - 1800]
	sub	rdx, qword [rbp - 1816]
	mov	qword [rbp - 1792], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1832], rdx
	mov	rdx, qword [rbp - 1832]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1824], rdx
	mov	rdx, qword [rbp - 1792]
	add	rdx, qword [rbp - 1824]
	mov	qword [rbp - 1784], rdx
	mov	rdx, qword [rbp - 1736]
	add	rdx, qword [rbp - 1784]
	mov	qword [rbp - 1728], rdx
	mov	rdx, qword [rbp - 1592]
	sub	rdx, qword [rbp - 1728]
	mov	qword [rbp - 1584], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1872], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1888], rdx
	mov	rdx, qword [rbp - 1888]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1880], rdx
	mov	rdx, qword [rbp - 1872]
	add	rdx, qword [rbp - 1880]
	mov	qword [rbp - 1864], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1896], rdx
	mov	rdx, qword [rbp - 1864]
	sub	rdx, qword [rbp - 1896]
	mov	qword [rbp - 1856], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1928], rdx
	mov	rdx, qword [rbp - 1928]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1920], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1936], rdx
	mov	rdx, qword [rbp - 1920]
	sub	rdx, qword [rbp - 1936]
	mov	qword [rbp - 1912], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 1952], rdx
	mov	rdx, qword [rbp - 1952]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1944], rdx
	mov	rdx, qword [rbp - 1912]
	add	rdx, qword [rbp - 1944]
	mov	qword [rbp - 1904], rdx
	mov	rdx, qword [rbp - 1856]
	add	rdx, qword [rbp - 1904]
	mov	qword [rbp - 1848], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1984], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2000], rdx
	mov	rdx, qword [rbp - 2000]
	add	rdx, qword [ B ]
	mov	qword [rbp - 1992], rdx
	mov	rdx, qword [rbp - 1984]
	add	rdx, qword [rbp - 1992]
	mov	qword [rbp - 1976], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2008], rdx
	mov	rdx, qword [rbp - 1976]
	sub	rdx, qword [rbp - 2008]
	mov	qword [rbp - 1968], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2040], rdx
	mov	rdx, qword [rbp - 2040]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2032], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2048], rdx
	mov	rdx, qword [rbp - 2032]
	sub	rdx, qword [rbp - 2048]
	mov	qword [rbp - 2024], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2064], rdx
	mov	rdx, qword [rbp - 2064]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2056], rdx
	mov	rdx, qword [rbp - 2024]
	add	rdx, qword [rbp - 2056]
	mov	qword [rbp - 2016], rdx
	mov	rdx, qword [rbp - 1968]
	add	rdx, qword [rbp - 2016]
	mov	qword [rbp - 1960], rdx
	mov	rdx, qword [rbp - 1848]
	sub	rdx, qword [rbp - 1960]
	mov	qword [rbp - 1840], rdx
	mov	rdx, qword [rbp - 1584]
	sub	rdx, qword [rbp - 1840]
	mov	qword [rbp - 1576], rdx
	mov	rdx, qword [rbp - 1088]
	add	rdx, qword [rbp - 1576]
	mov	qword [rbp - 1080], rdx
	mov	rdx, qword [rbp - 64]
	sub	rdx, qword [rbp - 1080]
	mov	qword [rbp - 56], rdx
	mov	rax, qword [rbp - 56]
	mov	qword [ A ], rax
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2136], rdx
	mov	rdx, qword [rbp - 2136]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2128], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2144], rdx
	mov	rdx, qword [rbp - 2128]
	sub	rdx, qword [rbp - 2144]
	mov	qword [rbp - 2120], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2168], rdx
	mov	rdx, qword [rbp - 2168]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2160], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2176], rdx
	mov	rdx, qword [rbp - 2160]
	sub	rdx, qword [rbp - 2176]
	mov	qword [rbp - 2152], rdx
	mov	rdx, qword [rbp - 2120]
	add	rdx, qword [rbp - 2152]
	mov	qword [rbp - 2112], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2208], rdx
	mov	rdx, qword [rbp - 2208]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2200], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2216], rdx
	mov	rdx, qword [rbp - 2200]
	sub	rdx, qword [rbp - 2216]
	mov	qword [rbp - 2192], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2232], rdx
	mov	rdx, qword [rbp - 2232]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2224], rdx
	mov	rdx, qword [rbp - 2192]
	add	rdx, qword [rbp - 2224]
	mov	qword [rbp - 2184], rdx
	mov	rdx, qword [rbp - 2112]
	add	rdx, qword [rbp - 2184]
	mov	qword [rbp - 2104], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2264], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2280], rdx
	mov	rdx, qword [rbp - 2280]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2272], rdx
	mov	rdx, qword [rbp - 2264]
	add	rdx, qword [rbp - 2272]
	mov	qword [rbp - 2256], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2288], rdx
	mov	rdx, qword [rbp - 2256]
	sub	rdx, qword [rbp - 2288]
	mov	qword [rbp - 2248], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2320], rdx
	mov	rdx, qword [rbp - 2320]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2312], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2328], rdx
	mov	rdx, qword [rbp - 2312]
	sub	rdx, qword [rbp - 2328]
	mov	qword [rbp - 2304], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2344], rdx
	mov	rdx, qword [rbp - 2344]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2336], rdx
	mov	rdx, qword [rbp - 2304]
	add	rdx, qword [rbp - 2336]
	mov	qword [rbp - 2296], rdx
	mov	rdx, qword [rbp - 2248]
	add	rdx, qword [rbp - 2296]
	mov	qword [rbp - 2240], rdx
	mov	rdx, qword [rbp - 2104]
	sub	rdx, qword [rbp - 2240]
	mov	qword [rbp - 2096], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2384], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2400], rdx
	mov	rdx, qword [rbp - 2400]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2392], rdx
	mov	rdx, qword [rbp - 2384]
	add	rdx, qword [rbp - 2392]
	mov	qword [rbp - 2376], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2416], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2432], rdx
	mov	rdx, qword [rbp - 2432]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2424], rdx
	mov	rdx, qword [rbp - 2416]
	add	rdx, qword [rbp - 2424]
	mov	qword [rbp - 2408], rdx
	mov	rdx, qword [rbp - 2376]
	sub	rdx, qword [rbp - 2408]
	mov	qword [rbp - 2368], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2456], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2472], rdx
	mov	rdx, qword [rbp - 2472]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2464], rdx
	mov	rdx, qword [rbp - 2456]
	add	rdx, qword [rbp - 2464]
	mov	qword [rbp - 2448], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2480], rdx
	mov	rdx, qword [rbp - 2448]
	sub	rdx, qword [rbp - 2480]
	mov	qword [rbp - 2440], rdx
	mov	rdx, qword [rbp - 2368]
	sub	rdx, qword [rbp - 2440]
	mov	qword [rbp - 2360], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2520], rdx
	mov	rdx, qword [rbp - 2520]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2512], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2528], rdx
	mov	rdx, qword [rbp - 2512]
	sub	rdx, qword [rbp - 2528]
	mov	qword [rbp - 2504], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2544], rdx
	mov	rdx, qword [rbp - 2544]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2536], rdx
	mov	rdx, qword [rbp - 2504]
	add	rdx, qword [rbp - 2536]
	mov	qword [rbp - 2496], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2568], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2584], rdx
	mov	rdx, qword [rbp - 2584]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2576], rdx
	mov	rdx, qword [rbp - 2568]
	add	rdx, qword [rbp - 2576]
	mov	qword [rbp - 2560], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2592], rdx
	mov	rdx, qword [rbp - 2560]
	sub	rdx, qword [rbp - 2592]
	mov	qword [rbp - 2552], rdx
	mov	rdx, qword [rbp - 2496]
	sub	rdx, qword [rbp - 2552]
	mov	qword [rbp - 2488], rdx
	mov	rdx, qword [rbp - 2360]
	add	rdx, qword [rbp - 2488]
	mov	qword [rbp - 2352], rdx
	mov	rdx, qword [rbp - 2096]
	sub	rdx, qword [rbp - 2352]
	mov	qword [rbp - 2088], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2648], rdx
	mov	rdx, qword [rbp - 2648]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2640], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2656], rdx
	mov	rdx, qword [rbp - 2640]
	sub	rdx, qword [rbp - 2656]
	mov	qword [rbp - 2632], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2680], rdx
	mov	rdx, qword [rbp - 2680]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2672], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2688], rdx
	mov	rdx, qword [rbp - 2672]
	sub	rdx, qword [rbp - 2688]
	mov	qword [rbp - 2664], rdx
	mov	rdx, qword [rbp - 2632]
	add	rdx, qword [rbp - 2664]
	mov	qword [rbp - 2624], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2720], rdx
	mov	rdx, qword [rbp - 2720]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2712], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2728], rdx
	mov	rdx, qword [rbp - 2712]
	sub	rdx, qword [rbp - 2728]
	mov	qword [rbp - 2704], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2744], rdx
	mov	rdx, qword [rbp - 2744]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2736], rdx
	mov	rdx, qword [rbp - 2704]
	add	rdx, qword [rbp - 2736]
	mov	qword [rbp - 2696], rdx
	mov	rdx, qword [rbp - 2624]
	add	rdx, qword [rbp - 2696]
	mov	qword [rbp - 2616], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2776], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2792], rdx
	mov	rdx, qword [rbp - 2792]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2784], rdx
	mov	rdx, qword [rbp - 2776]
	add	rdx, qword [rbp - 2784]
	mov	qword [rbp - 2768], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2800], rdx
	mov	rdx, qword [rbp - 2768]
	sub	rdx, qword [rbp - 2800]
	mov	qword [rbp - 2760], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2832], rdx
	mov	rdx, qword [rbp - 2832]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2824], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2840], rdx
	mov	rdx, qword [rbp - 2824]
	sub	rdx, qword [rbp - 2840]
	mov	qword [rbp - 2816], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2856], rdx
	mov	rdx, qword [rbp - 2856]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2848], rdx
	mov	rdx, qword [rbp - 2816]
	add	rdx, qword [rbp - 2848]
	mov	qword [rbp - 2808], rdx
	mov	rdx, qword [rbp - 2760]
	add	rdx, qword [rbp - 2808]
	mov	qword [rbp - 2752], rdx
	mov	rdx, qword [rbp - 2616]
	sub	rdx, qword [rbp - 2752]
	mov	qword [rbp - 2608], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2896], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2912], rdx
	mov	rdx, qword [rbp - 2912]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2904], rdx
	mov	rdx, qword [rbp - 2896]
	add	rdx, qword [rbp - 2904]
	mov	qword [rbp - 2888], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2920], rdx
	mov	rdx, qword [rbp - 2888]
	sub	rdx, qword [rbp - 2920]
	mov	qword [rbp - 2880], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2952], rdx
	mov	rdx, qword [rbp - 2952]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2944], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2960], rdx
	mov	rdx, qword [rbp - 2944]
	sub	rdx, qword [rbp - 2960]
	mov	qword [rbp - 2936], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 2976], rdx
	mov	rdx, qword [rbp - 2976]
	add	rdx, qword [ B ]
	mov	qword [rbp - 2968], rdx
	mov	rdx, qword [rbp - 2936]
	add	rdx, qword [rbp - 2968]
	mov	qword [rbp - 2928], rdx
	mov	rdx, qword [rbp - 2880]
	add	rdx, qword [rbp - 2928]
	mov	qword [rbp - 2872], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3008], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3024], rdx
	mov	rdx, qword [rbp - 3024]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3016], rdx
	mov	rdx, qword [rbp - 3008]
	add	rdx, qword [rbp - 3016]
	mov	qword [rbp - 3000], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3032], rdx
	mov	rdx, qword [rbp - 3000]
	sub	rdx, qword [rbp - 3032]
	mov	qword [rbp - 2992], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3064], rdx
	mov	rdx, qword [rbp - 3064]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3056], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3072], rdx
	mov	rdx, qword [rbp - 3056]
	sub	rdx, qword [rbp - 3072]
	mov	qword [rbp - 3048], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3088], rdx
	mov	rdx, qword [rbp - 3088]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3080], rdx
	mov	rdx, qword [rbp - 3048]
	add	rdx, qword [rbp - 3080]
	mov	qword [rbp - 3040], rdx
	mov	rdx, qword [rbp - 2992]
	add	rdx, qword [rbp - 3040]
	mov	qword [rbp - 2984], rdx
	mov	rdx, qword [rbp - 2872]
	sub	rdx, qword [rbp - 2984]
	mov	qword [rbp - 2864], rdx
	mov	rdx, qword [rbp - 2608]
	sub	rdx, qword [rbp - 2864]
	mov	qword [rbp - 2600], rdx
	mov	rdx, qword [rbp - 2088]
	add	rdx, qword [rbp - 2600]
	mov	qword [rbp - 2080], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3144], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3160], rdx
	mov	rdx, qword [rbp - 3160]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3152], rdx
	mov	rdx, qword [rbp - 3144]
	add	rdx, qword [rbp - 3152]
	mov	qword [rbp - 3136], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3176], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3192], rdx
	mov	rdx, qword [rbp - 3192]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3184], rdx
	mov	rdx, qword [rbp - 3176]
	add	rdx, qword [rbp - 3184]
	mov	qword [rbp - 3168], rdx
	mov	rdx, qword [rbp - 3136]
	sub	rdx, qword [rbp - 3168]
	mov	qword [rbp - 3128], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3216], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3232], rdx
	mov	rdx, qword [rbp - 3232]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3224], rdx
	mov	rdx, qword [rbp - 3216]
	add	rdx, qword [rbp - 3224]
	mov	qword [rbp - 3208], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3240], rdx
	mov	rdx, qword [rbp - 3208]
	sub	rdx, qword [rbp - 3240]
	mov	qword [rbp - 3200], rdx
	mov	rdx, qword [rbp - 3128]
	sub	rdx, qword [rbp - 3200]
	mov	qword [rbp - 3120], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3280], rdx
	mov	rdx, qword [rbp - 3280]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3272], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3288], rdx
	mov	rdx, qword [rbp - 3272]
	sub	rdx, qword [rbp - 3288]
	mov	qword [rbp - 3264], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3304], rdx
	mov	rdx, qword [rbp - 3304]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3296], rdx
	mov	rdx, qword [rbp - 3264]
	add	rdx, qword [rbp - 3296]
	mov	qword [rbp - 3256], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3328], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3344], rdx
	mov	rdx, qword [rbp - 3344]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3336], rdx
	mov	rdx, qword [rbp - 3328]
	add	rdx, qword [rbp - 3336]
	mov	qword [rbp - 3320], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3352], rdx
	mov	rdx, qword [rbp - 3320]
	sub	rdx, qword [rbp - 3352]
	mov	qword [rbp - 3312], rdx
	mov	rdx, qword [rbp - 3256]
	sub	rdx, qword [rbp - 3312]
	mov	qword [rbp - 3248], rdx
	mov	rdx, qword [rbp - 3120]
	add	rdx, qword [rbp - 3248]
	mov	qword [rbp - 3112], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3400], rdx
	mov	rdx, qword [rbp - 3400]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3392], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3408], rdx
	mov	rdx, qword [rbp - 3392]
	sub	rdx, qword [rbp - 3408]
	mov	qword [rbp - 3384], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3424], rdx
	mov	rdx, qword [rbp - 3424]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3416], rdx
	mov	rdx, qword [rbp - 3384]
	add	rdx, qword [rbp - 3416]
	mov	qword [rbp - 3376], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3448], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3464], rdx
	mov	rdx, qword [rbp - 3464]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3456], rdx
	mov	rdx, qword [rbp - 3448]
	add	rdx, qword [rbp - 3456]
	mov	qword [rbp - 3440], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3472], rdx
	mov	rdx, qword [rbp - 3440]
	sub	rdx, qword [rbp - 3472]
	mov	qword [rbp - 3432], rdx
	mov	rdx, qword [rbp - 3376]
	sub	rdx, qword [rbp - 3432]
	mov	qword [rbp - 3368], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3512], rdx
	mov	rdx, qword [rbp - 3512]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3504], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3520], rdx
	mov	rdx, qword [rbp - 3504]
	sub	rdx, qword [rbp - 3520]
	mov	qword [rbp - 3496], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3536], rdx
	mov	rdx, qword [rbp - 3536]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3528], rdx
	mov	rdx, qword [rbp - 3496]
	add	rdx, qword [rbp - 3528]
	mov	qword [rbp - 3488], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3560], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3576], rdx
	mov	rdx, qword [rbp - 3576]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3568], rdx
	mov	rdx, qword [rbp - 3560]
	add	rdx, qword [rbp - 3568]
	mov	qword [rbp - 3552], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3584], rdx
	mov	rdx, qword [rbp - 3552]
	sub	rdx, qword [rbp - 3584]
	mov	qword [rbp - 3544], rdx
	mov	rdx, qword [rbp - 3488]
	sub	rdx, qword [rbp - 3544]
	mov	qword [rbp - 3480], rdx
	mov	rdx, qword [rbp - 3368]
	add	rdx, qword [rbp - 3480]
	mov	qword [rbp - 3360], rdx
	mov	rdx, qword [rbp - 3112]
	add	rdx, qword [rbp - 3360]
	mov	qword [rbp - 3104], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3640], rdx
	mov	rdx, qword [rbp - 3640]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3632], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3648], rdx
	mov	rdx, qword [rbp - 3632]
	sub	rdx, qword [rbp - 3648]
	mov	qword [rbp - 3624], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3672], rdx
	mov	rdx, qword [rbp - 3672]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3664], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3680], rdx
	mov	rdx, qword [rbp - 3664]
	sub	rdx, qword [rbp - 3680]
	mov	qword [rbp - 3656], rdx
	mov	rdx, qword [rbp - 3624]
	add	rdx, qword [rbp - 3656]
	mov	qword [rbp - 3616], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3712], rdx
	mov	rdx, qword [rbp - 3712]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3704], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3720], rdx
	mov	rdx, qword [rbp - 3704]
	sub	rdx, qword [rbp - 3720]
	mov	qword [rbp - 3696], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3736], rdx
	mov	rdx, qword [rbp - 3736]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3728], rdx
	mov	rdx, qword [rbp - 3696]
	add	rdx, qword [rbp - 3728]
	mov	qword [rbp - 3688], rdx
	mov	rdx, qword [rbp - 3616]
	add	rdx, qword [rbp - 3688]
	mov	qword [rbp - 3608], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3768], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3784], rdx
	mov	rdx, qword [rbp - 3784]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3776], rdx
	mov	rdx, qword [rbp - 3768]
	add	rdx, qword [rbp - 3776]
	mov	qword [rbp - 3760], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3792], rdx
	mov	rdx, qword [rbp - 3760]
	sub	rdx, qword [rbp - 3792]
	mov	qword [rbp - 3752], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3824], rdx
	mov	rdx, qword [rbp - 3824]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3816], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3832], rdx
	mov	rdx, qword [rbp - 3816]
	sub	rdx, qword [rbp - 3832]
	mov	qword [rbp - 3808], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3848], rdx
	mov	rdx, qword [rbp - 3848]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3840], rdx
	mov	rdx, qword [rbp - 3808]
	add	rdx, qword [rbp - 3840]
	mov	qword [rbp - 3800], rdx
	mov	rdx, qword [rbp - 3752]
	add	rdx, qword [rbp - 3800]
	mov	qword [rbp - 3744], rdx
	mov	rdx, qword [rbp - 3608]
	sub	rdx, qword [rbp - 3744]
	mov	qword [rbp - 3600], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3888], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3904], rdx
	mov	rdx, qword [rbp - 3904]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3896], rdx
	mov	rdx, qword [rbp - 3888]
	add	rdx, qword [rbp - 3896]
	mov	qword [rbp - 3880], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3912], rdx
	mov	rdx, qword [rbp - 3880]
	sub	rdx, qword [rbp - 3912]
	mov	qword [rbp - 3872], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3944], rdx
	mov	rdx, qword [rbp - 3944]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3936], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3952], rdx
	mov	rdx, qword [rbp - 3936]
	sub	rdx, qword [rbp - 3952]
	mov	qword [rbp - 3928], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 3968], rdx
	mov	rdx, qword [rbp - 3968]
	add	rdx, qword [ B ]
	mov	qword [rbp - 3960], rdx
	mov	rdx, qword [rbp - 3928]
	add	rdx, qword [rbp - 3960]
	mov	qword [rbp - 3920], rdx
	mov	rdx, qword [rbp - 3872]
	add	rdx, qword [rbp - 3920]
	mov	qword [rbp - 3864], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4000], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4016], rdx
	mov	rdx, qword [rbp - 4016]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4008], rdx
	mov	rdx, qword [rbp - 4000]
	add	rdx, qword [rbp - 4008]
	mov	qword [rbp - 3992], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4024], rdx
	mov	rdx, qword [rbp - 3992]
	sub	rdx, qword [rbp - 4024]
	mov	qword [rbp - 3984], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4056], rdx
	mov	rdx, qword [rbp - 4056]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4048], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4064], rdx
	mov	rdx, qword [rbp - 4048]
	sub	rdx, qword [rbp - 4064]
	mov	qword [rbp - 4040], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4080], rdx
	mov	rdx, qword [rbp - 4080]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4072], rdx
	mov	rdx, qword [rbp - 4040]
	add	rdx, qword [rbp - 4072]
	mov	qword [rbp - 4032], rdx
	mov	rdx, qword [rbp - 3984]
	add	rdx, qword [rbp - 4032]
	mov	qword [rbp - 3976], rdx
	mov	rdx, qword [rbp - 3864]
	sub	rdx, qword [rbp - 3976]
	mov	qword [rbp - 3856], rdx
	mov	rdx, qword [rbp - 3600]
	sub	rdx, qword [rbp - 3856]
	mov	qword [rbp - 3592], rdx
	mov	rdx, qword [rbp - 3104]
	add	rdx, qword [rbp - 3592]
	mov	qword [rbp - 3096], rdx
	mov	rdx, qword [rbp - 2080]
	sub	rdx, qword [rbp - 3096]
	mov	qword [rbp - 2072], rdx
	mov	rax, qword [rbp - 2072]
	mov	qword [ B ], rax
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4152], rdx
	mov	rdx, qword [rbp - 4152]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4144], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4160], rdx
	mov	rdx, qword [rbp - 4144]
	sub	rdx, qword [rbp - 4160]
	mov	qword [rbp - 4136], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4184], rdx
	mov	rdx, qword [rbp - 4184]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4176], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4192], rdx
	mov	rdx, qword [rbp - 4176]
	sub	rdx, qword [rbp - 4192]
	mov	qword [rbp - 4168], rdx
	mov	rdx, qword [rbp - 4136]
	add	rdx, qword [rbp - 4168]
	mov	qword [rbp - 4128], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4224], rdx
	mov	rdx, qword [rbp - 4224]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4216], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4232], rdx
	mov	rdx, qword [rbp - 4216]
	sub	rdx, qword [rbp - 4232]
	mov	qword [rbp - 4208], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4248], rdx
	mov	rdx, qword [rbp - 4248]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4240], rdx
	mov	rdx, qword [rbp - 4208]
	add	rdx, qword [rbp - 4240]
	mov	qword [rbp - 4200], rdx
	mov	rdx, qword [rbp - 4128]
	add	rdx, qword [rbp - 4200]
	mov	qword [rbp - 4120], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4280], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4296], rdx
	mov	rdx, qword [rbp - 4296]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4288], rdx
	mov	rdx, qword [rbp - 4280]
	add	rdx, qword [rbp - 4288]
	mov	qword [rbp - 4272], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4304], rdx
	mov	rdx, qword [rbp - 4272]
	sub	rdx, qword [rbp - 4304]
	mov	qword [rbp - 4264], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4336], rdx
	mov	rdx, qword [rbp - 4336]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4328], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4344], rdx
	mov	rdx, qword [rbp - 4328]
	sub	rdx, qword [rbp - 4344]
	mov	qword [rbp - 4320], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4360], rdx
	mov	rdx, qword [rbp - 4360]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4352], rdx
	mov	rdx, qword [rbp - 4320]
	add	rdx, qword [rbp - 4352]
	mov	qword [rbp - 4312], rdx
	mov	rdx, qword [rbp - 4264]
	add	rdx, qword [rbp - 4312]
	mov	qword [rbp - 4256], rdx
	mov	rdx, qword [rbp - 4120]
	sub	rdx, qword [rbp - 4256]
	mov	qword [rbp - 4112], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4400], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4416], rdx
	mov	rdx, qword [rbp - 4416]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4408], rdx
	mov	rdx, qword [rbp - 4400]
	add	rdx, qword [rbp - 4408]
	mov	qword [rbp - 4392], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4432], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4448], rdx
	mov	rdx, qword [rbp - 4448]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4440], rdx
	mov	rdx, qword [rbp - 4432]
	add	rdx, qword [rbp - 4440]
	mov	qword [rbp - 4424], rdx
	mov	rdx, qword [rbp - 4392]
	sub	rdx, qword [rbp - 4424]
	mov	qword [rbp - 4384], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4472], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4488], rdx
	mov	rdx, qword [rbp - 4488]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4480], rdx
	mov	rdx, qword [rbp - 4472]
	add	rdx, qword [rbp - 4480]
	mov	qword [rbp - 4464], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4496], rdx
	mov	rdx, qword [rbp - 4464]
	sub	rdx, qword [rbp - 4496]
	mov	qword [rbp - 4456], rdx
	mov	rdx, qword [rbp - 4384]
	sub	rdx, qword [rbp - 4456]
	mov	qword [rbp - 4376], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4536], rdx
	mov	rdx, qword [rbp - 4536]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4528], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4544], rdx
	mov	rdx, qword [rbp - 4528]
	sub	rdx, qword [rbp - 4544]
	mov	qword [rbp - 4520], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4560], rdx
	mov	rdx, qword [rbp - 4560]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4552], rdx
	mov	rdx, qword [rbp - 4520]
	add	rdx, qword [rbp - 4552]
	mov	qword [rbp - 4512], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4584], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4600], rdx
	mov	rdx, qword [rbp - 4600]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4592], rdx
	mov	rdx, qword [rbp - 4584]
	add	rdx, qword [rbp - 4592]
	mov	qword [rbp - 4576], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4608], rdx
	mov	rdx, qword [rbp - 4576]
	sub	rdx, qword [rbp - 4608]
	mov	qword [rbp - 4568], rdx
	mov	rdx, qword [rbp - 4512]
	sub	rdx, qword [rbp - 4568]
	mov	qword [rbp - 4504], rdx
	mov	rdx, qword [rbp - 4376]
	add	rdx, qword [rbp - 4504]
	mov	qword [rbp - 4368], rdx
	mov	rdx, qword [rbp - 4112]
	sub	rdx, qword [rbp - 4368]
	mov	qword [rbp - 4104], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4664], rdx
	mov	rdx, qword [rbp - 4664]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4656], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4672], rdx
	mov	rdx, qword [rbp - 4656]
	sub	rdx, qword [rbp - 4672]
	mov	qword [rbp - 4648], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4696], rdx
	mov	rdx, qword [rbp - 4696]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4688], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4704], rdx
	mov	rdx, qword [rbp - 4688]
	sub	rdx, qword [rbp - 4704]
	mov	qword [rbp - 4680], rdx
	mov	rdx, qword [rbp - 4648]
	add	rdx, qword [rbp - 4680]
	mov	qword [rbp - 4640], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4736], rdx
	mov	rdx, qword [rbp - 4736]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4728], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4744], rdx
	mov	rdx, qword [rbp - 4728]
	sub	rdx, qword [rbp - 4744]
	mov	qword [rbp - 4720], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4760], rdx
	mov	rdx, qword [rbp - 4760]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4752], rdx
	mov	rdx, qword [rbp - 4720]
	add	rdx, qword [rbp - 4752]
	mov	qword [rbp - 4712], rdx
	mov	rdx, qword [rbp - 4640]
	add	rdx, qword [rbp - 4712]
	mov	qword [rbp - 4632], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4792], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4808], rdx
	mov	rdx, qword [rbp - 4808]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4800], rdx
	mov	rdx, qword [rbp - 4792]
	add	rdx, qword [rbp - 4800]
	mov	qword [rbp - 4784], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4816], rdx
	mov	rdx, qword [rbp - 4784]
	sub	rdx, qword [rbp - 4816]
	mov	qword [rbp - 4776], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4848], rdx
	mov	rdx, qword [rbp - 4848]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4840], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4856], rdx
	mov	rdx, qword [rbp - 4840]
	sub	rdx, qword [rbp - 4856]
	mov	qword [rbp - 4832], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4872], rdx
	mov	rdx, qword [rbp - 4872]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4864], rdx
	mov	rdx, qword [rbp - 4832]
	add	rdx, qword [rbp - 4864]
	mov	qword [rbp - 4824], rdx
	mov	rdx, qword [rbp - 4776]
	add	rdx, qword [rbp - 4824]
	mov	qword [rbp - 4768], rdx
	mov	rdx, qword [rbp - 4632]
	sub	rdx, qword [rbp - 4768]
	mov	qword [rbp - 4624], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4912], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4928], rdx
	mov	rdx, qword [rbp - 4928]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4920], rdx
	mov	rdx, qword [rbp - 4912]
	add	rdx, qword [rbp - 4920]
	mov	qword [rbp - 4904], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4936], rdx
	mov	rdx, qword [rbp - 4904]
	sub	rdx, qword [rbp - 4936]
	mov	qword [rbp - 4896], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4968], rdx
	mov	rdx, qword [rbp - 4968]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4960], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4976], rdx
	mov	rdx, qword [rbp - 4960]
	sub	rdx, qword [rbp - 4976]
	mov	qword [rbp - 4952], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 4992], rdx
	mov	rdx, qword [rbp - 4992]
	add	rdx, qword [ B ]
	mov	qword [rbp - 4984], rdx
	mov	rdx, qword [rbp - 4952]
	add	rdx, qword [rbp - 4984]
	mov	qword [rbp - 4944], rdx
	mov	rdx, qword [rbp - 4896]
	add	rdx, qword [rbp - 4944]
	mov	qword [rbp - 4888], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5024], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5040], rdx
	mov	rdx, qword [rbp - 5040]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5032], rdx
	mov	rdx, qword [rbp - 5024]
	add	rdx, qword [rbp - 5032]
	mov	qword [rbp - 5016], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5048], rdx
	mov	rdx, qword [rbp - 5016]
	sub	rdx, qword [rbp - 5048]
	mov	qword [rbp - 5008], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5080], rdx
	mov	rdx, qword [rbp - 5080]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5072], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5088], rdx
	mov	rdx, qword [rbp - 5072]
	sub	rdx, qword [rbp - 5088]
	mov	qword [rbp - 5064], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5104], rdx
	mov	rdx, qword [rbp - 5104]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5096], rdx
	mov	rdx, qword [rbp - 5064]
	add	rdx, qword [rbp - 5096]
	mov	qword [rbp - 5056], rdx
	mov	rdx, qword [rbp - 5008]
	add	rdx, qword [rbp - 5056]
	mov	qword [rbp - 5000], rdx
	mov	rdx, qword [rbp - 4888]
	sub	rdx, qword [rbp - 5000]
	mov	qword [rbp - 4880], rdx
	mov	rdx, qword [rbp - 4624]
	sub	rdx, qword [rbp - 4880]
	mov	qword [rbp - 4616], rdx
	mov	rdx, qword [rbp - 4104]
	add	rdx, qword [rbp - 4616]
	mov	qword [rbp - 4096], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5160], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5176], rdx
	mov	rdx, qword [rbp - 5176]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5168], rdx
	mov	rdx, qword [rbp - 5160]
	add	rdx, qword [rbp - 5168]
	mov	qword [rbp - 5152], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5192], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5208], rdx
	mov	rdx, qword [rbp - 5208]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5200], rdx
	mov	rdx, qword [rbp - 5192]
	add	rdx, qword [rbp - 5200]
	mov	qword [rbp - 5184], rdx
	mov	rdx, qword [rbp - 5152]
	sub	rdx, qword [rbp - 5184]
	mov	qword [rbp - 5144], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5232], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5248], rdx
	mov	rdx, qword [rbp - 5248]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5240], rdx
	mov	rdx, qword [rbp - 5232]
	add	rdx, qword [rbp - 5240]
	mov	qword [rbp - 5224], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5256], rdx
	mov	rdx, qword [rbp - 5224]
	sub	rdx, qword [rbp - 5256]
	mov	qword [rbp - 5216], rdx
	mov	rdx, qword [rbp - 5144]
	sub	rdx, qword [rbp - 5216]
	mov	qword [rbp - 5136], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5296], rdx
	mov	rdx, qword [rbp - 5296]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5288], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5304], rdx
	mov	rdx, qword [rbp - 5288]
	sub	rdx, qword [rbp - 5304]
	mov	qword [rbp - 5280], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5320], rdx
	mov	rdx, qword [rbp - 5320]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5312], rdx
	mov	rdx, qword [rbp - 5280]
	add	rdx, qword [rbp - 5312]
	mov	qword [rbp - 5272], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5344], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5360], rdx
	mov	rdx, qword [rbp - 5360]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5352], rdx
	mov	rdx, qword [rbp - 5344]
	add	rdx, qword [rbp - 5352]
	mov	qword [rbp - 5336], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5368], rdx
	mov	rdx, qword [rbp - 5336]
	sub	rdx, qword [rbp - 5368]
	mov	qword [rbp - 5328], rdx
	mov	rdx, qword [rbp - 5272]
	sub	rdx, qword [rbp - 5328]
	mov	qword [rbp - 5264], rdx
	mov	rdx, qword [rbp - 5136]
	add	rdx, qword [rbp - 5264]
	mov	qword [rbp - 5128], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5416], rdx
	mov	rdx, qword [rbp - 5416]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5408], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5424], rdx
	mov	rdx, qword [rbp - 5408]
	sub	rdx, qword [rbp - 5424]
	mov	qword [rbp - 5400], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5440], rdx
	mov	rdx, qword [rbp - 5440]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5432], rdx
	mov	rdx, qword [rbp - 5400]
	add	rdx, qword [rbp - 5432]
	mov	qword [rbp - 5392], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5464], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5480], rdx
	mov	rdx, qword [rbp - 5480]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5472], rdx
	mov	rdx, qword [rbp - 5464]
	add	rdx, qword [rbp - 5472]
	mov	qword [rbp - 5456], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5488], rdx
	mov	rdx, qword [rbp - 5456]
	sub	rdx, qword [rbp - 5488]
	mov	qword [rbp - 5448], rdx
	mov	rdx, qword [rbp - 5392]
	sub	rdx, qword [rbp - 5448]
	mov	qword [rbp - 5384], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5528], rdx
	mov	rdx, qword [rbp - 5528]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5520], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5536], rdx
	mov	rdx, qword [rbp - 5520]
	sub	rdx, qword [rbp - 5536]
	mov	qword [rbp - 5512], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5552], rdx
	mov	rdx, qword [rbp - 5552]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5544], rdx
	mov	rdx, qword [rbp - 5512]
	add	rdx, qword [rbp - 5544]
	mov	qword [rbp - 5504], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5576], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5592], rdx
	mov	rdx, qword [rbp - 5592]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5584], rdx
	mov	rdx, qword [rbp - 5576]
	add	rdx, qword [rbp - 5584]
	mov	qword [rbp - 5568], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5600], rdx
	mov	rdx, qword [rbp - 5568]
	sub	rdx, qword [rbp - 5600]
	mov	qword [rbp - 5560], rdx
	mov	rdx, qword [rbp - 5504]
	sub	rdx, qword [rbp - 5560]
	mov	qword [rbp - 5496], rdx
	mov	rdx, qword [rbp - 5384]
	add	rdx, qword [rbp - 5496]
	mov	qword [rbp - 5376], rdx
	mov	rdx, qword [rbp - 5128]
	add	rdx, qword [rbp - 5376]
	mov	qword [rbp - 5120], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5656], rdx
	mov	rdx, qword [rbp - 5656]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5648], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5664], rdx
	mov	rdx, qword [rbp - 5648]
	sub	rdx, qword [rbp - 5664]
	mov	qword [rbp - 5640], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5688], rdx
	mov	rdx, qword [rbp - 5688]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5680], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5696], rdx
	mov	rdx, qword [rbp - 5680]
	sub	rdx, qword [rbp - 5696]
	mov	qword [rbp - 5672], rdx
	mov	rdx, qword [rbp - 5640]
	add	rdx, qword [rbp - 5672]
	mov	qword [rbp - 5632], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5728], rdx
	mov	rdx, qword [rbp - 5728]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5720], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5736], rdx
	mov	rdx, qword [rbp - 5720]
	sub	rdx, qword [rbp - 5736]
	mov	qword [rbp - 5712], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5752], rdx
	mov	rdx, qword [rbp - 5752]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5744], rdx
	mov	rdx, qword [rbp - 5712]
	add	rdx, qword [rbp - 5744]
	mov	qword [rbp - 5704], rdx
	mov	rdx, qword [rbp - 5632]
	add	rdx, qword [rbp - 5704]
	mov	qword [rbp - 5624], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5784], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5800], rdx
	mov	rdx, qword [rbp - 5800]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5792], rdx
	mov	rdx, qword [rbp - 5784]
	add	rdx, qword [rbp - 5792]
	mov	qword [rbp - 5776], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5808], rdx
	mov	rdx, qword [rbp - 5776]
	sub	rdx, qword [rbp - 5808]
	mov	qword [rbp - 5768], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5840], rdx
	mov	rdx, qword [rbp - 5840]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5832], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5848], rdx
	mov	rdx, qword [rbp - 5832]
	sub	rdx, qword [rbp - 5848]
	mov	qword [rbp - 5824], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5864], rdx
	mov	rdx, qword [rbp - 5864]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5856], rdx
	mov	rdx, qword [rbp - 5824]
	add	rdx, qword [rbp - 5856]
	mov	qword [rbp - 5816], rdx
	mov	rdx, qword [rbp - 5768]
	add	rdx, qword [rbp - 5816]
	mov	qword [rbp - 5760], rdx
	mov	rdx, qword [rbp - 5624]
	sub	rdx, qword [rbp - 5760]
	mov	qword [rbp - 5616], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5904], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5920], rdx
	mov	rdx, qword [rbp - 5920]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5912], rdx
	mov	rdx, qword [rbp - 5904]
	add	rdx, qword [rbp - 5912]
	mov	qword [rbp - 5896], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5928], rdx
	mov	rdx, qword [rbp - 5896]
	sub	rdx, qword [rbp - 5928]
	mov	qword [rbp - 5888], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5960], rdx
	mov	rdx, qword [rbp - 5960]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5952], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5968], rdx
	mov	rdx, qword [rbp - 5952]
	sub	rdx, qword [rbp - 5968]
	mov	qword [rbp - 5944], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 5984], rdx
	mov	rdx, qword [rbp - 5984]
	add	rdx, qword [ B ]
	mov	qword [rbp - 5976], rdx
	mov	rdx, qword [rbp - 5944]
	add	rdx, qword [rbp - 5976]
	mov	qword [rbp - 5936], rdx
	mov	rdx, qword [rbp - 5888]
	add	rdx, qword [rbp - 5936]
	mov	qword [rbp - 5880], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 6016], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 6032], rdx
	mov	rdx, qword [rbp - 6032]
	add	rdx, qword [ B ]
	mov	qword [rbp - 6024], rdx
	mov	rdx, qword [rbp - 6016]
	add	rdx, qword [rbp - 6024]
	mov	qword [rbp - 6008], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 6040], rdx
	mov	rdx, qword [rbp - 6008]
	sub	rdx, qword [rbp - 6040]
	mov	qword [rbp - 6000], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 6072], rdx
	mov	rdx, qword [rbp - 6072]
	add	rdx, qword [ B ]
	mov	qword [rbp - 6064], rdx
	mov	rdx, qword [ A ]
	add	rdx, qword [ B ]
	mov	qword [rbp - 6080], rdx
	mov	rdx, qword [rbp - 6064]
	sub	rdx, qword [rbp - 6080]
	mov	qword [rbp - 6056], rdx
	mov	rdx, qword [ C ]
	sub	rdx, qword [ A ]
	mov	qword [rbp - 6096], rdx
	mov	rdx, qword [rbp - 6096]
	add	rdx, qword [ B ]
	mov	qword [rbp - 6088], rdx
	mov	rdx, qword [rbp - 6056]
	add	rdx, qword [rbp - 6088]
	mov	qword [rbp - 6048], rdx
	mov	rdx, qword [rbp - 6000]
	add	rdx, qword [rbp - 6048]
	mov	qword [rbp - 5992], rdx
	mov	rdx, qword [rbp - 5880]
	sub	rdx, qword [rbp - 5992]
	mov	qword [rbp - 5872], rdx
	mov	rdx, qword [rbp - 5616]
	sub	rdx, qword [rbp - 5872]
	mov	qword [rbp - 5608], rdx
	mov	rdx, qword [rbp - 5120]
	add	rdx, qword [rbp - 5608]
	mov	qword [rbp - 5112], rdx
	mov	rdx, qword [rbp - 4096]
	sub	rdx, qword [rbp - 5112]
	mov	qword [rbp - 4088], rdx
	mov	rax, qword [rbp - 4088]
	mov	qword [ C ], rax
	mov	rax, qword [ A ]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 6104], rax
	mov	rax, qword [rbp - 6104]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 6112], rax
	mov	rax, qword [ B ]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 6120], rax
	mov	rax, qword [rbp - 6120]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 6128], rax
	mov	rax, qword [ C ]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 6136], rax
	mov	rax, qword [rbp - 6136]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 6144], rax
Label_1:
	jmp	Label_4
Label_2:
	mov	rax, qword [ A ]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 6216], rax
	mov	rax, qword [rbp - 6216]
	mov	rdi, rax
	mov	rax, str__0
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 6208], rax
	mov	rax, qword [ B ]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 6224], rax
	mov	rax, qword [rbp - 6208]
	mov	rdi, rax
	mov	rax, qword [rbp - 6224]
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 6192], rax
	mov	rax, qword [rbp - 6192]
	mov	rdi, rax
	mov	rax, str__1
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 6176], rax
	mov	rax, qword [ C ]
	mov	rdi, rax
	call	toString
	mov	qword [rbp - 6232], rax
	mov	rax, qword [rbp - 6176]
	mov	rdi, rax
	mov	rax, qword [rbp - 6232]
	mov	rsi, rax
	call	string.add
	mov	qword [rbp - 6160], rax
	mov	rax, qword [rbp - 6160]
	mov	rdi, rax
	call	println
	mov	qword [rbp - 6240], rax
	mov	rax, 0
	jmp	Label_0
Label_0:
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
	mov     dword [rbp-428H], 0
	mov     dword [rbp-424H], 0
	mov     dword [rbp-420H], 0
	cmp     dword [rbp-434H], 0
	jns     L_002
	neg     dword [rbp-434H]
	mov     dword [rbp-420H], 1
	mov     rax, qword [rbp-418H]
	mov     byte [rax], 45
	jmp     L_002
L_001:  mov     ecx, dword [rbp-434H]
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
	mov     eax, ecx
	mov     dword [rbp-41CH], eax
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
	mov     eax, dword [rbp-428H]
	lea     edx, [rax+1H]
	mov     dword [rbp-428H], edx
	        cdqe
	mov     edx, dword [rbp-41CH]
	mov     dword [rbp+rax*4-410H], edx
L_002:  cmp     dword [rbp-434H], 0
	jnz     L_001
	mov     dword [rbp-424H], 0
	jmp     L_004
L_003:  mov     edx, dword [rbp-424H]
	mov     eax, dword [rbp-420H]
	add     eax, edx
	movsxd  rdx, eax
	mov     rax, qword [rbp-418H]
	add     rdx, rax
	mov     eax, dword [rbp-428H]
	sub     eax, 1
	sub     eax, dword [rbp-424H]
	cdqe
	mov     eax, dword [rbp+rax*4-410H]
	add     eax, 48
	mov     byte [rdx], al
	add     dword [rbp-424H], 1
L_004:  mov     eax, dword [rbp-424H]
	cmp     eax, dword [rbp-428H]
	jl      L_003
	mov     edx, dword [rbp-428H]
	mov     eax, dword [rbp-420H]
	add     eax, edx
	movsxd  rdx, eax
	mov     rax, qword [rbp-418H]
	add     rax, rdx
	mov     byte [rax], 0
	mov     rax, qword [rbp-418H]
	mov     rsi, qword [rbp-8H]
	xor     rsi, qword [fs:abs 28H]
	jz      L_005
	call    __stack_chk_fail
L_005:  leave
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
