.intel_syntax noprefix

.macro lps_op acr, ir, xr, i, ai, op=xor
	vpextrb		\ir, \xr, \i
	\op			\acr, [rax + \ir*8] + AXC_SIZE * \ai
	
.endm
#-------------------------------------	
	.p2align 4,,15
	#should not use rcx, rdi, rsi!
lps:
	vperm2f128 ymm9, ymm2, ymm2, 1
	vperm2f128 ymm10, ymm3, ymm3, 1
	
	
	lps_op	r8,  rdx,xmm2, 0    , 0, mov
	lps_op	r8,  rdx,xmm2, 0 + 8, 1
	lps_op	r8,  rdx,xmm3, 0 + 0, 4
	lps_op	r8,  rdx,xmm3, 0 + 8, 5
	
	lps_op	r8,  rdx,xmm9,  0    , 2 
	lps_op	r8,  rdx,xmm9,  0 + 8, 3
	lps_op	r8,  rdx,xmm10, 0 + 0, 6
	lps_op	r8,  rdx,xmm10, 0 + 8, 7
	mov	[rbp]   , r8
	
	lps_op	r9,  rdx,xmm2, 1    , 0,   mov
	lps_op	r9,  rdx,xmm2, 1 + 8, 1
	lps_op	r9,  rdx,xmm3, 1 + 0, 4
	lps_op	r9,  rdx,xmm3, 1 + 8, 5
	
	lps_op	r9,  rdx,xmm9,  1    , 2 
	lps_op	r9,  rdx,xmm9,  1 + 8, 3
	lps_op	r9,  rdx,xmm10, 1 + 0, 6
	lps_op	r9,  rdx,xmm10, 1 + 8, 7
	mov [rbp]+8 , r9
	
	lps_op	r10, rdx,xmm2, 2    , 0, mov
	lps_op	r10, rdx,xmm2, 2 + 8, 1
	lps_op	r10, rdx,xmm3, 2 + 0, 4
	lps_op	r10, rdx,xmm3, 2 + 8, 5

	lps_op	r10, rdx,xmm9,  2    , 2 
	lps_op	r10, rdx,xmm9,  2 + 8, 3
	lps_op	r10, rdx,xmm10, 2 + 0, 6
	lps_op	r10, rdx,xmm10, 2 + 8, 7
	mov	[rbp]+16, r10
	
	lps_op	r11, rdx,xmm2, 3    , 0, mov
	lps_op	r11, rdx,xmm2, 3 + 8, 1
	lps_op	r11, rdx,xmm3, 3 + 0, 4
	lps_op	r11, rdx,xmm3, 3 + 8, 5
	
	lps_op	r11, rdx,xmm9,  3    , 2 
	lps_op	r11, rdx,xmm9,  3 + 8, 3
	lps_op	r11, rdx,xmm10, 3 + 0, 6
	lps_op	r11, rdx,xmm10, 3 + 8, 7
	mov [rbp]+24, r11
	
	lps_op	r8,  rdx,xmm2, 4    , 0, mov
	lps_op	r8,  rdx,xmm2, 4 + 8, 1
	lps_op	r8,  rdx,xmm3, 4 + 0, 4
	lps_op	r8,  rdx,xmm3, 4 + 8, 5
	
	lps_op	r8,  rdx,xmm9,  4    , 2, 
	lps_op	r8,  rdx,xmm9,  4 + 8, 3
	lps_op	r8,  rdx,xmm10, 4 + 0, 6
	lps_op	r8,  rdx,xmm10, 4 + 8, 7
	mov	[rbp]+32 , r8
	
	lps_op	r9,  rdx,xmm2, 5    , 0, mov
	lps_op	r9,  rdx,xmm2, 5 + 8, 1
	lps_op	r9,  rdx,xmm3, 5 + 0, 4
	lps_op	r9,  rdx,xmm3, 5 + 8, 5

	lps_op	r9,  rdx,xmm9,  5    , 2
	lps_op	r9,  rdx,xmm9,  5 + 8, 3
	lps_op	r9,  rdx,xmm10, 5 + 0, 6
	lps_op	r9,  rdx,xmm10, 5 + 8, 7	
	mov [rbp]+40 , r9
	
	lps_op	r10, rdx,xmm2, 6    , 0, mov
	lps_op	r10, rdx,xmm2, 6 + 8, 1
	lps_op	r10, rdx,xmm3, 6 + 0, 4
	lps_op	r10, rdx,xmm3, 6 + 8, 5

	lps_op	r10, rdx,xmm9,  6    , 2
	lps_op	r10, rdx,xmm9,  6 + 8, 3
	lps_op	r10, rdx,xmm10, 6 + 0, 6
	lps_op	r10, rdx,xmm10, 6 + 8, 7
	mov	[rbp]+48, r10
	
	lps_op	r11, rdx,xmm2, 7    , 0, mov
	lps_op	r11, rdx,xmm2, 7 + 8, 1
	lps_op	r11, rdx,xmm3, 7 + 0, 4
	lps_op	r11, rdx,xmm3, 7 + 8, 5

	lps_op	r11, rdx,xmm9,  7    , 2
	lps_op	r11, rdx,xmm9,  7 + 8, 3
	lps_op	r11, rdx,xmm10, 7 + 0, 6
	lps_op	r11, rdx,xmm10, 7 + 8, 7	
	mov [rbp]+56, r11
	
	vmovdqa	ymm0, [rbp]
	vmovdqa	ymm1, [rbp+32]
	
	ret

	
