.intel_syntax noprefix

.section .rodata
	sep_m   : .asciz    "-------------------------------"
	ymm_m	: .asciz    "\nymm:"

.section .bss
	.p2align 5,,15
	.comm  buffer, 64
	
	
.section .rodata
	test_msg:
		.asciz "_test: <%llx> \n"

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
	
	mov		rsi, 64
	call	print_buffer
	
	mov		rax, 64
	sub		rax, 64
	jl		next_
	
	lea		rdi, ymm_m[rip]
	call	puts
next_:

	lea		rdi, ymm_m[rip]
	call	puts
	
	add		rsp, 8
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
	push	rdi
	push	rsi
	push	rcx	
	
	call	_save_ymm
	lea		rdi, ymm_m[rip]
	call	puts
	call	_restore_ymm
	
	lea		rdi, buffer[rip]

	vmovdqa YMMWORD PTR [rdi], ymm0
	vmovdqa YMMWORD PTR [rdi+32], ymm1
	mov		rsi, 64
	call	_save_ymm
	call	print_buffer
	call	_restore_ymm

	lea		rdi, buffer[rip]
	vmovdqa YMMWORD PTR [rdi], ymm2
	vmovdqa YMMWORD PTR [rdi + 32 ], ymm3
	mov		rsi, 64
	
	call	_save_ymm
	call	print_buffer
	call	_restore_ymm
	
	#zero fill buffer
	# lea		rdi, buffer[rip]
	# mov		al, 0xF0
	# mov 	rcx, 64
	# rep		stosb
	# lea		rdi, buffer[rip]
	# mov	rsi, 64
	# call	_save_ymm
	# call	print_buffer
	# call	_restore_ymm
	
	#print line
	lea		rdi, sep_m[rip]
	call	puts
	
	pop 	rcx
	pop		rsi	
	pop		rdi
	ret
	
	.p2align 4,,15
_print_buffer:
	push	rdi
	push	rsi
	push	rcx
	
	mov		rsi,  64
	call	print_buffer
	
	pop 	rcx
	pop		rsi
	pop		rdi
	ret
	