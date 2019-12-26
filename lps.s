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
	movzx		r8d,    bl
	movzx		edx,    bh
	
	\op			\acr1, [rax + r8  * 8]  + AXC_SIZE * \ai
	\op			\acr2, [rax + rdx * 8]  + AXC_SIZE * \ai
	
	SHR 		rbx,   16
	
	movzx		r8d,   bl
	movzx		edx,   bh
	\op			\acr3, [rax + r8  * 8]  + AXC_SIZE * \ai
	\op			\acr4, [rax + rdx * 8]  + AXC_SIZE * \ai
	
.endm

.macro lps_opd2  xr1, xr2, xr3, xr4, i

	lps_opd r9, r10, r11, r12, \xr1, \i,   0,  mov
	lps_opd r9, r10, r11, r12, \xr1, \i+2, 1

	lps_opd r9, r10, r11, r12, \xr2, \i,   4
	lps_opd r9, r10, r11, r12, \xr2, \i+2, 5

	lps_opd r9, r10, r11, r12, \xr3, \i,   2
	lps_opd r9, r10, r11, r12, \xr3, \i+2, 3

	lps_opd r9, r10, r11, r12, \xr4, \i,   6
	lps_opd r9, r10, r11, r12, \xr4, \i+2, 7

.endm

#-------------------------------------	
	.p2align 4,,15
.macro lps_macro src1, src2, src3, src4,  dst1, dst2, dst3, dst4 
	xor 	rdx, rdx
	xor		r8,  r8
	
	lps_opd2 \src1, \src2, \src3, \src4, 0
	
	vmovq   \dst1, r9
	vmovq   \dst2, r11
	
	vpinsrq \dst1, \dst1, r10, 1
	vpinsrq \dst2, \dst2, r12, 1
	
	lps_opd2 \src1, \src2, \src3, \src4, 1
	
	vmovq  \dst3, r9
	vmovq  \dst4, r11
	
	vpinsrq \dst3, \dst3, r10, 1
	vpinsrq \dst4, \dst4, r12, 1
	
.endm
