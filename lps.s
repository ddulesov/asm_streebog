# Copyright (c) 2020, Dmitry Dulesov  <dmitry.dulesov@gmail.com>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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



