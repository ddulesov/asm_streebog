	# .p2align 4,,15
# add_bytes:
	# xor		rcx, rcx
	# xor		rax, rax
	
	# .p2align 3,,10
# loop:		
	
	# mov		r10, qword ptr [\src + rcx + 0] 
	# mov		r9, qword ptr [\src + rcx + 8] 
	# sahf	#restore cf
	# adc		qword ptr [\dst + rcx + 0], r10
	# adc		qword ptr [\dst + rcx + 8], r9
	# lahf	#save cf
	
	# add		rcx, 16
	# cmp		rcx, 64
	# jne		loop
	# ret
	
.macro add_bytes_macro	src=rsi, dst=rdi
			
	mov		r10, qword ptr [\src +  0] 
	mov		r9, qword ptr [\src +   8] 
	add 	qword ptr [\dst + 0], r10
	adc		qword ptr [\dst + 8], r9

	mov		r10, qword ptr [\src + 16] 
	mov		r9, qword ptr [\src + 24] 
	adc		qword ptr [\dst + 16], r10
	adc		qword ptr [\dst + 24], r9	

	mov		r10, qword ptr [\src + 32 ]
	mov		r9, qword ptr [\src + 40] 
	adc		qword ptr [\dst + 32], r10
	adc		qword ptr [\dst + 40], r9

	mov		r10, qword ptr [\src + 48] 
	mov		r9, qword ptr [\src + 56] 
	adc		qword ptr [\dst +  48], r10
	adc		qword ptr [\dst +  56], r9
	
.endm

.macro add_bytes512_macro  dst=rdi, val=r10
	
	xor		r9, r9
	add 	qword ptr [\dst + 0], \val
	adc		qword ptr [\dst + 8], r9
	adc		qword ptr [\dst + 16], r9
	adc		qword ptr [\dst + 24], r9
	adc		qword ptr [\dst + 32], r9
	adc		qword ptr [\dst + 40], r9
	adc		qword ptr [\dst + 48], r9
	adc		qword ptr [\dst + 56], r9
	
.endm


	
