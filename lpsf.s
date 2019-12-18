BUFS = 8 
.section .text
#-------------------------------------	
	.p2align 4,,15
	#should not use rcx, rdi, rsi!
lps:
		
	VEXTRACTI128  xmm0, ymm2, 1
	VEXTRACTI128  xmm1, ymm3, 1
	#0
	lps_op	r8,  dx,xmm2, 0, 0, mov
	lps_op	r8,  dx,xmm2, 0 + 8, 1
	lps_op	r8,  dx,xmm3, 0 + 0, 4
	lps_op	r8,  dx,xmm3, 0 + 8, 5
	
	lps_op	r8,  bx,xmm0, 0, 2, 
	lps_op	r8,  bx,xmm0, 0 + 8, 3
	lps_op	r8,  bx,xmm1, 0 + 0, 6
	lps_op	r8,  bx,xmm1, 0 + 8, 7
	
	#1
	lps_op	r9,  dx,xmm2, 1    , 0, mov
	lps_op	r9,  dx,xmm2, 1 + 8, 1
	lps_op	r9,  dx,xmm3, 1 + 0, 4
	lps_op	r9,  dx,xmm3, 1 + 8, 5
	
	lps_op	r9,  bx,xmm0, 1, 2, 
	lps_op	r9,  bx,xmm0, 1 + 8, 3
	lps_op	r9,  bx,xmm1, 1 + 0, 6
	lps_op	r9,  bx,xmm1, 1 + 8, 7
	
	#2
	lps_op	r10, dx,xmm2, 2, 0, mov
	lps_op	r10, dx,xmm2, 2 + 8, 1
	lps_op	r10, dx,xmm3, 2 + 0, 4
	lps_op	r10, dx,xmm3, 2 + 8, 5
	
	lps_op	r10, bx,xmm0, 2, 2, 
	lps_op	r10, bx,xmm0, 2 + 8, 3
	lps_op	r10, bx,xmm1, 2 + 0, 6
	lps_op	r10, bx,xmm1, 2 + 8, 7
	
	#3
	lps_op	r11, dx,xmm2, 3, 0, mov
	lps_op	r11, dx,xmm2, 3 + 8, 1
	lps_op	r11, dx,xmm3, 3 + 0, 4
	lps_op	r11, dx,xmm3, 3 + 8, 5
	
	lps_op	r11, bx,xmm0, 3, 2, 
	lps_op	r11, bx,xmm0, 3 + 8, 3
	lps_op	r11, bx,xmm1, 3 + 0, 6
	lps_op	r11, bx,xmm1, 3 + 8, 7
	
	mov	[rsp]+BUFS   , r8
	mov [rsp]+BUFS+8 , r9
	mov	[rsp]+BUFS+16, r10
	mov [rsp]+BUFS+24, r11
	
	#4
	lps_op	r8,  dx,xmm2, 4, 0, mov
	lps_op	r8,  dx,xmm2, 4 + 8, 1
	lps_op	r8,  dx,xmm3, 4 + 0, 4
	lps_op	r8,  dx,xmm3, 4 + 8, 5
	
	lps_op	r8,  bx,xmm0, 4, 2, 
	lps_op	r8,  bx,xmm0, 4 + 8, 3
	lps_op	r8,  bx,xmm1, 4 + 0, 6
	lps_op	r8,  bx,xmm1, 4 + 8, 7
	
	#5
	lps_op	r9,  dx,xmm2, 5, 0, mov
	lps_op	r9,  dx,xmm2, 5 + 8, 1
	lps_op	r9,  dx,xmm3, 5 + 0, 4
	lps_op	r9,  dx,xmm3, 5 + 8, 5
	
	lps_op	r9,  bx,xmm0, 5    , 2, 
	lps_op	r9,  bx,xmm0, 5 + 8, 3
	lps_op	r9,  bx,xmm1, 5 + 0, 6
	lps_op	r9,  bx,xmm1, 5 + 8, 7
	
	#6
	lps_op	r10, dx,xmm2, 6, 0, mov
	lps_op	r10, dx,xmm2, 6 + 8, 1
	lps_op	r10, dx,xmm3, 6 + 0, 4
	lps_op	r10, dx,xmm3, 6 + 8, 5
	
	lps_op	r10, bx,xmm0, 6    , 2, 
	lps_op	r10, bx,xmm0, 6 + 8, 3
	lps_op	r10, bx,xmm1, 6 + 0, 6
	lps_op	r10, bx,xmm1, 6 + 8, 7
	
	#7
	lps_op	r11, dx,xmm2, 7, 0, mov
	lps_op	r11, dx,xmm2, 7 + 8, 1
	lps_op	r11, dx,xmm3, 7 + 0, 4
	lps_op	r11, dx,xmm3, 7 + 8, 5

	lps_op	r11, bx,xmm0, 7    , 2, 
	lps_op	r11, bx,xmm0, 7 + 8, 3
	lps_op	r11, bx,xmm1, 7 + 0, 6
	lps_op	r11, bx,xmm1, 7 + 8, 7
	
	mov	[rsp]+BUFS+32 , r8
	mov [rsp]+BUFS+40 , r9
	mov	[rsp]+BUFS+48, r10
	mov [rsp]+BUFS+56, r11
	
	vmovdqa	ymm0, [rsp]+BUFS
	vmovdqa	ymm1, [rsp]+BUFS + 32
	
	ret