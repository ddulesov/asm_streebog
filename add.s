	.p2align 4,,15
add_bytes:
	xor		rcx, rcx
	#push 	rbx
	#push	rdx
	xor		rax, rax
	#clc
	#lahf
	.p2align 3,,10
loop:		
	
	mov		r8, qword ptr [rdi + rcx + 0] 
	mov		r9, qword ptr [rdi + rcx + 8] 
	sahf
	adc		r8, qword ptr [rsi + rcx + 0]
	adc		r9, qword ptr [rsi + rcx + 8]
	lahf
	
	mov 	qword ptr [rdi + rcx + 0], r8
	mov 	qword ptr [rdi + rcx + 8], r9
	
	add		rcx, 16
	cmp		rcx, 64
	jne		loop
	#pop		rdx
	#pop 	rbx
	ret
	
/*	
	mov		rax, qword ptr [rdi + 2*8 + 0] 
	adc		rax, qword ptr [rsi + 2*8 + 0]
	mov 	qword ptr [rdi + 2*8 + 0], rax	
	
	mov		rax, qword ptr [rdi + 3*8 + 0] 
	adc		rax, qword ptr [rsi + 3*8 + 0]
	mov 	qword ptr [rdi + 3*8 + 0], rax
	
	mov		rax, qword ptr [rdi + 4*8 + 0] 
	adc		rax, qword ptr [rsi + 4*8 + 0]
	mov 	qword ptr [rdi + 4*8 + 0], rax
	
	mov		rax, qword ptr [rdi + 5*8 + 0] 
	adc		rax, qword ptr [rsi + 5*8 + 0]
	mov 	qword ptr [rdi + 5*8 + 0], rax	
	
	mov		rax, qword ptr [rdi + 6*8 + 0] 
	adc		rax, qword ptr [rsi + 6*8 + 0]
	mov 	qword ptr [rdi + 6*8 + 0], rax	
	
	mov		rax, qword ptr [rdi + 7*8 + 0] 
	adc		rax, qword ptr [rsi + 7*8 + 0]
	mov 	qword ptr [rdi + 7*8 + 0], rax	
	ret
*/
	
