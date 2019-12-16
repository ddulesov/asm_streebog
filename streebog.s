.intel_syntax noprefix

#.equ _DEBUG, 1
#include "core.h"

.include "const.s"
.include "debug.s"
.include "lps.s"
.include "add.s"
	
.section .text
.extern  printf
.extern  puts
.extern  print_digest
.extern  GOST34112012Dump

.global  stage2
.global  stage3
.global _test
.global update_hash
.global init 
.global GOST34112012Final
.global GOST34112012Update
.global GOST34112012Init
.global GOST34112012Cleanup
.global GOST34112012Hash


sh_bufsize  = 256
sh_digsize  = 260
sh_h		= 0
sh_N		= 64
sh_Sigma	= 128
sh_buffer   = 192


.type     stage2, @function
.type     stage3, @function
.type      _test, @function
.type        lps, @function
.type     g_func, @function
.type       init, @function
.type GOST34112012Final  , @function
.type GOST34112012Update , @function
.type GOST34112012Init   , @function
.type GOST34112012Cleanup, @function
.type GOST34112012Hash   , @function

	.p2align 4,,15
GOST34112012Cleanup:
	mov		esi, dword ptr [rdi + sh_digsize]
	
	.p2align 4,,15
GOST34112012Init:
	#rdi - context
	#rsi - digest size
	mov		rcx,  64
	xor		rax, rax
	mov		r8,  0x0101
	cmp		rsi, 32 #32 bit hash
	cmove	rax, r8
	
	rep		stosb
	xor		al, al
	mov		rcx,  264-64-4	#sizeof(	GOST34112012Context ) - 64
	rep		stosb
	
	mov		dword ptr [rdi], esi
	cmp		rsi, 64 #64 bit hash
	cmove	rax, r8
	shr		rax, 8 #1 - ok, 0 - error
	dec		rax
	ret
	
	.p2align 4,,15
stage2:  #should keep rdi!
	#	rdi - context
	#   rsi - data ptr
	push	rdx
	mov		rdx, rdi
	
	vzeroupper
	prefetcht0 	qword ptr [rdi+64]
	#debug 
.ifdef _DEBUG
	call	_print_contex
	print_msg "stage2"
	
	
	mov		rdi, rsi
	call	_print_buffer
	mov		rdi,  rdx
.endif
	#end debug
	
	# load h
	vmovdqa ymm0, ymmword ptr [rdi + sh_h + 0 ]
	vmovdqa ymm1, ymmword ptr [rdi + sh_h + 32 ]
	
	# load N
	vmovdqa ymm2, ymmword ptr [rdi + sh_N + 0 ]
	vmovdqa ymm3, ymmword ptr [rdi + sh_N + 32 ]
	
	#mov		rbx,  rsi  #rbx - data ptr
	call	g_func #doesn't alter rsi, rdi
	
	#self.n.add(&BUFFER512);
	mov		rax, [rdi + sh_N] #load low qword
	add		rax,  0x0000000000000200;
	mov 	[rdi + sh_N], rax
	
	#self.sigma.add_bytes(data);
	#mov		rsi, rbx
	lea		rdi, [rdi + sh_Sigma]
	add_bytes_macro
	#call	add_bytes
	
	#mov		rdi, [rsp]
	#call	GOST34112012Dump
	mov		rdi, rdx #restore context
	vmovdqa ymmword ptr [rdi + sh_h + 0 ], ymm0
	vmovdqa ymmword ptr [rdi + sh_h + 32 ], ymm1
	
	vzeroupper
	
	pop		rdx
	ret
	
#--------------------------- update hash ------------
	.p2align 4,,15
GOST34112012Update:
	push	rbx
	#rdi    - context
	#rsi    - data pointer
	#rdx    - size 
	
	mov 	r8,  rdi # save context pointer
	
	mov		ebx, dword ptr [r8 + sh_bufsize] 
	cmp		ebx, 0
	je		update_data
	#update buffer
	mov		rcx, 64
	sub		rcx, rbx # chunk_size
	
	cmp		rcx, rdx # chunk_size > data_len
	cmovg	rcx, rdx
	#copy data to buffer
	lea		rdi, [r8 + rbx + sh_buffer]
	
	add		rbx, rcx # bufsize += chunk_size
	sub		rdx, rcx # data_len -= chunk_size
	rep		movsb
	
	mov		dword ptr [r8 + sh_bufsize], ebx # save bufsize
	cmp		rbx, 0
	jne		exit_update
	
	#TODO optimize call stage2
	mov		rbx, rsi #save data pointer
	lea		rsi, [r8 + sh_buffer] #buffer pointer
	mov		rdi, r8
	call	stage2
	mov		rsi, rbx #restore
	
	jmp		update_data
	
	.p2align 3,,10
update_loop:	
	mov		rbx, rsi #save data_ptr
	call	stage2
	sub		rdx, 64
	mov		rsi, rbx #restore
	add		rsi, 64
	
	.p2align 3,,10
update_data:	
	cmp		rdx, 64
	jge		update_loop	
	
	#update buffsize
	mov		rcx, rdx
	mov		rbx, rdi #save rdi
	lea		rdi, [rdi + sh_buffer]
	rep		movsb #copy data to buffer
	mov		dword ptr [rbx + sh_bufsize], edx #save buffsize
	
	.p2align 3,,10
exit_update:	
	vzeroupper
	pop		rbx
	ret
#------------------------stage3 -----------------------------	
	.p2align 4,,15
GOST34112012Final:
stage3:
	push	rbx
	push	rdx
	push	rsi

	vzeroupper
	# rdi - context
	# rsi - digest ptr, can be NULL
	#mov		r8,  rdi  #context
.ifdef _DEBUG
	call	_print_contex
	print_msg "stage3"
.endif
	
	mov		ebx, dword ptr [rdi + sh_bufsize]  #bufsize
	#load h
	vmovdqa ymm0, ymmword ptr [rdi + sh_h + 0 ]
	vmovdqa ymm1, ymmword ptr [rdi + sh_h + 32 ]
	
	mov		rcx, 64
	sub		rcx, rbx  #self.bufsize < 64 {
	je		n_buff
	#pad
	mov		rdx, rdi #save rdi
	lea		rdi,  [rdi + rbx + sh_buffer]
	mov		al, 0x01
	stosb
	
	xor		al, al
	dec		rcx
	#zero  pad 
	rep 	stosb	
	
	#debug  print buffer
.ifdef _DEBUG

	print_msg  "stage3 buffer"
	lea		rdi,  [rdx + sh_buffer]
	call	_print_buffer	
	#end debug
.endif 
	
	mov		rdi, rdx #restore rdi - context
	.p2align 3,,10
n_buff:	
	#self.h.g(&self.n, self.buffer.as_ptr());
	lea		rsi,  [rdi + sh_buffer ]
	# load N
	
	vmovdqa ymm2, ymmword ptr [rdi + sh_N + 0 ]
	vmovdqa ymm3, ymmword ptr [rdi + sh_N + 32 ]
	call	g_func  #rdi, rsi not changed
	
	#buf.b64[0] = (self.bufsize as u64) << 3;
	#self.n.add(&buf);
	
	shl		rbx, 3
	mov		rax, [rdi + sh_N]
	add		rax, rbx
	mov		[rdi + sh_N], rax
	#rbx now free
	
	#self.sigma.add(&self.buffer);
	lea		rsi, [rdi + sh_bufsize]
	lea		rdi, [rdi + sh_Sigma]
	#call	add_bytes
	add_bytes_macro
	mov		rdi, rdx #restore rdi - context
	
	#self.h.g(&BUFFER0, self.n.as_ptr());
	#zerro buffer
	vpxor 	ymm2, ymm2, ymm2
	vpxor 	ymm3, ymm3, ymm3
	lea		rsi, [rdi + sh_N]	
	call	g_func
	
	#self.h.g(&BUFFER0, self.sigma.as_ptr());
	#zerro buffer
	vpxor 	ymm2,  ymm2, ymm2
	vpxor 	ymm3,  ymm3, ymm3
	lea		rsi, [rdi + sh_Sigma]
	call	g_func
	
	#save   ymm0, ymm1 to h
	vmovdqa ymmword ptr [rdi + sh_h + 0 ], ymm0
	vmovdqa ymmword ptr [rdi + sh_h + 32 ], ymm1
	
	#get    digest
	#debug
.ifdef _DEBUG
	call	_print_contex
	#end debug
.endif
	vzeroupper
	
	pop		rsi
	pop		rdx
	pop		rbx
	
	test	rsi, rsi
	jnz		stage3_exit
	ret
	
	.p2align 4,,15
GOST34112012Hash:
stage3_exit:
	#return digest
	
	mov		ecx,  [rdi + sh_digsize ] 
	lea		rax,  [rdi + sh_h + 64]
	mov		rdi,   rsi
	sub		rax,   rcx
	mov		rsi,   rax
	rep		movsb
	
	xor		rax, rax
	ret

	.p2align 4,,15
g_func:
	push	rsi
	push	rbp
	push	rbx
	push	rdx
	
	#reserv 64 byte for lps. beware all subsequents calls must not allocate stack
	#or should be done before lps call
	mov		rbp, rsp
	sub 	rbp, 64 + 8 #reserv buffer and return address (calling lps)
	and		rbp, 0xFFFFFFFFFFFFFFE0
	
	#copy  h -> Y3
	vmovdqa	ymm6, ymm0
	vmovdqa	ymm7, ymm1
	
	#  h xor N -> Y1
	vpxor 	ymm2,  ymm2, ymm0
	vpxor 	ymm3,  ymm3, ymm1
	
	lea		rax, AXC[rip]
	call	lps #Y1 -> Y0
	
	#load data ->Y2 TODO . load using xmm
	#TODO use vmovntdqa  ymm, m256
	vmovdqu ymm4, ymmword ptr [rsi]
	vmovdqu ymm5, ymmword ptr [rsi+32]
	#TODO xor with ymm6,7 in advance
	#vmovdqa	ymm8, ymm4
	#vmovdqa	ymm9, ymm5
	vpxor 	ymm6,  ymm6, ymm4
	vpxor 	ymm7,  ymm7, ymm5
	
	mov 	rcx, 12
	lea		rsi, CXC[rip] # rsi - cx[i]
	
	.p2align 3,,
g_func_loop:
	# Y2 xor Y0 -> Y1  ( D xor key)
	vpxor 	ymm2,  ymm4, ymm0
	vpxor 	ymm3,  ymm5, ymm1
	
	prefetcht0	  byte ptr   [rsi + 64]
	#load CX[i] -> Y2
	vmovdqa ymm4, ymmword ptr [rsi]
	vmovdqa ymm5, ymmword ptr [rsi+32]
	
	#Y2 xor Y0 -> Y2
	vpxor 	ymm4,  ymm4, ymm0
	vpxor 	ymm5,  ymm5, ymm1
	
	#Y1 -> Y0
	call	lps
	#Y2 -> Y1
	vmovdqa	ymm2, ymm4
	vmovdqa	ymm3, ymm5
	#Y0 -> Y2
	vmovdqa	ymm4, ymm0
	vmovdqa	ymm5, ymm1	
	#Y1 -> Y0
	call	lps
	
	add		rsi, CXC_SIZE
	loop	g_func_loop
	
	#end of loop. Y0 xor Y2 -> Y0
	vpxor 	ymm0,  ymm4, ymm0
	vpxor 	ymm1,  ymm5, ymm1	
	#vmovdqu ymm4, YMMWORD [rdi]
	#vmovdqu ymm5, YMMWORD [rdi+32]
	
	#vpxor 	ymm0,  ymm8, ymm0
	#vpxor 	ymm1,  ymm9, ymm1
	
	vpxor 	ymm0,  ymm6, ymm0
	vpxor 	ymm1,  ymm7, ymm1	
g_func_exit:
	pop		rdx
	pop		rbx
	pop		rbp
	pop		rsi
	ret

	