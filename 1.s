
./build/asm_streebog:     file format elf64-x86-64


Disassembly of section .init:

0000000000400528 <_init>:
  400528:	48 83 ec 08          	sub    $0x8,%rsp
  40052c:	48 8b 05 c5 6a 20 00 	mov    0x206ac5(%rip),%rax        # 606ff8 <__gmon_start__>
  400533:	48 85 c0             	test   %rax,%rax
  400536:	74 02                	je     40053a <_init+0x12>
  400538:	ff d0                	callq  *%rax
  40053a:	48 83 c4 08          	add    $0x8,%rsp
  40053e:	c3                   	retq   

Disassembly of section .plt:

0000000000400540 <.plt>:
  400540:	ff 35 c2 6a 20 00    	pushq  0x206ac2(%rip)        # 607008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400546:	ff 25 c4 6a 20 00    	jmpq   *0x206ac4(%rip)        # 607010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40054c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400550 <puts@plt>:
  400550:	ff 25 c2 6a 20 00    	jmpq   *0x206ac2(%rip)        # 607018 <puts@GLIBC_2.2.5>
  400556:	68 00 00 00 00       	pushq  $0x0
  40055b:	e9 e0 ff ff ff       	jmpq   400540 <.plt>

0000000000400560 <clock@plt>:
  400560:	ff 25 ba 6a 20 00    	jmpq   *0x206aba(%rip)        # 607020 <clock@GLIBC_2.2.5>
  400566:	68 01 00 00 00       	pushq  $0x1
  40056b:	e9 d0 ff ff ff       	jmpq   400540 <.plt>

0000000000400570 <strlen@plt>:
  400570:	ff 25 b2 6a 20 00    	jmpq   *0x206ab2(%rip)        # 607028 <strlen@GLIBC_2.2.5>
  400576:	68 02 00 00 00       	pushq  $0x2
  40057b:	e9 c0 ff ff ff       	jmpq   400540 <.plt>

0000000000400580 <__stack_chk_fail@plt>:
  400580:	ff 25 aa 6a 20 00    	jmpq   *0x206aaa(%rip)        # 607030 <__stack_chk_fail@GLIBC_2.4>
  400586:	68 03 00 00 00       	pushq  $0x3
  40058b:	e9 b0 ff ff ff       	jmpq   400540 <.plt>

0000000000400590 <strcmp@plt>:
  400590:	ff 25 a2 6a 20 00    	jmpq   *0x206aa2(%rip)        # 607038 <strcmp@GLIBC_2.2.5>
  400596:	68 04 00 00 00       	pushq  $0x4
  40059b:	e9 a0 ff ff ff       	jmpq   400540 <.plt>

00000000004005a0 <__printf_chk@plt>:
  4005a0:	ff 25 9a 6a 20 00    	jmpq   *0x206a9a(%rip)        # 607040 <__printf_chk@GLIBC_2.3.4>
  4005a6:	68 05 00 00 00       	pushq  $0x5
  4005ab:	e9 90 ff ff ff       	jmpq   400540 <.plt>

Disassembly of section .text:

00000000004005b0 <main>:
  4005b0:	83 ff 01             	cmp    $0x1,%edi
  4005b3:	7e 33                	jle    4005e8 <main+0x38>
  4005b5:	53                   	push   %rbx
  4005b6:	48 8b 5e 08          	mov    0x8(%rsi),%rbx
  4005ba:	48 8d 35 5f 5a 00 00 	lea    0x5a5f(%rip),%rsi        # 406020 <AXC+0x4040>
  4005c1:	48 89 df             	mov    %rbx,%rdi
  4005c4:	e8 c7 ff ff ff       	callq  400590 <strcmp@plt>
  4005c9:	85 c0                	test   %eax,%eax
  4005cb:	74 22                	je     4005ef <main+0x3f>
  4005cd:	48 8d 35 4f 5a 00 00 	lea    0x5a4f(%rip),%rsi        # 406023 <AXC+0x4043>
  4005d4:	48 89 df             	mov    %rbx,%rdi
  4005d7:	e8 b4 ff ff ff       	callq  400590 <strcmp@plt>
  4005dc:	85 c0                	test   %eax,%eax
  4005de:	74 15                	je     4005f5 <main+0x45>
  4005e0:	5b                   	pop    %rbx
  4005e1:	31 c0                	xor    %eax,%eax
  4005e3:	e9 08 14 00 00       	jmpq   4019f0 <test>
  4005e8:	31 c0                	xor    %eax,%eax
  4005ea:	e9 01 14 00 00       	jmpq   4019f0 <test>
  4005ef:	5b                   	pop    %rbx
  4005f0:	e9 0b 12 00 00       	jmpq   401800 <benchmark>
  4005f5:	5b                   	pop    %rbx
  4005f6:	e9 45 13 00 00       	jmpq   401940 <i1>
  4005fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400600 <_start>:
  400600:	31 ed                	xor    %ebp,%ebp
  400602:	49 89 d1             	mov    %rdx,%r9
  400605:	5e                   	pop    %rsi
  400606:	48 89 e2             	mov    %rsp,%rdx
  400609:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40060d:	50                   	push   %rax
  40060e:	54                   	push   %rsp
  40060f:	49 c7 c0 60 07 40 00 	mov    $0x400760,%r8
  400616:	48 c7 c1 f0 06 40 00 	mov    $0x4006f0,%rcx
  40061d:	48 c7 c7 b0 05 40 00 	mov    $0x4005b0,%rdi
  400624:	ff 15 c6 69 20 00    	callq  *0x2069c6(%rip)        # 606ff0 <__libc_start_main@GLIBC_2.2.5>
  40062a:	f4                   	hlt    
  40062b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400630 <_dl_relocate_static_pie>:
  400630:	f3 c3                	repz retq 
  400632:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400639:	00 00 00 
  40063c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400640 <deregister_tm_clones>:
  400640:	55                   	push   %rbp
  400641:	b8 b0 70 60 00       	mov    $0x6070b0,%eax
  400646:	48 3d b0 70 60 00    	cmp    $0x6070b0,%rax
  40064c:	48 89 e5             	mov    %rsp,%rbp
  40064f:	74 17                	je     400668 <deregister_tm_clones+0x28>
  400651:	b8 00 00 00 00       	mov    $0x0,%eax
  400656:	48 85 c0             	test   %rax,%rax
  400659:	74 0d                	je     400668 <deregister_tm_clones+0x28>
  40065b:	5d                   	pop    %rbp
  40065c:	bf b0 70 60 00       	mov    $0x6070b0,%edi
  400661:	ff e0                	jmpq   *%rax
  400663:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400668:	5d                   	pop    %rbp
  400669:	c3                   	retq   
  40066a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400670 <register_tm_clones>:
  400670:	be b0 70 60 00       	mov    $0x6070b0,%esi
  400675:	55                   	push   %rbp
  400676:	48 81 ee b0 70 60 00 	sub    $0x6070b0,%rsi
  40067d:	48 89 e5             	mov    %rsp,%rbp
  400680:	48 c1 fe 03          	sar    $0x3,%rsi
  400684:	48 89 f0             	mov    %rsi,%rax
  400687:	48 c1 e8 3f          	shr    $0x3f,%rax
  40068b:	48 01 c6             	add    %rax,%rsi
  40068e:	48 d1 fe             	sar    %rsi
  400691:	74 15                	je     4006a8 <register_tm_clones+0x38>
  400693:	b8 00 00 00 00       	mov    $0x0,%eax
  400698:	48 85 c0             	test   %rax,%rax
  40069b:	74 0b                	je     4006a8 <register_tm_clones+0x38>
  40069d:	5d                   	pop    %rbp
  40069e:	bf b0 70 60 00       	mov    $0x6070b0,%edi
  4006a3:	ff e0                	jmpq   *%rax
  4006a5:	0f 1f 00             	nopl   (%rax)
  4006a8:	5d                   	pop    %rbp
  4006a9:	c3                   	retq   
  4006aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004006b0 <__do_global_dtors_aux>:
  4006b0:	80 3d 09 6a 20 00 00 	cmpb   $0x0,0x206a09(%rip)        # 6070c0 <completed.7697>
  4006b7:	75 17                	jne    4006d0 <__do_global_dtors_aux+0x20>
  4006b9:	55                   	push   %rbp
  4006ba:	48 89 e5             	mov    %rsp,%rbp
  4006bd:	e8 7e ff ff ff       	callq  400640 <deregister_tm_clones>
  4006c2:	c6 05 f7 69 20 00 01 	movb   $0x1,0x2069f7(%rip)        # 6070c0 <completed.7697>
  4006c9:	5d                   	pop    %rbp
  4006ca:	c3                   	retq   
  4006cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4006d0:	f3 c3                	repz retq 
  4006d2:	0f 1f 40 00          	nopl   0x0(%rax)
  4006d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4006dd:	00 00 00 

00000000004006e0 <frame_dummy>:
  4006e0:	55                   	push   %rbp
  4006e1:	48 89 e5             	mov    %rsp,%rbp
  4006e4:	5d                   	pop    %rbp
  4006e5:	eb 89                	jmp    400670 <register_tm_clones>
  4006e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4006ee:	00 00 

00000000004006f0 <__libc_csu_init>:
  4006f0:	41 57                	push   %r15
  4006f2:	41 56                	push   %r14
  4006f4:	49 89 d7             	mov    %rdx,%r15
  4006f7:	41 55                	push   %r13
  4006f9:	41 54                	push   %r12
  4006fb:	4c 8d 25 0e 67 20 00 	lea    0x20670e(%rip),%r12        # 606e10 <__frame_dummy_init_array_entry>
  400702:	55                   	push   %rbp
  400703:	48 8d 2d 0e 67 20 00 	lea    0x20670e(%rip),%rbp        # 606e18 <__init_array_end>
  40070a:	53                   	push   %rbx
  40070b:	41 89 fd             	mov    %edi,%r13d
  40070e:	49 89 f6             	mov    %rsi,%r14
  400711:	4c 29 e5             	sub    %r12,%rbp
  400714:	48 83 ec 08          	sub    $0x8,%rsp
  400718:	48 c1 fd 03          	sar    $0x3,%rbp
  40071c:	e8 07 fe ff ff       	callq  400528 <_init>
  400721:	48 85 ed             	test   %rbp,%rbp
  400724:	74 20                	je     400746 <__libc_csu_init+0x56>
  400726:	31 db                	xor    %ebx,%ebx
  400728:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40072f:	00 
  400730:	4c 89 fa             	mov    %r15,%rdx
  400733:	4c 89 f6             	mov    %r14,%rsi
  400736:	44 89 ef             	mov    %r13d,%edi
  400739:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40073d:	48 83 c3 01          	add    $0x1,%rbx
  400741:	48 39 dd             	cmp    %rbx,%rbp
  400744:	75 ea                	jne    400730 <__libc_csu_init+0x40>
  400746:	48 83 c4 08          	add    $0x8,%rsp
  40074a:	5b                   	pop    %rbx
  40074b:	5d                   	pop    %rbp
  40074c:	41 5c                	pop    %r12
  40074e:	41 5d                	pop    %r13
  400750:	41 5e                	pop    %r14
  400752:	41 5f                	pop    %r15
  400754:	c3                   	retq   
  400755:	90                   	nop
  400756:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40075d:	00 00 00 

0000000000400760 <__libc_csu_fini>:
  400760:	f3 c3                	repz retq 
  400762:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400769:	00 00 00 
  40076c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400770 <GOST34112012Cleanup>:
  400770:	8b b7 04 01 00 00    	mov    0x104(%rdi),%esi
  400776:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40077d:	00 00 00 

0000000000400780 <GOST34112012Init>:
  400780:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  400787:	48 31 c0             	xor    %rax,%rax
  40078a:	49 c7 c0 01 01 00 00 	mov    $0x101,%r8
  400791:	48 83 fe 20          	cmp    $0x20,%rsi
  400795:	49 0f 44 c0          	cmove  %r8,%rax
  400799:	f3 aa                	rep stos %al,%es:(%rdi)
  40079b:	30 c0                	xor    %al,%al
  40079d:	48 c7 c1 c4 00 00 00 	mov    $0xc4,%rcx
  4007a4:	f3 aa                	rep stos %al,%es:(%rdi)
  4007a6:	89 37                	mov    %esi,(%rdi)
  4007a8:	48 83 fe 40          	cmp    $0x40,%rsi
  4007ac:	49 0f 44 c0          	cmove  %r8,%rax
  4007b0:	48 c1 e8 08          	shr    $0x8,%rax
  4007b4:	48 ff c8             	dec    %rax
  4007b7:	c3                   	retq   
  4007b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4007bf:	00 

00000000004007c0 <GOST34112012Update>:
  4007c0:	53                   	push   %rbx
  4007c1:	52                   	push   %rdx
  4007c2:	41 54                	push   %r12
  4007c4:	c5 f8 77             	vzeroupper 
  4007c7:	49 89 fc             	mov    %rdi,%r12
  4007ca:	c4 c1 7d 6f 04 24    	vmovdqa (%r12),%ymm0
  4007d0:	c4 c1 7d 6f 4c 24 20 	vmovdqa 0x20(%r12),%ymm1
  4007d7:	41 8b 9c 24 00 01 00 	mov    0x100(%r12),%ebx
  4007de:	00 
  4007df:	83 fb 00             	cmp    $0x0,%ebx
  4007e2:	48 89 f3             	mov    %rsi,%rbx
  4007e5:	0f 84 dd 00 00 00    	je     4008c8 <update_data>
  4007eb:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  4007f2:	48 29 d9             	sub    %rbx,%rcx
  4007f5:	48 39 d1             	cmp    %rdx,%rcx
  4007f8:	48 0f 4f ca          	cmovg  %rdx,%rcx
  4007fc:	49 8d 3c 1c          	lea    (%r12,%rbx,1),%rdi
  400800:	48 8d bf c0 00 00 00 	lea    0xc0(%rdi),%rdi
  400807:	48 01 cb             	add    %rcx,%rbx
  40080a:	48 29 ca             	sub    %rcx,%rdx
  40080d:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  40080f:	41 89 9c 24 00 01 00 	mov    %ebx,0x100(%r12)
  400816:	00 
  400817:	48 83 fb 00          	cmp    $0x0,%rbx
  40081b:	0f 85 df 00 00 00    	jne    400900 <exit_update>
  400821:	48 89 f3             	mov    %rsi,%rbx
  400824:	49 8d b4 24 c0 00 00 	lea    0xc0(%r12),%rsi
  40082b:	00 
  40082c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400830 <stage_loop>:
  400830:	0f 18 43 40          	prefetchnta 0x40(%rbx)
  400834:	0f 18 83 c0 00 00 00 	prefetchnta 0xc0(%rbx)
  40083b:	c4 c1 7d 6f 54 24 40 	vmovdqa 0x40(%r12),%ymm2
  400842:	c4 c1 7d 6f 5c 24 60 	vmovdqa 0x60(%r12),%ymm3
  400849:	e8 f2 01 00 00       	callq  400a40 <g_func>
  40084e:	49 8d 7c 24 40       	lea    0x40(%r12),%rdi
  400853:	49 c7 c2 00 02 00 00 	mov    $0x200,%r10
  40085a:	4d 31 c9             	xor    %r9,%r9
  40085d:	4c 01 17             	add    %r10,(%rdi)
  400860:	4c 11 4f 08          	adc    %r9,0x8(%rdi)
  400864:	4c 11 4f 10          	adc    %r9,0x10(%rdi)
  400868:	4c 11 4f 18          	adc    %r9,0x18(%rdi)
  40086c:	4c 11 4f 20          	adc    %r9,0x20(%rdi)
  400870:	4c 11 4f 28          	adc    %r9,0x28(%rdi)
  400874:	4c 11 4f 30          	adc    %r9,0x30(%rdi)
  400878:	4c 11 4f 38          	adc    %r9,0x38(%rdi)
  40087c:	49 8d bc 24 80 00 00 	lea    0x80(%r12),%rdi
  400883:	00 
  400884:	4c 8b 16             	mov    (%rsi),%r10
  400887:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
  40088b:	4c 01 17             	add    %r10,(%rdi)
  40088e:	4c 11 4f 08          	adc    %r9,0x8(%rdi)
  400892:	4c 8b 56 10          	mov    0x10(%rsi),%r10
  400896:	4c 8b 4e 18          	mov    0x18(%rsi),%r9
  40089a:	4c 11 57 10          	adc    %r10,0x10(%rdi)
  40089e:	4c 11 4f 18          	adc    %r9,0x18(%rdi)
  4008a2:	4c 8b 56 20          	mov    0x20(%rsi),%r10
  4008a6:	4c 8b 4e 28          	mov    0x28(%rsi),%r9
  4008aa:	4c 11 57 20          	adc    %r10,0x20(%rdi)
  4008ae:	4c 11 4f 28          	adc    %r9,0x28(%rdi)
  4008b2:	4c 8b 56 30          	mov    0x30(%rsi),%r10
  4008b6:	4c 8b 4e 38          	mov    0x38(%rsi),%r9
  4008ba:	4c 11 57 30          	adc    %r10,0x30(%rdi)
  4008be:	4c 11 4f 38          	adc    %r9,0x38(%rdi)
  4008c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004008c8 <update_data>:
  4008c8:	48 89 de             	mov    %rbx,%rsi
  4008cb:	48 83 c3 40          	add    $0x40,%rbx
  4008cf:	48 83 ea 40          	sub    $0x40,%rdx
  4008d3:	0f 83 57 ff ff ff    	jae    400830 <stage_loop>
  4008d9:	48 83 c2 40          	add    $0x40,%rdx
  4008dd:	c4 c1 7d 7f 04 24    	vmovdqa %ymm0,(%r12)
  4008e3:	c4 c1 7d 7f 4c 24 20 	vmovdqa %ymm1,0x20(%r12)
  4008ea:	48 89 d1             	mov    %rdx,%rcx
  4008ed:	41 89 94 24 00 01 00 	mov    %edx,0x100(%r12)
  4008f4:	00 
  4008f5:	49 8d bc 24 c0 00 00 	lea    0xc0(%r12),%rdi
  4008fc:	00 
  4008fd:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  4008ff:	90                   	nop

0000000000400900 <exit_update>:
  400900:	c5 f8 77             	vzeroupper 
  400903:	41 5c                	pop    %r12
  400905:	5a                   	pop    %rdx
  400906:	5b                   	pop    %rbx
  400907:	c3                   	retq   
  400908:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40090f:	00 

0000000000400910 <GOST34112012Final>:
  400910:	53                   	push   %rbx
  400911:	52                   	push   %rdx
  400912:	56                   	push   %rsi
  400913:	c5 f8 77             	vzeroupper 
  400916:	8b 9f 00 01 00 00    	mov    0x100(%rdi),%ebx
  40091c:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
  400920:	c5 fd 6f 4f 20       	vmovdqa 0x20(%rdi),%ymm1
  400925:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  40092c:	48 29 d9             	sub    %rbx,%rcx
  40092f:	74 1f                	je     400950 <n_buff>
  400931:	48 89 fa             	mov    %rdi,%rdx
  400934:	48 8d 3c 1f          	lea    (%rdi,%rbx,1),%rdi
  400938:	48 8d bf c0 00 00 00 	lea    0xc0(%rdi),%rdi
  40093f:	b0 01                	mov    $0x1,%al
  400941:	aa                   	stos   %al,%es:(%rdi)
  400942:	30 c0                	xor    %al,%al
  400944:	48 ff c9             	dec    %rcx
  400947:	f3 aa                	rep stos %al,%es:(%rdi)
  400949:	48 89 d7             	mov    %rdx,%rdi
  40094c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400950 <n_buff>:
  400950:	48 8d b7 c0 00 00 00 	lea    0xc0(%rdi),%rsi
  400957:	c5 fd 6f 57 40       	vmovdqa 0x40(%rdi),%ymm2
  40095c:	c5 fd 6f 5f 60       	vmovdqa 0x60(%rdi),%ymm3
  400961:	e8 da 00 00 00       	callq  400a40 <g_func>
  400966:	48 c1 e3 03          	shl    $0x3,%rbx
  40096a:	48 8d 77 40          	lea    0x40(%rdi),%rsi
  40096e:	4d 31 c9             	xor    %r9,%r9
  400971:	48 01 1e             	add    %rbx,(%rsi)
  400974:	4c 11 4e 08          	adc    %r9,0x8(%rsi)
  400978:	4c 11 4e 10          	adc    %r9,0x10(%rsi)
  40097c:	4c 11 4e 18          	adc    %r9,0x18(%rsi)
  400980:	4c 11 4e 20          	adc    %r9,0x20(%rsi)
  400984:	4c 11 4e 28          	adc    %r9,0x28(%rsi)
  400988:	4c 11 4e 30          	adc    %r9,0x30(%rsi)
  40098c:	4c 11 4e 38          	adc    %r9,0x38(%rsi)
  400990:	48 8d b7 c0 00 00 00 	lea    0xc0(%rdi),%rsi
  400997:	48 8d bf 80 00 00 00 	lea    0x80(%rdi),%rdi
  40099e:	4c 8b 16             	mov    (%rsi),%r10
  4009a1:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
  4009a5:	4c 01 17             	add    %r10,(%rdi)
  4009a8:	4c 11 4f 08          	adc    %r9,0x8(%rdi)
  4009ac:	4c 8b 56 10          	mov    0x10(%rsi),%r10
  4009b0:	4c 8b 4e 18          	mov    0x18(%rsi),%r9
  4009b4:	4c 11 57 10          	adc    %r10,0x10(%rdi)
  4009b8:	4c 11 4f 18          	adc    %r9,0x18(%rdi)
  4009bc:	4c 8b 56 20          	mov    0x20(%rsi),%r10
  4009c0:	4c 8b 4e 28          	mov    0x28(%rsi),%r9
  4009c4:	4c 11 57 20          	adc    %r10,0x20(%rdi)
  4009c8:	4c 11 4f 28          	adc    %r9,0x28(%rdi)
  4009cc:	4c 8b 56 30          	mov    0x30(%rsi),%r10
  4009d0:	4c 8b 4e 38          	mov    0x38(%rsi),%r9
  4009d4:	4c 11 57 30          	adc    %r10,0x30(%rdi)
  4009d8:	4c 11 4f 38          	adc    %r9,0x38(%rdi)
  4009dc:	48 89 d7             	mov    %rdx,%rdi
  4009df:	c5 ed ef d2          	vpxor  %ymm2,%ymm2,%ymm2
  4009e3:	c5 e5 ef db          	vpxor  %ymm3,%ymm3,%ymm3
  4009e7:	48 8d 77 40          	lea    0x40(%rdi),%rsi
  4009eb:	e8 50 00 00 00       	callq  400a40 <g_func>
  4009f0:	c5 ed ef d2          	vpxor  %ymm2,%ymm2,%ymm2
  4009f4:	c5 e5 ef db          	vpxor  %ymm3,%ymm3,%ymm3
  4009f8:	48 8d b7 80 00 00 00 	lea    0x80(%rdi),%rsi
  4009ff:	e8 3c 00 00 00       	callq  400a40 <g_func>
  400a04:	c5 fd 7f 07          	vmovdqa %ymm0,(%rdi)
  400a08:	c5 fd 7f 4f 20       	vmovdqa %ymm1,0x20(%rdi)
  400a0d:	c5 f8 77             	vzeroupper 
  400a10:	5e                   	pop    %rsi
  400a11:	5a                   	pop    %rdx
  400a12:	5b                   	pop    %rbx
  400a13:	48 85 f6             	test   %rsi,%rsi
  400a16:	75 08                	jne    400a20 <GOST34112012Hash>
  400a18:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
  400a1f:	c3                   	retq   

0000000000400a20 <GOST34112012Hash>:
  400a20:	8b 8f 04 01 00 00    	mov    0x104(%rdi),%ecx
  400a26:	48 8d 47 40          	lea    0x40(%rdi),%rax
  400a2a:	48 89 f7             	mov    %rsi,%rdi
  400a2d:	48 29 c8             	sub    %rcx,%rax
  400a30:	48 89 c6             	mov    %rax,%rsi
  400a33:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  400a35:	48 31 c0             	xor    %rax,%rax
  400a38:	c3                   	retq   
  400a39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400a40 <g_func>:
  400a40:	56                   	push   %rsi
  400a41:	55                   	push   %rbp
  400a42:	53                   	push   %rbx
  400a43:	52                   	push   %rdx
  400a44:	48 89 e5             	mov    %rsp,%rbp
  400a47:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
  400a4e:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400a52:	c5 fd 6f f0          	vmovdqa %ymm0,%ymm6
  400a56:	c5 fd 6f f9          	vmovdqa %ymm1,%ymm7
  400a5a:	c5 ed ef d0          	vpxor  %ymm0,%ymm2,%ymm2
  400a5e:	c5 e5 ef d9          	vpxor  %ymm1,%ymm3,%ymm3
  400a62:	48 8d 05 77 15 00 00 	lea    0x1577(%rip),%rax        # 401fe0 <AXC>
  400a69:	c4 e3 7d 39 d0 01    	vextracti128 $0x1,%ymm2,%xmm0
  400a6f:	c4 e3 7d 39 d9 01    	vextracti128 $0x1,%ymm3,%xmm1
  400a75:	c4 e3 79 14 d2 00    	vpextrb $0x0,%xmm2,%edx
  400a7b:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  400a7f:	c4 e3 79 14 d2 08    	vpextrb $0x8,%xmm2,%edx
  400a85:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  400a8c:	00 
  400a8d:	c4 e3 79 14 da 00    	vpextrb $0x0,%xmm3,%edx
  400a93:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  400a9a:	00 
  400a9b:	c4 e3 79 14 da 08    	vpextrb $0x8,%xmm3,%edx
  400aa1:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  400aa8:	00 
  400aa9:	c4 e3 79 14 c2 00    	vpextrb $0x0,%xmm0,%edx
  400aaf:	4c 33 84 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r8
  400ab6:	00 
  400ab7:	c4 e3 79 14 c2 08    	vpextrb $0x8,%xmm0,%edx
  400abd:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  400ac4:	00 
  400ac5:	c4 e3 79 14 ca 00    	vpextrb $0x0,%xmm1,%edx
  400acb:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  400ad2:	00 
  400ad3:	c4 e3 79 14 ca 08    	vpextrb $0x8,%xmm1,%edx
  400ad9:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  400ae0:	00 
  400ae1:	c4 e3 79 14 d3 01    	vpextrb $0x1,%xmm2,%ebx
  400ae7:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  400aeb:	c4 e3 79 14 d3 09    	vpextrb $0x9,%xmm2,%ebx
  400af1:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  400af8:	00 
  400af9:	c4 e3 79 14 db 01    	vpextrb $0x1,%xmm3,%ebx
  400aff:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  400b06:	00 
  400b07:	c4 e3 79 14 db 09    	vpextrb $0x9,%xmm3,%ebx
  400b0d:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  400b14:	00 
  400b15:	c4 e3 79 14 c3 01    	vpextrb $0x1,%xmm0,%ebx
  400b1b:	4c 33 8c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r9
  400b22:	00 
  400b23:	c4 e3 79 14 c3 09    	vpextrb $0x9,%xmm0,%ebx
  400b29:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  400b30:	00 
  400b31:	c4 e3 79 14 cb 01    	vpextrb $0x1,%xmm1,%ebx
  400b37:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  400b3e:	00 
  400b3f:	c4 e3 79 14 cb 09    	vpextrb $0x9,%xmm1,%ebx
  400b45:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  400b4c:	00 
  400b4d:	c4 e3 79 14 d2 02    	vpextrb $0x2,%xmm2,%edx
  400b53:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  400b57:	c4 e3 79 14 d2 0a    	vpextrb $0xa,%xmm2,%edx
  400b5d:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  400b64:	00 
  400b65:	c4 e3 79 14 da 02    	vpextrb $0x2,%xmm3,%edx
  400b6b:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  400b72:	00 
  400b73:	c4 e3 79 14 da 0a    	vpextrb $0xa,%xmm3,%edx
  400b79:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  400b80:	00 
  400b81:	c4 e3 79 14 c2 02    	vpextrb $0x2,%xmm0,%edx
  400b87:	4c 33 94 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r10
  400b8e:	00 
  400b8f:	c4 e3 79 14 c2 0a    	vpextrb $0xa,%xmm0,%edx
  400b95:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  400b9c:	00 
  400b9d:	c4 e3 79 14 ca 02    	vpextrb $0x2,%xmm1,%edx
  400ba3:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  400baa:	00 
  400bab:	c4 e3 79 14 ca 0a    	vpextrb $0xa,%xmm1,%edx
  400bb1:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  400bb8:	00 
  400bb9:	c4 e3 79 14 d3 03    	vpextrb $0x3,%xmm2,%ebx
  400bbf:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  400bc3:	c4 e3 79 14 d3 0b    	vpextrb $0xb,%xmm2,%ebx
  400bc9:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  400bd0:	00 
  400bd1:	c4 e3 79 14 db 03    	vpextrb $0x3,%xmm3,%ebx
  400bd7:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  400bde:	00 
  400bdf:	c4 e3 79 14 db 0b    	vpextrb $0xb,%xmm3,%ebx
  400be5:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  400bec:	00 
  400bed:	c4 e3 79 14 c3 03    	vpextrb $0x3,%xmm0,%ebx
  400bf3:	4c 33 9c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r11
  400bfa:	00 
  400bfb:	c4 e3 79 14 c3 0b    	vpextrb $0xb,%xmm0,%ebx
  400c01:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  400c08:	00 
  400c09:	c4 e3 79 14 cb 03    	vpextrb $0x3,%xmm1,%ebx
  400c0f:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  400c16:	00 
  400c17:	c4 e3 79 14 cb 0b    	vpextrb $0xb,%xmm1,%ebx
  400c1d:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  400c24:	00 
  400c25:	4c 89 04 24          	mov    %r8,(%rsp)
  400c29:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
  400c2e:	4c 89 54 24 10       	mov    %r10,0x10(%rsp)
  400c33:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
  400c38:	c4 e3 79 14 d2 04    	vpextrb $0x4,%xmm2,%edx
  400c3e:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  400c42:	c4 e3 79 14 d2 0c    	vpextrb $0xc,%xmm2,%edx
  400c48:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  400c4f:	00 
  400c50:	c4 e3 79 14 da 04    	vpextrb $0x4,%xmm3,%edx
  400c56:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  400c5d:	00 
  400c5e:	c4 e3 79 14 da 0c    	vpextrb $0xc,%xmm3,%edx
  400c64:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  400c6b:	00 
  400c6c:	c4 e3 79 14 c2 04    	vpextrb $0x4,%xmm0,%edx
  400c72:	4c 33 84 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r8
  400c79:	00 
  400c7a:	c4 e3 79 14 c2 0c    	vpextrb $0xc,%xmm0,%edx
  400c80:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  400c87:	00 
  400c88:	c4 e3 79 14 ca 04    	vpextrb $0x4,%xmm1,%edx
  400c8e:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  400c95:	00 
  400c96:	c4 e3 79 14 ca 0c    	vpextrb $0xc,%xmm1,%edx
  400c9c:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  400ca3:	00 
  400ca4:	c4 e3 79 14 d3 05    	vpextrb $0x5,%xmm2,%ebx
  400caa:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  400cae:	c4 e3 79 14 d3 0d    	vpextrb $0xd,%xmm2,%ebx
  400cb4:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  400cbb:	00 
  400cbc:	c4 e3 79 14 db 05    	vpextrb $0x5,%xmm3,%ebx
  400cc2:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  400cc9:	00 
  400cca:	c4 e3 79 14 db 0d    	vpextrb $0xd,%xmm3,%ebx
  400cd0:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  400cd7:	00 
  400cd8:	c4 e3 79 14 c3 05    	vpextrb $0x5,%xmm0,%ebx
  400cde:	4c 33 8c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r9
  400ce5:	00 
  400ce6:	c4 e3 79 14 c3 0d    	vpextrb $0xd,%xmm0,%ebx
  400cec:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  400cf3:	00 
  400cf4:	c4 e3 79 14 cb 05    	vpextrb $0x5,%xmm1,%ebx
  400cfa:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  400d01:	00 
  400d02:	c4 e3 79 14 cb 0d    	vpextrb $0xd,%xmm1,%ebx
  400d08:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  400d0f:	00 
  400d10:	c4 e3 79 14 d2 06    	vpextrb $0x6,%xmm2,%edx
  400d16:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  400d1a:	c4 e3 79 14 d2 0e    	vpextrb $0xe,%xmm2,%edx
  400d20:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  400d27:	00 
  400d28:	c4 e3 79 14 da 06    	vpextrb $0x6,%xmm3,%edx
  400d2e:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  400d35:	00 
  400d36:	c4 e3 79 14 da 0e    	vpextrb $0xe,%xmm3,%edx
  400d3c:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  400d43:	00 
  400d44:	c4 e3 79 14 c2 06    	vpextrb $0x6,%xmm0,%edx
  400d4a:	4c 33 94 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r10
  400d51:	00 
  400d52:	c4 e3 79 14 c2 0e    	vpextrb $0xe,%xmm0,%edx
  400d58:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  400d5f:	00 
  400d60:	c4 e3 79 14 ca 06    	vpextrb $0x6,%xmm1,%edx
  400d66:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  400d6d:	00 
  400d6e:	c4 e3 79 14 ca 0e    	vpextrb $0xe,%xmm1,%edx
  400d74:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  400d7b:	00 
  400d7c:	c4 e3 79 14 d3 07    	vpextrb $0x7,%xmm2,%ebx
  400d82:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  400d86:	c4 e3 79 14 d3 0f    	vpextrb $0xf,%xmm2,%ebx
  400d8c:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  400d93:	00 
  400d94:	c4 e3 79 14 db 07    	vpextrb $0x7,%xmm3,%ebx
  400d9a:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  400da1:	00 
  400da2:	c4 e3 79 14 db 0f    	vpextrb $0xf,%xmm3,%ebx
  400da8:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  400daf:	00 
  400db0:	c4 e3 79 14 c3 07    	vpextrb $0x7,%xmm0,%ebx
  400db6:	4c 33 9c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r11
  400dbd:	00 
  400dbe:	c4 e3 79 14 c3 0f    	vpextrb $0xf,%xmm0,%ebx
  400dc4:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  400dcb:	00 
  400dcc:	c4 e3 79 14 cb 07    	vpextrb $0x7,%xmm1,%ebx
  400dd2:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  400dd9:	00 
  400dda:	c4 e3 79 14 cb 0f    	vpextrb $0xf,%xmm1,%ebx
  400de0:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  400de7:	00 
  400de8:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
  400ded:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
  400df2:	4c 89 54 24 30       	mov    %r10,0x30(%rsp)
  400df7:	4c 89 5c 24 38       	mov    %r11,0x38(%rsp)
  400dfc:	c5 fd 6f 04 24       	vmovdqa (%rsp),%ymm0
  400e01:	c5 fd 6f 4c 24 20    	vmovdqa 0x20(%rsp),%ymm1
  400e07:	c5 fe 6f 26          	vmovdqu (%rsi),%ymm4
  400e0b:	c5 fe 6f 6e 20       	vmovdqu 0x20(%rsi),%ymm5
  400e10:	c5 cd ef f4          	vpxor  %ymm4,%ymm6,%ymm6
  400e14:	c5 c5 ef fd          	vpxor  %ymm5,%ymm7,%ymm7
  400e18:	48 c7 c1 0c 00 00 00 	mov    $0xc,%rcx
  400e1f:	48 8d 35 ba 0e 00 00 	lea    0xeba(%rip),%rsi        # 401ce0 <CXC>
  400e26:	66 90                	xchg   %ax,%ax

0000000000400e28 <g_func_loop>:
  400e28:	c5 dd ef d0          	vpxor  %ymm0,%ymm4,%ymm2
  400e2c:	c5 d5 ef d9          	vpxor  %ymm1,%ymm5,%ymm3
  400e30:	c5 fd 6f 26          	vmovdqa (%rsi),%ymm4
  400e34:	c5 fd 6f 6e 20       	vmovdqa 0x20(%rsi),%ymm5
  400e39:	c5 dd ef e0          	vpxor  %ymm0,%ymm4,%ymm4
  400e3d:	c5 d5 ef e9          	vpxor  %ymm1,%ymm5,%ymm5
  400e41:	c4 e3 7d 39 d0 01    	vextracti128 $0x1,%ymm2,%xmm0
  400e47:	c4 e3 7d 39 d9 01    	vextracti128 $0x1,%ymm3,%xmm1
  400e4d:	c4 e3 79 14 d2 00    	vpextrb $0x0,%xmm2,%edx
  400e53:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  400e57:	c4 e3 79 14 d2 08    	vpextrb $0x8,%xmm2,%edx
  400e5d:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  400e64:	00 
  400e65:	c4 e3 79 14 da 00    	vpextrb $0x0,%xmm3,%edx
  400e6b:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  400e72:	00 
  400e73:	c4 e3 79 14 da 08    	vpextrb $0x8,%xmm3,%edx
  400e79:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  400e80:	00 
  400e81:	c4 e3 79 14 c2 00    	vpextrb $0x0,%xmm0,%edx
  400e87:	4c 33 84 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r8
  400e8e:	00 
  400e8f:	c4 e3 79 14 c2 08    	vpextrb $0x8,%xmm0,%edx
  400e95:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  400e9c:	00 
  400e9d:	c4 e3 79 14 ca 00    	vpextrb $0x0,%xmm1,%edx
  400ea3:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  400eaa:	00 
  400eab:	c4 e3 79 14 ca 08    	vpextrb $0x8,%xmm1,%edx
  400eb1:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  400eb8:	00 
  400eb9:	c4 e3 79 14 d3 01    	vpextrb $0x1,%xmm2,%ebx
  400ebf:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  400ec3:	c4 e3 79 14 d3 09    	vpextrb $0x9,%xmm2,%ebx
  400ec9:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  400ed0:	00 
  400ed1:	c4 e3 79 14 db 01    	vpextrb $0x1,%xmm3,%ebx
  400ed7:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  400ede:	00 
  400edf:	c4 e3 79 14 db 09    	vpextrb $0x9,%xmm3,%ebx
  400ee5:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  400eec:	00 
  400eed:	c4 e3 79 14 c3 01    	vpextrb $0x1,%xmm0,%ebx
  400ef3:	4c 33 8c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r9
  400efa:	00 
  400efb:	c4 e3 79 14 c3 09    	vpextrb $0x9,%xmm0,%ebx
  400f01:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  400f08:	00 
  400f09:	c4 e3 79 14 cb 01    	vpextrb $0x1,%xmm1,%ebx
  400f0f:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  400f16:	00 
  400f17:	c4 e3 79 14 cb 09    	vpextrb $0x9,%xmm1,%ebx
  400f1d:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  400f24:	00 
  400f25:	c4 e3 79 14 d2 02    	vpextrb $0x2,%xmm2,%edx
  400f2b:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  400f2f:	c4 e3 79 14 d2 0a    	vpextrb $0xa,%xmm2,%edx
  400f35:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  400f3c:	00 
  400f3d:	c4 e3 79 14 da 02    	vpextrb $0x2,%xmm3,%edx
  400f43:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  400f4a:	00 
  400f4b:	c4 e3 79 14 da 0a    	vpextrb $0xa,%xmm3,%edx
  400f51:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  400f58:	00 
  400f59:	c4 e3 79 14 c2 02    	vpextrb $0x2,%xmm0,%edx
  400f5f:	4c 33 94 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r10
  400f66:	00 
  400f67:	c4 e3 79 14 c2 0a    	vpextrb $0xa,%xmm0,%edx
  400f6d:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  400f74:	00 
  400f75:	c4 e3 79 14 ca 02    	vpextrb $0x2,%xmm1,%edx
  400f7b:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  400f82:	00 
  400f83:	c4 e3 79 14 ca 0a    	vpextrb $0xa,%xmm1,%edx
  400f89:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  400f90:	00 
  400f91:	c4 e3 79 14 d3 03    	vpextrb $0x3,%xmm2,%ebx
  400f97:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  400f9b:	c4 e3 79 14 d3 0b    	vpextrb $0xb,%xmm2,%ebx
  400fa1:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  400fa8:	00 
  400fa9:	c4 e3 79 14 db 03    	vpextrb $0x3,%xmm3,%ebx
  400faf:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  400fb6:	00 
  400fb7:	c4 e3 79 14 db 0b    	vpextrb $0xb,%xmm3,%ebx
  400fbd:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  400fc4:	00 
  400fc5:	c4 e3 79 14 c3 03    	vpextrb $0x3,%xmm0,%ebx
  400fcb:	4c 33 9c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r11
  400fd2:	00 
  400fd3:	c4 e3 79 14 c3 0b    	vpextrb $0xb,%xmm0,%ebx
  400fd9:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  400fe0:	00 
  400fe1:	c4 e3 79 14 cb 03    	vpextrb $0x3,%xmm1,%ebx
  400fe7:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  400fee:	00 
  400fef:	c4 e3 79 14 cb 0b    	vpextrb $0xb,%xmm1,%ebx
  400ff5:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  400ffc:	00 
  400ffd:	4c 89 04 24          	mov    %r8,(%rsp)
  401001:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
  401006:	4c 89 54 24 10       	mov    %r10,0x10(%rsp)
  40100b:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
  401010:	c4 e3 79 14 d2 04    	vpextrb $0x4,%xmm2,%edx
  401016:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  40101a:	c4 e3 79 14 d2 0c    	vpextrb $0xc,%xmm2,%edx
  401020:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  401027:	00 
  401028:	c4 e3 79 14 da 04    	vpextrb $0x4,%xmm3,%edx
  40102e:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  401035:	00 
  401036:	c4 e3 79 14 da 0c    	vpextrb $0xc,%xmm3,%edx
  40103c:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  401043:	00 
  401044:	c4 e3 79 14 c2 04    	vpextrb $0x4,%xmm0,%edx
  40104a:	4c 33 84 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r8
  401051:	00 
  401052:	c4 e3 79 14 c2 0c    	vpextrb $0xc,%xmm0,%edx
  401058:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  40105f:	00 
  401060:	c4 e3 79 14 ca 04    	vpextrb $0x4,%xmm1,%edx
  401066:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  40106d:	00 
  40106e:	c4 e3 79 14 ca 0c    	vpextrb $0xc,%xmm1,%edx
  401074:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  40107b:	00 
  40107c:	c4 e3 79 14 d3 05    	vpextrb $0x5,%xmm2,%ebx
  401082:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  401086:	c4 e3 79 14 d3 0d    	vpextrb $0xd,%xmm2,%ebx
  40108c:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  401093:	00 
  401094:	c4 e3 79 14 db 05    	vpextrb $0x5,%xmm3,%ebx
  40109a:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  4010a1:	00 
  4010a2:	c4 e3 79 14 db 0d    	vpextrb $0xd,%xmm3,%ebx
  4010a8:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  4010af:	00 
  4010b0:	c4 e3 79 14 c3 05    	vpextrb $0x5,%xmm0,%ebx
  4010b6:	4c 33 8c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r9
  4010bd:	00 
  4010be:	c4 e3 79 14 c3 0d    	vpextrb $0xd,%xmm0,%ebx
  4010c4:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  4010cb:	00 
  4010cc:	c4 e3 79 14 cb 05    	vpextrb $0x5,%xmm1,%ebx
  4010d2:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  4010d9:	00 
  4010da:	c4 e3 79 14 cb 0d    	vpextrb $0xd,%xmm1,%ebx
  4010e0:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  4010e7:	00 
  4010e8:	c4 e3 79 14 d2 06    	vpextrb $0x6,%xmm2,%edx
  4010ee:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  4010f2:	c4 e3 79 14 d2 0e    	vpextrb $0xe,%xmm2,%edx
  4010f8:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  4010ff:	00 
  401100:	c4 e3 79 14 da 06    	vpextrb $0x6,%xmm3,%edx
  401106:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  40110d:	00 
  40110e:	c4 e3 79 14 da 0e    	vpextrb $0xe,%xmm3,%edx
  401114:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  40111b:	00 
  40111c:	c4 e3 79 14 c2 06    	vpextrb $0x6,%xmm0,%edx
  401122:	4c 33 94 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r10
  401129:	00 
  40112a:	c4 e3 79 14 c2 0e    	vpextrb $0xe,%xmm0,%edx
  401130:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  401137:	00 
  401138:	c4 e3 79 14 ca 06    	vpextrb $0x6,%xmm1,%edx
  40113e:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  401145:	00 
  401146:	c4 e3 79 14 ca 0e    	vpextrb $0xe,%xmm1,%edx
  40114c:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  401153:	00 
  401154:	c4 e3 79 14 d3 07    	vpextrb $0x7,%xmm2,%ebx
  40115a:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  40115e:	c4 e3 79 14 d3 0f    	vpextrb $0xf,%xmm2,%ebx
  401164:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  40116b:	00 
  40116c:	c4 e3 79 14 db 07    	vpextrb $0x7,%xmm3,%ebx
  401172:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  401179:	00 
  40117a:	c4 e3 79 14 db 0f    	vpextrb $0xf,%xmm3,%ebx
  401180:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  401187:	00 
  401188:	c4 e3 79 14 c3 07    	vpextrb $0x7,%xmm0,%ebx
  40118e:	4c 33 9c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r11
  401195:	00 
  401196:	c4 e3 79 14 c3 0f    	vpextrb $0xf,%xmm0,%ebx
  40119c:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  4011a3:	00 
  4011a4:	c4 e3 79 14 cb 07    	vpextrb $0x7,%xmm1,%ebx
  4011aa:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  4011b1:	00 
  4011b2:	c4 e3 79 14 cb 0f    	vpextrb $0xf,%xmm1,%ebx
  4011b8:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  4011bf:	00 
  4011c0:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
  4011c5:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
  4011ca:	4c 89 54 24 30       	mov    %r10,0x30(%rsp)
  4011cf:	4c 89 5c 24 38       	mov    %r11,0x38(%rsp)
  4011d4:	c5 fd 6f 04 24       	vmovdqa (%rsp),%ymm0
  4011d9:	c5 fd 6f 4c 24 20    	vmovdqa 0x20(%rsp),%ymm1
  4011df:	c5 fd 6f d4          	vmovdqa %ymm4,%ymm2
  4011e3:	c5 fd 6f dd          	vmovdqa %ymm5,%ymm3
  4011e7:	c5 fd 6f e0          	vmovdqa %ymm0,%ymm4
  4011eb:	c5 fd 6f e9          	vmovdqa %ymm1,%ymm5
  4011ef:	c4 e3 7d 39 d0 01    	vextracti128 $0x1,%ymm2,%xmm0
  4011f5:	c4 e3 7d 39 d9 01    	vextracti128 $0x1,%ymm3,%xmm1
  4011fb:	c4 e3 79 14 d2 00    	vpextrb $0x0,%xmm2,%edx
  401201:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  401205:	c4 e3 79 14 d2 08    	vpextrb $0x8,%xmm2,%edx
  40120b:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  401212:	00 
  401213:	c4 e3 79 14 da 00    	vpextrb $0x0,%xmm3,%edx
  401219:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  401220:	00 
  401221:	c4 e3 79 14 da 08    	vpextrb $0x8,%xmm3,%edx
  401227:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  40122e:	00 
  40122f:	c4 e3 79 14 c2 00    	vpextrb $0x0,%xmm0,%edx
  401235:	4c 33 84 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r8
  40123c:	00 
  40123d:	c4 e3 79 14 c2 08    	vpextrb $0x8,%xmm0,%edx
  401243:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  40124a:	00 
  40124b:	c4 e3 79 14 ca 00    	vpextrb $0x0,%xmm1,%edx
  401251:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  401258:	00 
  401259:	c4 e3 79 14 ca 08    	vpextrb $0x8,%xmm1,%edx
  40125f:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  401266:	00 
  401267:	c4 e3 79 14 d3 01    	vpextrb $0x1,%xmm2,%ebx
  40126d:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  401271:	c4 e3 79 14 d3 09    	vpextrb $0x9,%xmm2,%ebx
  401277:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  40127e:	00 
  40127f:	c4 e3 79 14 db 01    	vpextrb $0x1,%xmm3,%ebx
  401285:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  40128c:	00 
  40128d:	c4 e3 79 14 db 09    	vpextrb $0x9,%xmm3,%ebx
  401293:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  40129a:	00 
  40129b:	c4 e3 79 14 c3 01    	vpextrb $0x1,%xmm0,%ebx
  4012a1:	4c 33 8c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r9
  4012a8:	00 
  4012a9:	c4 e3 79 14 c3 09    	vpextrb $0x9,%xmm0,%ebx
  4012af:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  4012b6:	00 
  4012b7:	c4 e3 79 14 cb 01    	vpextrb $0x1,%xmm1,%ebx
  4012bd:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  4012c4:	00 
  4012c5:	c4 e3 79 14 cb 09    	vpextrb $0x9,%xmm1,%ebx
  4012cb:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  4012d2:	00 
  4012d3:	c4 e3 79 14 d2 02    	vpextrb $0x2,%xmm2,%edx
  4012d9:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  4012dd:	c4 e3 79 14 d2 0a    	vpextrb $0xa,%xmm2,%edx
  4012e3:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  4012ea:	00 
  4012eb:	c4 e3 79 14 da 02    	vpextrb $0x2,%xmm3,%edx
  4012f1:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  4012f8:	00 
  4012f9:	c4 e3 79 14 da 0a    	vpextrb $0xa,%xmm3,%edx
  4012ff:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  401306:	00 
  401307:	c4 e3 79 14 c2 02    	vpextrb $0x2,%xmm0,%edx
  40130d:	4c 33 94 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r10
  401314:	00 
  401315:	c4 e3 79 14 c2 0a    	vpextrb $0xa,%xmm0,%edx
  40131b:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  401322:	00 
  401323:	c4 e3 79 14 ca 02    	vpextrb $0x2,%xmm1,%edx
  401329:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  401330:	00 
  401331:	c4 e3 79 14 ca 0a    	vpextrb $0xa,%xmm1,%edx
  401337:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  40133e:	00 
  40133f:	c4 e3 79 14 d3 03    	vpextrb $0x3,%xmm2,%ebx
  401345:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  401349:	c4 e3 79 14 d3 0b    	vpextrb $0xb,%xmm2,%ebx
  40134f:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  401356:	00 
  401357:	c4 e3 79 14 db 03    	vpextrb $0x3,%xmm3,%ebx
  40135d:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  401364:	00 
  401365:	c4 e3 79 14 db 0b    	vpextrb $0xb,%xmm3,%ebx
  40136b:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  401372:	00 
  401373:	c4 e3 79 14 c3 03    	vpextrb $0x3,%xmm0,%ebx
  401379:	4c 33 9c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r11
  401380:	00 
  401381:	c4 e3 79 14 c3 0b    	vpextrb $0xb,%xmm0,%ebx
  401387:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  40138e:	00 
  40138f:	c4 e3 79 14 cb 03    	vpextrb $0x3,%xmm1,%ebx
  401395:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  40139c:	00 
  40139d:	c4 e3 79 14 cb 0b    	vpextrb $0xb,%xmm1,%ebx
  4013a3:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  4013aa:	00 
  4013ab:	4c 89 04 24          	mov    %r8,(%rsp)
  4013af:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
  4013b4:	4c 89 54 24 10       	mov    %r10,0x10(%rsp)
  4013b9:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
  4013be:	c4 e3 79 14 d2 04    	vpextrb $0x4,%xmm2,%edx
  4013c4:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  4013c8:	c4 e3 79 14 d2 0c    	vpextrb $0xc,%xmm2,%edx
  4013ce:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  4013d5:	00 
  4013d6:	c4 e3 79 14 da 04    	vpextrb $0x4,%xmm3,%edx
  4013dc:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  4013e3:	00 
  4013e4:	c4 e3 79 14 da 0c    	vpextrb $0xc,%xmm3,%edx
  4013ea:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  4013f1:	00 
  4013f2:	c4 e3 79 14 c2 04    	vpextrb $0x4,%xmm0,%edx
  4013f8:	4c 33 84 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r8
  4013ff:	00 
  401400:	c4 e3 79 14 c2 0c    	vpextrb $0xc,%xmm0,%edx
  401406:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  40140d:	00 
  40140e:	c4 e3 79 14 ca 04    	vpextrb $0x4,%xmm1,%edx
  401414:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  40141b:	00 
  40141c:	c4 e3 79 14 ca 0c    	vpextrb $0xc,%xmm1,%edx
  401422:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  401429:	00 
  40142a:	c4 e3 79 14 d3 05    	vpextrb $0x5,%xmm2,%ebx
  401430:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  401434:	c4 e3 79 14 d3 0d    	vpextrb $0xd,%xmm2,%ebx
  40143a:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  401441:	00 
  401442:	c4 e3 79 14 db 05    	vpextrb $0x5,%xmm3,%ebx
  401448:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  40144f:	00 
  401450:	c4 e3 79 14 db 0d    	vpextrb $0xd,%xmm3,%ebx
  401456:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  40145d:	00 
  40145e:	c4 e3 79 14 c3 05    	vpextrb $0x5,%xmm0,%ebx
  401464:	4c 33 8c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r9
  40146b:	00 
  40146c:	c4 e3 79 14 c3 0d    	vpextrb $0xd,%xmm0,%ebx
  401472:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  401479:	00 
  40147a:	c4 e3 79 14 cb 05    	vpextrb $0x5,%xmm1,%ebx
  401480:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  401487:	00 
  401488:	c4 e3 79 14 cb 0d    	vpextrb $0xd,%xmm1,%ebx
  40148e:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  401495:	00 
  401496:	c4 e3 79 14 d2 06    	vpextrb $0x6,%xmm2,%edx
  40149c:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  4014a0:	c4 e3 79 14 d2 0e    	vpextrb $0xe,%xmm2,%edx
  4014a6:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  4014ad:	00 
  4014ae:	c4 e3 79 14 da 06    	vpextrb $0x6,%xmm3,%edx
  4014b4:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  4014bb:	00 
  4014bc:	c4 e3 79 14 da 0e    	vpextrb $0xe,%xmm3,%edx
  4014c2:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  4014c9:	00 
  4014ca:	c4 e3 79 14 c2 06    	vpextrb $0x6,%xmm0,%edx
  4014d0:	4c 33 94 d0 00 10 00 	xor    0x1000(%rax,%rdx,8),%r10
  4014d7:	00 
  4014d8:	c4 e3 79 14 c2 0e    	vpextrb $0xe,%xmm0,%edx
  4014de:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  4014e5:	00 
  4014e6:	c4 e3 79 14 ca 06    	vpextrb $0x6,%xmm1,%edx
  4014ec:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  4014f3:	00 
  4014f4:	c4 e3 79 14 ca 0e    	vpextrb $0xe,%xmm1,%edx
  4014fa:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  401501:	00 
  401502:	c4 e3 79 14 d3 07    	vpextrb $0x7,%xmm2,%ebx
  401508:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  40150c:	c4 e3 79 14 d3 0f    	vpextrb $0xf,%xmm2,%ebx
  401512:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  401519:	00 
  40151a:	c4 e3 79 14 db 07    	vpextrb $0x7,%xmm3,%ebx
  401520:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  401527:	00 
  401528:	c4 e3 79 14 db 0f    	vpextrb $0xf,%xmm3,%ebx
  40152e:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  401535:	00 
  401536:	c4 e3 79 14 c3 07    	vpextrb $0x7,%xmm0,%ebx
  40153c:	4c 33 9c d8 00 10 00 	xor    0x1000(%rax,%rbx,8),%r11
  401543:	00 
  401544:	c4 e3 79 14 c3 0f    	vpextrb $0xf,%xmm0,%ebx
  40154a:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  401551:	00 
  401552:	c4 e3 79 14 cb 07    	vpextrb $0x7,%xmm1,%ebx
  401558:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  40155f:	00 
  401560:	c4 e3 79 14 cb 0f    	vpextrb $0xf,%xmm1,%ebx
  401566:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  40156d:	00 
  40156e:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
  401573:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
  401578:	4c 89 54 24 30       	mov    %r10,0x30(%rsp)
  40157d:	4c 89 5c 24 38       	mov    %r11,0x38(%rsp)
  401582:	c5 fd 6f 04 24       	vmovdqa (%rsp),%ymm0
  401587:	c5 fd 6f 4c 24 20    	vmovdqa 0x20(%rsp),%ymm1
  40158d:	48 83 c6 40          	add    $0x40,%rsi
  401591:	0f 8c 91 f8 ff ff    	jl     400e28 <g_func_loop>
  401597:	c5 dd ef c0          	vpxor  %ymm0,%ymm4,%ymm0
  40159b:	c5 d5 ef c9          	vpxor  %ymm1,%ymm5,%ymm1
  40159f:	c5 cd ef c0          	vpxor  %ymm0,%ymm6,%ymm0
  4015a3:	c5 c5 ef c9          	vpxor  %ymm1,%ymm7,%ymm1

00000000004015a7 <g_func_exit>:
  4015a7:	48 89 ec             	mov    %rbp,%rsp
  4015aa:	5a                   	pop    %rdx
  4015ab:	5b                   	pop    %rbx
  4015ac:	5d                   	pop    %rbp
  4015ad:	5e                   	pop    %rsi
  4015ae:	c3                   	retq   
  4015af:	90                   	nop

00000000004015b0 <print_buffer>:
  4015b0:	85 f6                	test   %esi,%esi
  4015b2:	0f 8e 88 00 00 00    	jle    401640 <print_buffer+0x90>
  4015b8:	41 55                	push   %r13
  4015ba:	41 54                	push   %r12
  4015bc:	44 8d 66 ff          	lea    -0x1(%rsi),%r12d
  4015c0:	55                   	push   %rbp
  4015c1:	53                   	push   %rbx
  4015c2:	48 89 fd             	mov    %rdi,%rbp
  4015c5:	49 83 c4 01          	add    $0x1,%r12
  4015c9:	bb 01 00 00 00       	mov    $0x1,%ebx
  4015ce:	4c 8d 2d 0b 4a 00 00 	lea    0x4a0b(%rip),%r13        # 405fe0 <AXC+0x4000>
  4015d5:	48 83 ec 08          	sub    $0x8,%rsp
  4015d9:	eb 09                	jmp    4015e4 <print_buffer+0x34>
  4015db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4015e0:	48 83 c3 01          	add    $0x1,%rbx
  4015e4:	0f b6 54 1d ff       	movzbl -0x1(%rbp,%rbx,1),%edx
  4015e9:	31 c0                	xor    %eax,%eax
  4015eb:	4c 89 ee             	mov    %r13,%rsi
  4015ee:	bf 01 00 00 00       	mov    $0x1,%edi
  4015f3:	e8 a8 ef ff ff       	callq  4005a0 <__printf_chk@plt>
  4015f8:	49 39 dc             	cmp    %rbx,%r12
  4015fb:	74 23                	je     401620 <print_buffer+0x70>
  4015fd:	85 db                	test   %ebx,%ebx
  4015ff:	7e df                	jle    4015e0 <print_buffer+0x30>
  401601:	f6 c3 0f             	test   $0xf,%bl
  401604:	75 da                	jne    4015e0 <print_buffer+0x30>
  401606:	48 8d 35 e5 49 00 00 	lea    0x49e5(%rip),%rsi        # 405ff2 <AXC+0x4012>
  40160d:	bf 01 00 00 00       	mov    $0x1,%edi
  401612:	31 c0                	xor    %eax,%eax
  401614:	e8 87 ef ff ff       	callq  4005a0 <__printf_chk@plt>
  401619:	eb c5                	jmp    4015e0 <print_buffer+0x30>
  40161b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401620:	48 83 c4 08          	add    $0x8,%rsp
  401624:	48 8d 3d ee 49 00 00 	lea    0x49ee(%rip),%rdi        # 406019 <AXC+0x4039>
  40162b:	5b                   	pop    %rbx
  40162c:	5d                   	pop    %rbp
  40162d:	41 5c                	pop    %r12
  40162f:	41 5d                	pop    %r13
  401631:	e9 1a ef ff ff       	jmpq   400550 <puts@plt>
  401636:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40163d:	00 00 00 
  401640:	48 8d 3d d2 49 00 00 	lea    0x49d2(%rip),%rdi        # 406019 <AXC+0x4039>
  401647:	e9 04 ef ff ff       	jmpq   400550 <puts@plt>
  40164c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401650 <print_digest>:
  401650:	48 8d 3d 8f 49 00 00 	lea    0x498f(%rip),%rdi        # 405fe6 <AXC+0x4006>
  401657:	48 83 ec 08          	sub    $0x8,%rsp
  40165b:	e8 f0 ee ff ff       	callq  400550 <puts@plt>
  401660:	48 8d 3d 79 5a 20 00 	lea    0x205a79(%rip),%rdi        # 6070e0 <digest>
  401667:	be 40 00 00 00       	mov    $0x40,%esi
  40166c:	48 83 c4 08          	add    $0x8,%rsp
  401670:	e9 3b ff ff ff       	jmpq   4015b0 <print_buffer>
  401675:	90                   	nop
  401676:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40167d:	00 00 00 

0000000000401680 <print_ymm>:
  401680:	41 57                	push   %r15
  401682:	41 56                	push   %r14
  401684:	41 89 f6             	mov    %esi,%r14d
  401687:	41 55                	push   %r13
  401689:	41 54                	push   %r12
  40168b:	4c 8d 25 66 49 00 00 	lea    0x4966(%rip),%r12        # 405ff8 <AXC+0x4018>
  401692:	55                   	push   %rbp
  401693:	53                   	push   %rbx
  401694:	48 89 fd             	mov    %rdi,%rbp
  401697:	31 db                	xor    %ebx,%ebx
  401699:	48 83 ec 08          	sub    $0x8,%rsp
  40169d:	48 c7 c0 a8 70 60 00 	mov    $0x6070a8,%rax
  4016a4:	48 8b 38             	mov    (%rax),%rdi
  4016a7:	e8 a4 ee ff ff       	callq  400550 <puts@plt>
  4016ac:	48 8d 35 3b 49 00 00 	lea    0x493b(%rip),%rsi        # 405fee <AXC+0x400e>
  4016b3:	bf 01 00 00 00       	mov    $0x1,%edi
  4016b8:	31 c0                	xor    %eax,%eax
  4016ba:	e8 e1 ee ff ff       	callq  4005a0 <__printf_chk@plt>
  4016bf:	eb 0b                	jmp    4016cc <print_ymm+0x4c>
  4016c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4016c8:	48 83 c3 01          	add    $0x1,%rbx
  4016cc:	48 83 fb 10          	cmp    $0x10,%rbx
  4016d0:	0f 84 f5 00 00 00    	je     4017cb <print_ymm+0x14b>
  4016d6:	31 c0                	xor    %eax,%eax
  4016d8:	89 da                	mov    %ebx,%edx
  4016da:	4c 89 e6             	mov    %r12,%rsi
  4016dd:	bf 01 00 00 00       	mov    $0x1,%edi
  4016e2:	e8 b9 ee ff ff       	callq  4005a0 <__printf_chk@plt>
  4016e7:	83 fb 1f             	cmp    $0x1f,%ebx
  4016ea:	75 dc                	jne    4016c8 <print_ymm+0x48>
  4016ec:	48 8d 3d 26 49 00 00 	lea    0x4926(%rip),%rdi        # 406019 <AXC+0x4039>
  4016f3:	45 31 ed             	xor    %r13d,%r13d
  4016f6:	4c 8d 25 e3 48 00 00 	lea    0x48e3(%rip),%r12        # 405fe0 <AXC+0x4000>
  4016fd:	e8 4e ee ff ff       	callq  400550 <puts@plt>
  401702:	eb 0e                	jmp    401712 <print_ymm+0x92>
  401704:	0f 1f 40 00          	nopl   0x0(%rax)
  401708:	41 83 c5 01          	add    $0x1,%r13d
  40170c:	41 83 fd 0a          	cmp    $0xa,%r13d
  401710:	74 71                	je     401783 <print_ymm+0x103>
  401712:	45 0f a3 ee          	bt     %r13d,%r14d
  401716:	73 f0                	jae    401708 <print_ymm+0x88>
  401718:	48 8d 35 d6 48 00 00 	lea    0x48d6(%rip),%rsi        # 405ff5 <AXC+0x4015>
  40171f:	44 89 ea             	mov    %r13d,%edx
  401722:	bf 01 00 00 00       	mov    $0x1,%edi
  401727:	31 c0                	xor    %eax,%eax
  401729:	48 89 eb             	mov    %rbp,%rbx
  40172c:	45 31 ff             	xor    %r15d,%r15d
  40172f:	e8 6c ee ff ff       	callq  4005a0 <__printf_chk@plt>
  401734:	eb 0e                	jmp    401744 <print_ymm+0xc4>
  401736:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40173d:	00 00 00 
  401740:	41 83 c7 01          	add    $0x1,%r15d
  401744:	48 83 c3 01          	add    $0x1,%rbx
  401748:	41 83 ff 10          	cmp    $0x10,%r15d
  40174c:	74 52                	je     4017a0 <print_ymm+0x120>
  40174e:	0f b6 53 ff          	movzbl -0x1(%rbx),%edx
  401752:	31 c0                	xor    %eax,%eax
  401754:	4c 89 e6             	mov    %r12,%rsi
  401757:	bf 01 00 00 00       	mov    $0x1,%edi
  40175c:	e8 3f ee ff ff       	callq  4005a0 <__printf_chk@plt>
  401761:	89 d8                	mov    %ebx,%eax
  401763:	29 e8                	sub    %ebp,%eax
  401765:	83 f8 20             	cmp    $0x20,%eax
  401768:	75 d6                	jne    401740 <print_ymm+0xc0>
  40176a:	48 8d 3d a8 48 00 00 	lea    0x48a8(%rip),%rdi        # 406019 <AXC+0x4039>
  401771:	41 83 c5 01          	add    $0x1,%r13d
  401775:	48 89 dd             	mov    %rbx,%rbp
  401778:	e8 d3 ed ff ff       	callq  400550 <puts@plt>
  40177d:	41 83 fd 0a          	cmp    $0xa,%r13d
  401781:	75 8f                	jne    401712 <print_ymm+0x92>
  401783:	48 c7 c0 a8 70 60 00 	mov    $0x6070a8,%rax
  40178a:	48 8b 38             	mov    (%rax),%rdi
  40178d:	48 83 c4 08          	add    $0x8,%rsp
  401791:	5b                   	pop    %rbx
  401792:	5d                   	pop    %rbp
  401793:	41 5c                	pop    %r12
  401795:	41 5d                	pop    %r13
  401797:	41 5e                	pop    %r14
  401799:	41 5f                	pop    %r15
  40179b:	e9 b0 ed ff ff       	jmpq   400550 <puts@plt>
  4017a0:	48 8d 35 4b 48 00 00 	lea    0x484b(%rip),%rsi        # 405ff2 <AXC+0x4012>
  4017a7:	bf 01 00 00 00       	mov    $0x1,%edi
  4017ac:	31 c0                	xor    %eax,%eax
  4017ae:	e8 ed ed ff ff       	callq  4005a0 <__printf_chk@plt>
  4017b3:	0f b6 53 ff          	movzbl -0x1(%rbx),%edx
  4017b7:	4c 89 e6             	mov    %r12,%rsi
  4017ba:	bf 01 00 00 00       	mov    $0x1,%edi
  4017bf:	31 c0                	xor    %eax,%eax
  4017c1:	e8 da ed ff ff       	callq  4005a0 <__printf_chk@plt>
  4017c6:	e9 75 ff ff ff       	jmpq   401740 <print_ymm+0xc0>
  4017cb:	48 8d 35 20 48 00 00 	lea    0x4820(%rip),%rsi        # 405ff2 <AXC+0x4012>
  4017d2:	bf 01 00 00 00       	mov    $0x1,%edi
  4017d7:	31 c0                	xor    %eax,%eax
  4017d9:	e8 c2 ed ff ff       	callq  4005a0 <__printf_chk@plt>
  4017de:	ba 10 00 00 00       	mov    $0x10,%edx
  4017e3:	4c 89 e6             	mov    %r12,%rsi
  4017e6:	bf 01 00 00 00       	mov    $0x1,%edi
  4017eb:	31 c0                	xor    %eax,%eax
  4017ed:	e8 ae ed ff ff       	callq  4005a0 <__printf_chk@plt>
  4017f2:	e9 d1 fe ff ff       	jmpq   4016c8 <print_ymm+0x48>
  4017f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4017fe:	00 00 

0000000000401800 <benchmark>:
  401800:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
  401805:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  401809:	41 ff 72 f8          	pushq  -0x8(%r10)
  40180d:	55                   	push   %rbp
  40180e:	48 89 e5             	mov    %rsp,%rbp
  401811:	41 57                	push   %r15
  401813:	41 56                	push   %r14
  401815:	41 55                	push   %r13
  401817:	41 54                	push   %r12
  401819:	41 bc 40 42 0f 00    	mov    $0xf4240,%r12d
  40181f:	41 52                	push   %r10
  401821:	53                   	push   %rbx
  401822:	48 8d 9d 50 fe ff ff 	lea    -0x1b0(%rbp),%rbx
  401829:	48 81 ec a0 01 00 00 	sub    $0x1a0,%rsp
  401830:	49 c7 c5 80 70 60 00 	mov    $0x607080,%r13
  401837:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40183e:	00 00 
  401840:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  401844:	31 c0                	xor    %eax,%eax
  401846:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  40184a:	e8 21 ed ff ff       	callq  400570 <strlen@plt>
  40184f:	49 89 c6             	mov    %rax,%r14
  401852:	48 89 85 40 fe ff ff 	mov    %rax,-0x1c0(%rbp)
  401859:	4d 63 fe             	movslq %r14d,%r15
  40185c:	4c 8d 35 7d 58 20 00 	lea    0x20587d(%rip),%r14        # 6070e0 <digest>
  401863:	e8 f8 ec ff ff       	callq  400560 <clock@plt>
  401868:	be 40 00 00 00       	mov    $0x40,%esi
  40186d:	48 89 df             	mov    %rbx,%rdi
  401870:	48 89 85 48 fe ff ff 	mov    %rax,-0x1b8(%rbp)
  401877:	e8 04 ef ff ff       	callq  400780 <GOST34112012Init>
  40187c:	0f 1f 40 00          	nopl   0x0(%rax)
  401880:	49 8b 75 00          	mov    0x0(%r13),%rsi
  401884:	4c 89 fa             	mov    %r15,%rdx
  401887:	48 89 df             	mov    %rbx,%rdi
  40188a:	e8 31 ef ff ff       	callq  4007c0 <GOST34112012Update>
  40188f:	4c 89 f6             	mov    %r14,%rsi
  401892:	48 89 df             	mov    %rbx,%rdi
  401895:	e8 76 f0 ff ff       	callq  400910 <GOST34112012Final>
  40189a:	48 89 df             	mov    %rbx,%rdi
  40189d:	e8 ce ee ff ff       	callq  400770 <GOST34112012Cleanup>
  4018a2:	41 83 ec 01          	sub    $0x1,%r12d
  4018a6:	75 d8                	jne    401880 <benchmark+0x80>
  4018a8:	e8 b3 ec ff ff       	callq  400560 <clock@plt>
  4018ad:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  4018b1:	48 2b 85 48 fe ff ff 	sub    -0x1b8(%rbp),%rax
  4018b8:	c5 fb 10 1d c0 4b 00 	vmovsd 0x4bc0(%rip),%xmm3        # 406480 <hash_test+0x420>
  4018bf:	00 
  4018c0:	48 8d 35 37 47 00 00 	lea    0x4737(%rip),%rsi        # 405ffe <AXC+0x401e>
  4018c7:	c5 fb 10 0d b9 4b 00 	vmovsd 0x4bb9(%rip),%xmm1        # 406488 <hash_test+0x428>
  4018ce:	00 
  4018cf:	bf 01 00 00 00       	mov    $0x1,%edi
  4018d4:	c5 fb 2a 85 40 fe ff 	vcvtsi2sdl -0x1c0(%rbp),%xmm0,%xmm0
  4018db:	ff 
  4018dc:	c5 fb 59 c3          	vmulsd %xmm3,%xmm0,%xmm0
  4018e0:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
  4018e4:	c5 fb 5e c1          	vdivsd %xmm1,%xmm0,%xmm0
  4018e8:	c4 e1 eb 2a d0       	vcvtsi2sd %rax,%xmm2,%xmm2
  4018ed:	b8 02 00 00 00       	mov    $0x2,%eax
  4018f2:	c5 fb 5e c1          	vdivsd %xmm1,%xmm0,%xmm0
  4018f6:	c5 fb 59 cb          	vmulsd %xmm3,%xmm0,%xmm1
  4018fa:	c5 eb 5e c3          	vdivsd %xmm3,%xmm2,%xmm0
  4018fe:	c5 f3 5e ca          	vdivsd %xmm2,%xmm1,%xmm1
  401902:	e8 99 ec ff ff       	callq  4005a0 <__printf_chk@plt>
  401907:	31 c0                	xor    %eax,%eax
  401909:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  40190d:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  401914:	00 00 
  401916:	75 18                	jne    401930 <benchmark+0x130>
  401918:	48 81 c4 a0 01 00 00 	add    $0x1a0,%rsp
  40191f:	5b                   	pop    %rbx
  401920:	41 5a                	pop    %r10
  401922:	41 5c                	pop    %r12
  401924:	41 5d                	pop    %r13
  401926:	41 5e                	pop    %r14
  401928:	41 5f                	pop    %r15
  40192a:	5d                   	pop    %rbp
  40192b:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
  40192f:	c3                   	retq   
  401930:	e8 4b ec ff ff       	callq  400580 <__stack_chk_fail@plt>
  401935:	90                   	nop
  401936:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40193d:	00 00 00 

0000000000401940 <i1>:
  401940:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
  401945:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  401949:	41 ff 72 f8          	pushq  -0x8(%r10)
  40194d:	55                   	push   %rbp
  40194e:	48 89 e5             	mov    %rsp,%rbp
  401951:	41 55                	push   %r13
  401953:	41 54                	push   %r12
  401955:	41 52                	push   %r10
  401957:	53                   	push   %rbx
  401958:	48 8d 9d 50 fe ff ff 	lea    -0x1b0(%rbp),%rbx
  40195f:	48 81 ec 90 01 00 00 	sub    $0x190,%rsp
  401966:	49 c7 c5 80 70 60 00 	mov    $0x607080,%r13
  40196d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401974:	00 00 
  401976:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  40197a:	31 c0                	xor    %eax,%eax
  40197c:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  401980:	e8 eb eb ff ff       	callq  400570 <strlen@plt>
  401985:	be 40 00 00 00       	mov    $0x40,%esi
  40198a:	48 89 df             	mov    %rbx,%rdi
  40198d:	49 89 c4             	mov    %rax,%r12
  401990:	e8 eb ed ff ff       	callq  400780 <GOST34112012Init>
  401995:	49 8b 75 00          	mov    0x0(%r13),%rsi
  401999:	49 63 d4             	movslq %r12d,%rdx
  40199c:	48 89 df             	mov    %rbx,%rdi
  40199f:	e8 1c ee ff ff       	callq  4007c0 <GOST34112012Update>
  4019a4:	48 8d 35 35 57 20 00 	lea    0x205735(%rip),%rsi        # 6070e0 <digest>
  4019ab:	48 89 df             	mov    %rbx,%rdi
  4019ae:	e8 5d ef ff ff       	callq  400910 <GOST34112012Final>
  4019b3:	48 89 df             	mov    %rbx,%rdi
  4019b6:	e8 b5 ed ff ff       	callq  400770 <GOST34112012Cleanup>
  4019bb:	31 c0                	xor    %eax,%eax
  4019bd:	e8 8e fc ff ff       	callq  401650 <print_digest>
  4019c2:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  4019c6:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4019cd:	00 00 
  4019cf:	75 16                	jne    4019e7 <i1+0xa7>
  4019d1:	48 81 c4 90 01 00 00 	add    $0x190,%rsp
  4019d8:	31 c0                	xor    %eax,%eax
  4019da:	5b                   	pop    %rbx
  4019db:	41 5a                	pop    %r10
  4019dd:	41 5c                	pop    %r12
  4019df:	41 5d                	pop    %r13
  4019e1:	5d                   	pop    %rbp
  4019e2:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
  4019e6:	c3                   	retq   
  4019e7:	e8 94 eb ff ff       	callq  400580 <__stack_chk_fail@plt>
  4019ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004019f0 <test>:
  4019f0:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
  4019f5:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  4019f9:	41 ff 72 f8          	pushq  -0x8(%r10)
  4019fd:	55                   	push   %rbp
  4019fe:	48 89 e5             	mov    %rsp,%rbp
  401a01:	41 55                	push   %r13
  401a03:	41 54                	push   %r12
  401a05:	41 52                	push   %r10
  401a07:	53                   	push   %rbx
  401a08:	48 8d 9d 50 fe ff ff 	lea    -0x1b0(%rbp),%rbx
  401a0f:	48 81 ec 90 01 00 00 	sub    $0x190,%rsp
  401a16:	49 c7 c5 a0 70 60 00 	mov    $0x6070a0,%r13
  401a1d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401a24:	00 00 
  401a26:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  401a2a:	31 c0                	xor    %eax,%eax
  401a2c:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  401a30:	e8 3b eb ff ff       	callq  400570 <strlen@plt>
  401a35:	48 89 df             	mov    %rbx,%rdi
  401a38:	be 40 00 00 00       	mov    $0x40,%esi
  401a3d:	49 89 c4             	mov    %rax,%r12
  401a40:	e8 3b ed ff ff       	callq  400780 <GOST34112012Init>
  401a45:	49 8b 75 00          	mov    0x0(%r13),%rsi
  401a49:	49 63 d4             	movslq %r12d,%rdx
  401a4c:	48 89 df             	mov    %rbx,%rdi
  401a4f:	e8 6c ed ff ff       	callq  4007c0 <GOST34112012Update>
  401a54:	48 8d 35 85 56 20 00 	lea    0x205685(%rip),%rsi        # 6070e0 <digest>
  401a5b:	48 89 df             	mov    %rbx,%rdi
  401a5e:	e8 ad ee ff ff       	callq  400910 <GOST34112012Final>
  401a63:	48 89 df             	mov    %rbx,%rdi
  401a66:	e8 05 ed ff ff       	callq  400770 <GOST34112012Cleanup>
  401a6b:	31 c0                	xor    %eax,%eax
  401a6d:	e8 de fb ff ff       	callq  401650 <print_digest>
  401a72:	48 c7 c3 60 60 40 00 	mov    $0x406060,%rbx
  401a79:	48 8b 15 68 56 20 00 	mov    0x205668(%rip),%rdx        # 6070e8 <digest+0x8>
  401a80:	48 8b 05 59 56 20 00 	mov    0x205659(%rip),%rax        # 6070e0 <digest>
  401a87:	48 33 53 08          	xor    0x8(%rbx),%rdx
  401a8b:	48 33 03             	xor    (%rbx),%rax
  401a8e:	48 09 c2             	or     %rax,%rdx
  401a91:	75 1b                	jne    401aae <test+0xbe>
  401a93:	48 8b 15 5e 56 20 00 	mov    0x20565e(%rip),%rdx        # 6070f8 <digest+0x18>
  401a9a:	48 8b 05 4f 56 20 00 	mov    0x20564f(%rip),%rax        # 6070f0 <digest+0x10>
  401aa1:	48 33 53 18          	xor    0x18(%rbx),%rdx
  401aa5:	48 33 43 10          	xor    0x10(%rbx),%rax
  401aa9:	48 09 c2             	or     %rax,%rdx
  401aac:	74 42                	je     401af0 <test+0x100>
  401aae:	48 8d 3d 65 45 00 00 	lea    0x4565(%rip),%rdi        # 40601a <AXC+0x403a>
  401ab5:	e8 96 ea ff ff       	callq  400550 <puts@plt>
  401aba:	be 40 00 00 00       	mov    $0x40,%esi
  401abf:	48 89 df             	mov    %rbx,%rdi
  401ac2:	e8 e9 fa ff ff       	callq  4015b0 <print_buffer>
  401ac7:	b8 01 00 00 00       	mov    $0x1,%eax
  401acc:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  401ad0:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  401ad7:	00 00 
  401ad9:	75 4f                	jne    401b2a <test+0x13a>
  401adb:	48 81 c4 90 01 00 00 	add    $0x190,%rsp
  401ae2:	5b                   	pop    %rbx
  401ae3:	41 5a                	pop    %r10
  401ae5:	41 5c                	pop    %r12
  401ae7:	41 5d                	pop    %r13
  401ae9:	5d                   	pop    %rbp
  401aea:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
  401aee:	c3                   	retq   
  401aef:	90                   	nop
  401af0:	48 8b 15 11 56 20 00 	mov    0x205611(%rip),%rdx        # 607108 <digest+0x28>
  401af7:	48 8b 05 02 56 20 00 	mov    0x205602(%rip),%rax        # 607100 <digest+0x20>
  401afe:	48 33 53 28          	xor    0x28(%rbx),%rdx
  401b02:	48 33 43 20          	xor    0x20(%rbx),%rax
  401b06:	48 09 c2             	or     %rax,%rdx
  401b09:	75 a3                	jne    401aae <test+0xbe>
  401b0b:	48 8b 15 06 56 20 00 	mov    0x205606(%rip),%rdx        # 607118 <digest+0x38>
  401b12:	48 8b 05 f7 55 20 00 	mov    0x2055f7(%rip),%rax        # 607110 <digest+0x30>
  401b19:	48 33 53 38          	xor    0x38(%rbx),%rdx
  401b1d:	48 33 43 30          	xor    0x30(%rbx),%rax
  401b21:	48 09 c2             	or     %rax,%rdx
  401b24:	75 88                	jne    401aae <test+0xbe>
  401b26:	31 c0                	xor    %eax,%eax
  401b28:	eb a2                	jmp    401acc <test+0xdc>
  401b2a:	e8 51 ea ff ff       	callq  400580 <__stack_chk_fail@plt>
  401b2f:	90                   	nop

0000000000401b30 <GOST34112012Dump>:
  401b30:	41 55                	push   %r13
  401b32:	41 54                	push   %r12
  401b34:	48 8d 97 08 01 00 00 	lea    0x108(%rdi),%rdx
  401b3b:	55                   	push   %rbp
  401b3c:	53                   	push   %rbx
  401b3d:	48 8d 35 4c 49 00 00 	lea    0x494c(%rip),%rsi        # 406490 <hash_test+0x430>
  401b44:	49 89 fc             	mov    %rdi,%r12
  401b47:	31 c0                	xor    %eax,%eax
  401b49:	48 8d 2d 90 44 00 00 	lea    0x4490(%rip),%rbp        # 405fe0 <AXC+0x4000>
  401b50:	48 83 ec 08          	sub    $0x8,%rsp
  401b54:	c6 87 47 01 00 00 00 	movb   $0x0,0x147(%rdi)
  401b5b:	bf 01 00 00 00       	mov    $0x1,%edi
  401b60:	e8 3b ea ff ff       	callq  4005a0 <__printf_chk@plt>
  401b65:	41 8b 94 24 04 01 00 	mov    0x104(%r12),%edx
  401b6c:	00 
  401b6d:	48 8d 35 1f 49 00 00 	lea    0x491f(%rip),%rsi        # 406493 <hash_test+0x433>
  401b74:	bf 01 00 00 00       	mov    $0x1,%edi
  401b79:	31 c0                	xor    %eax,%eax
  401b7b:	4d 8d 6c 24 40       	lea    0x40(%r12),%r13
  401b80:	4c 89 e3             	mov    %r12,%rbx
  401b83:	e8 18 ea ff ff       	callq  4005a0 <__printf_chk@plt>
  401b88:	48 8d 35 0f 49 00 00 	lea    0x490f(%rip),%rsi        # 40649e <hash_test+0x43e>
  401b8f:	bf 01 00 00 00       	mov    $0x1,%edi
  401b94:	31 c0                	xor    %eax,%eax
  401b96:	e8 05 ea ff ff       	callq  4005a0 <__printf_chk@plt>
  401b9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401ba0:	0f b6 13             	movzbl (%rbx),%edx
  401ba3:	31 c0                	xor    %eax,%eax
  401ba5:	48 89 ee             	mov    %rbp,%rsi
  401ba8:	bf 01 00 00 00       	mov    $0x1,%edi
  401bad:	48 83 c3 01          	add    $0x1,%rbx
  401bb1:	e8 ea e9 ff ff       	callq  4005a0 <__printf_chk@plt>
  401bb6:	4c 39 eb             	cmp    %r13,%rbx
  401bb9:	75 e5                	jne    401ba0 <GOST34112012Dump+0x70>
  401bbb:	48 8d 35 e4 48 00 00 	lea    0x48e4(%rip),%rsi        # 4064a6 <hash_test+0x446>
  401bc2:	49 8d ac 24 80 00 00 	lea    0x80(%r12),%rbp
  401bc9:	00 
  401bca:	4c 8d 2d 0f 44 00 00 	lea    0x440f(%rip),%r13        # 405fe0 <AXC+0x4000>
  401bd1:	bf 01 00 00 00       	mov    $0x1,%edi
  401bd6:	31 c0                	xor    %eax,%eax
  401bd8:	e8 c3 e9 ff ff       	callq  4005a0 <__printf_chk@plt>
  401bdd:	0f 1f 00             	nopl   (%rax)
  401be0:	0f b6 13             	movzbl (%rbx),%edx
  401be3:	31 c0                	xor    %eax,%eax
  401be5:	4c 89 ee             	mov    %r13,%rsi
  401be8:	bf 01 00 00 00       	mov    $0x1,%edi
  401bed:	48 83 c3 01          	add    $0x1,%rbx
  401bf1:	e8 aa e9 ff ff       	callq  4005a0 <__printf_chk@plt>
  401bf6:	48 39 dd             	cmp    %rbx,%rbp
  401bf9:	75 e5                	jne    401be0 <GOST34112012Dump+0xb0>
  401bfb:	48 8d 35 ac 48 00 00 	lea    0x48ac(%rip),%rsi        # 4064ae <hash_test+0x44e>
  401c02:	48 89 eb             	mov    %rbp,%rbx
  401c05:	4c 8d 2d d4 43 00 00 	lea    0x43d4(%rip),%r13        # 405fe0 <AXC+0x4000>
  401c0c:	49 8d ac 24 c0 00 00 	lea    0xc0(%r12),%rbp
  401c13:	00 
  401c14:	bf 01 00 00 00       	mov    $0x1,%edi
  401c19:	31 c0                	xor    %eax,%eax
  401c1b:	e8 80 e9 ff ff       	callq  4005a0 <__printf_chk@plt>
  401c20:	0f b6 13             	movzbl (%rbx),%edx
  401c23:	31 c0                	xor    %eax,%eax
  401c25:	4c 89 ee             	mov    %r13,%rsi
  401c28:	bf 01 00 00 00       	mov    $0x1,%edi
  401c2d:	48 83 c3 01          	add    $0x1,%rbx
  401c31:	e8 6a e9 ff ff       	callq  4005a0 <__printf_chk@plt>
  401c36:	48 39 dd             	cmp    %rbx,%rbp
  401c39:	75 e5                	jne    401c20 <GOST34112012Dump+0xf0>
  401c3b:	48 8d 35 74 48 00 00 	lea    0x4874(%rip),%rsi        # 4064b6 <hash_test+0x456>
  401c42:	31 c0                	xor    %eax,%eax
  401c44:	bf 01 00 00 00       	mov    $0x1,%edi
  401c49:	e8 52 e9 ff ff       	callq  4005a0 <__printf_chk@plt>
  401c4e:	41 8b 94 24 00 01 00 	mov    0x100(%r12),%edx
  401c55:	00 
  401c56:	85 d2                	test   %edx,%edx
  401c58:	7e 3a                	jle    401c94 <GOST34112012Dump+0x164>
  401c5a:	8d 42 ff             	lea    -0x1(%rdx),%eax
  401c5d:	48 8d 1d 7c 43 00 00 	lea    0x437c(%rip),%rbx        # 405fe0 <AXC+0x4000>
  401c64:	4d 8d ac 04 c1 00 00 	lea    0xc1(%r12,%rax,1),%r13
  401c6b:	00 
  401c6c:	0f 1f 40 00          	nopl   0x0(%rax)
  401c70:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  401c74:	31 c0                	xor    %eax,%eax
  401c76:	48 89 de             	mov    %rbx,%rsi
  401c79:	bf 01 00 00 00       	mov    $0x1,%edi
  401c7e:	48 83 c5 01          	add    $0x1,%rbp
  401c82:	e8 19 e9 ff ff       	callq  4005a0 <__printf_chk@plt>
  401c87:	49 39 ed             	cmp    %rbp,%r13
  401c8a:	75 e4                	jne    401c70 <GOST34112012Dump+0x140>
  401c8c:	41 8b 94 24 00 01 00 	mov    0x100(%r12),%edx
  401c93:	00 
  401c94:	48 83 c4 08          	add    $0x8,%rsp
  401c98:	48 8d 35 1f 48 00 00 	lea    0x481f(%rip),%rsi        # 4064be <hash_test+0x45e>
  401c9f:	bf 01 00 00 00       	mov    $0x1,%edi
  401ca4:	5b                   	pop    %rbx
  401ca5:	5d                   	pop    %rbp
  401ca6:	41 5c                	pop    %r12
  401ca8:	41 5d                	pop    %r13
  401caa:	31 c0                	xor    %eax,%eax
  401cac:	e9 ef e8 ff ff       	jmpq   4005a0 <__printf_chk@plt>

Disassembly of section .fini:

0000000000401cb4 <_fini>:
  401cb4:	48 83 ec 08          	sub    $0x8,%rsp
  401cb8:	48 83 c4 08          	add    $0x8,%rsp
  401cbc:	c3                   	retq   
