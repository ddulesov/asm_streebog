.intel_syntax noprefix

.macro lps_op acr, ir, xr, i, ai, op=xor
	vpextrb		e\ir, \xr, \i
	\op			\acr, [rax + r\ir*8]  + AXC_SIZE * \ai
	
.endm

BUFS = 8 
.section .text
#-------------------------------------	
	.p2align 4,,15
	#should not use rcx, rdi, rsi!
lps:
	
	lps_op	r8,  dx,xmm2, 0, 0, mov
	lps_op	r8,  dx,xmm2, 0 + 8, 1
	lps_op	r8,  dx,xmm3, 0 + 0, 4
	lps_op	r8,  dx,xmm3, 0 + 8, 5
	
	mov	[rsp]+BUFS   , r8
	
	lps_op	r9,  bx,xmm2, 1    , 0, mov
	lps_op	r9,  bx,xmm2, 1 + 8, 1
	lps_op	r9,  bx,xmm3, 1 + 0, 4
	lps_op	r9,  bx,xmm3, 1 + 8, 5
	
	mov [rsp]+BUFS+8 , r9
	
	lps_op	r10, dx,xmm2, 2, 0, mov
	lps_op	r10, dx,xmm2, 2 + 8, 1
	lps_op	r10, dx,xmm3, 2 + 0, 4
	lps_op	r10, dx,xmm3, 2 + 8, 5
	
	mov	[rsp]+BUFS+16, r10
	
	lps_op	r11, bx,xmm2, 3, 0, mov
	lps_op	r11, bx,xmm2, 3 + 8, 1
	lps_op	r11, bx,xmm3, 3 + 0, 4
	lps_op	r11, bx,xmm3, 3 + 8, 5
	
	mov [rsp]+BUFS+24, r11
	
	lps_op	r8,  dx,xmm2, 4, 0, mov
	lps_op	r8,  dx,xmm2, 4 + 8, 1
	lps_op	r8,  dx,xmm3, 4 + 0, 4
	lps_op	r8,  dx,xmm3, 4 + 8, 5
	
	mov	[rsp]+BUFS+32 , r8
	
	lps_op	r9,  bx,xmm2, 5, 0, mov
	lps_op	r9,  bx,xmm2, 5 + 8, 1
	lps_op	r9,  bx,xmm3, 5 + 0, 4
	lps_op	r9,  bx,xmm3, 5 + 8, 5
	
	mov [rsp]+BUFS+40 , r9
	
	lps_op	r10, dx,xmm2, 6, 0, mov
	lps_op	r10, dx,xmm2, 6 + 8, 1
	lps_op	r10, dx,xmm3, 6 + 0, 4
	lps_op	r10, dx,xmm3, 6 + 8, 5
	
	mov	[rsp]+BUFS+48, r10
	
	lps_op	r11, bx,xmm2, 7, 0, mov
	lps_op	r11, bx,xmm2, 7 + 8, 1
	lps_op	r11, bx,xmm3, 7 + 0, 4
	lps_op	r11, bx,xmm3, 7 + 8, 5

	mov [rsp]+BUFS+56, r11
	
	VEXTRACTI128  xmm2, ymm2, 1
	VEXTRACTI128  xmm3, ymm3, 1
	#vperm2f128 ymm2, ymm2, ymm2, 1
	#vperm2f128 ymm3, ymm3, ymm3, 1

	lps_op	r8,  dx,xmm2, 0, 2, mov
	lps_op	r8,  dx,xmm2, 0 + 8, 3
	lps_op	r8,  dx,xmm3, 0 + 0, 6
	lps_op	r8,  dx,xmm3, 0 + 8, 7
	
	mov	[rsp]+BUFS +64  , r8
	
	lps_op	r9,  bx,xmm2, 1, 2, mov
	lps_op	r9,  bx,xmm2, 1 + 8, 3
	lps_op	r9,  bx,xmm3, 1 + 0, 6
	lps_op	r9,  bx,xmm3, 1 + 8, 7
	
	mov [rsp]+BUFS+64+8 , r9
	
	lps_op	r10, dx,xmm2, 2, 2, mov
	lps_op	r10, dx,xmm2, 2 + 8, 3
	lps_op	r10, dx,xmm3, 2 + 0, 6
	lps_op	r10, dx,xmm3, 2 + 8, 7
	
	mov	[rsp]+BUFS+64+16, r10
	
	lps_op	r11, bx,xmm2, 3, 2, mov
	lps_op	r11, bx,xmm2, 3 + 8, 3
	lps_op	r11, bx,xmm3, 3 + 0, 6
	lps_op	r11, bx,xmm3, 3 + 8, 7
	
	mov [rsp]+BUFS+64+24, r11
	
	lps_op	r8,  dx,xmm2, 4, 2, mov
	lps_op	r8,  dx,xmm2, 4 + 8, 3
	lps_op	r8,  dx,xmm3, 4 + 0, 6
	lps_op	r8,  dx,xmm3, 4 + 8, 7
	
	mov	[rsp]+BUFS+64+32 , r8
	
	lps_op	r9,  bx,xmm2, 5    , 2, mov
	lps_op	r9,  bx,xmm2, 5 + 8, 3
	lps_op	r9,  bx,xmm3, 5 + 0, 6
	lps_op	r9,  bx,xmm3, 5 + 8, 7
	
	mov [rsp]+BUFS+64+40 , r9
	
	lps_op	r10, dx,xmm2, 6    , 2, mov
	lps_op	r10, dx,xmm2, 6 + 8, 3
	lps_op	r10, dx,xmm3, 6 + 0, 6
	lps_op	r10, dx,xmm3, 6 + 8, 7
	
	mov	[rsp]+BUFS+64+48, r10
	
	lps_op	r11, bx,xmm2, 7    , 2, mov
	lps_op	r11, bx,xmm2, 7 + 8, 3
	lps_op	r11, bx,xmm3, 7 + 0, 6
	lps_op	r11, bx,xmm3, 7 + 8, 7
	
	mov [rsp]+BUFS+64+56, r11
	
	vmovdqa	ymm0, [rsp]+BUFS
	vmovdqa	ymm1, [rsp]+BUFS + 32
	
	vpxor	ymm0, ymm0, [rsp]+BUFS+64
	vpxor	ymm1, ymm1, [rsp]+BUFS+96
	

	ret

	
