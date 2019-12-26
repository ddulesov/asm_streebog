.intel_syntax noprefix

PROLOG_LEN = 8 
.macro ymm_prolog

	push	rbp
	push	rdi
	push	rsi
	push	rdx
	push	rbx
	push	rcx
	push	rax
	mov		rbp, rsp
	
	
	sub		rsp, 32 * 16
	and		rsp, -32
	
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
	
	vmovdqa YMMWORD PTR [rsp+320], ymm10
	vmovdqa YMMWORD PTR [rsp+352], ymm11
	
	vmovdqa YMMWORD PTR [rsp+384], ymm12
	vmovdqa YMMWORD PTR [rsp+416], ymm13

	vmovdqa YMMWORD PTR [rsp+448], ymm14
	vmovdqa YMMWORD PTR [rsp+480], ymm15	
	
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

	vmovdqa ymm10, YMMWORD PTR [rsp+320]
	vmovdqa ymm11, YMMWORD PTR [rsp+352]

	vmovdqa ymm12, YMMWORD PTR [rsp+384]
	vmovdqa ymm13, YMMWORD PTR [rsp+416]

	vmovdqa ymm14, YMMWORD PTR [rsp+448]
	vmovdqa ymm15, YMMWORD PTR [rsp+480]

	
	mov		rsp, rbp
	pop		rax
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


	
	# .p2align 4,,15
# _save_ymm:
	# mov		rax,  rsp
	# sub		rsp,  ( 32 + 32 + 32 + 32 )
	# and		rsp, 0xFFFFFFFFFFFFFFE0 #align 32
	
	# vmovdqa YMMWORD PTR [rsp], ymm0
	# vmovdqa YMMWORD PTR [rsp+32], ymm1
	# vmovdqa YMMWORD PTR [rsp+64], ymm2
	# vmovdqa YMMWORD PTR [rsp+96], ymm3
	# push	rax #for 16bit layout
	# push	rax
	# mov		rax, 	[rax]
	# push	rax
	
	# ret
	
	# .p2align 4,,15
# _restore_ymm:
	# pop		rax #ret address
	
	# vmovdqa ymm0, YMMWORD PTR [rsp + 16]
	# vmovdqa ymm1, YMMWORD PTR [rsp+32 + 16]
	# vmovdqa ymm2, YMMWORD PTR [rsp+64 + 16]
	# vmovdqa ymm3, YMMWORD PTR [rsp+96 + 16]
	
	# pop		rsp
	# mov		[rsp], rax #new resp address
	# ret

	.p2align 4,,15
_print_g:
	ymm_prolog
	
	mov		rdi, rsp
	xor		rax, rax
	call	print_g
	
	#tail   optimization
	ymm_epilog
	ret		
	
	.p2align 4,,15
	
_print_ymm:
	ymm_prolog
	
	mov		rdi, rsp
	mov		rsi, [rbp + PROLOG_LEN*8]
	
	xor		rax, rax
	call	print_ymm
	
	ymm_epilog
	ret     8
	
	
	
	
	.p2align 4,,15
_print_buffer:
	ymm_prolog
	mov		rdi,	 [rbp + PROLOG_LEN*8]
	xor		rax, rax
	mov		rsi,  64
	call	print_buffer
	
	ymm_epilog
	ret		8
	
	.p2align 4,,15
_print_contex:
	ymm_prolog
	mov		rdi,	 [rbp + PROLOG_LEN*8]
	call	GOST34112012Dump
	ymm_epilog
	ret		8

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
	