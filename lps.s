.intel_syntax noprefix

.macro lps_op acr, ir, xr, i, ai, op=xor
	vpextrb		\ir, \xr, \i
	\op			\acr, [rax + \ir*8] + AXC_SIZE * \ai
	
.endm
#-------------------------------------	
	.p2align 4,,15
	
lps:
	lps_op	r8,  rdx,xmm2, 0, 0, mov
	lps_op	r9,  rdx,xmm2, 1, 0, mov
	lps_op	r10, rdx,xmm2, 2, 0, mov
	lps_op	r11, rdx,xmm2, 3, 0, mov
	
	lps_op	r8,  rdx,xmm2, 0 + 8, 1
	lps_op	r9,  rdx,xmm2, 1 + 8, 1
	lps_op	r10, rdx,xmm2, 2 + 8, 1
	lps_op	r11, rdx,xmm2, 3 + 8, 1
	
	lps_op	r8,  rdx,xmm3, 0 + 8, 4
	lps_op	r9,  rdx,xmm3, 1 + 8, 4
	lps_op	r10, rdx,xmm3, 2 + 8, 4
	lps_op	r11, rdx,xmm3, 3 + 8, 4
	
	lps_op	r8,  rdx,xmm3, 0 + 8, 5
	lps_op	r9,  rdx,xmm3, 1 + 8, 5
	lps_op	r10, rdx,xmm3, 2 + 8, 5
	lps_op	r11, rdx,xmm3, 3 + 8, 5
	
	mov	[rbp]   , r8
	mov [rbp]+8 , r9
	mov	[rbp]+16, r10
	mov [rbp]+24, r11
	
	lps_op	r8,  rdx,xmm2, 4, 0, mov
	lps_op	r9,  rdx,xmm2, 5, 0, mov
	lps_op	r10, rdx,xmm2, 6, 0, mov
	lps_op	r11, rdx,xmm2, 7, 0, mov
	
	lps_op	r8,  rdx,xmm2, 4 + 8, 1
	lps_op	r9,  rdx,xmm2, 5 + 8, 1
	lps_op	r10, rdx,xmm2, 6 + 8, 1
	lps_op	r11, rdx,xmm2, 7 + 8, 1
	
	lps_op	r8,  rdx,xmm3, 4 + 8, 4
	lps_op	r9,  rdx,xmm3, 5 + 8, 4
	lps_op	r10, rdx,xmm3, 6 + 8, 4
	lps_op	r11, rdx,xmm3, 7 + 8, 4
	
	lps_op	r8,  rdx,xmm3, 4 + 8, 5
	lps_op	r9,  rdx,xmm3, 5 + 8, 5
	lps_op	r10, rdx,xmm3, 6 + 8, 5
	lps_op	r11, rdx,xmm3, 7 + 8, 5
	
	vmovdqa	ymm0, [rbp]
	mov	[rbp]+32 , r8
	mov [rbp]+40 , r9
	mov	[rbp]+48, r10
	mov [rbp]+56, r11
	
	vperm2f128 ymm0, ymm0, ymm0, 1
	vperm2f128 ymm1, ymm1, ymm1, 1
	
	lps_op	r8,  rdx,xmm2, 0, 2, mov
	lps_op	r9,  rdx,xmm2, 1, 2, mov
	lps_op	r10, rdx,xmm2, 2, 2, mov
	lps_op	r11, rdx,xmm2, 3, 2, mov
	
	lps_op	r8,  rdx,xmm2, 0 + 8, 3
	lps_op	r9,  rdx,xmm2, 1 + 8, 3
	lps_op	r10, rdx,xmm2, 2 + 8, 3
	lps_op	r11, rdx,xmm2, 3 + 8, 3
	
	lps_op	r8,  rdx,xmm3, 0 + 8, 6
	lps_op	r9,  rdx,xmm3, 1 + 8, 6
	lps_op	r10, rdx,xmm3, 2 + 8, 6
	lps_op	r11, rdx,xmm3, 3 + 8, 6
	
	lps_op	r8,  rdx,xmm3, 0 + 8, 7
	lps_op	r9,  rdx,xmm3, 1 + 8, 7
	lps_op	r10, rdx,xmm3, 2 + 8, 7
	lps_op	r11, rdx,xmm3, 3 + 8, 7
	
	vmovdqa	ymm1, [rbp+32]
	mov	[rbp]   , r8
	mov [rbp]+8 , r9
	mov	[rbp]+16, r10
	mov [rbp]+24, r11
	
	lps_op	r8,  rdx,xmm2, 4, 2, mov
	lps_op	r9,  rdx,xmm2, 5, 2, mov
	lps_op	r10, rdx,xmm2, 6, 2, mov
	lps_op	r11, rdx,xmm2, 7, 2, mov
	
	lps_op	r8,  rdx,xmm2, 4 + 8, 3
	lps_op	r9,  rdx,xmm2, 5 + 8, 3
	lps_op	r10, rdx,xmm2, 6 + 8, 3
	lps_op	r11, rdx,xmm2, 7 + 8, 3
	
	lps_op	r8,  rdx,xmm3, 4 + 8, 6
	lps_op	r9,  rdx,xmm3, 5 + 8, 6
	lps_op	r10, rdx,xmm3, 6 + 8, 6
	lps_op	r11, rdx,xmm3, 7 + 8, 6
	
	lps_op	r8,  rdx,xmm3, 4 + 8, 7
	lps_op	r9,  rdx,xmm3, 5 + 8, 7
	lps_op	r10, rdx,xmm3, 6 + 8, 7
	lps_op	r11, rdx,xmm3, 7 + 8, 7
	
	mov	[rbp]+32 , r8
	mov [rbp]+40 , r9
	mov	[rbp]+48, r10
	mov [rbp]+56, r11
	
	vpxor	ymm0, ymm0, [rbp]
	vpxor	ymm1, ymm1, [rbp+32]
	ret
#-------------------------------------	
	.p2align 4,,15
	
	#should not use rcx, rdi, rsi!
lps_bak:
	#rbp - buffer
	#ymm2,3  -> ymm0,1	
	#available  ymm8, ymm9, ymm0, ymm1
	
	#call	_print_ymm
	#swap hi<->lo 128 bit
	
	#-------------- 0 ----------------------
	vpextrb	edx, xmm2, 0
	vpextrb	ebx, xmm2, 1

	mov	r8, [rax + rdx*8] + AXC_SIZE * 0
	mov	r9, [rax + rbx*8] + AXC_SIZE * 0
	
	vpextrb	edx, xmm2, 2
	vpextrb	ebx, xmm2, 3
	
	mov	r10, [rax + rdx*8] + AXC_SIZE * 0
	mov	r11, [rax + rbx*8] + AXC_SIZE * 0
	#----------------
	
	vpextrb	edx, xmm2, 0 + 8
	vpextrb	ebx, xmm2, 1 + 8
	xor	r8, [rax + rdx*8] + AXC_SIZE * 1
	xor	r9, [rax + rbx*8] + AXC_SIZE * 1
	
	vpextrb	edx, xmm2, 2 + 8
	vpextrb	ebx, xmm2, 3 + 8
	xor	r10, [rax + rdx*8] + AXC_SIZE * 1
	xor	r11, [rax + rbx*8] + AXC_SIZE * 1
	
	#----------------
	
	vpextrb	edx, xmm3, 0 
	vpextrb	ebx, xmm3, 1
	xor	r8, [rax + rdx*8] + AXC_SIZE * 4
	xor	r9, [rax + rbx*8] + AXC_SIZE * 4
	
	vpextrb	edx, xmm3, 2 
	vpextrb	ebx, xmm3, 3 
	xor	r10, [rax + rdx*8] + AXC_SIZE * 4
	xor	r11, [rax + rbx*8] + AXC_SIZE * 4
	
	#----------------
	vpextrb	edx, xmm3, 0 + 8
	vpextrb	ebx, xmm3, 1 + 8
	xor	r8, [rax + rdx*8] + AXC_SIZE * 5
	xor	r9, [rax + rbx*8] + AXC_SIZE * 5
	
	vpextrb	edx, xmm3, 2 + 8
	vpextrb	ebx, xmm3, 3 + 8
	xor	r10, [rax + rdx*8] + AXC_SIZE * 5
	xor	r11, [rax + rbx*8] + AXC_SIZE * 5
	
	#--------------------------------------
	#save 1
	mov	[rbp]   , r8
	mov [rbp]+8 , r9
	mov	[rbp]+16, r10
	mov [rbp]+24, r11
	
	#-------------- 1 ----------------------
	vpextrb	edx, xmm2, 4
	vpextrb	ebx, xmm2, 5

	mov	r8, [rax + rdx*8]
	mov	r9, [rax + rbx*8]
	
	vpextrb	edx, xmm2, 6
	vpextrb	ebx, xmm2, 7
	
	mov	r10, [rax + rdx*8]
	mov	r11, [rax + rbx*8]
	
	#----------------
	
	vpextrb	edx, xmm2, 4 + 8
	vpextrb	ebx, xmm2, 5 + 8
	xor	r8, [rax + rdx*8] + AXC_SIZE * 1
	xor	r9, [rax + rbx*8] + AXC_SIZE * 1
	
	vpextrb	edx, xmm2, 6 + 8
	vpextrb	ebx, xmm2, 7 + 8
	xor	r10, [rax + rdx*8] + AXC_SIZE * 1
	xor	r11, [rax + rbx*8] + AXC_SIZE * 1
	
	#----------------
	
	vpextrb	edx, xmm3, 4
	vpextrb	ebx, xmm3, 5
	xor	r8, [rax + rdx*8] + AXC_SIZE * 4
	xor	r9, [rax + rbx*8] + AXC_SIZE * 4
	
	vpextrb	edx, xmm3, 6 
	vpextrb	ebx, xmm3, 7 
	xor	r10, [rax + rdx*8] + AXC_SIZE * 4
	xor	r11, [rax + rbx*8] + AXC_SIZE * 4
	
	#----------------
	
	vpextrb	edx, xmm3, 4 + 8
	vpextrb	ebx, xmm3, 5 + 8
	xor	r8, [rax + rdx*8] + AXC_SIZE * 5
	xor	r9, [rax + rbx*8] + AXC_SIZE * 5
	
	vpextrb	edx, xmm3, 6 + 8
	vpextrb	ebx, xmm3, 7 + 8
	xor	r10, [rax + rdx*8] + AXC_SIZE * 5
	xor	r11, [rax + rbx*8] + AXC_SIZE * 5
	
	mov	[rbp]+32 , r8
	mov [rbp]+40 , r9
	mov	[rbp]+48, r10
	mov [rbp]+56, r11
	
	#-------------- 2 ----------------------
	
	vperm2f128 ymm0, ymm0, ymm0, 1
	vperm2f128 ymm1, ymm1, ymm1, 1
	
	#load
	vmovdqa	ymm0, [rbp]
	vmovdqa	ymm1, [rbp+32]
	
	vpextrb	edx, xmm2, 0
	vpextrb	ebx, xmm2, 1

	mov	r8, [rax + rdx*8] + AXC_SIZE * 2
	mov	r9, [rax + rbx*8] + AXC_SIZE * 2
	
	vpextrb	edx, xmm2, 2
	vpextrb	ebx, xmm2, 3
	
	mov	r10, [rax + rdx*8] + AXC_SIZE * 2
	mov	r11, [rax + rbx*8] + AXC_SIZE * 2
	
	#----------------
	
	vpextrb	edx, xmm2, 0 + 8
	vpextrb	ebx, xmm2, 1 + 8
	xor	r8, [rax + rdx*8] + AXC_SIZE * 3
	xor	r9, [rax + rbx*8] + AXC_SIZE * 3
	
	vpextrb	edx, xmm2, 2 + 8
	vpextrb	ebx, xmm2, 3 + 8
	xor	r10, [rax + rdx*8] + AXC_SIZE * 3
	xor	r11, [rax + rbx*8] + AXC_SIZE * 3
	
	#----------------
	
	vpextrb	edx, xmm3, 0 
	vpextrb	ebx, xmm3, 1
	xor	r8, [rax + rdx*8] + AXC_SIZE * 6
	xor	r9, [rax + rbx*8] + AXC_SIZE * 6
	
	vpextrb	edx, xmm3, 2 
	vpextrb	ebx, xmm3, 3 
	xor	r10, [rax + rdx*8] + AXC_SIZE * 6
	xor	r11, [rax + rbx*8] + AXC_SIZE * 6
	
	#----------------
	
	vpextrb	edx, xmm3, 0 + 8
	vpextrb	ebx, xmm3, 1 + 8
	xor	r8, [rax + rdx*8] + AXC_SIZE * 7
	xor	r9, [rax + rbx*8] + AXC_SIZE * 7
	
	vpextrb	edx, xmm3, 2 + 8
	vpextrb	ebx, xmm3, 3 + 8
	xor	r10, [rax + rdx*8] + AXC_SIZE * 7
	xor	r11, [rax + rbx*8] + AXC_SIZE * 7
	
	mov	[rbp]   , r8
	mov [rbp]+8 , r9
	mov	[rbp]+16, r10
	mov [rbp]+24, r11
	
	#-------------- 3 ----------------------
	vpextrb	edx, xmm2, 4
	vpextrb	ebx, xmm2, 5

	mov	r8, [rax + rdx*8] + AXC_SIZE * 2
	mov	r9, [rax + rbx*8] + AXC_SIZE * 2
	
	vpextrb	edx, xmm2, 6
	vpextrb	ebx, xmm2, 7
	
	mov	r10, [rax + rdx*8] + AXC_SIZE * 2
	mov	r11, [rax + rbx*8] + AXC_SIZE * 2
	
	#----------------
	
	vpextrb	edx, xmm2, 4 + 8
	vpextrb	ebx, xmm2, 5 + 8
	xor	r8, [rax + rdx*8] + AXC_SIZE * 3
	xor	r9, [rax + rbx*8] + AXC_SIZE * 3
	
	vpextrb	edx, xmm2, 6 + 8
	vpextrb	ebx, xmm2, 7 + 8
	xor	r10, [rax + rdx*8] + AXC_SIZE * 3
	xor	r11, [rax + rbx*8] + AXC_SIZE * 3
	
	#----------------
	
	vpextrb	edx, xmm3, 4
	vpextrb	ebx, xmm3, 5
	xor	r8, [rax + rdx*8] + AXC_SIZE * 6
	xor	r9, [rax + rbx*8] + AXC_SIZE * 6
	
	vpextrb	edx, xmm3, 6 
	vpextrb	ebx, xmm3, 7 
	xor	r10, [rax + rdx*8] + AXC_SIZE * 6
	xor	r11, [rax + rbx*8] + AXC_SIZE * 6
	
	#----------------
	
	vpextrb	edx, xmm3, 4 + 8
	vpextrb	ebx, xmm3, 5 + 8
	xor	r8, [rax + rdx*8] + AXC_SIZE * 7
	xor	r9, [rax + rbx*8] + AXC_SIZE * 7
	
	vpextrb	edx, xmm3, 6 + 8
	vpextrb	ebx, xmm3, 7 + 8
	xor	r10, [rax + rdx*8] + AXC_SIZE * 7
	xor	r11, [rax + rbx*8] + AXC_SIZE * 7
	
	mov	[rbp]+32 , r8
	mov [rbp]+40 , r9
	mov	[rbp]+48, r10
	mov [rbp]+56, r11
	
	vpxor	ymm0, ymm0, [rbp]
	vpxor	ymm1, ymm1, [rbp+32]
	
lps_exit:	
	ret
	