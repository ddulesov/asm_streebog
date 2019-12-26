.intel_syntax noprefix

.macro lps_opd acr1, acr2, acr3, acr4, xr, i, ai, op=xor
	vpextrd			ebx,   \xr, \i
	movzx			r8d,    bl
	movzx			edx,    bh
	
	\op				\acr1, [rax + r8  * 8]  + AXC_SIZE * \ai
	\op				\acr2, [rax + rdx * 8]  + AXC_SIZE * \ai
	
	shr 			rbx,   16
	
	movzx			r8d,   bl
	movzx			edx,   bh
	\op				\acr3, [rax + r8  * 8]  + AXC_SIZE * \ai
	\op				\acr4, [rax + rdx * 8]  + AXC_SIZE * \ai
	
.endm

.macro lps_opd2  xr1, xr2, xr3, xr4, i

	lps_opd 		r9, r10, r11, r12, \xr1, \i,   0,  mov
	lps_opd 		r9, r10, r11, r12, \xr1, \i+2, 1

	lps_opd 		r9, r10, r11, r12, \xr2, \i,   2
	lps_opd 		r9, r10, r11, r12, \xr2, \i+2, 3

	lps_opd 		r9, r10, r11, r12, \xr3, \i,   4
	lps_opd 		r9, r10, r11, r12, \xr3, \i+2, 5

	lps_opd 		r9, r10, r11, r12, \xr4, \i,   6
	lps_opd 		r9, r10, r11, r12, \xr4, \i+2, 7

.endm

	
.macro lps_half_macro i, src1, src2, src3, src4,  d1, d2
	lps_opd2 		\src1, \src2, \src3, \src4, \i
	
	vmovq   		\d1, r9
	vmovq   		\d2, r11
	
	vpinsrq 		\d1, \d1, r10, 1
	vpinsrq 		\d2, \d2, r12, 1
.endm

	
.macro lps_macro src1, src2, src3, src4,  dst1, dst2, dst3, dst4 
	#xor 	rdx, rdx
	#xor	r8,  r8
	lps_half_macro 0, \src1, \src2, \src3, \src4, \dst1, \dst2
	lps_half_macro 1, \src1, \src2, \src3, \src4, \dst3, \dst4	
.endm



