.intel_syntax noprefix

.section .rodata
	sep_m   : .asciz    "-------------------------------"

.include "const.s"
	
.section .text
.extern  printf
.extern  puts
.extern  GOST34112012Dump

.global  stage2
.global  stage3

.include "add.s"
.global  add_bytes

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
.type  stage2, @function
.type  stage3, @function


	.p2align 4,,15
	
stage2:
	
	push	rdi
	
	print_msg "stage2"
	
	mov		rdi, [rsp]
	call	GOST34112012Dump
	
	pop		rdi
	ret
	
	.p2align 4,,15
stage3:
	
	push	rdi
	print_msg "stage3"
	
	mov		rdi, [rsp]
	call	GOST34112012Dump
	
	pop		rdi
	ret
	

