.intel_syntax noprefix



.include "const.s"
.include "lps.s"
.include "add.s"

#.ifdef _DEBUG
.include "debug.s"
#.endif
	
.section .text


sh_bufsize  = 256
sh_digsize  = 260
sh_h		= 0
sh_N		= 64
sh_Sigma	= 128
sh_buffer   = 192

.type                g   , @function
.type GOST34112012Final  , @function
.type GOST34112012Update , @function
.type GOST34112012Init   , @function
.type GOST34112012Cleanup, @function
.type GOST34112012Hash   , @function

.global GOST34112012Final
.global GOST34112012Update
.global GOST34112012Init
.global GOST34112012Cleanup
.global GOST34112012Hash


#--- cleanup context ---
	.p2align 4,,15
GOST34112012Cleanup:
	mov		esi, dword ptr [rdi + sh_digsize]

#--- init context ---	
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
	
#--- update hash ---
	.p2align 4,,15
GOST34112012Update:
	#rdi    - context
	#rsi    - data pointer
	#rdx    - size 
	push	rbx
	push	rdx
	push	r12
	
	test	rdx, rdx #data size == 0
	jz		exit_update
	test	rsi, rsi #data pointer == NULL
	jz		exit_update
	
	mov 	r12,  rdi # save context pointer
	
	# load h
	vmovdqa ymm0, ymmword ptr [r12 + sh_h + 0 ]
	vmovdqa ymm1, ymmword ptr [r12 + sh_h + 32 ]
	
	mov		r8d, dword ptr [r12 + sh_bufsize] 
    cmp		r8, 0
	mov		rbx,  rsi #data pointer
	je		update_data
	
	mov		rcx, 64
	sub		rcx, r8 # chunk_size (free buffer space)
	
	cmp		rcx, rdx # chunk_size > data_len
	cmovg	rcx, rdx
	#copy data to buffer
	
	#lea		rdi, [r12 + rbx + sh_buffer]
	lea		rdi, [r12 + r8]
	lea		rdi, [rdi + sh_buffer]
	
	add		r8,  rcx # bufsize += chunk_size
	sub		rdx, rcx # data_len -= chunk_size
	rep		movsb  #fill buffer
	
	mov		dword ptr [r12 + sh_bufsize], r8d # save bufsize
	cmp		r8, 64
	jne		exit_update
	
	#TODO optimize call stage2
	mov		rbx, rsi #save data pointer
	lea		rsi, [r12 + sh_buffer] #buffer pointer
	
	.p2align 3,,10
stage_loop:
	PREFETCHNTA 	    [rbx+64]
	#stage2
		
	# load N
	vmovdqa ymm2, ymmword ptr [r12 + sh_N + 0 ]
	vmovdqa ymm3, ymmword ptr [r12 + sh_N + 32 ]

	call	g #doesn't alter rsi, rdi

	#self.n.add(&BUFFER512);
	lea		rdi, [r12 + sh_N] #load low qword
	mov		r10, 0x0000000000000200
	add_bytes512_macro
	
	#self.sigma.add_bytes(data);
	lea		rdi, [r12 + sh_Sigma]
	add_bytes_macro

	.p2align 3,,10
update_data:	

	mov		rsi, rbx #restore
	add		rbx, 64
	sub		rdx, 64
	jnb		stage_loop
	
	add		rdx, 64 #reminder
	#save h
	vmovdqa ymmword ptr [r12 + sh_h + 0 ], ymm0
	vmovdqa ymmword ptr [r12 + sh_h + 32 ], ymm1
	vzeroupper	
	#update buffsize
	mov		rcx, rdx
	mov		dword ptr [r12 + sh_bufsize], edx #save buffsize
	lea		rdi, [r12 + sh_buffer]
	rep		movsb #copy data to buffer
	
	
	.p2align 3,,10
exit_update:	
	
	pop		r12
	pop		rdx
	pop		rbx
	ret
#---finalization---
	.p2align 4,,15
GOST34112012Final:
	push	rbx
	push	rdx
	push	rsi

	# rdi - context
	# rsi - digest ptr, can be NULL	
	mov		ebx, dword ptr [rdi + sh_bufsize]  #bufsize
	#load h
	vmovdqa ymm0, ymmword ptr [rdi + sh_h + 0 ]
	vmovdqa ymm1, ymmword ptr [rdi + sh_h + 32 ]
	
	mov		rcx, 63
	sub		rcx, rbx  #self.bufsize < 64 {
	
	# the situation with bufsize == 64 is imposible. so, remove this check
	#je		n_buff
	#pad
	mov		rdx,   rdi #save rdi
	lea		rdi,  [rdi + rbx]
	lea		rdi,  [rdi + sh_buffer]
	
	mov		al, 0x01
	stosb
	
	xor		al, al
	#zero  pad 
	rep 	stosb	
	
	mov		rdi, rdx #restore rdi - context
#	.p2align 3,,10
#n_buff:	
	#self.h.g(&self.n, self.buffer.as_ptr());
	lea		rsi,  [rdi + sh_buffer ]
	# load N
	
	vmovdqa ymm2, ymmword ptr [rdi + sh_N + 0 ]
	vmovdqa ymm3, ymmword ptr [rdi + sh_N + 32 ]
	call	g  #rdi, rsi not changed
	
	#buf.b64[0] = (self.bufsize as u64) << 3;
	#self.n.add(&buf);
	
	shl		rbx, 3
	lea		rsi, [rdi + sh_N ]
	add_bytes512_macro	rbx, rsi 
	#rbx now free
	
	#self.sigma.add(&self.buffer);
	lea		rsi, [rdi + sh_buffer]
	lea		rdi, [rdi + sh_Sigma]
	#call	add_bytes
	add_bytes_macro
		
	mov		rdi, rdx #restore rdi - context
	
	#self.h.g(&BUFFER0, self.n.as_ptr());
	#zerro buffer
	vpxor 	ymm2, ymm2, ymm2
	vpxor 	ymm3, ymm3, ymm3
	lea		rsi, [rdi + sh_N]	
	call	g
	
	#self.h.g(&BUFFER0, self.sigma.as_ptr());
	#zerro buffer
	vpxor 	ymm2, ymm2, ymm2
	vpxor 	ymm3, ymm3, ymm3
	lea		rsi, [rdi + sh_Sigma]
	call	g
	
	#save   ymm0, ymm1 to h
	vmovdqa ymmword ptr [rdi + sh_h + 0 ], ymm0
	vmovdqa ymmword ptr [rdi + sh_h + 32 ], ymm1
	vzeroupper

	pop		rsi
	pop		rdx
	pop		rbx
	
	test	rsi, rsi
	jnz		stage3_exit
	mov		rax, 1
	ret
	
	.p2align 4,,15
	
GOST34112012Hash:
stage3_exit:
	#return digest
	mov		ecx,  [rdi + sh_digsize ] 
	lea		rax,  [rdi + sh_h + 64]
	mov		rdi,  rsi
	sub		rax,  rcx
	mov		rsi,  rax
	rep		movsb
	
	xor		rax, rax
	ret
#------------------ g function  ---------------------------- 
	.p2align 4,,15
g:
	push	rsi
	push	rbx
	push	rdx
	
	push	r12
	push	r11
	push	r10
	push	r9
		
	vmovdqu ymm4, ymmword ptr [rsi]
	vmovdqu ymm5, ymmword ptr [rsi+32]

	vpxor 	ymm14, ymm0, ymm4
	vpxor 	ymm15, ymm1, ymm5
	
	vpxor 	ymm0, ymm2, ymm0
	vpxor 	ymm1, ymm3, ymm1

	VEXTRACTI128  xmm2, ymm0, 1
	VEXTRACTI128  xmm3, ymm1, 1 #[ xmm0, xmm2, xmm1, xmm3 ]
	
	lea		rax, AXC[rip]
	lea		rsi, CXC[rip] # rsi = cx[i]

	lps_macro xmm0, xmm2, xmm1, xmm3,  xmm8, xmm9, xmm10, xmm11
	
	vmovdqa   xmm0,  xmm8
	vmovdqa   xmm2,  xmm9
	vmovdqa   xmm1,  xmm10
	vmovdqa   xmm3,  xmm11
	
	VEXTRACTI128  xmm6, ymm4, 1
	VEXTRACTI128  xmm7, ymm5, 1 #[ xmm4, xmm6, xmm5, xmm7 ]

	mov		rcx, 12


	
	
	#start loop,  key:Y0(ymm0, ymm1), buffer:Y2(ymm4, ymm5) 
	.p2align 3,,
_loop:
	prefetchnta byte ptr [rsi+ 1 * CXC_SIZE]
	
	
	
	vpxor 	xmm8,  xmm4, xmm0
	vpxor 	xmm9,  xmm6, xmm2
	vpxor 	xmm10, xmm5, xmm1
	vpxor 	xmm11, xmm7, xmm3	
	
	push	3840
	call	_print_ymm
	
	lps_macro  xmm8, xmm9, xmm10, xmm11,  xmm4, xmm6, xmm5, xmm7
	
	
	call	_print_g	
	
	vpxor 	xmm8,  xmm0, xmmword ptr [rsi]
	vpxor 	xmm9,  xmm2, xmmword ptr [rsi+16]
	vpxor 	xmm10, xmm1, xmmword ptr [rsi+32]
	vpxor 	xmm11, xmm3, xmmword ptr [rsi+48]	
	add		rsi,   CXC_SIZE

	lps_macro  xmm8, xmm9, xmm10, xmm11,  xmm0, xmm2, xmm1, xmm3
		
	#call  	_print_g
	
	sub		rcx, 1
	jne		_loop
	
	vpxor 	xmm0,  xmm0, xmm4
	vpxor 	xmm2,  xmm2, xmm6
	vpxor 	xmm1,  xmm1, xmm5		
	vpxor 	xmm3,  xmm3, xmm7
	
	#assemble
	vinserti128   ymm0, ymm0, xmm2, 1
	vinserti128   ymm1, ymm1, xmm3, 1
	
	vpxor 	ymm0,  ymm0, ymm14
	vpxor 	ymm1,  ymm1, ymm15
	
_exit:
	pop		r9
	pop		r10
	pop		r11
	pop		r12
	pop		rdx
	pop		rbx
	pop		rsi
	ret

	