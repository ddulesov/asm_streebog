.intel_syntax noprefix

.macro lps_op acr, ir, xr, i, ai, op=xor
	vpextrb		e\ir, \xr, \i
	\op			\acr, [rax + r\ir * 8]  + AXC_SIZE * \ai
	
.endm

.macro lps_op2 acr , xr, i, ai1, ai2, op=xor
	vpextrb		ebx, \xr, \i
	vpextrb		edx, \xr, \i + 8
	\op			\acr, [rax + rbx * 8]  + AXC_SIZE * \ai1
	xor			\acr, [rax + rdx * 8]  + AXC_SIZE * \ai2
	
.endm

.macro lps_op3 acr, i, x1, x2, x3, x4 
	lps_op2 \acr,  \x1,  \i,    0,1, mov
	lps_op2 \acr,  \x2,  \i,    4,5
	lps_op2 \acr,  \x3,  \i,    2,3
	lps_op2 \acr,  \x4,  \i,    6,7
.endm
#-------------------------------------	
	.p2align 4,,15
.macro lps_macro src1=mm2, src2=mm3, dst1=mm0, dst2=mm1
	
	VEXTRACTI128  x\dst1, y\src1, 1
	VEXTRACTI128  x\dst2, y\src2, 1
	
	lps_op3 r8, 0, x\src1, x\src2, x\dst1, x\dst2
	mov	[rsp]+0  , r8

	#1
	lps_op3 r9, 1, x\src1, x\src2, x\dst1, x\dst2
	mov [rsp]+8 , r9

	#2
	lps_op3 r10, 2, x\src1, x\src2, x\dst1, x\dst2
	mov	[rsp]+16, r10
	
	lps_op3 r11, 3, x\src1, x\src2, x\dst1, x\dst2
	mov [rsp]+24, r11

	lps_op3 r8, 4, x\src1, x\src2, x\dst1, x\dst2
	mov	[rsp]+32 , r8
	
	lps_op3 r9, 5, x\src1, x\src2, x\dst1, x\dst2
	mov [rsp]+40 , r9
	
	lps_op3 r10, 6, x\src1, x\src2, x\dst1, x\dst2
	mov	[rsp]+48, r10

	lps_op3 r11, 7, x\src1, x\src2, x\dst1, x\dst2
	mov [rsp]+56, r11
	
	vmovdqa	y\dst1, [rsp]
	vmovdqa	y\dst2, [rsp] + 32
	
.endm
