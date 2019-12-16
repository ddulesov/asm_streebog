.intel_syntax noprefix

.macro ymm_prolog

	push	rbp
	push	rdi
	push	rsi
	push	rdx
	push	rbx
	push	rcx
	mov		rbp, rsp
	
	sub		rsp, 32 * 10
	and		rsp, 0xFFFFFFFFFFFFFFE0
	
	vmovdqa YMMWORD PTR [rsp], ymm0
	vmovdqa YMMWORD PTR [rsp+32], ymm1
	vmovdqa YMMWORD PTR [rsp+64], ymm2
	vmovdqa YMMWORD PTR [rsp+96], ymm3
	vmovdqa YMMWORD PTR [rsp+128], ymm4
	vmovdqa YMMWORD PTR [rsp+160], ymm5
	vmovdqa YMMWORD PTR [rsp+192], ymm6
	vmovdqa YMMWORD PTR [rsp+224], ymm7
	vmovdqa YMMWORD PTR [rsp+256], ymm8
	vmovdqa YMMWORD PTR [rsp+288], ymm9
	
.endm

.macro ymm_epilog
	vmovdqa ymm0, YMMWORD PTR [rsp]
	vmovdqa ymm1, YMMWORD PTR [rsp+32]
	vmovdqa ymm2, YMMWORD PTR [rsp+64]
	vmovdqa ymm3, YMMWORD PTR [rsp+96]
	vmovdqa ymm4, YMMWORD PTR [rsp+128]
	vmovdqa ymm5, YMMWORD PTR [rsp+160]
	vmovdqa ymm6, YMMWORD PTR [rsp+192]
	vmovdqa ymm7, YMMWORD PTR [rsp+224]
	vmovdqa ymm8, YMMWORD PTR [rsp+256]
	vmovdqa ymm9, YMMWORD PTR [rsp+288]
	
	mov		rsp, rbp
	pop		rcx
	pop		rbx
	pop		rdx
	pop		rsi
	pop		rdi
	pop		rbp

.endm

.section .rodata
	sep_m   : .ascii    "-------------------------------"
	null_m  : .asciz    ""
	ymm_m	: .asciz    "\nymm:"

.section .bss
	.p2align 5,,15
	.comm  buffer, 4096
	
	
.section .rodata
	test_msg:
		.asciz "_test: <%llx> \n"
	printf_i:
		.asciz "v:%llx\n"

.section .text
.extern  printf
.extern  puts

	.p2align 4,,15
_test:
	sub		rsp, 8

	lea		rax, AXC[rip]
	
	vpxor	ymm0, ymm0, ymm0
	vpxor	ymm1, ymm1, ymm1
	
	vmovdqa	ymm9, [rax]
	vperm2f128 ymm1, ymm9, ymm9, 1
	vpxor	   ymm0, ymm1, ymm9
	#vmovdqa	ymm1, ymmword ptr [rax]
	
	lea		rdi, buffer[rip]

	vperm2f128 ymm1, ymm9, ymm9, 1
	
	vmovdqa XMMWORD PTR [rdi], xmm9
	vmovdqa XMMWORD PTR [rdi]+16, xmm1
	#vmovdqa YMMWORD PTR [rdi], ymm0
	#vmovdqa YMMWORD PTR [rdi+32], ymm9
	
	call	_print_ymm
	
	call	_print_ymm
	
	mov		rsi, 64
	call	print_buffer
	
	
	
	vmovdqa	ymm9, AXC[rip]
	xor		rax, rax
	vpextrb	esi, xmm9, 15
	
	lea		rdi, printf_i[rip]
	call	printf
	
	mov		rcx, 0xFFFFFFFF
	vmovdqa	ymm9, AXC[rip]
	vmovdqa	ymm1, AXC[rip]+32
_test_1:	
	
	vpxor	ymm0, ymm0, ymm9
	vpxor	ymm1, ymm1, ymm9
	vperm2f128 ymm1, ymm9, ymm9, 1

	vpxor	ymm1, ymm1, ymm9
	vpxor	ymm0, ymm0, ymm9
	vperm2f128 ymm0, ymm9, ymm9, 1
	
	vpxor	ymm2, ymm2, ymm9
	vpxor	ymm3, ymm3, ymm9
	vperm2f128 ymm3, ymm9, ymm9, 1

	vpxor	ymm0, ymm0, ymm9
	vpxor	ymm1, ymm1, ymm9
	vperm2f128 ymm1, ymm9, ymm9, 1
	
	vpxor	ymm0, ymm0, ymm9
	vpxor	ymm1, ymm1, ymm9
	vperm2f128 ymm1, ymm9, ymm9, 1

	vpxor	ymm1, ymm1, ymm9
	vpxor	ymm0, ymm0, ymm9
	vperm2f128 ymm0, ymm9, ymm9, 1
	
	vpxor	ymm2, ymm2, ymm9
	vpxor	ymm3, ymm3, ymm9
	vperm2f128 ymm3, ymm9, ymm9, 1

	vpxor	ymm0, ymm0, ymm9
	vpxor	ymm1, ymm1, ymm9
	vperm2f128 ymm1, ymm9, ymm9, 1


	vpxor	ymm0, ymm0, ymm9
	vpxor	ymm1, ymm1, ymm9
	vperm2f128 ymm1, ymm9, ymm9, 1

	vpxor	ymm1, ymm1, ymm9
	vpxor	ymm0, ymm0, ymm9
	vperm2f128 ymm0, ymm9, ymm9, 1
	
	vpxor	ymm2, ymm2, ymm9
	vpxor	ymm3, ymm3, ymm9
	vperm2f128 ymm3, ymm9, ymm9, 1

	vpxor	ymm0, ymm0, ymm9
	vpxor	ymm1, ymm1, ymm9
	vperm2f128 ymm1, ymm9, ymm9, 1	
	
	vpxor	ymm0, ymm0, ymm9
	vpxor	ymm1, ymm1, ymm9
	vperm2f128 ymm1, ymm9, ymm9, 1

	vpxor	ymm1, ymm1, ymm9
	vpxor	ymm0, ymm0, ymm9
	vperm2f128 ymm0, ymm9, ymm9, 1
	
	
	dec     rcx


	
	jne	_test_1
	
	add 	rsp, 8
	ret
	
	.p2align 4,,15
_save_ymm:
	mov		rax,  rsp
	sub		rsp,  ( 32 + 32 + 32 + 32 )
	and		rsp, 0xFFFFFFFFFFFFFFE0 #align 32
	
	vmovdqa YMMWORD PTR [rsp], ymm0
	vmovdqa YMMWORD PTR [rsp+32], ymm1
	vmovdqa YMMWORD PTR [rsp+64], ymm2
	vmovdqa YMMWORD PTR [rsp+96], ymm3
	push	rax #for 16bit layout
	push	rax
	mov		rax, 	[rax]
	push	rax
	
	ret
	
	.p2align 4,,15
_restore_ymm:
	pop		rax #ret address
	
	vmovdqa ymm0, YMMWORD PTR [rsp + 16]
	vmovdqa ymm1, YMMWORD PTR [rsp+32 + 16]
	vmovdqa ymm2, YMMWORD PTR [rsp+64 + 16]
	vmovdqa ymm3, YMMWORD PTR [rsp+96 + 16]
	
	pop		rsp
	mov		[rsp], rax #new resp address
	ret
	
	.p2align 4,,15
	
_print_ymm:
	ymm_prolog
	
	mov		rdi, rsp
	call	print_ymm
	
	ymm_epilog
	ret
	
	.p2align 4,,15
_print_buffer:
	push	rcx
	ymm_prolog
	xor		rax, rax
	mov		rsi,  64
	call	print_buffer
	
	ymm_epilog
	pop		rcx
	ret
	
	.p2align 4,,15
_print_contex:
	
	ymm_prolog
	
	call	GOST34112012Dump
	
	ymm_epilog
	ret

.macro print_msg msg
	.section .rodata
		msg\@:           .asciz              "\msg"
	.section .text
	
	ymm_prolog
	xor		rax, rax
	lea		rdi, null_m[rip]
	call	puts	
	lea 	rdi, msg\@[rip]
	call 	puts
	ymm_epilog
	
.endm
	