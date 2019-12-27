	# .p2align 4,,15

	
# .macro add_block  src, dst, i
	# mov	r10, 	qword ptr [\src + \i] 
	# mov	r9, 	qword ptr [\src + \i+8] 
	# adcx 	r10, 	qword ptr [\dst + \i]
	# adcx	r9, 	qword ptr [\dst + \i+8]
	# mov	qword ptr [\dst + \i], r10 
	# mov	qword ptr [\dst + \i+8], r9

# .endm
	
# .macro add_bytes_macro	src=rsi, dst=rdi
	# clc
	# add_block \src, \dst, 0
	# add_block \src, \dst, 16
	# add_block \src, \dst, 32
	# add_block \src, \dst, 48
		
# .endm
	
.macro add_bytes_macro	src=rsi, dst=rdi
	xor		eax, eax
	xor 	rcx, rcx
_add\@:	
	add		al, -1
	mov		r9, qword ptr [\src +  rcx + 0 ] 
	adc 	qword ptr [\dst + rcx + 0 ], r9
	mov		r9, qword ptr [\src +  rcx+ 8 ] 
	adc		qword ptr [\dst + rcx + 8], r9
	
	setb	al
	add     rcx, 16
	cmp		rcx, 64
	jne		_add\@
		
.endm

.macro add_bytes512_macro  val=r10, dst=rdi
	
	add 	qword ptr [\dst + 0], \val
	xor 	\val, \val
	adc		qword ptr [\dst + 8], \val
	adc		qword ptr [\dst + 16], \val
	adc		qword ptr [\dst + 24], \val
	adc		qword ptr [\dst + 32], \val
	adc		qword ptr [\dst + 40], \val
	adc		qword ptr [\dst + 48], \val
	adc		qword ptr [\dst + 56], \val
	
.endm


	
