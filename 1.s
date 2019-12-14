
streebog:     file format elf64-x86-64


Disassembly of section .init:

0000000000400510 <_init>:
  400510:	48 83 ec 08          	sub    $0x8,%rsp
  400514:	48 8b 05 dd 1a 20 00 	mov    0x201add(%rip),%rax        # 601ff8 <__gmon_start__>
  40051b:	48 85 c0             	test   %rax,%rax
  40051e:	74 02                	je     400522 <_init+0x12>
  400520:	ff d0                	callq  *%rax
  400522:	48 83 c4 08          	add    $0x8,%rsp
  400526:	c3                   	retq   

Disassembly of section .plt:

0000000000400530 <.plt>:
  400530:	ff 35 d2 1a 20 00    	pushq  0x201ad2(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400536:	ff 25 d4 1a 20 00    	jmpq   *0x201ad4(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40053c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400540 <puts@plt>:
  400540:	ff 25 d2 1a 20 00    	jmpq   *0x201ad2(%rip)        # 602018 <puts@GLIBC_2.2.5>
  400546:	68 00 00 00 00       	pushq  $0x0
  40054b:	e9 e0 ff ff ff       	jmpq   400530 <.plt>

0000000000400550 <strlen@plt>:
  400550:	ff 25 ca 1a 20 00    	jmpq   *0x201aca(%rip)        # 602020 <strlen@GLIBC_2.2.5>
  400556:	68 01 00 00 00       	pushq  $0x1
  40055b:	e9 d0 ff ff ff       	jmpq   400530 <.plt>

0000000000400560 <__stack_chk_fail@plt>:
  400560:	ff 25 c2 1a 20 00    	jmpq   *0x201ac2(%rip)        # 602028 <__stack_chk_fail@GLIBC_2.4>
  400566:	68 02 00 00 00       	pushq  $0x2
  40056b:	e9 c0 ff ff ff       	jmpq   400530 <.plt>

0000000000400570 <memcpy@plt>:
  400570:	ff 25 ba 1a 20 00    	jmpq   *0x201aba(%rip)        # 602030 <memcpy@GLIBC_2.14>
  400576:	68 03 00 00 00       	pushq  $0x3
  40057b:	e9 b0 ff ff ff       	jmpq   400530 <.plt>

0000000000400580 <__printf_chk@plt>:
  400580:	ff 25 b2 1a 20 00    	jmpq   *0x201ab2(%rip)        # 602038 <__printf_chk@GLIBC_2.3.4>
  400586:	68 04 00 00 00       	pushq  $0x4
  40058b:	e9 a0 ff ff ff       	jmpq   400530 <.plt>

Disassembly of section .text:

0000000000400590 <main>:
  400590:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
  400595:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400599:	41 ff 72 f8          	pushq  -0x8(%r10)
  40059d:	55                   	push   %rbp
  40059e:	48 89 e5             	mov    %rsp,%rbp
  4005a1:	41 55                	push   %r13
  4005a3:	41 54                	push   %r12
  4005a5:	41 52                	push   %r10
  4005a7:	53                   	push   %rbx
  4005a8:	48 8d 9d 50 fe ff ff 	lea    -0x1b0(%rbp),%rbx
  4005af:	48 81 ec 90 01 00 00 	sub    $0x190,%rsp
  4005b6:	49 c7 c5 50 20 60 00 	mov    $0x602050,%r13
  4005bd:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4005c4:	00 00 
  4005c6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  4005ca:	31 c0                	xor    %eax,%eax
  4005cc:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  4005d0:	e8 7b ff ff ff       	callq  400550 <strlen@plt>
  4005d5:	49 89 c4             	mov    %rax,%r12
  4005d8:	31 c0                	xor    %eax,%eax
  4005da:	e8 a1 02 00 00       	callq  400880 <_test>
  4005df:	be 40 00 00 00       	mov    $0x40,%esi
  4005e4:	48 89 df             	mov    %rbx,%rdi
  4005e7:	e8 14 07 00 00       	callq  400d00 <GOST34112012Init>
  4005ec:	48 8d 3d ef 09 00 00 	lea    0x9ef(%rip),%rdi        # 400fe2 <_IO_stdin_used+0x12>
  4005f3:	e8 48 ff ff ff       	callq  400540 <puts@plt>
  4005f8:	49 8b 75 00          	mov    0x0(%r13),%rsi
  4005fc:	49 63 d4             	movslq %r12d,%rdx
  4005ff:	48 89 df             	mov    %rbx,%rdi
  400602:	e8 c9 07 00 00       	callq  400dd0 <GOST34112012Update>
  400607:	48 8d 35 72 1a 20 00 	lea    0x201a72(%rip),%rsi        # 602080 <digest>
  40060e:	48 89 df             	mov    %rbx,%rdi
  400611:	e8 3a 09 00 00       	callq  400f50 <GOST34112012Final>
  400616:	31 c0                	xor    %eax,%eax
  400618:	e8 03 02 00 00       	callq  400820 <print_digest>
  40061d:	48 89 df             	mov    %rbx,%rdi
  400620:	e8 3b 05 00 00       	callq  400b60 <GOST34112012Cleanup>
  400625:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  400629:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  400630:	00 00 
  400632:	75 16                	jne    40064a <main+0xba>
  400634:	48 81 c4 90 01 00 00 	add    $0x190,%rsp
  40063b:	31 c0                	xor    %eax,%eax
  40063d:	5b                   	pop    %rbx
  40063e:	41 5a                	pop    %r10
  400640:	41 5c                	pop    %r12
  400642:	41 5d                	pop    %r13
  400644:	5d                   	pop    %rbp
  400645:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
  400649:	c3                   	retq   
  40064a:	e8 11 ff ff ff       	callq  400560 <__stack_chk_fail@plt>
  40064f:	90                   	nop

0000000000400650 <_start>:
  400650:	31 ed                	xor    %ebp,%ebp
  400652:	49 89 d1             	mov    %rdx,%r9
  400655:	5e                   	pop    %rsi
  400656:	48 89 e2             	mov    %rsp,%rdx
  400659:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40065d:	50                   	push   %rax
  40065e:	54                   	push   %rsp
  40065f:	49 c7 c0 b0 07 40 00 	mov    $0x4007b0,%r8
  400666:	48 c7 c1 40 07 40 00 	mov    $0x400740,%rcx
  40066d:	48 c7 c7 90 05 40 00 	mov    $0x400590,%rdi
  400674:	ff 15 76 19 20 00    	callq  *0x201976(%rip)        # 601ff0 <__libc_start_main@GLIBC_2.2.5>
  40067a:	f4                   	hlt    
  40067b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400680 <_dl_relocate_static_pie>:
  400680:	f3 c3                	repz retq 
  400682:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400689:	00 00 00 
  40068c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400690 <deregister_tm_clones>:
  400690:	55                   	push   %rbp
  400691:	b8 58 20 60 00       	mov    $0x602058,%eax
  400696:	48 3d 58 20 60 00    	cmp    $0x602058,%rax
  40069c:	48 89 e5             	mov    %rsp,%rbp
  40069f:	74 17                	je     4006b8 <deregister_tm_clones+0x28>
  4006a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4006a6:	48 85 c0             	test   %rax,%rax
  4006a9:	74 0d                	je     4006b8 <deregister_tm_clones+0x28>
  4006ab:	5d                   	pop    %rbp
  4006ac:	bf 58 20 60 00       	mov    $0x602058,%edi
  4006b1:	ff e0                	jmpq   *%rax
  4006b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4006b8:	5d                   	pop    %rbp
  4006b9:	c3                   	retq   
  4006ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004006c0 <register_tm_clones>:
  4006c0:	be 58 20 60 00       	mov    $0x602058,%esi
  4006c5:	55                   	push   %rbp
  4006c6:	48 81 ee 58 20 60 00 	sub    $0x602058,%rsi
  4006cd:	48 89 e5             	mov    %rsp,%rbp
  4006d0:	48 c1 fe 03          	sar    $0x3,%rsi
  4006d4:	48 89 f0             	mov    %rsi,%rax
  4006d7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4006db:	48 01 c6             	add    %rax,%rsi
  4006de:	48 d1 fe             	sar    %rsi
  4006e1:	74 15                	je     4006f8 <register_tm_clones+0x38>
  4006e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4006e8:	48 85 c0             	test   %rax,%rax
  4006eb:	74 0b                	je     4006f8 <register_tm_clones+0x38>
  4006ed:	5d                   	pop    %rbp
  4006ee:	bf 58 20 60 00       	mov    $0x602058,%edi
  4006f3:	ff e0                	jmpq   *%rax
  4006f5:	0f 1f 00             	nopl   (%rax)
  4006f8:	5d                   	pop    %rbp
  4006f9:	c3                   	retq   
  4006fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400700 <__do_global_dtors_aux>:
  400700:	80 3d 59 19 20 00 00 	cmpb   $0x0,0x201959(%rip)        # 602060 <completed.7697>
  400707:	75 17                	jne    400720 <__do_global_dtors_aux+0x20>
  400709:	55                   	push   %rbp
  40070a:	48 89 e5             	mov    %rsp,%rbp
  40070d:	e8 7e ff ff ff       	callq  400690 <deregister_tm_clones>
  400712:	c6 05 47 19 20 00 01 	movb   $0x1,0x201947(%rip)        # 602060 <completed.7697>
  400719:	5d                   	pop    %rbp
  40071a:	c3                   	retq   
  40071b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400720:	f3 c3                	repz retq 
  400722:	0f 1f 40 00          	nopl   0x0(%rax)
  400726:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40072d:	00 00 00 

0000000000400730 <frame_dummy>:
  400730:	55                   	push   %rbp
  400731:	48 89 e5             	mov    %rsp,%rbp
  400734:	5d                   	pop    %rbp
  400735:	eb 89                	jmp    4006c0 <register_tm_clones>
  400737:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40073e:	00 00 

0000000000400740 <__libc_csu_init>:
  400740:	41 57                	push   %r15
  400742:	41 56                	push   %r14
  400744:	49 89 d7             	mov    %rdx,%r15
  400747:	41 55                	push   %r13
  400749:	41 54                	push   %r12
  40074b:	4c 8d 25 be 16 20 00 	lea    0x2016be(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  400752:	55                   	push   %rbp
  400753:	48 8d 2d be 16 20 00 	lea    0x2016be(%rip),%rbp        # 601e18 <__init_array_end>
  40075a:	53                   	push   %rbx
  40075b:	41 89 fd             	mov    %edi,%r13d
  40075e:	49 89 f6             	mov    %rsi,%r14
  400761:	4c 29 e5             	sub    %r12,%rbp
  400764:	48 83 ec 08          	sub    $0x8,%rsp
  400768:	48 c1 fd 03          	sar    $0x3,%rbp
  40076c:	e8 9f fd ff ff       	callq  400510 <_init>
  400771:	48 85 ed             	test   %rbp,%rbp
  400774:	74 20                	je     400796 <__libc_csu_init+0x56>
  400776:	31 db                	xor    %ebx,%ebx
  400778:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40077f:	00 
  400780:	4c 89 fa             	mov    %r15,%rdx
  400783:	4c 89 f6             	mov    %r14,%rsi
  400786:	44 89 ef             	mov    %r13d,%edi
  400789:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40078d:	48 83 c3 01          	add    $0x1,%rbx
  400791:	48 39 dd             	cmp    %rbx,%rbp
  400794:	75 ea                	jne    400780 <__libc_csu_init+0x40>
  400796:	48 83 c4 08          	add    $0x8,%rsp
  40079a:	5b                   	pop    %rbx
  40079b:	5d                   	pop    %rbp
  40079c:	41 5c                	pop    %r12
  40079e:	41 5d                	pop    %r13
  4007a0:	41 5e                	pop    %r14
  4007a2:	41 5f                	pop    %r15
  4007a4:	c3                   	retq   
  4007a5:	90                   	nop
  4007a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4007ad:	00 00 00 

00000000004007b0 <__libc_csu_fini>:
  4007b0:	f3 c3                	repz retq 
  4007b2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4007b9:	00 00 00 
  4007bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007c0 <print_buffer>:
  4007c0:	85 f6                	test   %esi,%esi
  4007c2:	7e 4c                	jle    400810 <print_buffer+0x50>
  4007c4:	8d 46 ff             	lea    -0x1(%rsi),%eax
  4007c7:	41 54                	push   %r12
  4007c9:	55                   	push   %rbp
  4007ca:	48 8d 2d 03 08 00 00 	lea    0x803(%rip),%rbp        # 400fd4 <_IO_stdin_used+0x4>
  4007d1:	53                   	push   %rbx
  4007d2:	48 89 fb             	mov    %rdi,%rbx
  4007d5:	4c 8d 64 07 01       	lea    0x1(%rdi,%rax,1),%r12
  4007da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4007e0:	0f b6 13             	movzbl (%rbx),%edx
  4007e3:	31 c0                	xor    %eax,%eax
  4007e5:	48 89 ee             	mov    %rbp,%rsi
  4007e8:	bf 01 00 00 00       	mov    $0x1,%edi
  4007ed:	48 83 c3 01          	add    $0x1,%rbx
  4007f1:	e8 8a fd ff ff       	callq  400580 <__printf_chk@plt>
  4007f6:	4c 39 e3             	cmp    %r12,%rbx
  4007f9:	75 e5                	jne    4007e0 <print_buffer+0x20>
  4007fb:	5b                   	pop    %rbx
  4007fc:	5d                   	pop    %rbp
  4007fd:	41 5c                	pop    %r12
  4007ff:	48 8d 3d a7 0b 00 00 	lea    0xba7(%rip),%rdi        # 4013ad <msg1+0x36>
  400806:	e9 35 fd ff ff       	jmpq   400540 <puts@plt>
  40080b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400810:	48 8d 3d 96 0b 00 00 	lea    0xb96(%rip),%rdi        # 4013ad <msg1+0x36>
  400817:	e9 24 fd ff ff       	jmpq   400540 <puts@plt>
  40081c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400820 <print_digest>:
  400820:	48 8d 35 b3 07 00 00 	lea    0x7b3(%rip),%rsi        # 400fda <_IO_stdin_used+0xa>
  400827:	48 83 ec 08          	sub    $0x8,%rsp
  40082b:	bf 01 00 00 00       	mov    $0x1,%edi
  400830:	31 c0                	xor    %eax,%eax
  400832:	e8 49 fd ff ff       	callq  400580 <__printf_chk@plt>
  400837:	48 8d 3d 42 18 20 00 	lea    0x201842(%rip),%rdi        # 602080 <digest>
  40083e:	be 40 00 00 00       	mov    $0x40,%esi
  400843:	48 83 c4 08          	add    $0x8,%rsp
  400847:	e9 74 ff ff ff       	jmpq   4007c0 <print_buffer>
  40084c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400850 <add_bytes>:
  400850:	48 31 c9             	xor    %rcx,%rcx
  400853:	48 31 c0             	xor    %rax,%rax
  400856:	66 90                	xchg   %ax,%ax

0000000000400858 <loop>:
  400858:	4c 8b 04 0f          	mov    (%rdi,%rcx,1),%r8
  40085c:	4c 8b 4c 0f 08       	mov    0x8(%rdi,%rcx,1),%r9
  400861:	9e                   	sahf   
  400862:	4c 13 04 0e          	adc    (%rsi,%rcx,1),%r8
  400866:	4c 13 4c 0e 08       	adc    0x8(%rsi,%rcx,1),%r9
  40086b:	9f                   	lahf   
  40086c:	4c 89 04 0f          	mov    %r8,(%rdi,%rcx,1)
  400870:	4c 89 4c 0f 08       	mov    %r9,0x8(%rdi,%rcx,1)
  400875:	48 83 c1 10          	add    $0x10,%rcx
  400879:	48 83 f9 40          	cmp    $0x40,%rcx
  40087d:	75 d9                	jne    400858 <loop>
  40087f:	c3                   	retq   

0000000000400880 <_test>:
  400880:	48 83 ec 08          	sub    $0x8,%rsp
  400884:	c5 fd ef c0          	vpxor  %ymm0,%ymm0,%ymm0
  400888:	c5 fd ef c8          	vpxor  %ymm0,%ymm0,%ymm1
  40088c:	e8 50 00 00 00       	callq  4008e1 <_print_ymm>
  400891:	48 83 c4 08          	add    $0x8,%rsp
  400895:	c3                   	retq   

0000000000400896 <_save_ymm>:
  400896:	48 89 e0             	mov    %rsp,%rax
  400899:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
  4008a0:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  4008a4:	c5 fd 7f 04 24       	vmovdqa %ymm0,(%rsp)
  4008a9:	c5 fd 7f 4c 24 20    	vmovdqa %ymm1,0x20(%rsp)
  4008af:	c5 fd 7f 54 24 40    	vmovdqa %ymm2,0x40(%rsp)
  4008b5:	c5 fd 7f 5c 24 60    	vmovdqa %ymm3,0x60(%rsp)
  4008bb:	50                   	push   %rax
  4008bc:	50                   	push   %rax
  4008bd:	48 8b 00             	mov    (%rax),%rax
  4008c0:	50                   	push   %rax
  4008c1:	c3                   	retq   

00000000004008c2 <_restore_ymm>:
  4008c2:	58                   	pop    %rax
  4008c3:	c5 fd 6f 44 24 10    	vmovdqa 0x10(%rsp),%ymm0
  4008c9:	c5 fd 6f 4c 24 30    	vmovdqa 0x30(%rsp),%ymm1
  4008cf:	c5 fd 6f 54 24 50    	vmovdqa 0x50(%rsp),%ymm2
  4008d5:	c5 fd 6f 5c 24 70    	vmovdqa 0x70(%rsp),%ymm3
  4008db:	5c                   	pop    %rsp
  4008dc:	48 89 04 24          	mov    %rax,(%rsp)
  4008e0:	c3                   	retq   

00000000004008e1 <_print_ymm>:
  4008e1:	57                   	push   %rdi
  4008e2:	56                   	push   %rsi
  4008e3:	51                   	push   %rcx
  4008e4:	e8 ad ff ff ff       	callq  400896 <_save_ymm>
  4008e9:	48 8d 3d 70 07 00 00 	lea    0x770(%rip),%rdi        # 401060 <ymm_m>
  4008f0:	e8 4b fc ff ff       	callq  400540 <puts@plt>
  4008f5:	e8 c8 ff ff ff       	callq  4008c2 <_restore_ymm>
  4008fa:	48 8d 3d bf 17 20 00 	lea    0x2017bf(%rip),%rdi        # 6020c0 <buffer>
  400901:	c5 fd 7f 07          	vmovdqa %ymm0,(%rdi)
  400905:	c5 fd 7f 47 20       	vmovdqa %ymm0,0x20(%rdi)
  40090a:	48 c7 c6 40 00 00 00 	mov    $0x40,%rsi
  400911:	e8 80 ff ff ff       	callq  400896 <_save_ymm>
  400916:	e8 a5 fe ff ff       	callq  4007c0 <print_buffer>
  40091b:	e8 a2 ff ff ff       	callq  4008c2 <_restore_ymm>
  400920:	48 8d 3d 99 17 20 00 	lea    0x201799(%rip),%rdi        # 6020c0 <buffer>
  400927:	c5 fd 7f 17          	vmovdqa %ymm2,(%rdi)
  40092b:	c5 fd 7f 5f 20       	vmovdqa %ymm3,0x20(%rdi)
  400930:	48 c7 c6 40 00 00 00 	mov    $0x40,%rsi
  400937:	e8 5a ff ff ff       	callq  400896 <_save_ymm>
  40093c:	e8 7f fe ff ff       	callq  4007c0 <print_buffer>
  400941:	e8 7c ff ff ff       	callq  4008c2 <_restore_ymm>
  400946:	48 8d 3d f3 06 00 00 	lea    0x6f3(%rip),%rdi        # 401040 <sep_m>
  40094d:	e8 ee fb ff ff       	callq  400540 <puts@plt>
  400952:	59                   	pop    %rcx
  400953:	5e                   	pop    %rsi
  400954:	5f                   	pop    %rdi
  400955:	c3                   	retq   
  400956:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40095d:	00 00 00 

0000000000400960 <_print_buffer>:
  400960:	57                   	push   %rdi
  400961:	56                   	push   %rsi
  400962:	51                   	push   %rcx
  400963:	48 c7 c6 40 00 00 00 	mov    $0x40,%rsi
  40096a:	e8 51 fe ff ff       	callq  4007c0 <print_buffer>
  40096f:	59                   	pop    %rcx
  400970:	5e                   	pop    %rsi
  400971:	5f                   	pop    %rdi
  400972:	c3                   	retq   
  400973:	0f 1f 00             	nopl   (%rax)
  400976:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40097d:	00 00 00 

0000000000400980 <stage2>:
  400980:	55                   	push   %rbp
  400981:	53                   	push   %rbx
  400982:	41 51                	push   %r9
  400984:	48 89 fd             	mov    %rdi,%rbp
  400987:	48 8d 3d b2 06 00 00 	lea    0x6b2(%rip),%rdi        # 401040 <sep_m>
  40098e:	e8 ad fb ff ff       	callq  400540 <puts@plt>
  400993:	48 8d 3d d6 09 00 00 	lea    0x9d6(%rip),%rdi        # 401370 <msg0>
  40099a:	e8 a1 fb ff ff       	callq  400540 <puts@plt>
  40099f:	c5 fd 6f 85 20 00 00 	vmovdqa 0x20(%rbp),%ymm0
  4009a6:	00 
  4009a7:	c5 fd 6f 8d 40 00 00 	vmovdqa 0x40(%rbp),%ymm1
  4009ae:	00 
  4009af:	c5 fd 6f 95 60 00 00 	vmovdqa 0x60(%rbp),%ymm2
  4009b6:	00 
  4009b7:	c5 fd 6f 9d 80 00 00 	vmovdqa 0x80(%rbp),%ymm3
  4009be:	00 
  4009bf:	48 89 f7             	mov    %rsi,%rdi
  4009c2:	48 89 f3             	mov    %rsi,%rbx
  4009c5:	e8 f6 00 00 00       	callq  400ac0 <g_func>
  4009ca:	48 8b 85 40 00 00 00 	mov    0x40(%rbp),%rax
  4009d1:	48 05 00 02 00 00    	add    $0x200,%rax
  4009d7:	48 89 85 40 00 00 00 	mov    %rax,0x40(%rbp)
  4009de:	48 89 de             	mov    %rbx,%rsi
  4009e1:	48 8d bd 80 00 00 00 	lea    0x80(%rbp),%rdi
  4009e8:	e8 63 fe ff ff       	callq  400850 <add_bytes>
  4009ed:	41 59                	pop    %r9
  4009ef:	5b                   	pop    %rbx
  4009f0:	5d                   	pop    %rbp
  4009f1:	c3                   	retq   
  4009f2:	0f 1f 40 00          	nopl   0x0(%rax)
  4009f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4009fd:	00 00 00 

0000000000400a00 <stage3>:
  400a00:	55                   	push   %rbp
  400a01:	53                   	push   %rbx
  400a02:	41 50                	push   %r8
  400a04:	48 89 fd             	mov    %rdi,%rbp
  400a07:	48 8d 3d 32 06 00 00 	lea    0x632(%rip),%rdi        # 401040 <sep_m>
  400a0e:	e8 2d fb ff ff       	callq  400540 <puts@plt>
  400a13:	48 8d 3d 5d 09 00 00 	lea    0x95d(%rip),%rdi        # 401377 <msg1>
  400a1a:	e8 21 fb ff ff       	callq  400540 <puts@plt>
  400a1f:	31 db                	xor    %ebx,%ebx
  400a21:	8b 9d 00 01 00 00    	mov    0x100(%rbp),%ebx
  400a27:	c5 fd 6f 45 20       	vmovdqa 0x20(%rbp),%ymm0
  400a2c:	c5 fd 6f 4d 40       	vmovdqa 0x40(%rbp),%ymm1
  400a31:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  400a38:	48 29 d9             	sub    %rbx,%rcx
  400a3b:	74 13                	je     400a50 <n_buff>
  400a3d:	48 8d bc 1d c0 00 00 	lea    0xc0(%rbp,%rbx,1),%rdi
  400a44:	00 
  400a45:	b0 01                	mov    $0x1,%al
  400a47:	aa                   	stos   %al,%es:(%rdi)
  400a48:	30 c0                	xor    %al,%al
  400a4a:	48 ff c9             	dec    %rcx
  400a4d:	f3 aa                	rep stos %al,%es:(%rdi)
  400a4f:	90                   	nop

0000000000400a50 <n_buff>:
  400a50:	48 8d bd c0 00 00 00 	lea    0xc0(%rbp),%rdi
  400a57:	c5 fd 6f 55 60       	vmovdqa 0x60(%rbp),%ymm2
  400a5c:	c5 fd 6f 9d 80 00 00 	vmovdqa 0x80(%rbp),%ymm3
  400a63:	00 
  400a64:	e8 57 00 00 00       	callq  400ac0 <g_func>
  400a69:	48 c1 e3 03          	shl    $0x3,%rbx
  400a6d:	48 8b 45 40          	mov    0x40(%rbp),%rax
  400a71:	48 01 d8             	add    %rbx,%rax
  400a74:	48 89 45 40          	mov    %rax,0x40(%rbp)
  400a78:	48 8d b5 00 01 00 00 	lea    0x100(%rbp),%rsi
  400a7f:	48 8d bd 80 00 00 00 	lea    0x80(%rbp),%rdi
  400a86:	e8 c5 fd ff ff       	callq  400850 <add_bytes>
  400a8b:	c5 ed ef d2          	vpxor  %ymm2,%ymm2,%ymm2
  400a8f:	c5 e5 ef db          	vpxor  %ymm3,%ymm3,%ymm3
  400a93:	48 8d 7d 40          	lea    0x40(%rbp),%rdi
  400a97:	e8 24 00 00 00       	callq  400ac0 <g_func>
  400a9c:	c5 ed ef d2          	vpxor  %ymm2,%ymm2,%ymm2
  400aa0:	c5 e5 ef db          	vpxor  %ymm3,%ymm3,%ymm3
  400aa4:	48 8d bd 80 00 00 00 	lea    0x80(%rbp),%rdi
  400aab:	e8 10 00 00 00       	callq  400ac0 <g_func>
  400ab0:	c5 fd 7f 45 20       	vmovdqa %ymm0,0x20(%rbp)
  400ab5:	c5 fd 7f 4d 40       	vmovdqa %ymm1,0x40(%rbp)
  400aba:	41 58                	pop    %r8
  400abc:	5b                   	pop    %rbx
  400abd:	5d                   	pop    %rbp
  400abe:	c3                   	retq   
  400abf:	90                   	nop

0000000000400ac0 <g_func>:
  400ac0:	c5 fd 6f f0          	vmovdqa %ymm0,%ymm6
  400ac4:	c5 fd 6f f9          	vmovdqa %ymm1,%ymm7
  400ac8:	c5 ed ef d0          	vpxor  %ymm0,%ymm2,%ymm2
  400acc:	c5 e5 ef d9          	vpxor  %ymm1,%ymm3,%ymm3
  400ad0:	e8 7b 00 00 00       	callq  400b50 <lps>
  400ad5:	c5 fe 6f 67 20       	vmovdqu 0x20(%rdi),%ymm4
  400ada:	c5 fe 6f 6f 40       	vmovdqu 0x40(%rdi),%ymm5
  400adf:	48 c7 c1 0c 00 00 00 	mov    $0xc,%rcx
  400ae6:	48 8d 35 83 05 00 00 	lea    0x583(%rip),%rsi        # 401070 <CXC>

0000000000400aed <g_func_loop>:
  400aed:	c5 dd ef d0          	vpxor  %ymm0,%ymm4,%ymm2
  400af1:	c5 d5 ef d9          	vpxor  %ymm1,%ymm5,%ymm3
  400af5:	c5 fd 6f 66 20       	vmovdqa 0x20(%rsi),%ymm4
  400afa:	c5 fd 6f 6e 40       	vmovdqa 0x40(%rsi),%ymm5
  400aff:	c5 dd ef e0          	vpxor  %ymm0,%ymm4,%ymm4
  400b03:	c5 d5 ef e9          	vpxor  %ymm1,%ymm5,%ymm5
  400b07:	e8 44 00 00 00       	callq  400b50 <lps>
  400b0c:	c5 fd 6f d4          	vmovdqa %ymm4,%ymm2
  400b10:	c5 fd 6f dd          	vmovdqa %ymm5,%ymm3
  400b14:	c5 fd 6f e0          	vmovdqa %ymm0,%ymm4
  400b18:	c5 fd 6f e9          	vmovdqa %ymm1,%ymm5
  400b1c:	e8 2f 00 00 00       	callq  400b50 <lps>
  400b21:	48 83 c6 40          	add    $0x40,%rsi
  400b25:	e2 c6                	loop   400aed <g_func_loop>
  400b27:	c5 dd ef c0          	vpxor  %ymm0,%ymm4,%ymm0
  400b2b:	c5 d5 ef c9          	vpxor  %ymm1,%ymm5,%ymm1
  400b2f:	c5 fe 6f 67 20       	vmovdqu 0x20(%rdi),%ymm4
  400b34:	c5 fe 6f 6f 40       	vmovdqu 0x40(%rdi),%ymm5
  400b39:	c5 dd ef c0          	vpxor  %ymm0,%ymm4,%ymm0
  400b3d:	c5 d5 ef c9          	vpxor  %ymm1,%ymm5,%ymm1
  400b41:	c5 cd ef c0          	vpxor  %ymm0,%ymm6,%ymm0
  400b45:	c5 c5 ef c9          	vpxor  %ymm1,%ymm7,%ymm1
  400b49:	c3                   	retq   
  400b4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400b50 <lps>:
  400b50:	c3                   	retq   
  400b51:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400b58:	00 00 00 
  400b5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400b60 <GOST34112012Cleanup>:
  400b60:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  400b67:	48 c7 87 58 01 00 00 	movq   $0x0,0x158(%rdi)
  400b6e:	00 00 00 00 
  400b72:	48 89 f9             	mov    %rdi,%rcx
  400b75:	48 8d 7f 08          	lea    0x8(%rdi),%rdi
  400b79:	31 c0                	xor    %eax,%eax
  400b7b:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  400b7f:	48 29 f9             	sub    %rdi,%rcx
  400b82:	81 c1 60 01 00 00    	add    $0x160,%ecx
  400b88:	c1 e9 03             	shr    $0x3,%ecx
  400b8b:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  400b8e:	c3                   	retq   
  400b8f:	90                   	nop

0000000000400b90 <GOST34112012Dump>:
  400b90:	41 55                	push   %r13
  400b92:	41 54                	push   %r12
  400b94:	48 8d 97 08 01 00 00 	lea    0x108(%rdi),%rdx
  400b9b:	55                   	push   %rbp
  400b9c:	53                   	push   %rbx
  400b9d:	48 8d 35 da 07 00 00 	lea    0x7da(%rip),%rsi        # 40137e <msg1+0x7>
  400ba4:	49 89 fc             	mov    %rdi,%r12
  400ba7:	31 c0                	xor    %eax,%eax
  400ba9:	bf 01 00 00 00       	mov    $0x1,%edi
  400bae:	48 83 ec 08          	sub    $0x8,%rsp
  400bb2:	4d 8d 6c 24 40       	lea    0x40(%r12),%r13
  400bb7:	48 8d 2d 16 04 00 00 	lea    0x416(%rip),%rbp        # 400fd4 <_IO_stdin_used+0x4>
  400bbe:	e8 bd f9 ff ff       	callq  400580 <__printf_chk@plt>
  400bc3:	48 8d 35 b7 07 00 00 	lea    0x7b7(%rip),%rsi        # 401381 <msg1+0xa>
  400bca:	bf 01 00 00 00       	mov    $0x1,%edi
  400bcf:	31 c0                	xor    %eax,%eax
  400bd1:	4c 89 e3             	mov    %r12,%rbx
  400bd4:	e8 a7 f9 ff ff       	callq  400580 <__printf_chk@plt>
  400bd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400be0:	0f b6 13             	movzbl (%rbx),%edx
  400be3:	31 c0                	xor    %eax,%eax
  400be5:	48 89 ee             	mov    %rbp,%rsi
  400be8:	bf 01 00 00 00       	mov    $0x1,%edi
  400bed:	48 83 c3 01          	add    $0x1,%rbx
  400bf1:	e8 8a f9 ff ff       	callq  400580 <__printf_chk@plt>
  400bf6:	4c 39 eb             	cmp    %r13,%rbx
  400bf9:	75 e5                	jne    400be0 <GOST34112012Dump+0x50>
  400bfb:	48 8d 35 87 07 00 00 	lea    0x787(%rip),%rsi        # 401389 <msg1+0x12>
  400c02:	49 8d ac 24 80 00 00 	lea    0x80(%r12),%rbp
  400c09:	00 
  400c0a:	4c 8d 2d c3 03 00 00 	lea    0x3c3(%rip),%r13        # 400fd4 <_IO_stdin_used+0x4>
  400c11:	bf 01 00 00 00       	mov    $0x1,%edi
  400c16:	31 c0                	xor    %eax,%eax
  400c18:	e8 63 f9 ff ff       	callq  400580 <__printf_chk@plt>
  400c1d:	0f 1f 00             	nopl   (%rax)
  400c20:	0f b6 13             	movzbl (%rbx),%edx
  400c23:	31 c0                	xor    %eax,%eax
  400c25:	4c 89 ee             	mov    %r13,%rsi
  400c28:	bf 01 00 00 00       	mov    $0x1,%edi
  400c2d:	48 83 c3 01          	add    $0x1,%rbx
  400c31:	e8 4a f9 ff ff       	callq  400580 <__printf_chk@plt>
  400c36:	48 39 dd             	cmp    %rbx,%rbp
  400c39:	75 e5                	jne    400c20 <GOST34112012Dump+0x90>
  400c3b:	48 8d 35 4f 07 00 00 	lea    0x74f(%rip),%rsi        # 401391 <msg1+0x1a>
  400c42:	48 89 eb             	mov    %rbp,%rbx
  400c45:	4c 8d 2d 88 03 00 00 	lea    0x388(%rip),%r13        # 400fd4 <_IO_stdin_used+0x4>
  400c4c:	49 8d ac 24 c0 00 00 	lea    0xc0(%r12),%rbp
  400c53:	00 
  400c54:	bf 01 00 00 00       	mov    $0x1,%edi
  400c59:	31 c0                	xor    %eax,%eax
  400c5b:	e8 20 f9 ff ff       	callq  400580 <__printf_chk@plt>
  400c60:	0f b6 13             	movzbl (%rbx),%edx
  400c63:	31 c0                	xor    %eax,%eax
  400c65:	4c 89 ee             	mov    %r13,%rsi
  400c68:	bf 01 00 00 00       	mov    $0x1,%edi
  400c6d:	48 83 c3 01          	add    $0x1,%rbx
  400c71:	e8 0a f9 ff ff       	callq  400580 <__printf_chk@plt>
  400c76:	48 39 dd             	cmp    %rbx,%rbp
  400c79:	75 e5                	jne    400c60 <GOST34112012Dump+0xd0>
  400c7b:	48 8d 35 17 07 00 00 	lea    0x717(%rip),%rsi        # 401399 <msg1+0x22>
  400c82:	31 c0                	xor    %eax,%eax
  400c84:	bf 01 00 00 00       	mov    $0x1,%edi
  400c89:	e8 f2 f8 ff ff       	callq  400580 <__printf_chk@plt>
  400c8e:	41 8b 94 24 00 01 00 	mov    0x100(%r12),%edx
  400c95:	00 
  400c96:	85 d2                	test   %edx,%edx
  400c98:	7e 3a                	jle    400cd4 <GOST34112012Dump+0x144>
  400c9a:	8d 42 ff             	lea    -0x1(%rdx),%eax
  400c9d:	48 8d 1d 30 03 00 00 	lea    0x330(%rip),%rbx        # 400fd4 <_IO_stdin_used+0x4>
  400ca4:	4d 8d ac 04 c1 00 00 	lea    0xc1(%r12,%rax,1),%r13
  400cab:	00 
  400cac:	0f 1f 40 00          	nopl   0x0(%rax)
  400cb0:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  400cb4:	31 c0                	xor    %eax,%eax
  400cb6:	48 89 de             	mov    %rbx,%rsi
  400cb9:	bf 01 00 00 00       	mov    $0x1,%edi
  400cbe:	48 83 c5 01          	add    $0x1,%rbp
  400cc2:	e8 b9 f8 ff ff       	callq  400580 <__printf_chk@plt>
  400cc7:	49 39 ed             	cmp    %rbp,%r13
  400cca:	75 e4                	jne    400cb0 <GOST34112012Dump+0x120>
  400ccc:	41 8b 94 24 00 01 00 	mov    0x100(%r12),%edx
  400cd3:	00 
  400cd4:	48 83 c4 08          	add    $0x8,%rsp
  400cd8:	48 8d 35 c2 06 00 00 	lea    0x6c2(%rip),%rsi        # 4013a1 <msg1+0x2a>
  400cdf:	bf 01 00 00 00       	mov    $0x1,%edi
  400ce4:	5b                   	pop    %rbx
  400ce5:	5d                   	pop    %rbp
  400ce6:	41 5c                	pop    %r12
  400ce8:	41 5d                	pop    %r13
  400cea:	31 c0                	xor    %eax,%eax
  400cec:	e9 8f f8 ff ff       	jmpq   400580 <__printf_chk@plt>
  400cf1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400cf6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400cfd:	00 00 00 

0000000000400d00 <GOST34112012Init>:
  400d00:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  400d07:	48 c7 87 58 01 00 00 	movq   $0x0,0x158(%rdi)
  400d0e:	00 00 00 00 
  400d12:	48 89 fa             	mov    %rdi,%rdx
  400d15:	48 8d 7f 08          	lea    0x8(%rdi),%rdi
  400d19:	48 89 d1             	mov    %rdx,%rcx
  400d1c:	31 c0                	xor    %eax,%eax
  400d1e:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  400d22:	48 29 f9             	sub    %rdi,%rcx
  400d25:	81 c1 60 01 00 00    	add    $0x160,%ecx
  400d2b:	c1 e9 03             	shr    $0x3,%ecx
  400d2e:	81 fe 00 01 00 00    	cmp    $0x100,%esi
  400d34:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  400d37:	89 b2 04 01 00 00    	mov    %esi,0x104(%rdx)
  400d3d:	75 29                	jne    400d68 <GOST34112012Init+0x68>
  400d3f:	48 b8 01 01 01 01 01 	movabs $0x101010101010101,%rax
  400d46:	01 01 01 
  400d49:	48 89 02             	mov    %rax,(%rdx)
  400d4c:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400d50:	48 89 42 10          	mov    %rax,0x10(%rdx)
  400d54:	48 89 42 18          	mov    %rax,0x18(%rdx)
  400d58:	48 89 42 20          	mov    %rax,0x20(%rdx)
  400d5c:	48 89 42 28          	mov    %rax,0x28(%rdx)
  400d60:	48 89 42 30          	mov    %rax,0x30(%rdx)
  400d64:	48 89 42 38          	mov    %rax,0x38(%rdx)
  400d68:	c5 f9 6f 05 40 06 00 	vmovdqa 0x640(%rip),%xmm0        # 4013b0 <msg1+0x39>
  400d6f:	00 
  400d70:	31 c0                	xor    %eax,%eax
  400d72:	48 c7 82 18 01 00 00 	movq   $0x747865,0x118(%rdx)
  400d79:	65 78 74 00 
  400d7d:	48 c7 82 20 01 00 00 	movq   $0x0,0x120(%rdx)
  400d84:	00 00 00 00 
  400d88:	c5 f8 11 82 08 01 00 	vmovups %xmm0,0x108(%rdx)
  400d8f:	00 
  400d90:	c5 f9 ef c0          	vpxor  %xmm0,%xmm0,%xmm0
  400d94:	48 c7 82 38 01 00 00 	movq   $0x0,0x138(%rdx)
  400d9b:	00 00 00 00 
  400d9f:	c5 f8 11 82 28 01 00 	vmovups %xmm0,0x128(%rdx)
  400da6:	00 
  400da7:	c7 82 40 01 00 00 00 	movl   $0x0,0x140(%rdx)
  400dae:	00 00 00 
  400db1:	66 89 82 44 01 00 00 	mov    %ax,0x144(%rdx)
  400db8:	c6 82 46 01 00 00 00 	movb   $0x0,0x146(%rdx)
  400dbf:	c6 82 47 01 00 00 00 	movb   $0x0,0x147(%rdx)
  400dc6:	c3                   	retq   
  400dc7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400dce:	00 00 

0000000000400dd0 <GOST34112012Update>:
  400dd0:	41 55                	push   %r13
  400dd2:	41 54                	push   %r12
  400dd4:	49 89 d4             	mov    %rdx,%r12
  400dd7:	55                   	push   %rbp
  400dd8:	53                   	push   %rbx
  400dd9:	48 89 fd             	mov    %rdi,%rbp
  400ddc:	48 89 f3             	mov    %rsi,%rbx
  400ddf:	48 83 ec 08          	sub    $0x8,%rsp
  400de3:	8b 87 00 01 00 00    	mov    0x100(%rdi),%eax
  400de9:	85 c0                	test   %eax,%eax
  400deb:	74 3e                	je     400e2b <GOST34112012Update+0x5b>
  400ded:	41 bd 40 00 00 00    	mov    $0x40,%r13d
  400df3:	48 8d bc 07 c0 00 00 	lea    0xc0(%rdi,%rax,1),%rdi
  400dfa:	00 
  400dfb:	41 29 c5             	sub    %eax,%r13d
  400dfe:	4c 39 ea             	cmp    %r13,%rdx
  400e01:	4c 0f 46 ea          	cmovbe %rdx,%r13
  400e05:	4c 89 ea             	mov    %r13,%rdx
  400e08:	4d 29 ec             	sub    %r13,%r12
  400e0b:	4c 01 eb             	add    %r13,%rbx
  400e0e:	e8 5d f7 ff ff       	callq  400570 <memcpy@plt>
  400e13:	8b 85 00 01 00 00    	mov    0x100(%rbp),%eax
  400e19:	44 01 e8             	add    %r13d,%eax
  400e1c:	83 f8 40             	cmp    $0x40,%eax
  400e1f:	89 85 00 01 00 00    	mov    %eax,0x100(%rbp)
  400e25:	0f 84 dd 00 00 00    	je     400f08 <GOST34112012Update+0x138>
  400e2b:	49 83 fc 3f          	cmp    $0x3f,%r12
  400e2f:	76 27                	jbe    400e58 <GOST34112012Update+0x88>
  400e31:	49 8d 44 24 c0       	lea    -0x40(%r12),%rax
  400e36:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
  400e3a:	4c 8d 6c 03 40       	lea    0x40(%rbx,%rax,1),%r13
  400e3f:	90                   	nop
  400e40:	48 89 de             	mov    %rbx,%rsi
  400e43:	48 89 ef             	mov    %rbp,%rdi
  400e46:	48 83 c3 40          	add    $0x40,%rbx
  400e4a:	e8 31 fb ff ff       	callq  400980 <stage2>
  400e4f:	4c 39 eb             	cmp    %r13,%rbx
  400e52:	75 ec                	jne    400e40 <GOST34112012Update+0x70>
  400e54:	41 83 e4 3f          	and    $0x3f,%r12d
  400e58:	4d 85 e4             	test   %r12,%r12
  400e5b:	75 13                	jne    400e70 <GOST34112012Update+0xa0>
  400e5d:	48 83 c4 08          	add    $0x8,%rsp
  400e61:	5b                   	pop    %rbx
  400e62:	5d                   	pop    %rbp
  400e63:	41 5c                	pop    %r12
  400e65:	41 5d                	pop    %r13
  400e67:	c3                   	retq   
  400e68:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400e6f:	00 
  400e70:	41 83 fc 08          	cmp    $0x8,%r12d
  400e74:	48 8d 8d c0 00 00 00 	lea    0xc0(%rbp),%rcx
  400e7b:	44 89 e0             	mov    %r12d,%eax
  400e7e:	73 38                	jae    400eb8 <GOST34112012Update+0xe8>
  400e80:	41 f6 c4 04          	test   $0x4,%r12b
  400e84:	0f 85 9c 00 00 00    	jne    400f26 <GOST34112012Update+0x156>
  400e8a:	45 85 e4             	test   %r12d,%r12d
  400e8d:	74 11                	je     400ea0 <GOST34112012Update+0xd0>
  400e8f:	0f b6 13             	movzbl (%rbx),%edx
  400e92:	a8 02                	test   $0x2,%al
  400e94:	88 95 c0 00 00 00    	mov    %dl,0xc0(%rbp)
  400e9a:	0f 85 9e 00 00 00    	jne    400f3e <GOST34112012Update+0x16e>
  400ea0:	44 89 a5 00 01 00 00 	mov    %r12d,0x100(%rbp)
  400ea7:	48 83 c4 08          	add    $0x8,%rsp
  400eab:	5b                   	pop    %rbx
  400eac:	5d                   	pop    %rbp
  400ead:	41 5c                	pop    %r12
  400eaf:	41 5d                	pop    %r13
  400eb1:	c3                   	retq   
  400eb2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400eb8:	48 8b 03             	mov    (%rbx),%rax
  400ebb:	48 89 85 c0 00 00 00 	mov    %rax,0xc0(%rbp)
  400ec2:	44 89 e0             	mov    %r12d,%eax
  400ec5:	48 8b 54 03 f8       	mov    -0x8(%rbx,%rax,1),%rdx
  400eca:	48 89 54 01 f8       	mov    %rdx,-0x8(%rcx,%rax,1)
  400ecf:	48 8d 95 c8 00 00 00 	lea    0xc8(%rbp),%rdx
  400ed6:	48 83 e2 f8          	and    $0xfffffffffffffff8,%rdx
  400eda:	48 29 d1             	sub    %rdx,%rcx
  400edd:	41 8d 04 0c          	lea    (%r12,%rcx,1),%eax
  400ee1:	48 29 cb             	sub    %rcx,%rbx
  400ee4:	83 e0 f8             	and    $0xfffffff8,%eax
  400ee7:	83 f8 08             	cmp    $0x8,%eax
  400eea:	72 b4                	jb     400ea0 <GOST34112012Update+0xd0>
  400eec:	83 e0 f8             	and    $0xfffffff8,%eax
  400eef:	31 c9                	xor    %ecx,%ecx
  400ef1:	89 ce                	mov    %ecx,%esi
  400ef3:	83 c1 08             	add    $0x8,%ecx
  400ef6:	48 8b 3c 33          	mov    (%rbx,%rsi,1),%rdi
  400efa:	39 c1                	cmp    %eax,%ecx
  400efc:	48 89 3c 32          	mov    %rdi,(%rdx,%rsi,1)
  400f00:	72 ef                	jb     400ef1 <GOST34112012Update+0x121>
  400f02:	eb 9c                	jmp    400ea0 <GOST34112012Update+0xd0>
  400f04:	0f 1f 40 00          	nopl   0x0(%rax)
  400f08:	48 8d b5 c0 00 00 00 	lea    0xc0(%rbp),%rsi
  400f0f:	48 89 ef             	mov    %rbp,%rdi
  400f12:	e8 69 fa ff ff       	callq  400980 <stage2>
  400f17:	c7 85 00 01 00 00 00 	movl   $0x0,0x100(%rbp)
  400f1e:	00 00 00 
  400f21:	e9 05 ff ff ff       	jmpq   400e2b <GOST34112012Update+0x5b>
  400f26:	8b 13                	mov    (%rbx),%edx
  400f28:	89 95 c0 00 00 00    	mov    %edx,0xc0(%rbp)
  400f2e:	44 89 e2             	mov    %r12d,%edx
  400f31:	8b 44 13 fc          	mov    -0x4(%rbx,%rdx,1),%eax
  400f35:	89 44 11 fc          	mov    %eax,-0x4(%rcx,%rdx,1)
  400f39:	e9 62 ff ff ff       	jmpq   400ea0 <GOST34112012Update+0xd0>
  400f3e:	44 89 e2             	mov    %r12d,%edx
  400f41:	0f b7 44 13 fe       	movzwl -0x2(%rbx,%rdx,1),%eax
  400f46:	66 89 44 11 fe       	mov    %ax,-0x2(%rcx,%rdx,1)
  400f4b:	e9 50 ff ff ff       	jmpq   400ea0 <GOST34112012Update+0xd0>

0000000000400f50 <GOST34112012Final>:
  400f50:	55                   	push   %rbp
  400f51:	53                   	push   %rbx
  400f52:	48 89 fb             	mov    %rdi,%rbx
  400f55:	48 89 f5             	mov    %rsi,%rbp
  400f58:	48 83 ec 08          	sub    $0x8,%rsp
  400f5c:	e8 9f fa ff ff       	callq  400a00 <stage3>
  400f61:	81 bb 04 01 00 00 00 	cmpl   $0x100,0x104(%rbx)
  400f68:	01 00 00 
  400f6b:	c7 83 00 01 00 00 00 	movl   $0x0,0x100(%rbx)
  400f72:	00 00 00 
  400f75:	74 31                	je     400fa8 <GOST34112012Final+0x58>
  400f77:	c5 fa 6f 03          	vmovdqu (%rbx),%xmm0
  400f7b:	c5 f8 11 45 00       	vmovups %xmm0,0x0(%rbp)
  400f80:	c5 fa 6f 43 10       	vmovdqu 0x10(%rbx),%xmm0
  400f85:	c5 f8 11 45 10       	vmovups %xmm0,0x10(%rbp)
  400f8a:	c5 fa 6f 43 20       	vmovdqu 0x20(%rbx),%xmm0
  400f8f:	c5 f8 11 45 20       	vmovups %xmm0,0x20(%rbp)
  400f94:	c5 fa 6f 43 30       	vmovdqu 0x30(%rbx),%xmm0
  400f99:	c5 f8 11 45 30       	vmovups %xmm0,0x30(%rbp)
  400f9e:	48 83 c4 08          	add    $0x8,%rsp
  400fa2:	5b                   	pop    %rbx
  400fa3:	5d                   	pop    %rbp
  400fa4:	c3                   	retq   
  400fa5:	0f 1f 00             	nopl   (%rax)
  400fa8:	c5 fa 6f 43 20       	vmovdqu 0x20(%rbx),%xmm0
  400fad:	c5 f8 11 45 00       	vmovups %xmm0,0x0(%rbp)
  400fb2:	c5 fa 6f 43 30       	vmovdqu 0x30(%rbx),%xmm0
  400fb7:	c5 f8 11 45 10       	vmovups %xmm0,0x10(%rbp)
  400fbc:	48 83 c4 08          	add    $0x8,%rsp
  400fc0:	5b                   	pop    %rbx
  400fc1:	5d                   	pop    %rbp
  400fc2:	c3                   	retq   

Disassembly of section .fini:

0000000000400fc4 <_fini>:
  400fc4:	48 83 ec 08          	sub    $0x8,%rsp
  400fc8:	48 83 c4 08          	add    $0x8,%rsp
  400fcc:	c3                   	retq   
