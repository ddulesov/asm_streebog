
./build/asm_streebog:     file format elf64-x86-64


Disassembly of section .init:

00000000004004f0 <_init>:
  4004f0:	48 83 ec 08          	sub    $0x8,%rsp
  4004f4:	48 8b 05 fd 6a 20 00 	mov    0x206afd(%rip),%rax        # 606ff8 <__gmon_start__>
  4004fb:	48 85 c0             	test   %rax,%rax
  4004fe:	74 02                	je     400502 <_init+0x12>
  400500:	ff d0                	callq  *%rax
  400502:	48 83 c4 08          	add    $0x8,%rsp
  400506:	c3                   	retq   

Disassembly of section .plt:

0000000000400510 <.plt>:
  400510:	ff 35 f2 6a 20 00    	pushq  0x206af2(%rip)        # 607008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400516:	ff 25 f4 6a 20 00    	jmpq   *0x206af4(%rip)        # 607010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40051c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400520 <puts@plt>:
  400520:	ff 25 f2 6a 20 00    	jmpq   *0x206af2(%rip)        # 607018 <puts@GLIBC_2.2.5>
  400526:	68 00 00 00 00       	pushq  $0x0
  40052b:	e9 e0 ff ff ff       	jmpq   400510 <.plt>

0000000000400530 <clock@plt>:
  400530:	ff 25 ea 6a 20 00    	jmpq   *0x206aea(%rip)        # 607020 <clock@GLIBC_2.2.5>
  400536:	68 01 00 00 00       	pushq  $0x1
  40053b:	e9 d0 ff ff ff       	jmpq   400510 <.plt>

0000000000400540 <strlen@plt>:
  400540:	ff 25 e2 6a 20 00    	jmpq   *0x206ae2(%rip)        # 607028 <strlen@GLIBC_2.2.5>
  400546:	68 02 00 00 00       	pushq  $0x2
  40054b:	e9 c0 ff ff ff       	jmpq   400510 <.plt>

0000000000400550 <__stack_chk_fail@plt>:
  400550:	ff 25 da 6a 20 00    	jmpq   *0x206ada(%rip)        # 607030 <__stack_chk_fail@GLIBC_2.4>
  400556:	68 03 00 00 00       	pushq  $0x3
  40055b:	e9 b0 ff ff ff       	jmpq   400510 <.plt>

0000000000400560 <__printf_chk@plt>:
  400560:	ff 25 d2 6a 20 00    	jmpq   *0x206ad2(%rip)        # 607038 <__printf_chk@GLIBC_2.3.4>
  400566:	68 04 00 00 00       	pushq  $0x4
  40056b:	e9 a0 ff ff ff       	jmpq   400510 <.plt>

Disassembly of section .text:

0000000000400570 <main>:
  400570:	83 ff 01             	cmp    $0x1,%edi
  400573:	7e 1b                	jle    400590 <main+0x20>
  400575:	48 8b 76 08          	mov    0x8(%rsi),%rsi
  400579:	48 8d 3d 60 52 00 00 	lea    0x5260(%rip),%rdi        # 4057e0 <AXC+0x4040>
  400580:	b9 03 00 00 00       	mov    $0x3,%ecx
  400585:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  400587:	0f 97 c0             	seta   %al
  40058a:	1c 00                	sbb    $0x0,%al
  40058c:	84 c0                	test   %al,%al
  40058e:	74 07                	je     400597 <main+0x27>
  400590:	31 c0                	xor    %eax,%eax
  400592:	e9 09 0c 00 00       	jmpq   4011a0 <test>
  400597:	e9 c4 0a 00 00       	jmpq   401060 <benchmark>
  40059c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005a0 <_start>:
  4005a0:	31 ed                	xor    %ebp,%ebp
  4005a2:	49 89 d1             	mov    %rdx,%r9
  4005a5:	5e                   	pop    %rsi
  4005a6:	48 89 e2             	mov    %rsp,%rdx
  4005a9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4005ad:	50                   	push   %rax
  4005ae:	54                   	push   %rsp
  4005af:	49 c7 c0 00 07 40 00 	mov    $0x400700,%r8
  4005b6:	48 c7 c1 90 06 40 00 	mov    $0x400690,%rcx
  4005bd:	48 c7 c7 70 05 40 00 	mov    $0x400570,%rdi
  4005c4:	ff 15 26 6a 20 00    	callq  *0x206a26(%rip)        # 606ff0 <__libc_start_main@GLIBC_2.2.5>
  4005ca:	f4                   	hlt    
  4005cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004005d0 <_dl_relocate_static_pie>:
  4005d0:	f3 c3                	repz retq 
  4005d2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4005d9:	00 00 00 
  4005dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005e0 <deregister_tm_clones>:
  4005e0:	55                   	push   %rbp
  4005e1:	b8 90 70 60 00       	mov    $0x607090,%eax
  4005e6:	48 3d 90 70 60 00    	cmp    $0x607090,%rax
  4005ec:	48 89 e5             	mov    %rsp,%rbp
  4005ef:	74 17                	je     400608 <deregister_tm_clones+0x28>
  4005f1:	b8 00 00 00 00       	mov    $0x0,%eax
  4005f6:	48 85 c0             	test   %rax,%rax
  4005f9:	74 0d                	je     400608 <deregister_tm_clones+0x28>
  4005fb:	5d                   	pop    %rbp
  4005fc:	bf 90 70 60 00       	mov    $0x607090,%edi
  400601:	ff e0                	jmpq   *%rax
  400603:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400608:	5d                   	pop    %rbp
  400609:	c3                   	retq   
  40060a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400610 <register_tm_clones>:
  400610:	be 90 70 60 00       	mov    $0x607090,%esi
  400615:	55                   	push   %rbp
  400616:	48 81 ee 90 70 60 00 	sub    $0x607090,%rsi
  40061d:	48 89 e5             	mov    %rsp,%rbp
  400620:	48 c1 fe 03          	sar    $0x3,%rsi
  400624:	48 89 f0             	mov    %rsi,%rax
  400627:	48 c1 e8 3f          	shr    $0x3f,%rax
  40062b:	48 01 c6             	add    %rax,%rsi
  40062e:	48 d1 fe             	sar    %rsi
  400631:	74 15                	je     400648 <register_tm_clones+0x38>
  400633:	b8 00 00 00 00       	mov    $0x0,%eax
  400638:	48 85 c0             	test   %rax,%rax
  40063b:	74 0b                	je     400648 <register_tm_clones+0x38>
  40063d:	5d                   	pop    %rbp
  40063e:	bf 90 70 60 00       	mov    $0x607090,%edi
  400643:	ff e0                	jmpq   *%rax
  400645:	0f 1f 00             	nopl   (%rax)
  400648:	5d                   	pop    %rbp
  400649:	c3                   	retq   
  40064a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400650 <__do_global_dtors_aux>:
  400650:	80 3d 49 6a 20 00 00 	cmpb   $0x0,0x206a49(%rip)        # 6070a0 <completed.7697>
  400657:	75 17                	jne    400670 <__do_global_dtors_aux+0x20>
  400659:	55                   	push   %rbp
  40065a:	48 89 e5             	mov    %rsp,%rbp
  40065d:	e8 7e ff ff ff       	callq  4005e0 <deregister_tm_clones>
  400662:	c6 05 37 6a 20 00 01 	movb   $0x1,0x206a37(%rip)        # 6070a0 <completed.7697>
  400669:	5d                   	pop    %rbp
  40066a:	c3                   	retq   
  40066b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400670:	f3 c3                	repz retq 
  400672:	0f 1f 40 00          	nopl   0x0(%rax)
  400676:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40067d:	00 00 00 

0000000000400680 <frame_dummy>:
  400680:	55                   	push   %rbp
  400681:	48 89 e5             	mov    %rsp,%rbp
  400684:	5d                   	pop    %rbp
  400685:	eb 89                	jmp    400610 <register_tm_clones>
  400687:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40068e:	00 00 

0000000000400690 <__libc_csu_init>:
  400690:	41 57                	push   %r15
  400692:	41 56                	push   %r14
  400694:	49 89 d7             	mov    %rdx,%r15
  400697:	41 55                	push   %r13
  400699:	41 54                	push   %r12
  40069b:	4c 8d 25 6e 67 20 00 	lea    0x20676e(%rip),%r12        # 606e10 <__frame_dummy_init_array_entry>
  4006a2:	55                   	push   %rbp
  4006a3:	48 8d 2d 6e 67 20 00 	lea    0x20676e(%rip),%rbp        # 606e18 <__init_array_end>
  4006aa:	53                   	push   %rbx
  4006ab:	41 89 fd             	mov    %edi,%r13d
  4006ae:	49 89 f6             	mov    %rsi,%r14
  4006b1:	4c 29 e5             	sub    %r12,%rbp
  4006b4:	48 83 ec 08          	sub    $0x8,%rsp
  4006b8:	48 c1 fd 03          	sar    $0x3,%rbp
  4006bc:	e8 2f fe ff ff       	callq  4004f0 <_init>
  4006c1:	48 85 ed             	test   %rbp,%rbp
  4006c4:	74 20                	je     4006e6 <__libc_csu_init+0x56>
  4006c6:	31 db                	xor    %ebx,%ebx
  4006c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4006cf:	00 
  4006d0:	4c 89 fa             	mov    %r15,%rdx
  4006d3:	4c 89 f6             	mov    %r14,%rsi
  4006d6:	44 89 ef             	mov    %r13d,%edi
  4006d9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4006dd:	48 83 c3 01          	add    $0x1,%rbx
  4006e1:	48 39 dd             	cmp    %rbx,%rbp
  4006e4:	75 ea                	jne    4006d0 <__libc_csu_init+0x40>
  4006e6:	48 83 c4 08          	add    $0x8,%rsp
  4006ea:	5b                   	pop    %rbx
  4006eb:	5d                   	pop    %rbp
  4006ec:	41 5c                	pop    %r12
  4006ee:	41 5d                	pop    %r13
  4006f0:	41 5e                	pop    %r14
  4006f2:	41 5f                	pop    %r15
  4006f4:	c3                   	retq   
  4006f5:	90                   	nop
  4006f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4006fd:	00 00 00 

0000000000400700 <__libc_csu_fini>:
  400700:	f3 c3                	repz retq 
  400702:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400709:	00 00 00 
  40070c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400710 <lps>:
  400710:	c4 e3 79 14 d2 00    	vpextrb $0x0,%xmm2,%edx
  400716:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  40071a:	c4 e3 79 14 d2 08    	vpextrb $0x8,%xmm2,%edx
  400720:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  400727:	00 
  400728:	c4 e3 79 14 da 00    	vpextrb $0x0,%xmm3,%edx
  40072e:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  400735:	00 
  400736:	c4 e3 79 14 da 08    	vpextrb $0x8,%xmm3,%edx
  40073c:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  400743:	00 
  400744:	4c 89 45 00          	mov    %r8,0x0(%rbp)
  400748:	c4 e3 79 14 d3 01    	vpextrb $0x1,%xmm2,%ebx
  40074e:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  400752:	c4 e3 79 14 d3 09    	vpextrb $0x9,%xmm2,%ebx
  400758:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  40075f:	00 
  400760:	c4 e3 79 14 db 01    	vpextrb $0x1,%xmm3,%ebx
  400766:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  40076d:	00 
  40076e:	c4 e3 79 14 db 09    	vpextrb $0x9,%xmm3,%ebx
  400774:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  40077b:	00 
  40077c:	4c 89 4d 08          	mov    %r9,0x8(%rbp)
  400780:	c4 e3 79 14 d2 02    	vpextrb $0x2,%xmm2,%edx
  400786:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  40078a:	c4 e3 79 14 d2 0a    	vpextrb $0xa,%xmm2,%edx
  400790:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  400797:	00 
  400798:	c4 e3 79 14 da 02    	vpextrb $0x2,%xmm3,%edx
  40079e:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  4007a5:	00 
  4007a6:	c4 e3 79 14 da 0a    	vpextrb $0xa,%xmm3,%edx
  4007ac:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  4007b3:	00 
  4007b4:	4c 89 55 10          	mov    %r10,0x10(%rbp)
  4007b8:	c4 e3 79 14 d3 03    	vpextrb $0x3,%xmm2,%ebx
  4007be:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  4007c2:	c4 e3 79 14 d3 0b    	vpextrb $0xb,%xmm2,%ebx
  4007c8:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  4007cf:	00 
  4007d0:	c4 e3 79 14 db 03    	vpextrb $0x3,%xmm3,%ebx
  4007d6:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  4007dd:	00 
  4007de:	c4 e3 79 14 db 0b    	vpextrb $0xb,%xmm3,%ebx
  4007e4:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  4007eb:	00 
  4007ec:	4c 89 5d 18          	mov    %r11,0x18(%rbp)
  4007f0:	c4 e3 79 14 d2 04    	vpextrb $0x4,%xmm2,%edx
  4007f6:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  4007fa:	c4 e3 79 14 d2 0c    	vpextrb $0xc,%xmm2,%edx
  400800:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  400807:	00 
  400808:	c4 e3 79 14 da 04    	vpextrb $0x4,%xmm3,%edx
  40080e:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  400815:	00 
  400816:	c4 e3 79 14 da 0c    	vpextrb $0xc,%xmm3,%edx
  40081c:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  400823:	00 
  400824:	4c 89 45 20          	mov    %r8,0x20(%rbp)
  400828:	c4 e3 79 14 d3 05    	vpextrb $0x5,%xmm2,%ebx
  40082e:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  400832:	c4 e3 79 14 d3 0d    	vpextrb $0xd,%xmm2,%ebx
  400838:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  40083f:	00 
  400840:	c4 e3 79 14 db 05    	vpextrb $0x5,%xmm3,%ebx
  400846:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  40084d:	00 
  40084e:	c4 e3 79 14 db 0d    	vpextrb $0xd,%xmm3,%ebx
  400854:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  40085b:	00 
  40085c:	4c 89 4d 28          	mov    %r9,0x28(%rbp)
  400860:	c4 e3 79 14 d2 06    	vpextrb $0x6,%xmm2,%edx
  400866:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  40086a:	c4 e3 79 14 d2 0e    	vpextrb $0xe,%xmm2,%edx
  400870:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  400877:	00 
  400878:	c4 e3 79 14 da 06    	vpextrb $0x6,%xmm3,%edx
  40087e:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  400885:	00 
  400886:	c4 e3 79 14 da 0e    	vpextrb $0xe,%xmm3,%edx
  40088c:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  400893:	00 
  400894:	4c 89 55 30          	mov    %r10,0x30(%rbp)
  400898:	c4 e3 79 14 d3 07    	vpextrb $0x7,%xmm2,%ebx
  40089e:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  4008a2:	c4 e3 79 14 d3 0f    	vpextrb $0xf,%xmm2,%ebx
  4008a8:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  4008af:	00 
  4008b0:	c4 e3 79 14 db 07    	vpextrb $0x7,%xmm3,%ebx
  4008b6:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  4008bd:	00 
  4008be:	c4 e3 79 14 db 0f    	vpextrb $0xf,%xmm3,%ebx
  4008c4:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  4008cb:	00 
  4008cc:	4c 89 5d 38          	mov    %r11,0x38(%rbp)
  4008d0:	c4 e3 7d 39 d2 01    	vextracti128 $0x1,%ymm2,%xmm2
  4008d6:	c4 e3 7d 39 db 01    	vextracti128 $0x1,%ymm3,%xmm3
  4008dc:	c4 e3 79 14 d2 00    	vpextrb $0x0,%xmm2,%edx
  4008e2:	4c 8b 84 d0 00 10 00 	mov    0x1000(%rax,%rdx,8),%r8
  4008e9:	00 
  4008ea:	c4 e3 79 14 d2 08    	vpextrb $0x8,%xmm2,%edx
  4008f0:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  4008f7:	00 
  4008f8:	c4 e3 79 14 da 00    	vpextrb $0x0,%xmm3,%edx
  4008fe:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  400905:	00 
  400906:	c4 e3 79 14 da 08    	vpextrb $0x8,%xmm3,%edx
  40090c:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  400913:	00 
  400914:	4c 89 45 40          	mov    %r8,0x40(%rbp)
  400918:	c4 e3 79 14 d3 01    	vpextrb $0x1,%xmm2,%ebx
  40091e:	4c 8b 8c d8 00 10 00 	mov    0x1000(%rax,%rbx,8),%r9
  400925:	00 
  400926:	c4 e3 79 14 d3 09    	vpextrb $0x9,%xmm2,%ebx
  40092c:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  400933:	00 
  400934:	c4 e3 79 14 db 01    	vpextrb $0x1,%xmm3,%ebx
  40093a:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  400941:	00 
  400942:	c4 e3 79 14 db 09    	vpextrb $0x9,%xmm3,%ebx
  400948:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  40094f:	00 
  400950:	4c 89 4d 48          	mov    %r9,0x48(%rbp)
  400954:	c4 e3 79 14 d2 02    	vpextrb $0x2,%xmm2,%edx
  40095a:	4c 8b 94 d0 00 10 00 	mov    0x1000(%rax,%rdx,8),%r10
  400961:	00 
  400962:	c4 e3 79 14 d2 0a    	vpextrb $0xa,%xmm2,%edx
  400968:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  40096f:	00 
  400970:	c4 e3 79 14 da 02    	vpextrb $0x2,%xmm3,%edx
  400976:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  40097d:	00 
  40097e:	c4 e3 79 14 da 0a    	vpextrb $0xa,%xmm3,%edx
  400984:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  40098b:	00 
  40098c:	4c 89 55 50          	mov    %r10,0x50(%rbp)
  400990:	c4 e3 79 14 d3 03    	vpextrb $0x3,%xmm2,%ebx
  400996:	4c 8b 9c d8 00 10 00 	mov    0x1000(%rax,%rbx,8),%r11
  40099d:	00 
  40099e:	c4 e3 79 14 d3 0b    	vpextrb $0xb,%xmm2,%ebx
  4009a4:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  4009ab:	00 
  4009ac:	c4 e3 79 14 db 03    	vpextrb $0x3,%xmm3,%ebx
  4009b2:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  4009b9:	00 
  4009ba:	c4 e3 79 14 db 0b    	vpextrb $0xb,%xmm3,%ebx
  4009c0:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  4009c7:	00 
  4009c8:	4c 89 5d 58          	mov    %r11,0x58(%rbp)
  4009cc:	c4 e3 79 14 d2 04    	vpextrb $0x4,%xmm2,%edx
  4009d2:	4c 8b 84 d0 00 10 00 	mov    0x1000(%rax,%rdx,8),%r8
  4009d9:	00 
  4009da:	c4 e3 79 14 d2 0c    	vpextrb $0xc,%xmm2,%edx
  4009e0:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  4009e7:	00 
  4009e8:	c4 e3 79 14 da 04    	vpextrb $0x4,%xmm3,%edx
  4009ee:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  4009f5:	00 
  4009f6:	c4 e3 79 14 da 0c    	vpextrb $0xc,%xmm3,%edx
  4009fc:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  400a03:	00 
  400a04:	4c 89 45 60          	mov    %r8,0x60(%rbp)
  400a08:	c4 e3 79 14 d3 05    	vpextrb $0x5,%xmm2,%ebx
  400a0e:	4c 8b 8c d8 00 10 00 	mov    0x1000(%rax,%rbx,8),%r9
  400a15:	00 
  400a16:	c4 e3 79 14 d3 0d    	vpextrb $0xd,%xmm2,%ebx
  400a1c:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  400a23:	00 
  400a24:	c4 e3 79 14 db 05    	vpextrb $0x5,%xmm3,%ebx
  400a2a:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  400a31:	00 
  400a32:	c4 e3 79 14 db 0d    	vpextrb $0xd,%xmm3,%ebx
  400a38:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  400a3f:	00 
  400a40:	4c 89 4d 68          	mov    %r9,0x68(%rbp)
  400a44:	c4 e3 79 14 d2 06    	vpextrb $0x6,%xmm2,%edx
  400a4a:	4c 8b 94 d0 00 10 00 	mov    0x1000(%rax,%rdx,8),%r10
  400a51:	00 
  400a52:	c4 e3 79 14 d2 0e    	vpextrb $0xe,%xmm2,%edx
  400a58:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  400a5f:	00 
  400a60:	c4 e3 79 14 da 06    	vpextrb $0x6,%xmm3,%edx
  400a66:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  400a6d:	00 
  400a6e:	c4 e3 79 14 da 0e    	vpextrb $0xe,%xmm3,%edx
  400a74:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  400a7b:	00 
  400a7c:	4c 89 55 70          	mov    %r10,0x70(%rbp)
  400a80:	c4 e3 79 14 d3 07    	vpextrb $0x7,%xmm2,%ebx
  400a86:	4c 8b 9c d8 00 10 00 	mov    0x1000(%rax,%rbx,8),%r11
  400a8d:	00 
  400a8e:	c4 e3 79 14 d3 0f    	vpextrb $0xf,%xmm2,%ebx
  400a94:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  400a9b:	00 
  400a9c:	c4 e3 79 14 db 07    	vpextrb $0x7,%xmm3,%ebx
  400aa2:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  400aa9:	00 
  400aaa:	c4 e3 79 14 db 0f    	vpextrb $0xf,%xmm3,%ebx
  400ab0:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  400ab7:	00 
  400ab8:	4c 89 5d 78          	mov    %r11,0x78(%rbp)
  400abc:	c5 fd 6f 45 00       	vmovdqa 0x0(%rbp),%ymm0
  400ac1:	c5 fd 6f 4d 20       	vmovdqa 0x20(%rbp),%ymm1
  400ac6:	c5 fd ef 45 20       	vpxor  0x20(%rbp),%ymm0,%ymm0
  400acb:	c5 f5 ef 4d 40       	vpxor  0x40(%rbp),%ymm1,%ymm1
  400ad0:	c3                   	retq   
  400ad1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400ad6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400add:	00 00 00 

0000000000400ae0 <GOST34112012Cleanup>:
  400ae0:	8b b7 04 01 00 00    	mov    0x104(%rdi),%esi
  400ae6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400aed:	00 00 00 

0000000000400af0 <GOST34112012Init>:
  400af0:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  400af7:	48 31 c0             	xor    %rax,%rax
  400afa:	49 c7 c0 01 01 00 00 	mov    $0x101,%r8
  400b01:	48 83 fe 20          	cmp    $0x20,%rsi
  400b05:	49 0f 44 c0          	cmove  %r8,%rax
  400b09:	f3 aa                	rep stos %al,%es:(%rdi)
  400b0b:	30 c0                	xor    %al,%al
  400b0d:	48 c7 c1 c4 00 00 00 	mov    $0xc4,%rcx
  400b14:	f3 aa                	rep stos %al,%es:(%rdi)
  400b16:	89 37                	mov    %esi,(%rdi)
  400b18:	48 83 fe 40          	cmp    $0x40,%rsi
  400b1c:	49 0f 44 c0          	cmove  %r8,%rax
  400b20:	48 c1 e8 08          	shr    $0x8,%rax
  400b24:	48 ff c8             	dec    %rax
  400b27:	c3                   	retq   
  400b28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400b2f:	00 

0000000000400b30 <stage2>:
  400b30:	52                   	push   %rdx
  400b31:	48 89 fa             	mov    %rdi,%rdx
  400b34:	48 0f 18 4f 40       	rex.W prefetcht0 0x40(%rdi)
  400b39:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
  400b3d:	c5 fd 6f 4f 20       	vmovdqa 0x20(%rdi),%ymm1
  400b42:	c5 fd 6f 57 40       	vmovdqa 0x40(%rdi),%ymm2
  400b47:	c5 fd 6f 5f 60       	vmovdqa 0x60(%rdi),%ymm3
  400b4c:	e8 3f 02 00 00       	callq  400d90 <g_func>
  400b51:	48 8b 47 40          	mov    0x40(%rdi),%rax
  400b55:	48 05 00 02 00 00    	add    $0x200,%rax
  400b5b:	48 89 47 40          	mov    %rax,0x40(%rdi)
  400b5f:	48 8d bf 80 00 00 00 	lea    0x80(%rdi),%rdi
  400b66:	66 90                	xchg   %ax,%ax

0000000000400b68 <add_bytes64>:
  400b68:	4c 8b 04 0e          	mov    (%rsi,%rcx,1),%r8
  400b6c:	4c 8b 4c 0e 08       	mov    0x8(%rsi,%rcx,1),%r9
  400b71:	4c 01 04 0f          	add    %r8,(%rdi,%rcx,1)
  400b75:	4c 11 4c 0f 08       	adc    %r9,0x8(%rdi,%rcx,1)
  400b7a:	4c 8b 44 0e 10       	mov    0x10(%rsi,%rcx,1),%r8
  400b7f:	4c 8b 4c 0e 18       	mov    0x18(%rsi,%rcx,1),%r9
  400b84:	4c 11 44 0f 10       	adc    %r8,0x10(%rdi,%rcx,1)
  400b89:	4c 11 4c 0f 18       	adc    %r9,0x18(%rdi,%rcx,1)
  400b8e:	4c 8b 44 0e 20       	mov    0x20(%rsi,%rcx,1),%r8
  400b93:	4c 8b 4c 0e 28       	mov    0x28(%rsi,%rcx,1),%r9
  400b98:	4c 11 44 0f 20       	adc    %r8,0x20(%rdi,%rcx,1)
  400b9d:	4c 11 4c 0f 28       	adc    %r9,0x28(%rdi,%rcx,1)
  400ba2:	4c 8b 44 0e 30       	mov    0x30(%rsi,%rcx,1),%r8
  400ba7:	4c 8b 4c 0e 38       	mov    0x38(%rsi,%rcx,1),%r9
  400bac:	4c 11 44 0f 30       	adc    %r8,0x30(%rdi,%rcx,1)
  400bb1:	4c 11 4c 0f 38       	adc    %r9,0x38(%rdi,%rcx,1)
  400bb6:	48 89 d7             	mov    %rdx,%rdi
  400bb9:	c5 fd 7f 07          	vmovdqa %ymm0,(%rdi)
  400bbd:	c5 fd 7f 4f 20       	vmovdqa %ymm1,0x20(%rdi)
  400bc2:	5a                   	pop    %rdx
  400bc3:	c3                   	retq   
  400bc4:	66 90                	xchg   %ax,%ax
  400bc6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400bcd:	00 00 00 

0000000000400bd0 <GOST34112012Update>:
  400bd0:	53                   	push   %rbx
  400bd1:	c5 f8 77             	vzeroupper 
  400bd4:	49 89 f8             	mov    %rdi,%r8
  400bd7:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
  400bdb:	c5 fd 6f 4f 20       	vmovdqa 0x20(%rdi),%ymm1
  400be0:	41 8b 98 00 01 00 00 	mov    0x100(%r8),%ebx
  400be7:	83 fb 00             	cmp    $0x0,%ebx
  400bea:	48 89 f3             	mov    %rsi,%rbx
  400bed:	74 40                	je     400c2f <update_data>
  400bef:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  400bf6:	48 29 d9             	sub    %rbx,%rcx
  400bf9:	48 39 d1             	cmp    %rdx,%rcx
  400bfc:	48 0f 4f ca          	cmovg  %rdx,%rcx
  400c00:	49 8d bc 18 c0 00 00 	lea    0xc0(%r8,%rbx,1),%rdi
  400c07:	00 
  400c08:	48 01 cb             	add    %rcx,%rbx
  400c0b:	48 29 ca             	sub    %rcx,%rdx
  400c0e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  400c10:	41 89 98 00 01 00 00 	mov    %ebx,0x100(%r8)
  400c17:	48 83 fb 00          	cmp    $0x0,%rbx
  400c1b:	75 3b                	jne    400c58 <exit_update>
  400c1d:	48 89 f3             	mov    %rsi,%rbx
  400c20:	49 8d b0 c0 00 00 00 	lea    0xc0(%r8),%rsi
  400c27:	4c 89 c7             	mov    %r8,%rdi

0000000000400c2a <stage_loop>:
  400c2a:	e8 01 ff ff ff       	callq  400b30 <stage2>

0000000000400c2f <update_data>:
  400c2f:	48 89 de             	mov    %rbx,%rsi
  400c32:	48 83 c3 40          	add    $0x40,%rbx
  400c36:	48 83 ea 40          	sub    $0x40,%rdx
  400c3a:	73 ee                	jae    400c2a <stage_loop>
  400c3c:	48 83 c2 40          	add    $0x40,%rdx
  400c40:	48 89 d1             	mov    %rdx,%rcx
  400c43:	48 89 fb             	mov    %rdi,%rbx
  400c46:	48 8d bf c0 00 00 00 	lea    0xc0(%rdi),%rdi
  400c4d:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  400c4f:	89 93 00 01 00 00    	mov    %edx,0x100(%rbx)
  400c55:	0f 1f 00             	nopl   (%rax)

0000000000400c58 <exit_update>:
  400c58:	c5 f8 77             	vzeroupper 
  400c5b:	5b                   	pop    %rbx
  400c5c:	c3                   	retq   
  400c5d:	0f 1f 00             	nopl   (%rax)

0000000000400c60 <GOST34112012Final>:
  400c60:	53                   	push   %rbx
  400c61:	52                   	push   %rdx
  400c62:	56                   	push   %rsi
  400c63:	c5 f8 77             	vzeroupper 
  400c66:	8b 9f 00 01 00 00    	mov    0x100(%rdi),%ebx
  400c6c:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
  400c70:	c5 fd 6f 4f 20       	vmovdqa 0x20(%rdi),%ymm1
  400c75:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  400c7c:	48 29 d9             	sub    %rbx,%rcx
  400c7f:	74 1f                	je     400ca0 <n_buff>
  400c81:	48 89 fa             	mov    %rdi,%rdx
  400c84:	48 8d bc 1f c0 00 00 	lea    0xc0(%rdi,%rbx,1),%rdi
  400c8b:	00 
  400c8c:	b0 01                	mov    $0x1,%al
  400c8e:	aa                   	stos   %al,%es:(%rdi)
  400c8f:	30 c0                	xor    %al,%al
  400c91:	48 ff c9             	dec    %rcx
  400c94:	f3 aa                	rep stos %al,%es:(%rdi)
  400c96:	48 89 d7             	mov    %rdx,%rdi
  400c99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400ca0 <n_buff>:
  400ca0:	48 8d b7 c0 00 00 00 	lea    0xc0(%rdi),%rsi
  400ca7:	c5 fd 6f 57 40       	vmovdqa 0x40(%rdi),%ymm2
  400cac:	c5 fd 6f 5f 60       	vmovdqa 0x60(%rdi),%ymm3
  400cb1:	e8 da 00 00 00       	callq  400d90 <g_func>
  400cb6:	48 c1 e3 03          	shl    $0x3,%rbx
  400cba:	48 8b 47 40          	mov    0x40(%rdi),%rax
  400cbe:	48 01 d8             	add    %rbx,%rax
  400cc1:	48 89 47 40          	mov    %rax,0x40(%rdi)
  400cc5:	48 8d b7 00 01 00 00 	lea    0x100(%rdi),%rsi
  400ccc:	48 8d bf 80 00 00 00 	lea    0x80(%rdi),%rdi
  400cd3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400cd8 <add_bytes65>:
  400cd8:	4c 8b 04 0e          	mov    (%rsi,%rcx,1),%r8
  400cdc:	4c 8b 4c 0e 08       	mov    0x8(%rsi,%rcx,1),%r9
  400ce1:	4c 01 04 0f          	add    %r8,(%rdi,%rcx,1)
  400ce5:	4c 11 4c 0f 08       	adc    %r9,0x8(%rdi,%rcx,1)
  400cea:	4c 8b 44 0e 10       	mov    0x10(%rsi,%rcx,1),%r8
  400cef:	4c 8b 4c 0e 18       	mov    0x18(%rsi,%rcx,1),%r9
  400cf4:	4c 11 44 0f 10       	adc    %r8,0x10(%rdi,%rcx,1)
  400cf9:	4c 11 4c 0f 18       	adc    %r9,0x18(%rdi,%rcx,1)
  400cfe:	4c 8b 44 0e 20       	mov    0x20(%rsi,%rcx,1),%r8
  400d03:	4c 8b 4c 0e 28       	mov    0x28(%rsi,%rcx,1),%r9
  400d08:	4c 11 44 0f 20       	adc    %r8,0x20(%rdi,%rcx,1)
  400d0d:	4c 11 4c 0f 28       	adc    %r9,0x28(%rdi,%rcx,1)
  400d12:	4c 8b 44 0e 30       	mov    0x30(%rsi,%rcx,1),%r8
  400d17:	4c 8b 4c 0e 38       	mov    0x38(%rsi,%rcx,1),%r9
  400d1c:	4c 11 44 0f 30       	adc    %r8,0x30(%rdi,%rcx,1)
  400d21:	4c 11 4c 0f 38       	adc    %r9,0x38(%rdi,%rcx,1)
  400d26:	48 89 d7             	mov    %rdx,%rdi
  400d29:	c5 ed ef d2          	vpxor  %ymm2,%ymm2,%ymm2
  400d2d:	c5 e5 ef db          	vpxor  %ymm3,%ymm3,%ymm3
  400d31:	48 8d 77 40          	lea    0x40(%rdi),%rsi
  400d35:	e8 56 00 00 00       	callq  400d90 <g_func>
  400d3a:	c5 ed ef d2          	vpxor  %ymm2,%ymm2,%ymm2
  400d3e:	c5 e5 ef db          	vpxor  %ymm3,%ymm3,%ymm3
  400d42:	48 8d b7 80 00 00 00 	lea    0x80(%rdi),%rsi
  400d49:	e8 42 00 00 00       	callq  400d90 <g_func>
  400d4e:	c5 fd 7f 07          	vmovdqa %ymm0,(%rdi)
  400d52:	c5 fd 7f 4f 20       	vmovdqa %ymm1,0x20(%rdi)
  400d57:	c5 f8 77             	vzeroupper 
  400d5a:	5e                   	pop    %rsi
  400d5b:	5a                   	pop    %rdx
  400d5c:	5b                   	pop    %rbx
  400d5d:	48 85 f6             	test   %rsi,%rsi
  400d60:	75 0e                	jne    400d70 <GOST34112012Hash>
  400d62:	c3                   	retq   
  400d63:	0f 1f 00             	nopl   (%rax)
  400d66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400d6d:	00 00 00 

0000000000400d70 <GOST34112012Hash>:
  400d70:	8b 8f 04 01 00 00    	mov    0x104(%rdi),%ecx
  400d76:	48 8d 47 40          	lea    0x40(%rdi),%rax
  400d7a:	48 89 f7             	mov    %rsi,%rdi
  400d7d:	48 29 c8             	sub    %rcx,%rax
  400d80:	48 89 c6             	mov    %rax,%rsi
  400d83:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  400d85:	48 31 c0             	xor    %rax,%rax
  400d88:	c3                   	retq   
  400d89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400d90 <g_func>:
  400d90:	56                   	push   %rsi
  400d91:	55                   	push   %rbp
  400d92:	53                   	push   %rbx
  400d93:	52                   	push   %rdx
  400d94:	48 89 e5             	mov    %rsp,%rbp
  400d97:	48 81 ed 88 00 00 00 	sub    $0x88,%rbp
  400d9e:	48 83 e5 e0          	and    $0xffffffffffffffe0,%rbp
  400da2:	c5 fd 6f f0          	vmovdqa %ymm0,%ymm6
  400da6:	c5 fd 6f f9          	vmovdqa %ymm1,%ymm7
  400daa:	c5 ed ef d0          	vpxor  %ymm0,%ymm2,%ymm2
  400dae:	c5 e5 ef d9          	vpxor  %ymm1,%ymm3,%ymm3
  400db2:	48 8d 05 e7 09 00 00 	lea    0x9e7(%rip),%rax        # 4017a0 <AXC>
  400db9:	e8 52 f9 ff ff       	callq  400710 <lps>
  400dbe:	c5 fe 6f 26          	vmovdqu (%rsi),%ymm4
  400dc2:	c5 fe 6f 6e 20       	vmovdqu 0x20(%rsi),%ymm5
  400dc7:	c5 cd ef f4          	vpxor  %ymm4,%ymm6,%ymm6
  400dcb:	c5 c5 ef fd          	vpxor  %ymm5,%ymm7,%ymm7
  400dcf:	48 c7 c1 0c 00 00 00 	mov    $0xc,%rcx
  400dd6:	48 8d 35 c3 06 00 00 	lea    0x6c3(%rip),%rsi        # 4014a0 <CXC>
  400ddd:	0f 1f 00             	nopl   (%rax)

0000000000400de0 <g_func_loop>:
  400de0:	c5 dd ef d0          	vpxor  %ymm0,%ymm4,%ymm2
  400de4:	c5 d5 ef d9          	vpxor  %ymm1,%ymm5,%ymm3
  400de8:	0f 18 4e 40          	prefetcht0 0x40(%rsi)
  400dec:	c5 fd 6f 26          	vmovdqa (%rsi),%ymm4
  400df0:	c5 fd 6f 6e 20       	vmovdqa 0x20(%rsi),%ymm5
  400df5:	c5 dd ef e0          	vpxor  %ymm0,%ymm4,%ymm4
  400df9:	c5 d5 ef e9          	vpxor  %ymm1,%ymm5,%ymm5
  400dfd:	e8 0e f9 ff ff       	callq  400710 <lps>
  400e02:	c5 fd 6f d4          	vmovdqa %ymm4,%ymm2
  400e06:	c5 fd 6f dd          	vmovdqa %ymm5,%ymm3
  400e0a:	c5 fd 6f e0          	vmovdqa %ymm0,%ymm4
  400e0e:	c5 fd 6f e9          	vmovdqa %ymm1,%ymm5
  400e12:	e8 f9 f8 ff ff       	callq  400710 <lps>
  400e17:	48 83 c6 40          	add    $0x40,%rsi
  400e1b:	e2 c3                	loop   400de0 <g_func_loop>
  400e1d:	c5 dd ef c0          	vpxor  %ymm0,%ymm4,%ymm0
  400e21:	c5 d5 ef c9          	vpxor  %ymm1,%ymm5,%ymm1
  400e25:	c5 cd ef c0          	vpxor  %ymm0,%ymm6,%ymm0
  400e29:	c5 c5 ef c9          	vpxor  %ymm1,%ymm7,%ymm1

0000000000400e2d <g_func_exit>:
  400e2d:	5a                   	pop    %rdx
  400e2e:	5b                   	pop    %rbx
  400e2f:	5d                   	pop    %rbp
  400e30:	5e                   	pop    %rsi
  400e31:	c3                   	retq   
  400e32:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e39:	00 00 00 
  400e3c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e40 <print_buffer>:
  400e40:	85 f6                	test   %esi,%esi
  400e42:	0f 8e 88 00 00 00    	jle    400ed0 <print_buffer+0x90>
  400e48:	41 55                	push   %r13
  400e4a:	41 54                	push   %r12
  400e4c:	44 8d 66 ff          	lea    -0x1(%rsi),%r12d
  400e50:	55                   	push   %rbp
  400e51:	53                   	push   %rbx
  400e52:	48 89 fd             	mov    %rdi,%rbp
  400e55:	49 83 c4 01          	add    $0x1,%r12
  400e59:	bb 01 00 00 00       	mov    $0x1,%ebx
  400e5e:	4c 8d 2d 3b 49 00 00 	lea    0x493b(%rip),%r13        # 4057a0 <AXC+0x4000>
  400e65:	48 83 ec 08          	sub    $0x8,%rsp
  400e69:	eb 09                	jmp    400e74 <print_buffer+0x34>
  400e6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400e70:	48 83 c3 01          	add    $0x1,%rbx
  400e74:	0f b6 54 1d ff       	movzbl -0x1(%rbp,%rbx,1),%edx
  400e79:	31 c0                	xor    %eax,%eax
  400e7b:	4c 89 ee             	mov    %r13,%rsi
  400e7e:	bf 01 00 00 00       	mov    $0x1,%edi
  400e83:	e8 d8 f6 ff ff       	callq  400560 <__printf_chk@plt>
  400e88:	49 39 dc             	cmp    %rbx,%r12
  400e8b:	74 23                	je     400eb0 <print_buffer+0x70>
  400e8d:	85 db                	test   %ebx,%ebx
  400e8f:	7e df                	jle    400e70 <print_buffer+0x30>
  400e91:	f6 c3 0f             	test   $0xf,%bl
  400e94:	75 da                	jne    400e70 <print_buffer+0x30>
  400e96:	48 8d 35 15 49 00 00 	lea    0x4915(%rip),%rsi        # 4057b2 <AXC+0x4012>
  400e9d:	bf 01 00 00 00       	mov    $0x1,%edi
  400ea2:	31 c0                	xor    %eax,%eax
  400ea4:	e8 b7 f6 ff ff       	callq  400560 <__printf_chk@plt>
  400ea9:	eb c5                	jmp    400e70 <print_buffer+0x30>
  400eab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400eb0:	48 83 c4 08          	add    $0x8,%rsp
  400eb4:	48 8d 3d 1e 49 00 00 	lea    0x491e(%rip),%rdi        # 4057d9 <AXC+0x4039>
  400ebb:	5b                   	pop    %rbx
  400ebc:	5d                   	pop    %rbp
  400ebd:	41 5c                	pop    %r12
  400ebf:	41 5d                	pop    %r13
  400ec1:	e9 5a f6 ff ff       	jmpq   400520 <puts@plt>
  400ec6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400ecd:	00 00 00 
  400ed0:	48 8d 3d 02 49 00 00 	lea    0x4902(%rip),%rdi        # 4057d9 <AXC+0x4039>
  400ed7:	e9 44 f6 ff ff       	jmpq   400520 <puts@plt>
  400edc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400ee0 <print_digest>:
  400ee0:	48 8d 3d bf 48 00 00 	lea    0x48bf(%rip),%rdi        # 4057a6 <AXC+0x4006>
  400ee7:	48 83 ec 08          	sub    $0x8,%rsp
  400eeb:	e8 30 f6 ff ff       	callq  400520 <puts@plt>
  400ef0:	48 8d 3d c9 61 20 00 	lea    0x2061c9(%rip),%rdi        # 6070c0 <digest>
  400ef7:	be 40 00 00 00       	mov    $0x40,%esi
  400efc:	48 83 c4 08          	add    $0x8,%rsp
  400f00:	e9 3b ff ff ff       	jmpq   400e40 <print_buffer>
  400f05:	90                   	nop
  400f06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400f0d:	00 00 00 

0000000000400f10 <print_ymm>:
  400f10:	41 57                	push   %r15
  400f12:	41 56                	push   %r14
  400f14:	41 55                	push   %r13
  400f16:	41 54                	push   %r12
  400f18:	49 89 fc             	mov    %rdi,%r12
  400f1b:	55                   	push   %rbp
  400f1c:	53                   	push   %rbx
  400f1d:	48 8d 2d 94 48 00 00 	lea    0x4894(%rip),%rbp        # 4057b8 <AXC+0x4018>
  400f24:	31 db                	xor    %ebx,%ebx
  400f26:	48 83 ec 08          	sub    $0x8,%rsp
  400f2a:	49 c7 c7 88 70 60 00 	mov    $0x607088,%r15
  400f31:	49 8b 3f             	mov    (%r15),%rdi
  400f34:	e8 e7 f5 ff ff       	callq  400520 <puts@plt>
  400f39:	48 8d 35 6e 48 00 00 	lea    0x486e(%rip),%rsi        # 4057ae <AXC+0x400e>
  400f40:	bf 01 00 00 00       	mov    $0x1,%edi
  400f45:	31 c0                	xor    %eax,%eax
  400f47:	e8 14 f6 ff ff       	callq  400560 <__printf_chk@plt>
  400f4c:	eb 06                	jmp    400f54 <print_ymm+0x44>
  400f4e:	66 90                	xchg   %ax,%ax
  400f50:	48 83 c3 01          	add    $0x1,%rbx
  400f54:	48 83 fb 10          	cmp    $0x10,%rbx
  400f58:	0f 84 d2 00 00 00    	je     401030 <print_ymm+0x120>
  400f5e:	31 c0                	xor    %eax,%eax
  400f60:	89 da                	mov    %ebx,%edx
  400f62:	48 89 ee             	mov    %rbp,%rsi
  400f65:	bf 01 00 00 00       	mov    $0x1,%edi
  400f6a:	e8 f1 f5 ff ff       	callq  400560 <__printf_chk@plt>
  400f6f:	83 fb 1f             	cmp    $0x1f,%ebx
  400f72:	75 dc                	jne    400f50 <print_ymm+0x40>
  400f74:	48 8d 3d 5e 48 00 00 	lea    0x485e(%rip),%rdi        # 4057d9 <AXC+0x4039>
  400f7b:	4c 8d 2d 1e 48 00 00 	lea    0x481e(%rip),%r13        # 4057a0 <AXC+0x4000>
  400f82:	45 31 f6             	xor    %r14d,%r14d
  400f85:	e8 96 f5 ff ff       	callq  400520 <puts@plt>
  400f8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400f90:	48 8d 35 1e 48 00 00 	lea    0x481e(%rip),%rsi        # 4057b5 <AXC+0x4015>
  400f97:	44 89 f2             	mov    %r14d,%edx
  400f9a:	bf 01 00 00 00       	mov    $0x1,%edi
  400f9f:	31 c0                	xor    %eax,%eax
  400fa1:	4c 89 e3             	mov    %r12,%rbx
  400fa4:	31 ed                	xor    %ebp,%ebp
  400fa6:	e8 b5 f5 ff ff       	callq  400560 <__printf_chk@plt>
  400fab:	eb 06                	jmp    400fb3 <print_ymm+0xa3>
  400fad:	0f 1f 00             	nopl   (%rax)
  400fb0:	83 c5 01             	add    $0x1,%ebp
  400fb3:	48 83 c3 01          	add    $0x1,%rbx
  400fb7:	83 fd 10             	cmp    $0x10,%ebp
  400fba:	74 4c                	je     401008 <print_ymm+0xf8>
  400fbc:	0f b6 53 ff          	movzbl -0x1(%rbx),%edx
  400fc0:	31 c0                	xor    %eax,%eax
  400fc2:	4c 89 ee             	mov    %r13,%rsi
  400fc5:	bf 01 00 00 00       	mov    $0x1,%edi
  400fca:	e8 91 f5 ff ff       	callq  400560 <__printf_chk@plt>
  400fcf:	89 d8                	mov    %ebx,%eax
  400fd1:	44 29 e0             	sub    %r12d,%eax
  400fd4:	83 f8 20             	cmp    $0x20,%eax
  400fd7:	75 d7                	jne    400fb0 <print_ymm+0xa0>
  400fd9:	48 8d 3d f9 47 00 00 	lea    0x47f9(%rip),%rdi        # 4057d9 <AXC+0x4039>
  400fe0:	41 83 c6 01          	add    $0x1,%r14d
  400fe4:	49 89 dc             	mov    %rbx,%r12
  400fe7:	e8 34 f5 ff ff       	callq  400520 <puts@plt>
  400fec:	41 83 fe 0a          	cmp    $0xa,%r14d
  400ff0:	75 9e                	jne    400f90 <print_ymm+0x80>
  400ff2:	49 8b 3f             	mov    (%r15),%rdi
  400ff5:	48 83 c4 08          	add    $0x8,%rsp
  400ff9:	5b                   	pop    %rbx
  400ffa:	5d                   	pop    %rbp
  400ffb:	41 5c                	pop    %r12
  400ffd:	41 5d                	pop    %r13
  400fff:	41 5e                	pop    %r14
  401001:	41 5f                	pop    %r15
  401003:	e9 18 f5 ff ff       	jmpq   400520 <puts@plt>
  401008:	48 8d 35 a3 47 00 00 	lea    0x47a3(%rip),%rsi        # 4057b2 <AXC+0x4012>
  40100f:	bf 01 00 00 00       	mov    $0x1,%edi
  401014:	31 c0                	xor    %eax,%eax
  401016:	e8 45 f5 ff ff       	callq  400560 <__printf_chk@plt>
  40101b:	0f b6 53 ff          	movzbl -0x1(%rbx),%edx
  40101f:	4c 89 ee             	mov    %r13,%rsi
  401022:	bf 01 00 00 00       	mov    $0x1,%edi
  401027:	31 c0                	xor    %eax,%eax
  401029:	e8 32 f5 ff ff       	callq  400560 <__printf_chk@plt>
  40102e:	eb 80                	jmp    400fb0 <print_ymm+0xa0>
  401030:	48 8d 35 7b 47 00 00 	lea    0x477b(%rip),%rsi        # 4057b2 <AXC+0x4012>
  401037:	bf 01 00 00 00       	mov    $0x1,%edi
  40103c:	31 c0                	xor    %eax,%eax
  40103e:	e8 1d f5 ff ff       	callq  400560 <__printf_chk@plt>
  401043:	ba 10 00 00 00       	mov    $0x10,%edx
  401048:	48 89 ee             	mov    %rbp,%rsi
  40104b:	bf 01 00 00 00       	mov    $0x1,%edi
  401050:	31 c0                	xor    %eax,%eax
  401052:	e8 09 f5 ff ff       	callq  400560 <__printf_chk@plt>
  401057:	e9 f4 fe ff ff       	jmpq   400f50 <print_ymm+0x40>
  40105c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401060 <benchmark>:
  401060:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
  401065:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  401069:	41 ff 72 f8          	pushq  -0x8(%r10)
  40106d:	55                   	push   %rbp
  40106e:	48 89 e5             	mov    %rsp,%rbp
  401071:	41 57                	push   %r15
  401073:	41 56                	push   %r14
  401075:	41 55                	push   %r13
  401077:	41 54                	push   %r12
  401079:	41 bc 40 42 0f 00    	mov    $0xf4240,%r12d
  40107f:	41 52                	push   %r10
  401081:	53                   	push   %rbx
  401082:	48 8d 9d 50 fe ff ff 	lea    -0x1b0(%rbp),%rbx
  401089:	48 81 ec a0 01 00 00 	sub    $0x1a0,%rsp
  401090:	49 c7 c5 60 70 60 00 	mov    $0x607060,%r13
  401097:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40109e:	00 00 
  4010a0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  4010a4:	31 c0                	xor    %eax,%eax
  4010a6:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  4010aa:	e8 91 f4 ff ff       	callq  400540 <strlen@plt>
  4010af:	49 89 c6             	mov    %rax,%r14
  4010b2:	48 89 85 40 fe ff ff 	mov    %rax,-0x1c0(%rbp)
  4010b9:	4d 63 fe             	movslq %r14d,%r15
  4010bc:	4c 8d 35 fd 5f 20 00 	lea    0x205ffd(%rip),%r14        # 6070c0 <digest>
  4010c3:	e8 68 f4 ff ff       	callq  400530 <clock@plt>
  4010c8:	be 40 00 00 00       	mov    $0x40,%esi
  4010cd:	48 89 df             	mov    %rbx,%rdi
  4010d0:	48 89 85 48 fe ff ff 	mov    %rax,-0x1b8(%rbp)
  4010d7:	e8 14 fa ff ff       	callq  400af0 <GOST34112012Init>
  4010dc:	0f 1f 40 00          	nopl   0x0(%rax)
  4010e0:	49 8b 75 00          	mov    0x0(%r13),%rsi
  4010e4:	4c 89 fa             	mov    %r15,%rdx
  4010e7:	48 89 df             	mov    %rbx,%rdi
  4010ea:	e8 e1 fa ff ff       	callq  400bd0 <GOST34112012Update>
  4010ef:	4c 89 f6             	mov    %r14,%rsi
  4010f2:	48 89 df             	mov    %rbx,%rdi
  4010f5:	e8 66 fb ff ff       	callq  400c60 <GOST34112012Final>
  4010fa:	48 89 df             	mov    %rbx,%rdi
  4010fd:	e8 de f9 ff ff       	callq  400ae0 <GOST34112012Cleanup>
  401102:	41 83 ec 01          	sub    $0x1,%r12d
  401106:	75 d8                	jne    4010e0 <benchmark+0x80>
  401108:	e8 23 f4 ff ff       	callq  400530 <clock@plt>
  40110d:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  401111:	48 2b 85 48 fe ff ff 	sub    -0x1b8(%rbp),%rax
  401118:	c5 fb 10 1d 20 4b 00 	vmovsd 0x4b20(%rip),%xmm3        # 405c40 <hash_test+0x420>
  40111f:	00 
  401120:	48 8d 35 97 46 00 00 	lea    0x4697(%rip),%rsi        # 4057be <AXC+0x401e>
  401127:	c5 fb 10 0d 19 4b 00 	vmovsd 0x4b19(%rip),%xmm1        # 405c48 <hash_test+0x428>
  40112e:	00 
  40112f:	bf 01 00 00 00       	mov    $0x1,%edi
  401134:	c5 fb 2a 85 40 fe ff 	vcvtsi2sdl -0x1c0(%rbp),%xmm0,%xmm0
  40113b:	ff 
  40113c:	c5 fb 59 c3          	vmulsd %xmm3,%xmm0,%xmm0
  401140:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
  401144:	c5 fb 5e c1          	vdivsd %xmm1,%xmm0,%xmm0
  401148:	c4 e1 eb 2a d0       	vcvtsi2sd %rax,%xmm2,%xmm2
  40114d:	b8 02 00 00 00       	mov    $0x2,%eax
  401152:	c5 fb 5e c1          	vdivsd %xmm1,%xmm0,%xmm0
  401156:	c5 fb 59 cb          	vmulsd %xmm3,%xmm0,%xmm1
  40115a:	c5 eb 5e c3          	vdivsd %xmm3,%xmm2,%xmm0
  40115e:	c5 f3 5e ca          	vdivsd %xmm2,%xmm1,%xmm1
  401162:	e8 f9 f3 ff ff       	callq  400560 <__printf_chk@plt>
  401167:	31 c0                	xor    %eax,%eax
  401169:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  40116d:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  401174:	00 00 
  401176:	75 18                	jne    401190 <benchmark+0x130>
  401178:	48 81 c4 a0 01 00 00 	add    $0x1a0,%rsp
  40117f:	5b                   	pop    %rbx
  401180:	41 5a                	pop    %r10
  401182:	41 5c                	pop    %r12
  401184:	41 5d                	pop    %r13
  401186:	41 5e                	pop    %r14
  401188:	41 5f                	pop    %r15
  40118a:	5d                   	pop    %rbp
  40118b:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
  40118f:	c3                   	retq   
  401190:	e8 bb f3 ff ff       	callq  400550 <__stack_chk_fail@plt>
  401195:	90                   	nop
  401196:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40119d:	00 00 00 

00000000004011a0 <test>:
  4011a0:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
  4011a5:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  4011a9:	41 ff 72 f8          	pushq  -0x8(%r10)
  4011ad:	55                   	push   %rbp
  4011ae:	48 89 e5             	mov    %rsp,%rbp
  4011b1:	41 55                	push   %r13
  4011b3:	41 54                	push   %r12
  4011b5:	41 52                	push   %r10
  4011b7:	53                   	push   %rbx
  4011b8:	48 8d 9d 50 fe ff ff 	lea    -0x1b0(%rbp),%rbx
  4011bf:	48 81 ec 90 01 00 00 	sub    $0x190,%rsp
  4011c6:	49 c7 c5 80 70 60 00 	mov    $0x607080,%r13
  4011cd:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4011d4:	00 00 
  4011d6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  4011da:	31 c0                	xor    %eax,%eax
  4011dc:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  4011e0:	e8 5b f3 ff ff       	callq  400540 <strlen@plt>
  4011e5:	48 89 df             	mov    %rbx,%rdi
  4011e8:	be 40 00 00 00       	mov    $0x40,%esi
  4011ed:	49 89 c4             	mov    %rax,%r12
  4011f0:	e8 fb f8 ff ff       	callq  400af0 <GOST34112012Init>
  4011f5:	49 8b 75 00          	mov    0x0(%r13),%rsi
  4011f9:	49 63 d4             	movslq %r12d,%rdx
  4011fc:	48 89 df             	mov    %rbx,%rdi
  4011ff:	e8 cc f9 ff ff       	callq  400bd0 <GOST34112012Update>
  401204:	48 8d 35 b5 5e 20 00 	lea    0x205eb5(%rip),%rsi        # 6070c0 <digest>
  40120b:	48 89 df             	mov    %rbx,%rdi
  40120e:	e8 4d fa ff ff       	callq  400c60 <GOST34112012Final>
  401213:	48 89 df             	mov    %rbx,%rdi
  401216:	e8 c5 f8 ff ff       	callq  400ae0 <GOST34112012Cleanup>
  40121b:	31 c0                	xor    %eax,%eax
  40121d:	e8 be fc ff ff       	callq  400ee0 <print_digest>
  401222:	48 c7 c3 20 58 40 00 	mov    $0x405820,%rbx
  401229:	48 8b 15 98 5e 20 00 	mov    0x205e98(%rip),%rdx        # 6070c8 <digest+0x8>
  401230:	48 8b 05 89 5e 20 00 	mov    0x205e89(%rip),%rax        # 6070c0 <digest>
  401237:	48 33 53 08          	xor    0x8(%rbx),%rdx
  40123b:	48 33 03             	xor    (%rbx),%rax
  40123e:	48 09 c2             	or     %rax,%rdx
  401241:	75 1b                	jne    40125e <test+0xbe>
  401243:	48 8b 15 8e 5e 20 00 	mov    0x205e8e(%rip),%rdx        # 6070d8 <digest+0x18>
  40124a:	48 8b 05 7f 5e 20 00 	mov    0x205e7f(%rip),%rax        # 6070d0 <digest+0x10>
  401251:	48 33 53 18          	xor    0x18(%rbx),%rdx
  401255:	48 33 43 10          	xor    0x10(%rbx),%rax
  401259:	48 09 c2             	or     %rax,%rdx
  40125c:	74 42                	je     4012a0 <test+0x100>
  40125e:	48 8d 3d 75 45 00 00 	lea    0x4575(%rip),%rdi        # 4057da <AXC+0x403a>
  401265:	e8 b6 f2 ff ff       	callq  400520 <puts@plt>
  40126a:	be 40 00 00 00       	mov    $0x40,%esi
  40126f:	48 89 df             	mov    %rbx,%rdi
  401272:	e8 c9 fb ff ff       	callq  400e40 <print_buffer>
  401277:	b8 01 00 00 00       	mov    $0x1,%eax
  40127c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  401280:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  401287:	00 00 
  401289:	75 4f                	jne    4012da <test+0x13a>
  40128b:	48 81 c4 90 01 00 00 	add    $0x190,%rsp
  401292:	5b                   	pop    %rbx
  401293:	41 5a                	pop    %r10
  401295:	41 5c                	pop    %r12
  401297:	41 5d                	pop    %r13
  401299:	5d                   	pop    %rbp
  40129a:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
  40129e:	c3                   	retq   
  40129f:	90                   	nop
  4012a0:	48 8b 15 41 5e 20 00 	mov    0x205e41(%rip),%rdx        # 6070e8 <digest+0x28>
  4012a7:	48 8b 05 32 5e 20 00 	mov    0x205e32(%rip),%rax        # 6070e0 <digest+0x20>
  4012ae:	48 33 53 28          	xor    0x28(%rbx),%rdx
  4012b2:	48 33 43 20          	xor    0x20(%rbx),%rax
  4012b6:	48 09 c2             	or     %rax,%rdx
  4012b9:	75 a3                	jne    40125e <test+0xbe>
  4012bb:	48 8b 15 36 5e 20 00 	mov    0x205e36(%rip),%rdx        # 6070f8 <digest+0x38>
  4012c2:	48 8b 05 27 5e 20 00 	mov    0x205e27(%rip),%rax        # 6070f0 <digest+0x30>
  4012c9:	48 33 53 38          	xor    0x38(%rbx),%rdx
  4012cd:	48 33 43 30          	xor    0x30(%rbx),%rax
  4012d1:	48 09 c2             	or     %rax,%rdx
  4012d4:	75 88                	jne    40125e <test+0xbe>
  4012d6:	31 c0                	xor    %eax,%eax
  4012d8:	eb a2                	jmp    40127c <test+0xdc>
  4012da:	e8 71 f2 ff ff       	callq  400550 <__stack_chk_fail@plt>
  4012df:	90                   	nop

00000000004012e0 <GOST34112012Dump>:
  4012e0:	41 55                	push   %r13
  4012e2:	41 54                	push   %r12
  4012e4:	48 8d 97 08 01 00 00 	lea    0x108(%rdi),%rdx
  4012eb:	55                   	push   %rbp
  4012ec:	53                   	push   %rbx
  4012ed:	48 8d 35 5c 49 00 00 	lea    0x495c(%rip),%rsi        # 405c50 <hash_test+0x430>
  4012f4:	49 89 fc             	mov    %rdi,%r12
  4012f7:	31 c0                	xor    %eax,%eax
  4012f9:	48 8d 2d a0 44 00 00 	lea    0x44a0(%rip),%rbp        # 4057a0 <AXC+0x4000>
  401300:	48 83 ec 08          	sub    $0x8,%rsp
  401304:	c6 87 47 01 00 00 00 	movb   $0x0,0x147(%rdi)
  40130b:	bf 01 00 00 00       	mov    $0x1,%edi
  401310:	e8 4b f2 ff ff       	callq  400560 <__printf_chk@plt>
  401315:	41 8b 94 24 04 01 00 	mov    0x104(%r12),%edx
  40131c:	00 
  40131d:	48 8d 35 2f 49 00 00 	lea    0x492f(%rip),%rsi        # 405c53 <hash_test+0x433>
  401324:	bf 01 00 00 00       	mov    $0x1,%edi
  401329:	31 c0                	xor    %eax,%eax
  40132b:	4d 8d 6c 24 40       	lea    0x40(%r12),%r13
  401330:	4c 89 e3             	mov    %r12,%rbx
  401333:	e8 28 f2 ff ff       	callq  400560 <__printf_chk@plt>
  401338:	48 8d 35 1f 49 00 00 	lea    0x491f(%rip),%rsi        # 405c5e <hash_test+0x43e>
  40133f:	bf 01 00 00 00       	mov    $0x1,%edi
  401344:	31 c0                	xor    %eax,%eax
  401346:	e8 15 f2 ff ff       	callq  400560 <__printf_chk@plt>
  40134b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401350:	0f b6 13             	movzbl (%rbx),%edx
  401353:	31 c0                	xor    %eax,%eax
  401355:	48 89 ee             	mov    %rbp,%rsi
  401358:	bf 01 00 00 00       	mov    $0x1,%edi
  40135d:	48 83 c3 01          	add    $0x1,%rbx
  401361:	e8 fa f1 ff ff       	callq  400560 <__printf_chk@plt>
  401366:	4c 39 eb             	cmp    %r13,%rbx
  401369:	75 e5                	jne    401350 <GOST34112012Dump+0x70>
  40136b:	48 8d 35 f4 48 00 00 	lea    0x48f4(%rip),%rsi        # 405c66 <hash_test+0x446>
  401372:	49 8d ac 24 80 00 00 	lea    0x80(%r12),%rbp
  401379:	00 
  40137a:	4c 8d 2d 1f 44 00 00 	lea    0x441f(%rip),%r13        # 4057a0 <AXC+0x4000>
  401381:	bf 01 00 00 00       	mov    $0x1,%edi
  401386:	31 c0                	xor    %eax,%eax
  401388:	e8 d3 f1 ff ff       	callq  400560 <__printf_chk@plt>
  40138d:	0f 1f 00             	nopl   (%rax)
  401390:	0f b6 13             	movzbl (%rbx),%edx
  401393:	31 c0                	xor    %eax,%eax
  401395:	4c 89 ee             	mov    %r13,%rsi
  401398:	bf 01 00 00 00       	mov    $0x1,%edi
  40139d:	48 83 c3 01          	add    $0x1,%rbx
  4013a1:	e8 ba f1 ff ff       	callq  400560 <__printf_chk@plt>
  4013a6:	48 39 dd             	cmp    %rbx,%rbp
  4013a9:	75 e5                	jne    401390 <GOST34112012Dump+0xb0>
  4013ab:	48 8d 35 bc 48 00 00 	lea    0x48bc(%rip),%rsi        # 405c6e <hash_test+0x44e>
  4013b2:	48 89 eb             	mov    %rbp,%rbx
  4013b5:	4c 8d 2d e4 43 00 00 	lea    0x43e4(%rip),%r13        # 4057a0 <AXC+0x4000>
  4013bc:	49 8d ac 24 c0 00 00 	lea    0xc0(%r12),%rbp
  4013c3:	00 
  4013c4:	bf 01 00 00 00       	mov    $0x1,%edi
  4013c9:	31 c0                	xor    %eax,%eax
  4013cb:	e8 90 f1 ff ff       	callq  400560 <__printf_chk@plt>
  4013d0:	0f b6 13             	movzbl (%rbx),%edx
  4013d3:	31 c0                	xor    %eax,%eax
  4013d5:	4c 89 ee             	mov    %r13,%rsi
  4013d8:	bf 01 00 00 00       	mov    $0x1,%edi
  4013dd:	48 83 c3 01          	add    $0x1,%rbx
  4013e1:	e8 7a f1 ff ff       	callq  400560 <__printf_chk@plt>
  4013e6:	48 39 dd             	cmp    %rbx,%rbp
  4013e9:	75 e5                	jne    4013d0 <GOST34112012Dump+0xf0>
  4013eb:	48 8d 35 84 48 00 00 	lea    0x4884(%rip),%rsi        # 405c76 <hash_test+0x456>
  4013f2:	31 c0                	xor    %eax,%eax
  4013f4:	bf 01 00 00 00       	mov    $0x1,%edi
  4013f9:	e8 62 f1 ff ff       	callq  400560 <__printf_chk@plt>
  4013fe:	41 8b 94 24 00 01 00 	mov    0x100(%r12),%edx
  401405:	00 
  401406:	85 d2                	test   %edx,%edx
  401408:	7e 3a                	jle    401444 <GOST34112012Dump+0x164>
  40140a:	8d 42 ff             	lea    -0x1(%rdx),%eax
  40140d:	48 8d 1d 8c 43 00 00 	lea    0x438c(%rip),%rbx        # 4057a0 <AXC+0x4000>
  401414:	4d 8d ac 04 c1 00 00 	lea    0xc1(%r12,%rax,1),%r13
  40141b:	00 
  40141c:	0f 1f 40 00          	nopl   0x0(%rax)
  401420:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  401424:	31 c0                	xor    %eax,%eax
  401426:	48 89 de             	mov    %rbx,%rsi
  401429:	bf 01 00 00 00       	mov    $0x1,%edi
  40142e:	48 83 c5 01          	add    $0x1,%rbp
  401432:	e8 29 f1 ff ff       	callq  400560 <__printf_chk@plt>
  401437:	49 39 ed             	cmp    %rbp,%r13
  40143a:	75 e4                	jne    401420 <GOST34112012Dump+0x140>
  40143c:	41 8b 94 24 00 01 00 	mov    0x100(%r12),%edx
  401443:	00 
  401444:	48 83 c4 08          	add    $0x8,%rsp
  401448:	48 8d 35 2f 48 00 00 	lea    0x482f(%rip),%rsi        # 405c7e <hash_test+0x45e>
  40144f:	bf 01 00 00 00       	mov    $0x1,%edi
  401454:	5b                   	pop    %rbx
  401455:	5d                   	pop    %rbp
  401456:	41 5c                	pop    %r12
  401458:	41 5d                	pop    %r13
  40145a:	31 c0                	xor    %eax,%eax
  40145c:	e9 ff f0 ff ff       	jmpq   400560 <__printf_chk@plt>

Disassembly of section .fini:

0000000000401464 <_fini>:
  401464:	48 83 ec 08          	sub    $0x8,%rsp
  401468:	48 83 c4 08          	add    $0x8,%rsp
  40146c:	c3                   	retq   
