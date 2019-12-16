	# .p2align 4,,15
# add_bytes:
	# xor		rcx, rcx
	# xor		rax, rax
	
	# .p2align 3,,10
# loop:		
	
	# mov		r8, qword ptr [\src + rcx + 0] 
	# mov		r9, qword ptr [\src + rcx + 8] 
	# sahf	#restore cf
	# adc		qword ptr [\dst + rcx + 0], r8
	# adc		qword ptr [\dst + rcx + 8], r9
	# lahf	#save cf
	
	# add		rcx, 16
	# cmp		rcx, 64
	# jne		loop
	# ret
	
.macro add_bytes_macro	src=rsi, dst=rdi
	.p2align 3,,10
	
add_bytes\@:		
	mov		r8, qword ptr [\src + rcx + 0] 
	mov		r9, qword ptr [\src + rcx + 8] 
	add 	qword ptr [\dst + rcx + 0], r8
	adc		qword ptr [\dst + rcx + 8], r9

	mov		r8, qword ptr [\src + rcx + 16] 
	mov		r9, qword ptr [\src + rcx + 24] 
	adc		qword ptr [\dst + rcx + 16], r8
	adc		qword ptr [\dst + rcx + 24], r9	

	mov		r8, qword ptr [\src + rcx + 32 ]
	mov		r9, qword ptr [\src + rcx + 40] 
	adc		qword ptr [\dst + rcx + 32], r8
	adc		qword ptr [\dst + rcx + 40], r9

	mov		r8, qword ptr [\src + rcx + 48] 
	mov		r9, qword ptr [\src + rcx + 56] 
	adc		qword ptr [\dst + rcx + 48], r8
	adc		qword ptr [\dst + rcx + 56], r9
	
.endm	


	
