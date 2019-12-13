.intel_syntax noprefix


.section .rodata
	sep_m   : .asciz    "-------------------------------"


.section .text
.extern  printf
.extern  puts
.extern  GOST34112012Dump

.global  stage2
.global  stage3


.macro print_msg msg
	.section .rodata
		msg\@:           .asciz              "\msg"
	.text
	lea		rdi, sep_m[rip]
	call	puts	
	lea 	rdi, msg\@[rip]
	call 	puts
.endm


.type  stage2, @function
.type  stage3, @function

stage2:
	
	push	rdi
	
	print_msg "stage2"
	
	mov		rdi, [rsp]
	call	GOST34112012Dump
	
	pop		rdi
	ret
	
stage3:
	
	push	rdi
	print_msg "stage3"
	
	mov		rdi, [rsp]
	call	GOST34112012Dump
	
	pop		rdi
	ret
	

