.intel_syntax noprefix

.macro lps_op acr1, acr2, xr, i, ai, op=xor
	vpextrw		ebx, \xr, \i
	movzx		r9d, bl
	movzx		dx,  bh
	
	\op			\acr1, [rax + r9 * 8]  + AXC_SIZE * \ai
	\op			\acr2, [rax + rdx * 8]  + AXC_SIZE * \ai
.endm

.macro lps_op2  xr1, xr2, i
	lps_op r10, r11, \xr1, \i,   0,  mov
	lps_op r10, r11, \xr1, \i+4, 1

	lps_op r10, r11, \xr2, \i,   4
	lps_op r10, r11, \xr2, \i+4, 5

	lps_op r10, r11, xmm8, \i,   2
	lps_op r10, r11, xmm8, \i+4, 3

	lps_op r10, r11, xmm9, \i,   6
	lps_op r10, r11, xmm9, \i+4, 7
.endm


.macro lps_opd acr1, acr2, acr3, acr4, xr, i, ai, op=xor
	vpextrd		ebx,   \xr, \i
	movzx		r8d,   bl
	movzx		dx,    bh
	
	\op			\acr1, [rax + r8 * 8]   + AXC_SIZE * \ai
	\op			\acr2, [rax + rdx * 8]  + AXC_SIZE * \ai
	
	SHR 		rbx,   16
	
	movzx		r8d,   bl
	movzx		dx,    bh
	\op			\acr3, [rax + r8 * 8]  + AXC_SIZE * \ai
	\op			\acr4, [rax + rdx * 8]  + AXC_SIZE * \ai
	
.endm

.macro lps_opd2  xr1, xr2, i
	lps_opd r9, r10, r11, r12, \xr1, \i,   0,  mov
	lps_opd r9, r10, r11, r12, \xr1, \i+2, 1

	lps_opd r9, r10, r11, r12, \xr2, \i,   4
	lps_opd r9, r10, r11, r12, \xr2, \i+2, 5

	lps_opd r9, r10, r11, r12, xmm8, \i,   2
	lps_opd r9, r10, r11, r12, xmm8, \i+2, 3

	lps_opd r9, r10, r11, r12, xmm9, \i,   6
	lps_opd r9, r10, r11, r12, xmm9, \i+2, 7

.endm

#-------------------------------------	
	.p2align 4,,15
.macro lps_macro src1=mm2, src2=mm3, dst1=mm0, dst2=mm1
	xor 	rdx, rdx
	
	VEXTRACTI128  xmm8, y\src1, 1
	VEXTRACTI128  xmm9, y\src2, 1
	
	#available  to use: dst1, dst2, xmm10
	lps_opd2 x\src1, x\src2, 0
	
	vmovq  x\dst1, r9
	vpinsrq x\dst1, x\dst1, r10, 1
	
	vmovq  x\dst2, r11
	vpinsrq x\dst2, x\dst2, r12, 1
	
	vinserti128   y\dst1, y\dst1, x\dst2, 1
	
	#available  to use: dst2, xmm10 
	
	lps_opd2 x\src1, x\src2, 1
	
	vmovq  xmm10, r9
	vpinsrq xmm10, xmm10, r10, 1
	
	vmovq  x\dst2, r11
	vpinsrq x\dst2, x\dst2, r12, 1
	
	vinserti128   y\dst2, ymm10, x\dst2, 1

	#available  to use:  xmm10 
	
	
	
.endm
