.intel_syntax noprefix

.include "const.s"
.include "debug.s"
	
.section .text
.extern  printf
.extern  puts
.extern  print_digest
.extern  GOST34112012Dump

.global  stage2
.global  stage3
.global _test
.global update_hash

.include "add.s"
.global  add_bytes

sh_bufsize  = 256
sh_digsize  = 260
sh_h		= 0
sh_N		= 64
sh_Sigma	= 128
sh_buffer   = 192

.macro print_msg msg
	.section .rodata
		msg\@:           .asciz              "\msg"
	.text
	
	lea		rdi, sep_m[rip]
	call	puts	
	lea 	rdi, msg\@[rip]
	call 	puts
.endm

.type  add_bytes, @function
.type     stage2, @function
.type     stage3, @function
.type      _test, @function
.type        lps, @function
.type     g_func, @function

	.p2align 4,,15
stage2:
	#	rdi - context
	#   rsi - data ptr

	push	rbx
	mov		r8, rdi
	
	# load h
	vmovdqa ymm0, ymmword ptr [r8 + sh_h + 0 ]
	vmovdqa ymm1, ymmword ptr [r8 + sh_h + 32 ]
	
	# load N
	vmovdqa ymm2, ymmword ptr [r8 + sh_N + 0 ]
	vmovdqa ymm3, ymmword ptr [r8 + sh_N + 32 ]
	
	#mov		rbx,  rsi  #rbx - data ptr
	call	g_func #don't alter rsi
	
	#self.n.add(&BUFFER512);
	mov		rax, [r8 + sh_N] #load low qword
	add		rax,  0x0000000000000200;
	mov 	[r8 + sh_N], rax
	
	#self.sigma.add_bytes(data);
	#mov		rsi, rbx
	lea		rdi, [r8 + sh_Sigma]
	call	add_bytes
	
	#mov		rdi, [rsp]
	#call	GOST34112012Dump
	vmovdqa ymmword ptr [r8 + sh_h + 0 ], ymm0
	vmovdqa ymmword ptr [r8 + sh_h + 32 ], ymm1
	
	vzeroupper
	
	pop		rbx
	ret
	
	.p2align 4,,15
update_hash:
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

	mov		rdi, r8
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
	lea		rdi, [r8 + sh_buffer]
	rep		movsb #copy data to buffer
	mov		dword ptr [r8 + sh_bufsize], edx #save buffsize
	
	.p2align 3,,10
exit_update:	
	vzeroupper
	pop		rbx
	ret
	
	.p2align 4,,15
stage3:
	push	rbx

	# rdi - context
	# rsi - digest ptr, can be NULL
	mov		r8,  rdi  #context
	mov 	r9,	 rsi
	
	#print_msg "stage3"
	
	mov		ebx, dword ptr [r8 + sh_bufsize]  #bufsize
	#load h
	vmovdqa ymm0, ymmword ptr [r8 + sh_h + 0 ]
	vmovdqa ymm1, ymmword ptr [r8 + sh_h + 32 ]
	
	mov		rcx, 64
	sub		rcx, rbx  #self.bufsize < 64 {
	je		n_buff
	#pad
	
	lea		rdi,  [r8 + rbx + sh_buffer]
	mov		al, 0x01
	stosb
	
	xor		al, al
	dec		rcx
	#zero  pad 
	rep 	stosb	

	.p2align 3,,10
n_buff:	
	#self.h.g(&self.n, self.buffer.as_ptr());
	lea		rsi,  [r8 + sh_buffer ]
	# load N
	
	vmovdqa ymm2, ymmword ptr [r8 + sh_N + 0 ]
	vmovdqa ymm3, ymmword ptr [r8 + sh_N + 32 ]
	call	g_func
	
	#buf.b64[0] = (self.bufsize as u64) << 3;
	#self.n.add(&buf);
	
	shl		rbx, 3
	mov		rax, [r8 + sh_N]
	add		rax, rbx
	mov		[r8 + sh_N], rax
	
	#self.sigma.add(&self.buffer);
	lea		rsi, [r8 + sh_bufsize]
	lea		rdi, [r8 + sh_Sigma]
	call	add_bytes
	
	#self.h.g(&BUFFER0, self.n.as_ptr());
	#zerro buffer
	vpxor 	ymm2,  ymm2, ymm2
	vpxor 	ymm3,  ymm3, ymm3
	lea		rsi, [r8 + sh_N]
	call	g_func
	
	#self.h.g(&BUFFER0, self.sigma.as_ptr());
	#zerro buffer
	vpxor 	ymm2,  ymm2, ymm2
	vpxor 	ymm3,  ymm3, ymm3
	lea		rsi, [r8 + sh_Sigma]
	call	g_func
	
	#save   ymm0, ymm1 to h
	vmovdqa ymmword ptr [r8 + sh_h + 0 ], ymm0
	vmovdqa ymmword ptr [r8 + sh_h + 32 ], ymm1
	
	#get    digest
	mov		rax, 1
	pop		rbx
	test	r9,	 r9
	jnz		stage3_exit
	ret
	
	.p2align 3,,10
stage3_exit:
	#return digest
	lea		rcx,  [r8 + sh_digsize ] 
	mov		rdi,   r9
	lea		rsi,  [r8 + sh_buffer + 64]
	sub		rsi,   rcx
	rep		movsb
	
	xor		rax, rax
	ret

	.p2align 4,,15
g_func:
	push	rsi
	#copy  h -> Y3
	vmovdqa	ymm6, ymm0
	vmovdqa	ymm7, ymm1
	
	#  h xor N -> Y1
	vpxor 	ymm2,  ymm2, ymm0
	vpxor 	ymm3,  ymm3, ymm1
	call	lps #Y1 -> Y0
	
	#load data ->Y2 TODO . load using xmm
	vmovdqu ymm4, ymmword ptr [rsi]
	vmovdqu ymm5, ymmword ptr [rsi+32]
	#TODO xor with ymm6,7 in advance
	vmovdqa	ymm8, ymm4
	vmovdqa	ymm9, ymm5
	
	mov 	rcx, 12
	lea		rsi, CXC[rip] # rsi - cx[i]
	
	.p2align 3,,
g_func_loop:
	# Y2 xor Y0 -> Y1  ( D xor key)
	vpxor 	ymm2,  ymm4, ymm0
	vpxor 	ymm3,  ymm5, ymm1
	
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
	vpxor 	ymm0,  ymm8, ymm0
	vpxor 	ymm1,  ymm9, ymm1
	
	vpxor 	ymm0,  ymm6, ymm0
	vpxor 	ymm1,  ymm7, ymm1	

	pop	rsi
	ret
#-------------------------------------	
	.p2align 4,,15
lps:
	#ymm0,1  -> ymm2,3
	ret
	