.intel_syntax noprefix

.macro lps_op acr, ir, xr, i, ai, op=xor
	vpextrb		e\ir, \xr, \i
	\op			\acr, [rax + r\ir * 8]  + AXC_SIZE * \ai
	
.endm

#ymm8 - ymm12 free to use 

.macro lps_macro src1=mm2, src2=mm3, dst1=mm0, dst2=mm1
	
	VEXTRACTI128  x\dst1, y\src1, 1
	VEXTRACTI128  x\dst2, y\src2, 1
	#0
	lps_op	r8,  bx, x\src1, 0	  , 0, mov
	lps_op	r9,  dx, x\src1, 1    , 0, mov
	lps_op	r10, bx, x\src1, 2	  , 0, mov
	lps_op	r11, dx, x\src1, 3	  , 0, mov
	
	lps_op	r8,  bx, x\src1, 0 + 8, 1
	lps_op	r9,  dx, x\src1, 1 + 8, 1
	lps_op	r10, bx, x\src1, 2 + 8, 1
	lps_op	r11, dx, x\src1, 3 + 8, 1
	
	lps_op	r8,  bx, x\src2, 0 + 0, 4
	lps_op	r9,  dx, x\src2, 1 + 0, 4
	lps_op	r10, bx, x\src2, 2 + 0, 4
	lps_op	r11, dx, x\src2, 3 + 0, 4
	
	lps_op	r8,  bx, x\src2, 0 + 8, 5
	lps_op	r9,  dx, x\src2, 1 + 8, 5
	lps_op	r10, bx, x\src2, 2 + 8, 5
	lps_op	r11, dx, x\src2, 3 + 8, 5
	
	lps_op	r8,  bx, x\dst1, 0	  , 2
	lps_op	r9,  dx, x\dst1, 1	  , 2
	lps_op	r10, bx, x\dst1, 2	  , 2
	lps_op	r11, dx, x\dst1, 3    , 2 
	
	lps_op	r8,  bx, x\dst1, 0 + 8, 3
	lps_op	r9,  dx, x\dst1, 1 + 8, 3
	lps_op	r10, bx, x\dst1, 2 + 8, 3
	lps_op	r11, dx, x\dst1, 3 + 8, 3
	
	lps_op	r8,  bx, x\dst2, 0 + 0, 6
	lps_op	r9,  dx, x\dst2, 1 + 0, 6
	lps_op	r10, bx, x\dst2, 2 + 0, 6
	lps_op	r11, dx, x\dst2, 3 + 0, 6
	
	lps_op	r8,  bx, x\dst2, 0 + 8, 7
	lps_op	r9,  dx, x\dst2, 1 + 8, 7
	lps_op	r10, bx, x\dst2, 2 + 8, 7
	lps_op	r11, dx, x\dst2, 3 + 8, 7
	
	mov	[rsp]+0  , r8
	mov [rsp]+8 , r9
	mov	[rsp]+16, r10
	mov [rsp]+24, r11
	
	#4
	lps_op	r8,  bx, x\src1, 4	  , 0, mov
	lps_op	r9,  dx, x\src1, 5    , 0, mov
	lps_op	r10, bx, x\src1, 6    , 0, mov
	lps_op	r11, dx, x\src1, 7    , 0, mov
	
	lps_op	r8,  bx, x\src1, 4 + 8, 1
	lps_op	r9,  dx, x\src1, 5 + 8, 1
	lps_op	r10, bx, x\src1, 6 + 8, 1
	lps_op	r11, dx, x\src1, 7 + 8, 1
	
	lps_op	r8,  bx, x\src2, 4 + 0, 4
	lps_op	r9,  dx, x\src2, 5 + 0, 4
	lps_op	r10, bx, x\src2, 6 + 0, 4
	lps_op	r11, dx, x\src2, 7 + 0, 4
	
	lps_op	r8,  bx, x\src2, 4 + 8, 5
	lps_op	r9,  dx, x\src2, 5 + 8, 5
	lps_op	r10, bx, x\src2, 6 + 8, 5
	lps_op	r11, dx, x\src2, 7 + 8, 5
	
	lps_op	r8,  bx, x\dst1, 4	  , 2 
	lps_op	r9,  dx, x\dst1, 5    , 2 
	lps_op	r10, bx, x\dst1, 6    , 2
	lps_op	r11, dx, x\dst1, 7    , 2
	
	lps_op	r8,  bx, x\dst1, 4 + 8, 3
	lps_op	r9,  dx, x\dst1, 5 + 8, 3
	lps_op	r10, bx, x\dst1, 6 + 8, 3
	lps_op	r11, dx, x\dst1, 7 + 8, 3
	
	lps_op	r8,  bx, x\dst2, 4 + 0, 6
	lps_op	r9,  dx, x\dst2, 5 + 0, 6
	lps_op	r10, bx, x\dst2, 6 + 0, 6
	lps_op	r11, dx, x\dst2, 7 + 0, 6
	
	lps_op	r8,  bx, x\dst2, 4 + 8, 7
	lps_op	r9,  dx, x\dst2, 5 + 8, 7
	lps_op	r10, bx, x\dst2, 6 + 8, 7
	lps_op	r11, dx, x\dst2, 7 + 8, 7
	
	mov	[rsp]+32 , r8
	mov [rsp]+40 , r9
	mov	[rsp]+48, r10
	mov [rsp]+56, r11
	
	vmovdqa	y\dst1, [rsp]
	vmovdqa	y\dst2, [rsp] + 32
	
.endm
