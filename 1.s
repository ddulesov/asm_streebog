
streebog:     file format elf64-x86-64


Disassembly of section .init:

0000000000400580 <_init>:
  400580:	48 83 ec 08          	sub    $0x8,%rsp
  400584:	48 8b 05 6d 6a 20 00 	mov    0x206a6d(%rip),%rax        # 606ff8 <__gmon_start__>
  40058b:	48 85 c0             	test   %rax,%rax
  40058e:	74 02                	je     400592 <_init+0x12>
  400590:	ff d0                	callq  *%rax
  400592:	48 83 c4 08          	add    $0x8,%rsp
  400596:	c3                   	retq   

Disassembly of section .plt:

00000000004005a0 <.plt>:
  4005a0:	ff 35 62 6a 20 00    	pushq  0x206a62(%rip)        # 607008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4005a6:	ff 25 64 6a 20 00    	jmpq   *0x206a64(%rip)        # 607010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4005ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005b0 <puts@plt>:
  4005b0:	ff 25 62 6a 20 00    	jmpq   *0x206a62(%rip)        # 607018 <puts@GLIBC_2.2.5>
  4005b6:	68 00 00 00 00       	pushq  $0x0
  4005bb:	e9 e0 ff ff ff       	jmpq   4005a0 <.plt>

00000000004005c0 <clock@plt>:
  4005c0:	ff 25 5a 6a 20 00    	jmpq   *0x206a5a(%rip)        # 607020 <clock@GLIBC_2.2.5>
  4005c6:	68 01 00 00 00       	pushq  $0x1
  4005cb:	e9 d0 ff ff ff       	jmpq   4005a0 <.plt>

00000000004005d0 <strlen@plt>:
  4005d0:	ff 25 52 6a 20 00    	jmpq   *0x206a52(%rip)        # 607028 <strlen@GLIBC_2.2.5>
  4005d6:	68 02 00 00 00       	pushq  $0x2
  4005db:	e9 c0 ff ff ff       	jmpq   4005a0 <.plt>

00000000004005e0 <__stack_chk_fail@plt>:
  4005e0:	ff 25 4a 6a 20 00    	jmpq   *0x206a4a(%rip)        # 607030 <__stack_chk_fail@GLIBC_2.4>
  4005e6:	68 03 00 00 00       	pushq  $0x3
  4005eb:	e9 b0 ff ff ff       	jmpq   4005a0 <.plt>

00000000004005f0 <printf@plt>:
  4005f0:	ff 25 42 6a 20 00    	jmpq   *0x206a42(%rip)        # 607038 <printf@GLIBC_2.2.5>
  4005f6:	68 04 00 00 00       	pushq  $0x4
  4005fb:	e9 a0 ff ff ff       	jmpq   4005a0 <.plt>

0000000000400600 <memcpy@plt>:
  400600:	ff 25 3a 6a 20 00    	jmpq   *0x206a3a(%rip)        # 607040 <memcpy@GLIBC_2.14>
  400606:	68 05 00 00 00       	pushq  $0x5
  40060b:	e9 90 ff ff ff       	jmpq   4005a0 <.plt>

0000000000400610 <__printf_chk@plt>:
  400610:	ff 25 32 6a 20 00    	jmpq   *0x206a32(%rip)        # 607048 <__printf_chk@GLIBC_2.3.4>
  400616:	68 06 00 00 00       	pushq  $0x6
  40061b:	e9 80 ff ff ff       	jmpq   4005a0 <.plt>

Disassembly of section .text:

0000000000400620 <main>:
  400620:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
  400625:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400629:	41 ff 72 f8          	pushq  -0x8(%r10)
  40062d:	55                   	push   %rbp
  40062e:	48 89 e5             	mov    %rsp,%rbp
  400631:	41 57                	push   %r15
  400633:	41 56                	push   %r14
  400635:	41 55                	push   %r13
  400637:	41 54                	push   %r12
  400639:	41 bc 40 4b 4c 00    	mov    $0x4c4b40,%r12d
  40063f:	41 52                	push   %r10
  400641:	53                   	push   %rbx
  400642:	48 8d 9d 50 fe ff ff 	lea    -0x1b0(%rbp),%rbx
  400649:	48 81 ec a0 01 00 00 	sub    $0x1a0,%rsp
  400650:	49 c7 c5 60 70 60 00 	mov    $0x607060,%r13
  400657:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40065e:	00 00 
  400660:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  400664:	31 c0                	xor    %eax,%eax
  400666:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  40066a:	e8 61 ff ff ff       	callq  4005d0 <strlen@plt>
  40066f:	49 89 c6             	mov    %rax,%r14
  400672:	48 89 85 40 fe ff ff 	mov    %rax,-0x1c0(%rbp)
  400679:	4d 63 fe             	movslq %r14d,%r15
  40067c:	4c 8d 35 1d 6a 20 00 	lea    0x206a1d(%rip),%r14        # 6070a0 <digest>
  400683:	e8 38 ff ff ff       	callq  4005c0 <clock@plt>
  400688:	be 40 00 00 00       	mov    $0x40,%esi
  40068d:	48 89 df             	mov    %rbx,%rdi
  400690:	48 89 85 48 fe ff ff 	mov    %rax,-0x1b8(%rbp)
  400697:	e8 34 10 00 00       	callq  4016d0 <GOST34112012Init>
  40069c:	0f 1f 40 00          	nopl   0x0(%rax)
  4006a0:	49 8b 75 00          	mov    0x0(%r13),%rsi
  4006a4:	4c 89 fa             	mov    %r15,%rdx
  4006a7:	48 89 df             	mov    %rbx,%rdi
  4006aa:	e8 f1 10 00 00       	callq  4017a0 <GOST34112012Update>
  4006af:	4c 89 f6             	mov    %r14,%rsi
  4006b2:	48 89 df             	mov    %rbx,%rdi
  4006b5:	e8 66 12 00 00       	callq  401920 <GOST34112012Final>
  4006ba:	48 89 df             	mov    %rbx,%rdi
  4006bd:	e8 4e 0e 00 00       	callq  401510 <GOST34112012Cleanup>
  4006c2:	41 83 ec 01          	sub    $0x1,%r12d
  4006c6:	75 d8                	jne    4006a0 <main+0x80>
  4006c8:	e8 f3 fe ff ff       	callq  4005c0 <clock@plt>
  4006cd:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  4006d1:	48 2b 85 48 fe ff ff 	sub    -0x1b8(%rbp),%rax
  4006d8:	c5 fb 10 0d c0 13 00 	vmovsd 0x13c0(%rip),%xmm1        # 401aa0 <MAX+0xc0>
  4006df:	00 
  4006e0:	48 8d 35 db 12 00 00 	lea    0x12db(%rip),%rsi        # 4019c2 <_IO_stdin_used+0x22>
  4006e7:	c5 fb 10 1d b9 13 00 	vmovsd 0x13b9(%rip),%xmm3        # 401aa8 <MAX+0xc8>
  4006ee:	00 
  4006ef:	bf 01 00 00 00       	mov    $0x1,%edi
  4006f4:	c5 fb 2a 85 40 fe ff 	vcvtsi2sdl -0x1c0(%rbp),%xmm0,%xmm0
  4006fb:	ff 
  4006fc:	c5 fb 59 05 94 13 00 	vmulsd 0x1394(%rip),%xmm0,%xmm0        # 401a98 <MAX+0xb8>
  400703:	00 
  400704:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
  400708:	c4 e1 eb 2a d0       	vcvtsi2sd %rax,%xmm2,%xmm2
  40070d:	b8 02 00 00 00       	mov    $0x2,%eax
  400712:	c5 fb 5e c1          	vdivsd %xmm1,%xmm0,%xmm0
  400716:	c5 fb 5e c1          	vdivsd %xmm1,%xmm0,%xmm0
  40071a:	c5 fb 59 cb          	vmulsd %xmm3,%xmm0,%xmm1
  40071e:	c5 eb 5e c3          	vdivsd %xmm3,%xmm2,%xmm0
  400722:	c5 f3 5e ca          	vdivsd %xmm2,%xmm1,%xmm1
  400726:	e8 e5 fe ff ff       	callq  400610 <__printf_chk@plt>
  40072b:	31 c0                	xor    %eax,%eax
  40072d:	e8 3e 02 00 00       	callq  400970 <print_digest>
  400732:	31 c0                	xor    %eax,%eax
  400734:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  400738:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40073f:	00 00 
  400741:	75 18                	jne    40075b <main+0x13b>
  400743:	48 81 c4 a0 01 00 00 	add    $0x1a0,%rsp
  40074a:	5b                   	pop    %rbx
  40074b:	41 5a                	pop    %r10
  40074d:	41 5c                	pop    %r12
  40074f:	41 5d                	pop    %r13
  400751:	41 5e                	pop    %r14
  400753:	41 5f                	pop    %r15
  400755:	5d                   	pop    %rbp
  400756:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
  40075a:	c3                   	retq   
  40075b:	e8 80 fe ff ff       	callq  4005e0 <__stack_chk_fail@plt>

0000000000400760 <_start>:
  400760:	31 ed                	xor    %ebp,%ebp
  400762:	49 89 d1             	mov    %rdx,%r9
  400765:	5e                   	pop    %rsi
  400766:	48 89 e2             	mov    %rsp,%rdx
  400769:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40076d:	50                   	push   %rax
  40076e:	54                   	push   %rsp
  40076f:	49 c7 c0 c0 08 40 00 	mov    $0x4008c0,%r8
  400776:	48 c7 c1 50 08 40 00 	mov    $0x400850,%rcx
  40077d:	48 c7 c7 20 06 40 00 	mov    $0x400620,%rdi
  400784:	ff 15 66 68 20 00    	callq  *0x206866(%rip)        # 606ff0 <__libc_start_main@GLIBC_2.2.5>
  40078a:	f4                   	hlt    
  40078b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400790 <_dl_relocate_static_pie>:
  400790:	f3 c3                	repz retq 
  400792:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400799:	00 00 00 
  40079c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007a0 <deregister_tm_clones>:
  4007a0:	55                   	push   %rbp
  4007a1:	b8 70 70 60 00       	mov    $0x607070,%eax
  4007a6:	48 3d 70 70 60 00    	cmp    $0x607070,%rax
  4007ac:	48 89 e5             	mov    %rsp,%rbp
  4007af:	74 17                	je     4007c8 <deregister_tm_clones+0x28>
  4007b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4007b6:	48 85 c0             	test   %rax,%rax
  4007b9:	74 0d                	je     4007c8 <deregister_tm_clones+0x28>
  4007bb:	5d                   	pop    %rbp
  4007bc:	bf 70 70 60 00       	mov    $0x607070,%edi
  4007c1:	ff e0                	jmpq   *%rax
  4007c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4007c8:	5d                   	pop    %rbp
  4007c9:	c3                   	retq   
  4007ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004007d0 <register_tm_clones>:
  4007d0:	be 70 70 60 00       	mov    $0x607070,%esi
  4007d5:	55                   	push   %rbp
  4007d6:	48 81 ee 70 70 60 00 	sub    $0x607070,%rsi
  4007dd:	48 89 e5             	mov    %rsp,%rbp
  4007e0:	48 c1 fe 03          	sar    $0x3,%rsi
  4007e4:	48 89 f0             	mov    %rsi,%rax
  4007e7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4007eb:	48 01 c6             	add    %rax,%rsi
  4007ee:	48 d1 fe             	sar    %rsi
  4007f1:	74 15                	je     400808 <register_tm_clones+0x38>
  4007f3:	b8 00 00 00 00       	mov    $0x0,%eax
  4007f8:	48 85 c0             	test   %rax,%rax
  4007fb:	74 0b                	je     400808 <register_tm_clones+0x38>
  4007fd:	5d                   	pop    %rbp
  4007fe:	bf 70 70 60 00       	mov    $0x607070,%edi
  400803:	ff e0                	jmpq   *%rax
  400805:	0f 1f 00             	nopl   (%rax)
  400808:	5d                   	pop    %rbp
  400809:	c3                   	retq   
  40080a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400810 <__do_global_dtors_aux>:
  400810:	80 3d 69 68 20 00 00 	cmpb   $0x0,0x206869(%rip)        # 607080 <completed.7697>
  400817:	75 17                	jne    400830 <__do_global_dtors_aux+0x20>
  400819:	55                   	push   %rbp
  40081a:	48 89 e5             	mov    %rsp,%rbp
  40081d:	e8 7e ff ff ff       	callq  4007a0 <deregister_tm_clones>
  400822:	c6 05 57 68 20 00 01 	movb   $0x1,0x206857(%rip)        # 607080 <completed.7697>
  400829:	5d                   	pop    %rbp
  40082a:	c3                   	retq   
  40082b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400830:	f3 c3                	repz retq 
  400832:	0f 1f 40 00          	nopl   0x0(%rax)
  400836:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40083d:	00 00 00 

0000000000400840 <frame_dummy>:
  400840:	55                   	push   %rbp
  400841:	48 89 e5             	mov    %rsp,%rbp
  400844:	5d                   	pop    %rbp
  400845:	eb 89                	jmp    4007d0 <register_tm_clones>
  400847:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40084e:	00 00 

0000000000400850 <__libc_csu_init>:
  400850:	41 57                	push   %r15
  400852:	41 56                	push   %r14
  400854:	49 89 d7             	mov    %rdx,%r15
  400857:	41 55                	push   %r13
  400859:	41 54                	push   %r12
  40085b:	4c 8d 25 ae 65 20 00 	lea    0x2065ae(%rip),%r12        # 606e10 <__frame_dummy_init_array_entry>
  400862:	55                   	push   %rbp
  400863:	48 8d 2d ae 65 20 00 	lea    0x2065ae(%rip),%rbp        # 606e18 <__init_array_end>
  40086a:	53                   	push   %rbx
  40086b:	41 89 fd             	mov    %edi,%r13d
  40086e:	49 89 f6             	mov    %rsi,%r14
  400871:	4c 29 e5             	sub    %r12,%rbp
  400874:	48 83 ec 08          	sub    $0x8,%rsp
  400878:	48 c1 fd 03          	sar    $0x3,%rbp
  40087c:	e8 ff fc ff ff       	callq  400580 <_init>
  400881:	48 85 ed             	test   %rbp,%rbp
  400884:	74 20                	je     4008a6 <__libc_csu_init+0x56>
  400886:	31 db                	xor    %ebx,%ebx
  400888:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40088f:	00 
  400890:	4c 89 fa             	mov    %r15,%rdx
  400893:	4c 89 f6             	mov    %r14,%rsi
  400896:	44 89 ef             	mov    %r13d,%edi
  400899:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40089d:	48 83 c3 01          	add    $0x1,%rbx
  4008a1:	48 39 dd             	cmp    %rbx,%rbp
  4008a4:	75 ea                	jne    400890 <__libc_csu_init+0x40>
  4008a6:	48 83 c4 08          	add    $0x8,%rsp
  4008aa:	5b                   	pop    %rbx
  4008ab:	5d                   	pop    %rbp
  4008ac:	41 5c                	pop    %r12
  4008ae:	41 5d                	pop    %r13
  4008b0:	41 5e                	pop    %r14
  4008b2:	41 5f                	pop    %r15
  4008b4:	c3                   	retq   
  4008b5:	90                   	nop
  4008b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4008bd:	00 00 00 

00000000004008c0 <__libc_csu_fini>:
  4008c0:	f3 c3                	repz retq 
  4008c2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4008c9:	00 00 00 
  4008cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004008d0 <print_buffer>:
  4008d0:	85 f6                	test   %esi,%esi
  4008d2:	0f 8e 88 00 00 00    	jle    400960 <print_buffer+0x90>
  4008d8:	41 55                	push   %r13
  4008da:	41 54                	push   %r12
  4008dc:	44 8d 66 ff          	lea    -0x1(%rsi),%r12d
  4008e0:	55                   	push   %rbp
  4008e1:	53                   	push   %rbx
  4008e2:	48 89 fd             	mov    %rdi,%rbp
  4008e5:	49 83 c4 01          	add    $0x1,%r12
  4008e9:	bb 01 00 00 00       	mov    $0x1,%ebx
  4008ee:	4c 8d 2d af 10 00 00 	lea    0x10af(%rip),%r13        # 4019a4 <_IO_stdin_used+0x4>
  4008f5:	48 83 ec 08          	sub    $0x8,%rsp
  4008f9:	eb 09                	jmp    400904 <print_buffer+0x34>
  4008fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400900:	48 83 c3 01          	add    $0x1,%rbx
  400904:	0f b6 54 1d ff       	movzbl -0x1(%rbp,%rbx,1),%edx
  400909:	31 c0                	xor    %eax,%eax
  40090b:	4c 89 ee             	mov    %r13,%rsi
  40090e:	bf 01 00 00 00       	mov    $0x1,%edi
  400913:	e8 f8 fc ff ff       	callq  400610 <__printf_chk@plt>
  400918:	49 39 dc             	cmp    %rbx,%r12
  40091b:	74 23                	je     400940 <print_buffer+0x70>
  40091d:	85 db                	test   %ebx,%ebx
  40091f:	7e df                	jle    400900 <print_buffer+0x30>
  400921:	f6 c3 0f             	test   $0xf,%bl
  400924:	75 da                	jne    400900 <print_buffer+0x30>
  400926:	48 8d 35 89 10 00 00 	lea    0x1089(%rip),%rsi        # 4019b6 <_IO_stdin_used+0x16>
  40092d:	bf 01 00 00 00       	mov    $0x1,%edi
  400932:	31 c0                	xor    %eax,%eax
  400934:	e8 d7 fc ff ff       	callq  400610 <__printf_chk@plt>
  400939:	eb c5                	jmp    400900 <print_buffer+0x30>
  40093b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400940:	48 83 c4 08          	add    $0x8,%rsp
  400944:	48 8d 3d 92 10 00 00 	lea    0x1092(%rip),%rdi        # 4019dd <_IO_stdin_used+0x3d>
  40094b:	5b                   	pop    %rbx
  40094c:	5d                   	pop    %rbp
  40094d:	41 5c                	pop    %r12
  40094f:	41 5d                	pop    %r13
  400951:	e9 5a fc ff ff       	jmpq   4005b0 <puts@plt>
  400956:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40095d:	00 00 00 
  400960:	48 8d 3d 76 10 00 00 	lea    0x1076(%rip),%rdi        # 4019dd <_IO_stdin_used+0x3d>
  400967:	e9 44 fc ff ff       	jmpq   4005b0 <puts@plt>
  40096c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400970 <print_digest>:
  400970:	48 8d 3d 33 10 00 00 	lea    0x1033(%rip),%rdi        # 4019aa <_IO_stdin_used+0xa>
  400977:	48 83 ec 08          	sub    $0x8,%rsp
  40097b:	e8 30 fc ff ff       	callq  4005b0 <puts@plt>
  400980:	48 8d 3d 19 67 20 00 	lea    0x206719(%rip),%rdi        # 6070a0 <digest>
  400987:	be 40 00 00 00       	mov    $0x40,%esi
  40098c:	48 83 c4 08          	add    $0x8,%rsp
  400990:	e9 3b ff ff ff       	jmpq   4008d0 <print_buffer>
  400995:	90                   	nop
  400996:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40099d:	00 00 00 

00000000004009a0 <print_ymm>:
  4009a0:	41 57                	push   %r15
  4009a2:	41 56                	push   %r14
  4009a4:	41 55                	push   %r13
  4009a6:	41 54                	push   %r12
  4009a8:	49 89 fc             	mov    %rdi,%r12
  4009ab:	55                   	push   %rbp
  4009ac:	53                   	push   %rbx
  4009ad:	48 8d 2d 08 10 00 00 	lea    0x1008(%rip),%rbp        # 4019bc <_IO_stdin_used+0x1c>
  4009b4:	31 db                	xor    %ebx,%ebx
  4009b6:	48 83 ec 08          	sub    $0x8,%rsp
  4009ba:	49 c7 c7 68 70 60 00 	mov    $0x607068,%r15
  4009c1:	49 8b 3f             	mov    (%r15),%rdi
  4009c4:	e8 e7 fb ff ff       	callq  4005b0 <puts@plt>
  4009c9:	48 8d 35 e2 0f 00 00 	lea    0xfe2(%rip),%rsi        # 4019b2 <_IO_stdin_used+0x12>
  4009d0:	bf 01 00 00 00       	mov    $0x1,%edi
  4009d5:	31 c0                	xor    %eax,%eax
  4009d7:	e8 34 fc ff ff       	callq  400610 <__printf_chk@plt>
  4009dc:	eb 06                	jmp    4009e4 <print_ymm+0x44>
  4009de:	66 90                	xchg   %ax,%ax
  4009e0:	48 83 c3 01          	add    $0x1,%rbx
  4009e4:	48 83 fb 10          	cmp    $0x10,%rbx
  4009e8:	0f 84 d2 00 00 00    	je     400ac0 <print_ymm+0x120>
  4009ee:	31 c0                	xor    %eax,%eax
  4009f0:	89 da                	mov    %ebx,%edx
  4009f2:	48 89 ee             	mov    %rbp,%rsi
  4009f5:	bf 01 00 00 00       	mov    $0x1,%edi
  4009fa:	e8 11 fc ff ff       	callq  400610 <__printf_chk@plt>
  4009ff:	83 fb 1f             	cmp    $0x1f,%ebx
  400a02:	75 dc                	jne    4009e0 <print_ymm+0x40>
  400a04:	48 8d 3d d2 0f 00 00 	lea    0xfd2(%rip),%rdi        # 4019dd <_IO_stdin_used+0x3d>
  400a0b:	4c 8d 2d 92 0f 00 00 	lea    0xf92(%rip),%r13        # 4019a4 <_IO_stdin_used+0x4>
  400a12:	45 31 f6             	xor    %r14d,%r14d
  400a15:	e8 96 fb ff ff       	callq  4005b0 <puts@plt>
  400a1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400a20:	48 8d 35 92 0f 00 00 	lea    0xf92(%rip),%rsi        # 4019b9 <_IO_stdin_used+0x19>
  400a27:	44 89 f2             	mov    %r14d,%edx
  400a2a:	bf 01 00 00 00       	mov    $0x1,%edi
  400a2f:	31 c0                	xor    %eax,%eax
  400a31:	4c 89 e3             	mov    %r12,%rbx
  400a34:	31 ed                	xor    %ebp,%ebp
  400a36:	e8 d5 fb ff ff       	callq  400610 <__printf_chk@plt>
  400a3b:	eb 06                	jmp    400a43 <print_ymm+0xa3>
  400a3d:	0f 1f 00             	nopl   (%rax)
  400a40:	83 c5 01             	add    $0x1,%ebp
  400a43:	48 83 c3 01          	add    $0x1,%rbx
  400a47:	83 fd 10             	cmp    $0x10,%ebp
  400a4a:	74 4c                	je     400a98 <print_ymm+0xf8>
  400a4c:	0f b6 53 ff          	movzbl -0x1(%rbx),%edx
  400a50:	31 c0                	xor    %eax,%eax
  400a52:	4c 89 ee             	mov    %r13,%rsi
  400a55:	bf 01 00 00 00       	mov    $0x1,%edi
  400a5a:	e8 b1 fb ff ff       	callq  400610 <__printf_chk@plt>
  400a5f:	89 d8                	mov    %ebx,%eax
  400a61:	44 29 e0             	sub    %r12d,%eax
  400a64:	83 f8 20             	cmp    $0x20,%eax
  400a67:	75 d7                	jne    400a40 <print_ymm+0xa0>
  400a69:	48 8d 3d 6d 0f 00 00 	lea    0xf6d(%rip),%rdi        # 4019dd <_IO_stdin_used+0x3d>
  400a70:	41 83 c6 01          	add    $0x1,%r14d
  400a74:	49 89 dc             	mov    %rbx,%r12
  400a77:	e8 34 fb ff ff       	callq  4005b0 <puts@plt>
  400a7c:	41 83 fe 0a          	cmp    $0xa,%r14d
  400a80:	75 9e                	jne    400a20 <print_ymm+0x80>
  400a82:	49 8b 3f             	mov    (%r15),%rdi
  400a85:	48 83 c4 08          	add    $0x8,%rsp
  400a89:	5b                   	pop    %rbx
  400a8a:	5d                   	pop    %rbp
  400a8b:	41 5c                	pop    %r12
  400a8d:	41 5d                	pop    %r13
  400a8f:	41 5e                	pop    %r14
  400a91:	41 5f                	pop    %r15
  400a93:	e9 18 fb ff ff       	jmpq   4005b0 <puts@plt>
  400a98:	48 8d 35 17 0f 00 00 	lea    0xf17(%rip),%rsi        # 4019b6 <_IO_stdin_used+0x16>
  400a9f:	bf 01 00 00 00       	mov    $0x1,%edi
  400aa4:	31 c0                	xor    %eax,%eax
  400aa6:	e8 65 fb ff ff       	callq  400610 <__printf_chk@plt>
  400aab:	0f b6 53 ff          	movzbl -0x1(%rbx),%edx
  400aaf:	4c 89 ee             	mov    %r13,%rsi
  400ab2:	bf 01 00 00 00       	mov    $0x1,%edi
  400ab7:	31 c0                	xor    %eax,%eax
  400ab9:	e8 52 fb ff ff       	callq  400610 <__printf_chk@plt>
  400abe:	eb 80                	jmp    400a40 <print_ymm+0xa0>
  400ac0:	48 8d 35 ef 0e 00 00 	lea    0xeef(%rip),%rsi        # 4019b6 <_IO_stdin_used+0x16>
  400ac7:	bf 01 00 00 00       	mov    $0x1,%edi
  400acc:	31 c0                	xor    %eax,%eax
  400ace:	e8 3d fb ff ff       	callq  400610 <__printf_chk@plt>
  400ad3:	ba 10 00 00 00       	mov    $0x10,%edx
  400ad8:	48 89 ee             	mov    %rbp,%rsi
  400adb:	bf 01 00 00 00       	mov    $0x1,%edi
  400ae0:	31 c0                	xor    %eax,%eax
  400ae2:	e8 29 fb ff ff       	callq  400610 <__printf_chk@plt>
  400ae7:	e9 f4 fe ff ff       	jmpq   4009e0 <print_ymm+0x40>
  400aec:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400af0 <_test>:
  400af0:	48 83 ec 08          	sub    $0x8,%rsp
  400af4:	48 8d 05 c5 12 00 00 	lea    0x12c5(%rip),%rax        # 401dc0 <AXC>
  400afb:	c5 fd ef c0          	vpxor  %ymm0,%ymm0,%ymm0
  400aff:	c5 f5 ef c9          	vpxor  %ymm1,%ymm1,%ymm1
  400b03:	c5 7d 6f 08          	vmovdqa (%rax),%ymm9
  400b07:	c4 c3 35 06 c9 01    	vperm2f128 $0x1,%ymm9,%ymm9,%ymm1
  400b0d:	c4 c1 75 ef c1       	vpxor  %ymm9,%ymm1,%ymm0
  400b12:	48 8d 3d c7 65 20 00 	lea    0x2065c7(%rip),%rdi        # 6070e0 <buffer>
  400b19:	c4 c3 35 06 c9 01    	vperm2f128 $0x1,%ymm9,%ymm9,%ymm1
  400b1f:	c5 79 7f 0f          	vmovdqa %xmm9,(%rdi)
  400b23:	c5 f9 7f 4f 10       	vmovdqa %xmm1,0x10(%rdi)
  400b28:	e8 83 00 00 00       	callq  400bb0 <_print_ymm>
  400b2d:	e8 7e 00 00 00       	callq  400bb0 <_print_ymm>
  400b32:	48 c7 c6 40 00 00 00 	mov    $0x40,%rsi
  400b39:	e8 92 fd ff ff       	callq  4008d0 <print_buffer>
  400b3e:	c5 7d 6f 0d 7a 12 00 	vmovdqa 0x127a(%rip),%ymm9        # 401dc0 <AXC>
  400b45:	00 
  400b46:	48 31 c0             	xor    %rax,%rax
  400b49:	c4 63 79 14 ce 0f    	vpextrb $0xf,%xmm9,%esi
  400b4f:	48 8d 3d a0 52 00 00 	lea    0x52a0(%rip),%rdi        # 405df6 <printf_i>
  400b56:	e8 95 fa ff ff       	callq  4005f0 <printf@plt>
  400b5b:	48 83 c4 08          	add    $0x8,%rsp
  400b5f:	c3                   	retq   

0000000000400b60 <_save_ymm>:
  400b60:	48 89 e0             	mov    %rsp,%rax
  400b63:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
  400b6a:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400b6e:	c5 fd 7f 04 24       	vmovdqa %ymm0,(%rsp)
  400b73:	c5 fd 7f 4c 24 20    	vmovdqa %ymm1,0x20(%rsp)
  400b79:	c5 fd 7f 54 24 40    	vmovdqa %ymm2,0x40(%rsp)
  400b7f:	c5 fd 7f 5c 24 60    	vmovdqa %ymm3,0x60(%rsp)
  400b85:	50                   	push   %rax
  400b86:	50                   	push   %rax
  400b87:	48 8b 00             	mov    (%rax),%rax
  400b8a:	50                   	push   %rax
  400b8b:	c3                   	retq   
  400b8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400b90 <_restore_ymm>:
  400b90:	58                   	pop    %rax
  400b91:	c5 fd 6f 44 24 10    	vmovdqa 0x10(%rsp),%ymm0
  400b97:	c5 fd 6f 4c 24 30    	vmovdqa 0x30(%rsp),%ymm1
  400b9d:	c5 fd 6f 54 24 50    	vmovdqa 0x50(%rsp),%ymm2
  400ba3:	c5 fd 6f 5c 24 70    	vmovdqa 0x70(%rsp),%ymm3
  400ba9:	5c                   	pop    %rsp
  400baa:	48 89 04 24          	mov    %rax,(%rsp)
  400bae:	c3                   	retq   
  400baf:	90                   	nop

0000000000400bb0 <_print_ymm>:
  400bb0:	55                   	push   %rbp
  400bb1:	57                   	push   %rdi
  400bb2:	56                   	push   %rsi
  400bb3:	52                   	push   %rdx
  400bb4:	53                   	push   %rbx
  400bb5:	51                   	push   %rcx
  400bb6:	48 89 e5             	mov    %rsp,%rbp
  400bb9:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  400bc0:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400bc4:	c5 fd 7f 04 24       	vmovdqa %ymm0,(%rsp)
  400bc9:	c5 fd 7f 4c 24 20    	vmovdqa %ymm1,0x20(%rsp)
  400bcf:	c5 fd 7f 54 24 40    	vmovdqa %ymm2,0x40(%rsp)
  400bd5:	c5 fd 7f 5c 24 60    	vmovdqa %ymm3,0x60(%rsp)
  400bdb:	c5 fd 7f a4 24 80 00 	vmovdqa %ymm4,0x80(%rsp)
  400be2:	00 00 
  400be4:	c5 fd 7f ac 24 a0 00 	vmovdqa %ymm5,0xa0(%rsp)
  400beb:	00 00 
  400bed:	c5 fd 7f b4 24 c0 00 	vmovdqa %ymm6,0xc0(%rsp)
  400bf4:	00 00 
  400bf6:	c5 fd 7f bc 24 e0 00 	vmovdqa %ymm7,0xe0(%rsp)
  400bfd:	00 00 
  400bff:	c5 7d 7f 84 24 00 01 	vmovdqa %ymm8,0x100(%rsp)
  400c06:	00 00 
  400c08:	c5 7d 7f 8c 24 20 01 	vmovdqa %ymm9,0x120(%rsp)
  400c0f:	00 00 
  400c11:	48 89 e7             	mov    %rsp,%rdi
  400c14:	e8 87 fd ff ff       	callq  4009a0 <print_ymm>
  400c19:	c5 fd 6f 04 24       	vmovdqa (%rsp),%ymm0
  400c1e:	c5 fd 6f 4c 24 20    	vmovdqa 0x20(%rsp),%ymm1
  400c24:	c5 fd 6f 54 24 40    	vmovdqa 0x40(%rsp),%ymm2
  400c2a:	c5 fd 6f 5c 24 60    	vmovdqa 0x60(%rsp),%ymm3
  400c30:	c5 fd 6f a4 24 80 00 	vmovdqa 0x80(%rsp),%ymm4
  400c37:	00 00 
  400c39:	c5 fd 6f ac 24 a0 00 	vmovdqa 0xa0(%rsp),%ymm5
  400c40:	00 00 
  400c42:	c5 fd 6f b4 24 c0 00 	vmovdqa 0xc0(%rsp),%ymm6
  400c49:	00 00 
  400c4b:	c5 fd 6f bc 24 e0 00 	vmovdqa 0xe0(%rsp),%ymm7
  400c52:	00 00 
  400c54:	c5 7d 6f 84 24 00 01 	vmovdqa 0x100(%rsp),%ymm8
  400c5b:	00 00 
  400c5d:	c5 7d 6f 8c 24 20 01 	vmovdqa 0x120(%rsp),%ymm9
  400c64:	00 00 
  400c66:	48 89 ec             	mov    %rbp,%rsp
  400c69:	59                   	pop    %rcx
  400c6a:	5b                   	pop    %rbx
  400c6b:	5a                   	pop    %rdx
  400c6c:	5e                   	pop    %rsi
  400c6d:	5f                   	pop    %rdi
  400c6e:	5d                   	pop    %rbp
  400c6f:	c3                   	retq   

0000000000400c70 <_print_buffer>:
  400c70:	51                   	push   %rcx
  400c71:	55                   	push   %rbp
  400c72:	57                   	push   %rdi
  400c73:	56                   	push   %rsi
  400c74:	52                   	push   %rdx
  400c75:	53                   	push   %rbx
  400c76:	51                   	push   %rcx
  400c77:	48 89 e5             	mov    %rsp,%rbp
  400c7a:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  400c81:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400c85:	c5 fd 7f 04 24       	vmovdqa %ymm0,(%rsp)
  400c8a:	c5 fd 7f 4c 24 20    	vmovdqa %ymm1,0x20(%rsp)
  400c90:	c5 fd 7f 54 24 40    	vmovdqa %ymm2,0x40(%rsp)
  400c96:	c5 fd 7f 5c 24 60    	vmovdqa %ymm3,0x60(%rsp)
  400c9c:	c5 fd 7f a4 24 80 00 	vmovdqa %ymm4,0x80(%rsp)
  400ca3:	00 00 
  400ca5:	c5 fd 7f ac 24 a0 00 	vmovdqa %ymm5,0xa0(%rsp)
  400cac:	00 00 
  400cae:	c5 fd 7f b4 24 c0 00 	vmovdqa %ymm6,0xc0(%rsp)
  400cb5:	00 00 
  400cb7:	c5 fd 7f bc 24 e0 00 	vmovdqa %ymm7,0xe0(%rsp)
  400cbe:	00 00 
  400cc0:	c5 7d 7f 84 24 00 01 	vmovdqa %ymm8,0x100(%rsp)
  400cc7:	00 00 
  400cc9:	c5 7d 7f 8c 24 20 01 	vmovdqa %ymm9,0x120(%rsp)
  400cd0:	00 00 
  400cd2:	48 31 c0             	xor    %rax,%rax
  400cd5:	48 c7 c6 40 00 00 00 	mov    $0x40,%rsi
  400cdc:	e8 ef fb ff ff       	callq  4008d0 <print_buffer>
  400ce1:	c5 fd 6f 04 24       	vmovdqa (%rsp),%ymm0
  400ce6:	c5 fd 6f 4c 24 20    	vmovdqa 0x20(%rsp),%ymm1
  400cec:	c5 fd 6f 54 24 40    	vmovdqa 0x40(%rsp),%ymm2
  400cf2:	c5 fd 6f 5c 24 60    	vmovdqa 0x60(%rsp),%ymm3
  400cf8:	c5 fd 6f a4 24 80 00 	vmovdqa 0x80(%rsp),%ymm4
  400cff:	00 00 
  400d01:	c5 fd 6f ac 24 a0 00 	vmovdqa 0xa0(%rsp),%ymm5
  400d08:	00 00 
  400d0a:	c5 fd 6f b4 24 c0 00 	vmovdqa 0xc0(%rsp),%ymm6
  400d11:	00 00 
  400d13:	c5 fd 6f bc 24 e0 00 	vmovdqa 0xe0(%rsp),%ymm7
  400d1a:	00 00 
  400d1c:	c5 7d 6f 84 24 00 01 	vmovdqa 0x100(%rsp),%ymm8
  400d23:	00 00 
  400d25:	c5 7d 6f 8c 24 20 01 	vmovdqa 0x120(%rsp),%ymm9
  400d2c:	00 00 
  400d2e:	48 89 ec             	mov    %rbp,%rsp
  400d31:	59                   	pop    %rcx
  400d32:	5b                   	pop    %rbx
  400d33:	5a                   	pop    %rdx
  400d34:	5e                   	pop    %rsi
  400d35:	5f                   	pop    %rdi
  400d36:	5d                   	pop    %rbp
  400d37:	59                   	pop    %rcx
  400d38:	c3                   	retq   
  400d39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400d40 <_print_contex>:
  400d40:	55                   	push   %rbp
  400d41:	57                   	push   %rdi
  400d42:	56                   	push   %rsi
  400d43:	52                   	push   %rdx
  400d44:	53                   	push   %rbx
  400d45:	51                   	push   %rcx
  400d46:	48 89 e5             	mov    %rsp,%rbp
  400d49:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  400d50:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400d54:	c5 fd 7f 04 24       	vmovdqa %ymm0,(%rsp)
  400d59:	c5 fd 7f 4c 24 20    	vmovdqa %ymm1,0x20(%rsp)
  400d5f:	c5 fd 7f 54 24 40    	vmovdqa %ymm2,0x40(%rsp)
  400d65:	c5 fd 7f 5c 24 60    	vmovdqa %ymm3,0x60(%rsp)
  400d6b:	c5 fd 7f a4 24 80 00 	vmovdqa %ymm4,0x80(%rsp)
  400d72:	00 00 
  400d74:	c5 fd 7f ac 24 a0 00 	vmovdqa %ymm5,0xa0(%rsp)
  400d7b:	00 00 
  400d7d:	c5 fd 7f b4 24 c0 00 	vmovdqa %ymm6,0xc0(%rsp)
  400d84:	00 00 
  400d86:	c5 fd 7f bc 24 e0 00 	vmovdqa %ymm7,0xe0(%rsp)
  400d8d:	00 00 
  400d8f:	c5 7d 7f 84 24 00 01 	vmovdqa %ymm8,0x100(%rsp)
  400d96:	00 00 
  400d98:	c5 7d 7f 8c 24 20 01 	vmovdqa %ymm9,0x120(%rsp)
  400d9f:	00 00 
  400da1:	e8 9a 07 00 00       	callq  401540 <GOST34112012Dump>
  400da6:	c5 fd 6f 04 24       	vmovdqa (%rsp),%ymm0
  400dab:	c5 fd 6f 4c 24 20    	vmovdqa 0x20(%rsp),%ymm1
  400db1:	c5 fd 6f 54 24 40    	vmovdqa 0x40(%rsp),%ymm2
  400db7:	c5 fd 6f 5c 24 60    	vmovdqa 0x60(%rsp),%ymm3
  400dbd:	c5 fd 6f a4 24 80 00 	vmovdqa 0x80(%rsp),%ymm4
  400dc4:	00 00 
  400dc6:	c5 fd 6f ac 24 a0 00 	vmovdqa 0xa0(%rsp),%ymm5
  400dcd:	00 00 
  400dcf:	c5 fd 6f b4 24 c0 00 	vmovdqa 0xc0(%rsp),%ymm6
  400dd6:	00 00 
  400dd8:	c5 fd 6f bc 24 e0 00 	vmovdqa 0xe0(%rsp),%ymm7
  400ddf:	00 00 
  400de1:	c5 7d 6f 84 24 00 01 	vmovdqa 0x100(%rsp),%ymm8
  400de8:	00 00 
  400dea:	c5 7d 6f 8c 24 20 01 	vmovdqa 0x120(%rsp),%ymm9
  400df1:	00 00 
  400df3:	48 89 ec             	mov    %rbp,%rsp
  400df6:	59                   	pop    %rcx
  400df7:	5b                   	pop    %rbx
  400df8:	5a                   	pop    %rdx
  400df9:	5e                   	pop    %rsi
  400dfa:	5f                   	pop    %rdi
  400dfb:	5d                   	pop    %rbp
  400dfc:	c3                   	retq   
  400dfd:	0f 1f 00             	nopl   (%rax)

0000000000400e00 <lps>:
  400e00:	48 8d 05 b9 0f 00 00 	lea    0xfb9(%rip),%rax        # 401dc0 <AXC>
  400e07:	c4 e3 79 14 d2 00    	vpextrb $0x0,%xmm2,%edx
  400e0d:	c4 e3 79 14 d3 01    	vpextrb $0x1,%xmm2,%ebx
  400e13:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  400e17:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  400e1b:	c4 e3 79 14 d2 02    	vpextrb $0x2,%xmm2,%edx
  400e21:	c4 e3 79 14 d3 03    	vpextrb $0x3,%xmm2,%ebx
  400e27:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  400e2b:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  400e2f:	c4 e3 79 14 d2 08    	vpextrb $0x8,%xmm2,%edx
  400e35:	c4 e3 79 14 d3 09    	vpextrb $0x9,%xmm2,%ebx
  400e3b:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  400e42:	00 
  400e43:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  400e4a:	00 
  400e4b:	c4 e3 79 14 d2 0a    	vpextrb $0xa,%xmm2,%edx
  400e51:	c4 e3 79 14 d3 0b    	vpextrb $0xb,%xmm2,%ebx
  400e57:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  400e5e:	00 
  400e5f:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  400e66:	00 
  400e67:	c4 e3 79 14 da 00    	vpextrb $0x0,%xmm3,%edx
  400e6d:	c4 e3 79 14 db 01    	vpextrb $0x1,%xmm3,%ebx
  400e73:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  400e7a:	00 
  400e7b:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  400e82:	00 
  400e83:	c4 e3 79 14 da 02    	vpextrb $0x2,%xmm3,%edx
  400e89:	c4 e3 79 14 db 03    	vpextrb $0x3,%xmm3,%ebx
  400e8f:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  400e96:	00 
  400e97:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  400e9e:	00 
  400e9f:	c4 e3 79 14 da 08    	vpextrb $0x8,%xmm3,%edx
  400ea5:	c4 e3 79 14 db 09    	vpextrb $0x9,%xmm3,%ebx
  400eab:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  400eb2:	00 
  400eb3:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  400eba:	00 
  400ebb:	c4 e3 79 14 da 0a    	vpextrb $0xa,%xmm3,%edx
  400ec1:	c4 e3 79 14 db 0b    	vpextrb $0xb,%xmm3,%ebx
  400ec7:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  400ece:	00 
  400ecf:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  400ed6:	00 
  400ed7:	4c 89 45 00          	mov    %r8,0x0(%rbp)
  400edb:	4c 89 4d 08          	mov    %r9,0x8(%rbp)
  400edf:	4c 89 55 10          	mov    %r10,0x10(%rbp)
  400ee3:	4c 89 5d 18          	mov    %r11,0x18(%rbp)
  400ee7:	c4 e3 79 14 d2 04    	vpextrb $0x4,%xmm2,%edx
  400eed:	c4 e3 79 14 d3 05    	vpextrb $0x5,%xmm2,%ebx
  400ef3:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  400ef7:	4c 8b 0c d8          	mov    (%rax,%rbx,8),%r9
  400efb:	c4 e3 79 14 d2 06    	vpextrb $0x6,%xmm2,%edx
  400f01:	c4 e3 79 14 d3 07    	vpextrb $0x7,%xmm2,%ebx
  400f07:	4c 8b 14 d0          	mov    (%rax,%rdx,8),%r10
  400f0b:	4c 8b 1c d8          	mov    (%rax,%rbx,8),%r11
  400f0f:	c4 e3 79 14 d2 0c    	vpextrb $0xc,%xmm2,%edx
  400f15:	c4 e3 79 14 d3 0d    	vpextrb $0xd,%xmm2,%ebx
  400f1b:	4c 33 84 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r8
  400f22:	00 
  400f23:	4c 33 8c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r9
  400f2a:	00 
  400f2b:	c4 e3 79 14 d2 0e    	vpextrb $0xe,%xmm2,%edx
  400f31:	c4 e3 79 14 d3 0f    	vpextrb $0xf,%xmm2,%ebx
  400f37:	4c 33 94 d0 00 08 00 	xor    0x800(%rax,%rdx,8),%r10
  400f3e:	00 
  400f3f:	4c 33 9c d8 00 08 00 	xor    0x800(%rax,%rbx,8),%r11
  400f46:	00 
  400f47:	c4 e3 79 14 da 04    	vpextrb $0x4,%xmm3,%edx
  400f4d:	c4 e3 79 14 db 05    	vpextrb $0x5,%xmm3,%ebx
  400f53:	4c 33 84 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r8
  400f5a:	00 
  400f5b:	4c 33 8c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r9
  400f62:	00 
  400f63:	c4 e3 79 14 da 06    	vpextrb $0x6,%xmm3,%edx
  400f69:	c4 e3 79 14 db 07    	vpextrb $0x7,%xmm3,%ebx
  400f6f:	4c 33 94 d0 00 20 00 	xor    0x2000(%rax,%rdx,8),%r10
  400f76:	00 
  400f77:	4c 33 9c d8 00 20 00 	xor    0x2000(%rax,%rbx,8),%r11
  400f7e:	00 
  400f7f:	c4 e3 79 14 da 0c    	vpextrb $0xc,%xmm3,%edx
  400f85:	c4 e3 79 14 db 0d    	vpextrb $0xd,%xmm3,%ebx
  400f8b:	4c 33 84 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r8
  400f92:	00 
  400f93:	4c 33 8c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r9
  400f9a:	00 
  400f9b:	c4 e3 79 14 da 0e    	vpextrb $0xe,%xmm3,%edx
  400fa1:	c4 e3 79 14 db 0f    	vpextrb $0xf,%xmm3,%ebx
  400fa7:	4c 33 94 d0 00 28 00 	xor    0x2800(%rax,%rdx,8),%r10
  400fae:	00 
  400faf:	4c 33 9c d8 00 28 00 	xor    0x2800(%rax,%rbx,8),%r11
  400fb6:	00 
  400fb7:	4c 89 45 20          	mov    %r8,0x20(%rbp)
  400fbb:	4c 89 4d 28          	mov    %r9,0x28(%rbp)
  400fbf:	4c 89 55 30          	mov    %r10,0x30(%rbp)
  400fc3:	4c 89 5d 38          	mov    %r11,0x38(%rbp)
  400fc7:	c4 e3 7d 06 c0 01    	vperm2f128 $0x1,%ymm0,%ymm0,%ymm0
  400fcd:	c4 e3 75 06 c9 01    	vperm2f128 $0x1,%ymm1,%ymm1,%ymm1
  400fd3:	c5 fd 6f 45 00       	vmovdqa 0x0(%rbp),%ymm0
  400fd8:	c5 fd 6f 4d 20       	vmovdqa 0x20(%rbp),%ymm1
  400fdd:	c4 e3 79 14 d2 00    	vpextrb $0x0,%xmm2,%edx
  400fe3:	c4 e3 79 14 d3 01    	vpextrb $0x1,%xmm2,%ebx
  400fe9:	4c 8b 84 d0 00 10 00 	mov    0x1000(%rax,%rdx,8),%r8
  400ff0:	00 
  400ff1:	4c 8b 8c d8 00 10 00 	mov    0x1000(%rax,%rbx,8),%r9
  400ff8:	00 
  400ff9:	c4 e3 79 14 d2 02    	vpextrb $0x2,%xmm2,%edx
  400fff:	c4 e3 79 14 d3 03    	vpextrb $0x3,%xmm2,%ebx
  401005:	4c 8b 94 d0 00 10 00 	mov    0x1000(%rax,%rdx,8),%r10
  40100c:	00 
  40100d:	4c 8b 9c d8 00 10 00 	mov    0x1000(%rax,%rbx,8),%r11
  401014:	00 
  401015:	c4 e3 79 14 d2 08    	vpextrb $0x8,%xmm2,%edx
  40101b:	c4 e3 79 14 d3 09    	vpextrb $0x9,%xmm2,%ebx
  401021:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  401028:	00 
  401029:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  401030:	00 
  401031:	c4 e3 79 14 d2 0a    	vpextrb $0xa,%xmm2,%edx
  401037:	c4 e3 79 14 d3 0b    	vpextrb $0xb,%xmm2,%ebx
  40103d:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  401044:	00 
  401045:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  40104c:	00 
  40104d:	c4 e3 79 14 da 00    	vpextrb $0x0,%xmm3,%edx
  401053:	c4 e3 79 14 db 01    	vpextrb $0x1,%xmm3,%ebx
  401059:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  401060:	00 
  401061:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  401068:	00 
  401069:	c4 e3 79 14 da 02    	vpextrb $0x2,%xmm3,%edx
  40106f:	c4 e3 79 14 db 03    	vpextrb $0x3,%xmm3,%ebx
  401075:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  40107c:	00 
  40107d:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  401084:	00 
  401085:	c4 e3 79 14 da 08    	vpextrb $0x8,%xmm3,%edx
  40108b:	c4 e3 79 14 db 09    	vpextrb $0x9,%xmm3,%ebx
  401091:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  401098:	00 
  401099:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  4010a0:	00 
  4010a1:	c4 e3 79 14 da 0a    	vpextrb $0xa,%xmm3,%edx
  4010a7:	c4 e3 79 14 db 0b    	vpextrb $0xb,%xmm3,%ebx
  4010ad:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  4010b4:	00 
  4010b5:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  4010bc:	00 
  4010bd:	4c 89 45 00          	mov    %r8,0x0(%rbp)
  4010c1:	4c 89 4d 08          	mov    %r9,0x8(%rbp)
  4010c5:	4c 89 55 10          	mov    %r10,0x10(%rbp)
  4010c9:	4c 89 5d 18          	mov    %r11,0x18(%rbp)
  4010cd:	c4 e3 79 14 d2 04    	vpextrb $0x4,%xmm2,%edx
  4010d3:	c4 e3 79 14 d3 05    	vpextrb $0x5,%xmm2,%ebx
  4010d9:	4c 8b 84 d0 00 10 00 	mov    0x1000(%rax,%rdx,8),%r8
  4010e0:	00 
  4010e1:	4c 8b 8c d8 00 10 00 	mov    0x1000(%rax,%rbx,8),%r9
  4010e8:	00 
  4010e9:	c4 e3 79 14 d2 06    	vpextrb $0x6,%xmm2,%edx
  4010ef:	c4 e3 79 14 d3 07    	vpextrb $0x7,%xmm2,%ebx
  4010f5:	4c 8b 94 d0 00 10 00 	mov    0x1000(%rax,%rdx,8),%r10
  4010fc:	00 
  4010fd:	4c 8b 9c d8 00 10 00 	mov    0x1000(%rax,%rbx,8),%r11
  401104:	00 
  401105:	c4 e3 79 14 d2 0c    	vpextrb $0xc,%xmm2,%edx
  40110b:	c4 e3 79 14 d3 0d    	vpextrb $0xd,%xmm2,%ebx
  401111:	4c 33 84 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r8
  401118:	00 
  401119:	4c 33 8c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r9
  401120:	00 
  401121:	c4 e3 79 14 d2 0e    	vpextrb $0xe,%xmm2,%edx
  401127:	c4 e3 79 14 d3 0f    	vpextrb $0xf,%xmm2,%ebx
  40112d:	4c 33 94 d0 00 18 00 	xor    0x1800(%rax,%rdx,8),%r10
  401134:	00 
  401135:	4c 33 9c d8 00 18 00 	xor    0x1800(%rax,%rbx,8),%r11
  40113c:	00 
  40113d:	c4 e3 79 14 da 04    	vpextrb $0x4,%xmm3,%edx
  401143:	c4 e3 79 14 db 05    	vpextrb $0x5,%xmm3,%ebx
  401149:	4c 33 84 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r8
  401150:	00 
  401151:	4c 33 8c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r9
  401158:	00 
  401159:	c4 e3 79 14 da 06    	vpextrb $0x6,%xmm3,%edx
  40115f:	c4 e3 79 14 db 07    	vpextrb $0x7,%xmm3,%ebx
  401165:	4c 33 94 d0 00 30 00 	xor    0x3000(%rax,%rdx,8),%r10
  40116c:	00 
  40116d:	4c 33 9c d8 00 30 00 	xor    0x3000(%rax,%rbx,8),%r11
  401174:	00 
  401175:	c4 e3 79 14 da 0c    	vpextrb $0xc,%xmm3,%edx
  40117b:	c4 e3 79 14 db 0d    	vpextrb $0xd,%xmm3,%ebx
  401181:	4c 33 84 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r8
  401188:	00 
  401189:	4c 33 8c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r9
  401190:	00 
  401191:	c4 e3 79 14 da 0e    	vpextrb $0xe,%xmm3,%edx
  401197:	c4 e3 79 14 db 0f    	vpextrb $0xf,%xmm3,%ebx
  40119d:	4c 33 94 d0 00 38 00 	xor    0x3800(%rax,%rdx,8),%r10
  4011a4:	00 
  4011a5:	4c 33 9c d8 00 38 00 	xor    0x3800(%rax,%rbx,8),%r11
  4011ac:	00 
  4011ad:	4c 89 45 20          	mov    %r8,0x20(%rbp)
  4011b1:	4c 89 4d 28          	mov    %r9,0x28(%rbp)
  4011b5:	4c 89 55 30          	mov    %r10,0x30(%rbp)
  4011b9:	4c 89 5d 38          	mov    %r11,0x38(%rbp)
  4011bd:	c5 fd ef 45 00       	vpxor  0x0(%rbp),%ymm0,%ymm0
  4011c2:	c5 f5 ef 4d 20       	vpxor  0x20(%rbp),%ymm1,%ymm1

00000000004011c7 <lps_exit>:
  4011c7:	c3                   	retq   
  4011c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4011cf:	00 

00000000004011d0 <add_bytes>:
  4011d0:	48 31 c9             	xor    %rcx,%rcx
  4011d3:	48 31 c0             	xor    %rax,%rax
  4011d6:	66 90                	xchg   %ax,%ax

00000000004011d8 <loop>:
  4011d8:	4c 8b 04 0f          	mov    (%rdi,%rcx,1),%r8
  4011dc:	4c 8b 4c 0f 08       	mov    0x8(%rdi,%rcx,1),%r9
  4011e1:	9e                   	sahf   
  4011e2:	4c 13 04 0e          	adc    (%rsi,%rcx,1),%r8
  4011e6:	4c 13 4c 0e 08       	adc    0x8(%rsi,%rcx,1),%r9
  4011eb:	9f                   	lahf   
  4011ec:	4c 89 04 0f          	mov    %r8,(%rdi,%rcx,1)
  4011f0:	4c 89 4c 0f 08       	mov    %r9,0x8(%rdi,%rcx,1)
  4011f5:	48 83 c1 10          	add    $0x10,%rcx
  4011f9:	48 83 f9 40          	cmp    $0x40,%rcx
  4011fd:	75 d9                	jne    4011d8 <loop>
  4011ff:	c3                   	retq   

0000000000401200 <cleanup>:
  401200:	8b b7 04 01 00 00    	mov    0x104(%rdi),%esi
  401206:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40120d:	00 00 00 

0000000000401210 <init>:
  401210:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  401217:	48 31 c0             	xor    %rax,%rax
  40121a:	49 c7 c0 01 01 00 00 	mov    $0x101,%r8
  401221:	48 83 fe 20          	cmp    $0x20,%rsi
  401225:	49 0f 44 c0          	cmove  %r8,%rax
  401229:	f3 aa                	rep stos %al,%es:(%rdi)
  40122b:	30 c0                	xor    %al,%al
  40122d:	48 c7 c1 c4 00 00 00 	mov    $0xc4,%rcx
  401234:	f3 aa                	rep stos %al,%es:(%rdi)
  401236:	89 37                	mov    %esi,(%rdi)
  401238:	48 83 fe 40          	cmp    $0x40,%rsi
  40123c:	49 0f 44 c0          	cmove  %r8,%rax
  401240:	48 c1 e8 08          	shr    $0x8,%rax
  401244:	48 ff c8             	dec    %rax
  401247:	c3                   	retq   
  401248:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40124f:	00 

0000000000401250 <get_hash>:
  401250:	8b 8f 04 01 00 00    	mov    0x104(%rdi),%ecx
  401256:	49 89 f0             	mov    %rsi,%r8
  401259:	48 8d b7 00 01 00 00 	lea    0x100(%rdi),%rsi
  401260:	4c 89 c7             	mov    %r8,%rdi
  401263:	48 29 ce             	sub    %rcx,%rsi
  401266:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401268:	c3                   	retq   
  401269:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401270 <stage2>:
  401270:	52                   	push   %rdx
  401271:	48 89 fa             	mov    %rdi,%rdx
  401274:	c5 f8 77             	vzeroupper 
  401277:	0f 18 4f 40          	prefetcht0 0x40(%rdi)
  40127b:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
  40127f:	c5 fd 6f 4f 20       	vmovdqa 0x20(%rdi),%ymm1
  401284:	c5 fd 6f 57 40       	vmovdqa 0x40(%rdi),%ymm2
  401289:	c5 fd 6f 5f 60       	vmovdqa 0x60(%rdi),%ymm3
  40128e:	e8 dd 01 00 00       	callq  401470 <g_func>
  401293:	48 8b 47 40          	mov    0x40(%rdi),%rax
  401297:	48 05 00 02 00 00    	add    $0x200,%rax
  40129d:	48 89 47 40          	mov    %rax,0x40(%rdi)
  4012a1:	48 8d bf 80 00 00 00 	lea    0x80(%rdi),%rdi

00000000004012a8 <aa>:
  4012a8:	48 31 c9             	xor    %rcx,%rcx
  4012ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004012b0 <add_bytes6>:
  4012b0:	4c 8b 04 0e          	mov    (%rsi,%rcx,1),%r8
  4012b4:	4c 8b 4c 0e 08       	mov    0x8(%rsi,%rcx,1),%r9
  4012b9:	9e                   	sahf   
  4012ba:	4c 11 04 0f          	adc    %r8,(%rdi,%rcx,1)
  4012be:	4c 11 4c 0f 08       	adc    %r9,0x8(%rdi,%rcx,1)
  4012c3:	9f                   	lahf   
  4012c4:	48 83 c1 10          	add    $0x10,%rcx
  4012c8:	48 83 f9 40          	cmp    $0x40,%rcx
  4012cc:	75 e2                	jne    4012b0 <add_bytes6>
  4012ce:	48 89 d7             	mov    %rdx,%rdi
  4012d1:	c5 fd 7f 07          	vmovdqa %ymm0,(%rdi)
  4012d5:	c5 fd 7f 4f 20       	vmovdqa %ymm1,0x20(%rdi)
  4012da:	c5 f8 77             	vzeroupper 
  4012dd:	5a                   	pop    %rdx
  4012de:	c3                   	retq   
  4012df:	90                   	nop

00000000004012e0 <update_hash>:
  4012e0:	53                   	push   %rbx
  4012e1:	49 89 f8             	mov    %rdi,%r8
  4012e4:	41 8b 98 00 01 00 00 	mov    0x100(%r8),%ebx
  4012eb:	83 fb 00             	cmp    $0x0,%ebx
  4012ee:	74 60                	je     401350 <update_data>
  4012f0:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  4012f7:	48 29 d9             	sub    %rbx,%rcx
  4012fa:	48 39 d1             	cmp    %rdx,%rcx
  4012fd:	48 0f 4f ca          	cmovg  %rdx,%rcx
  401301:	49 8d bc 18 c0 00 00 	lea    0xc0(%r8,%rbx,1),%rdi
  401308:	00 
  401309:	48 01 cb             	add    %rcx,%rbx
  40130c:	48 29 ca             	sub    %rcx,%rdx
  40130f:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401311:	41 89 98 00 01 00 00 	mov    %ebx,0x100(%r8)
  401318:	48 83 fb 00          	cmp    $0x0,%rbx
  40131c:	75 52                	jne    401370 <exit_update>
  40131e:	48 89 f3             	mov    %rsi,%rbx
  401321:	49 8d b0 c0 00 00 00 	lea    0xc0(%r8),%rsi
  401328:	4c 89 c7             	mov    %r8,%rdi
  40132b:	e8 40 ff ff ff       	callq  401270 <stage2>
  401330:	48 89 de             	mov    %rbx,%rsi
  401333:	eb 1b                	jmp    401350 <update_data>
  401335:	0f 1f 00             	nopl   (%rax)

0000000000401338 <update_loop>:
  401338:	4c 89 c7             	mov    %r8,%rdi
  40133b:	48 89 f3             	mov    %rsi,%rbx
  40133e:	e8 2d ff ff ff       	callq  401270 <stage2>
  401343:	48 83 ea 40          	sub    $0x40,%rdx
  401347:	48 89 de             	mov    %rbx,%rsi
  40134a:	48 83 c6 40          	add    $0x40,%rsi
  40134e:	66 90                	xchg   %ax,%ax

0000000000401350 <update_data>:
  401350:	48 83 fa 40          	cmp    $0x40,%rdx
  401354:	7d e2                	jge    401338 <update_loop>
  401356:	48 89 d1             	mov    %rdx,%rcx
  401359:	49 8d b8 c0 00 00 00 	lea    0xc0(%r8),%rdi
  401360:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401362:	41 89 90 00 01 00 00 	mov    %edx,0x100(%r8)
  401369:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401370 <exit_update>:
  401370:	c5 f8 77             	vzeroupper 
  401373:	5b                   	pop    %rbx
  401374:	c3                   	retq   
  401375:	90                   	nop
  401376:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40137d:	00 00 00 

0000000000401380 <stage3>:
  401380:	53                   	push   %rbx
  401381:	52                   	push   %rdx
  401382:	56                   	push   %rsi
  401383:	c5 f8 77             	vzeroupper 
  401386:	8b 9f 00 01 00 00    	mov    0x100(%rdi),%ebx
  40138c:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
  401390:	c5 fd 6f 4f 20       	vmovdqa 0x20(%rdi),%ymm1
  401395:	48 c7 c1 40 00 00 00 	mov    $0x40,%rcx
  40139c:	48 29 d9             	sub    %rbx,%rcx
  40139f:	74 1f                	je     4013c0 <n_buff>
  4013a1:	48 89 fa             	mov    %rdi,%rdx
  4013a4:	48 8d bc 1f c0 00 00 	lea    0xc0(%rdi,%rbx,1),%rdi
  4013ab:	00 
  4013ac:	b0 01                	mov    $0x1,%al
  4013ae:	aa                   	stos   %al,%es:(%rdi)
  4013af:	30 c0                	xor    %al,%al
  4013b1:	48 ff c9             	dec    %rcx
  4013b4:	f3 aa                	rep stos %al,%es:(%rdi)
  4013b6:	48 89 d7             	mov    %rdx,%rdi
  4013b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004013c0 <n_buff>:
  4013c0:	48 8d b7 c0 00 00 00 	lea    0xc0(%rdi),%rsi
  4013c7:	c5 fd 6f 57 40       	vmovdqa 0x40(%rdi),%ymm2
  4013cc:	c5 fd 6f 5f 60       	vmovdqa 0x60(%rdi),%ymm3
  4013d1:	e8 9a 00 00 00       	callq  401470 <g_func>
  4013d6:	48 c1 e3 03          	shl    $0x3,%rbx
  4013da:	48 8b 47 40          	mov    0x40(%rdi),%rax
  4013de:	48 01 d8             	add    %rbx,%rax
  4013e1:	48 89 47 40          	mov    %rax,0x40(%rdi)
  4013e5:	48 8d b7 00 01 00 00 	lea    0x100(%rdi),%rsi
  4013ec:	48 8d bf 80 00 00 00 	lea    0x80(%rdi),%rdi
  4013f3:	48 31 c9             	xor    %rcx,%rcx
  4013f6:	66 90                	xchg   %ax,%ax

00000000004013f8 <add_bytes7>:
  4013f8:	4c 8b 04 0e          	mov    (%rsi,%rcx,1),%r8
  4013fc:	4c 8b 4c 0e 08       	mov    0x8(%rsi,%rcx,1),%r9
  401401:	9e                   	sahf   
  401402:	4c 11 04 0f          	adc    %r8,(%rdi,%rcx,1)
  401406:	4c 11 4c 0f 08       	adc    %r9,0x8(%rdi,%rcx,1)
  40140b:	9f                   	lahf   
  40140c:	48 83 c1 10          	add    $0x10,%rcx
  401410:	48 83 f9 40          	cmp    $0x40,%rcx
  401414:	75 e2                	jne    4013f8 <add_bytes7>
  401416:	48 89 d7             	mov    %rdx,%rdi
  401419:	c5 ed ef d2          	vpxor  %ymm2,%ymm2,%ymm2
  40141d:	c5 e5 ef db          	vpxor  %ymm3,%ymm3,%ymm3
  401421:	48 8d 77 40          	lea    0x40(%rdi),%rsi
  401425:	e8 46 00 00 00       	callq  401470 <g_func>
  40142a:	c5 ed ef d2          	vpxor  %ymm2,%ymm2,%ymm2
  40142e:	c5 e5 ef db          	vpxor  %ymm3,%ymm3,%ymm3
  401432:	48 8d b7 80 00 00 00 	lea    0x80(%rdi),%rsi
  401439:	e8 32 00 00 00       	callq  401470 <g_func>
  40143e:	c5 fd 7f 07          	vmovdqa %ymm0,(%rdi)
  401442:	c5 fd 7f 4f 20       	vmovdqa %ymm1,0x20(%rdi)
  401447:	c5 f8 77             	vzeroupper 
  40144a:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
  401451:	5e                   	pop    %rsi
  401452:	5a                   	pop    %rdx
  401453:	5b                   	pop    %rbx
  401454:	48 85 f6             	test   %rsi,%rsi
  401457:	75 07                	jne    401460 <stage3_exit>
  401459:	c3                   	retq   
  40145a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401460 <stage3_exit>:
  401460:	48 31 c0             	xor    %rax,%rax
  401463:	c3                   	retq   
  401464:	66 90                	xchg   %ax,%ax
  401466:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40146d:	00 00 00 

0000000000401470 <g_func>:
  401470:	56                   	push   %rsi
  401471:	55                   	push   %rbp
  401472:	53                   	push   %rbx
  401473:	52                   	push   %rdx
  401474:	48 89 e5             	mov    %rsp,%rbp
  401477:	48 83 ed 48          	sub    $0x48,%rbp
  40147b:	48 83 e5 e0          	and    $0xffffffffffffffe0,%rbp
  40147f:	c5 fd 6f f0          	vmovdqa %ymm0,%ymm6
  401483:	c5 fd 6f f9          	vmovdqa %ymm1,%ymm7
  401487:	c5 ed ef d0          	vpxor  %ymm0,%ymm2,%ymm2
  40148b:	c5 e5 ef d9          	vpxor  %ymm1,%ymm3,%ymm3
  40148f:	e8 6c f9 ff ff       	callq  400e00 <lps>
  401494:	c5 fe 6f 26          	vmovdqu (%rsi),%ymm4
  401498:	c5 fe 6f 6e 20       	vmovdqu 0x20(%rsi),%ymm5
  40149d:	c5 cd ef f4          	vpxor  %ymm4,%ymm6,%ymm6
  4014a1:	c5 c5 ef fd          	vpxor  %ymm5,%ymm7,%ymm7
  4014a5:	48 c7 c1 0c 00 00 00 	mov    $0xc,%rcx
  4014ac:	48 8d 35 0d 06 00 00 	lea    0x60d(%rip),%rsi        # 401ac0 <CXC>
  4014b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004014b8 <g_func_loop>:
  4014b8:	c5 dd ef d0          	vpxor  %ymm0,%ymm4,%ymm2
  4014bc:	c5 d5 ef d9          	vpxor  %ymm1,%ymm5,%ymm3
  4014c0:	0f 18 4e 40          	prefetcht0 0x40(%rsi)
  4014c4:	c5 fd 6f 26          	vmovdqa (%rsi),%ymm4
  4014c8:	c5 fd 6f 6e 20       	vmovdqa 0x20(%rsi),%ymm5
  4014cd:	c5 dd ef e0          	vpxor  %ymm0,%ymm4,%ymm4
  4014d1:	c5 d5 ef e9          	vpxor  %ymm1,%ymm5,%ymm5
  4014d5:	e8 26 f9 ff ff       	callq  400e00 <lps>
  4014da:	c5 fd 6f d4          	vmovdqa %ymm4,%ymm2
  4014de:	c5 fd 6f dd          	vmovdqa %ymm5,%ymm3
  4014e2:	c5 fd 6f e0          	vmovdqa %ymm0,%ymm4
  4014e6:	c5 fd 6f e9          	vmovdqa %ymm1,%ymm5
  4014ea:	e8 11 f9 ff ff       	callq  400e00 <lps>
  4014ef:	48 83 c6 40          	add    $0x40,%rsi
  4014f3:	e2 c3                	loop   4014b8 <g_func_loop>
  4014f5:	c5 dd ef c0          	vpxor  %ymm0,%ymm4,%ymm0
  4014f9:	c5 d5 ef c9          	vpxor  %ymm1,%ymm5,%ymm1
  4014fd:	c5 cd ef c0          	vpxor  %ymm0,%ymm6,%ymm0
  401501:	c5 c5 ef c9          	vpxor  %ymm1,%ymm7,%ymm1

0000000000401505 <g_func_exit>:
  401505:	5a                   	pop    %rdx
  401506:	5b                   	pop    %rbx
  401507:	5d                   	pop    %rbp
  401508:	5e                   	pop    %rsi
  401509:	c3                   	retq   
  40150a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401510 <GOST34112012Cleanup>:
  401510:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  401517:	48 c7 87 58 01 00 00 	movq   $0x0,0x158(%rdi)
  40151e:	00 00 00 00 
  401522:	48 89 f9             	mov    %rdi,%rcx
  401525:	48 8d 7f 08          	lea    0x8(%rdi),%rdi
  401529:	31 c0                	xor    %eax,%eax
  40152b:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  40152f:	48 29 f9             	sub    %rdi,%rcx
  401532:	81 c1 60 01 00 00    	add    $0x160,%ecx
  401538:	c1 e9 03             	shr    $0x3,%ecx
  40153b:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  40153e:	c3                   	retq   
  40153f:	90                   	nop

0000000000401540 <GOST34112012Dump>:
  401540:	41 55                	push   %r13
  401542:	41 54                	push   %r12
  401544:	48 8d 97 08 01 00 00 	lea    0x108(%rdi),%rdx
  40154b:	55                   	push   %rbp
  40154c:	53                   	push   %rbx
  40154d:	48 8d 35 aa 48 00 00 	lea    0x48aa(%rip),%rsi        # 405dfe <printf_i+0x8>
  401554:	49 89 fc             	mov    %rdi,%r12
  401557:	31 c0                	xor    %eax,%eax
  401559:	48 8d 2d 44 04 00 00 	lea    0x444(%rip),%rbp        # 4019a4 <_IO_stdin_used+0x4>
  401560:	48 83 ec 08          	sub    $0x8,%rsp
  401564:	c6 87 47 01 00 00 00 	movb   $0x0,0x147(%rdi)
  40156b:	bf 01 00 00 00       	mov    $0x1,%edi
  401570:	e8 9b f0 ff ff       	callq  400610 <__printf_chk@plt>
  401575:	41 8b 94 24 04 01 00 	mov    0x104(%r12),%edx
  40157c:	00 
  40157d:	48 8d 35 7d 48 00 00 	lea    0x487d(%rip),%rsi        # 405e01 <printf_i+0xb>
  401584:	bf 01 00 00 00       	mov    $0x1,%edi
  401589:	31 c0                	xor    %eax,%eax
  40158b:	4d 8d 6c 24 40       	lea    0x40(%r12),%r13
  401590:	4c 89 e3             	mov    %r12,%rbx
  401593:	e8 78 f0 ff ff       	callq  400610 <__printf_chk@plt>
  401598:	48 8d 35 6d 48 00 00 	lea    0x486d(%rip),%rsi        # 405e0c <printf_i+0x16>
  40159f:	bf 01 00 00 00       	mov    $0x1,%edi
  4015a4:	31 c0                	xor    %eax,%eax
  4015a6:	e8 65 f0 ff ff       	callq  400610 <__printf_chk@plt>
  4015ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4015b0:	0f b6 13             	movzbl (%rbx),%edx
  4015b3:	31 c0                	xor    %eax,%eax
  4015b5:	48 89 ee             	mov    %rbp,%rsi
  4015b8:	bf 01 00 00 00       	mov    $0x1,%edi
  4015bd:	48 83 c3 01          	add    $0x1,%rbx
  4015c1:	e8 4a f0 ff ff       	callq  400610 <__printf_chk@plt>
  4015c6:	4c 39 eb             	cmp    %r13,%rbx
  4015c9:	75 e5                	jne    4015b0 <GOST34112012Dump+0x70>
  4015cb:	48 8d 35 42 48 00 00 	lea    0x4842(%rip),%rsi        # 405e14 <printf_i+0x1e>
  4015d2:	49 8d ac 24 80 00 00 	lea    0x80(%r12),%rbp
  4015d9:	00 
  4015da:	4c 8d 2d c3 03 00 00 	lea    0x3c3(%rip),%r13        # 4019a4 <_IO_stdin_used+0x4>
  4015e1:	bf 01 00 00 00       	mov    $0x1,%edi
  4015e6:	31 c0                	xor    %eax,%eax
  4015e8:	e8 23 f0 ff ff       	callq  400610 <__printf_chk@plt>
  4015ed:	0f 1f 00             	nopl   (%rax)
  4015f0:	0f b6 13             	movzbl (%rbx),%edx
  4015f3:	31 c0                	xor    %eax,%eax
  4015f5:	4c 89 ee             	mov    %r13,%rsi
  4015f8:	bf 01 00 00 00       	mov    $0x1,%edi
  4015fd:	48 83 c3 01          	add    $0x1,%rbx
  401601:	e8 0a f0 ff ff       	callq  400610 <__printf_chk@plt>
  401606:	48 39 dd             	cmp    %rbx,%rbp
  401609:	75 e5                	jne    4015f0 <GOST34112012Dump+0xb0>
  40160b:	48 8d 35 0a 48 00 00 	lea    0x480a(%rip),%rsi        # 405e1c <printf_i+0x26>
  401612:	48 89 eb             	mov    %rbp,%rbx
  401615:	4c 8d 2d 88 03 00 00 	lea    0x388(%rip),%r13        # 4019a4 <_IO_stdin_used+0x4>
  40161c:	49 8d ac 24 c0 00 00 	lea    0xc0(%r12),%rbp
  401623:	00 
  401624:	bf 01 00 00 00       	mov    $0x1,%edi
  401629:	31 c0                	xor    %eax,%eax
  40162b:	e8 e0 ef ff ff       	callq  400610 <__printf_chk@plt>
  401630:	0f b6 13             	movzbl (%rbx),%edx
  401633:	31 c0                	xor    %eax,%eax
  401635:	4c 89 ee             	mov    %r13,%rsi
  401638:	bf 01 00 00 00       	mov    $0x1,%edi
  40163d:	48 83 c3 01          	add    $0x1,%rbx
  401641:	e8 ca ef ff ff       	callq  400610 <__printf_chk@plt>
  401646:	48 39 dd             	cmp    %rbx,%rbp
  401649:	75 e5                	jne    401630 <GOST34112012Dump+0xf0>
  40164b:	48 8d 35 d2 47 00 00 	lea    0x47d2(%rip),%rsi        # 405e24 <printf_i+0x2e>
  401652:	31 c0                	xor    %eax,%eax
  401654:	bf 01 00 00 00       	mov    $0x1,%edi
  401659:	e8 b2 ef ff ff       	callq  400610 <__printf_chk@plt>
  40165e:	41 8b 94 24 00 01 00 	mov    0x100(%r12),%edx
  401665:	00 
  401666:	85 d2                	test   %edx,%edx
  401668:	7e 3a                	jle    4016a4 <GOST34112012Dump+0x164>
  40166a:	8d 42 ff             	lea    -0x1(%rdx),%eax
  40166d:	48 8d 1d 30 03 00 00 	lea    0x330(%rip),%rbx        # 4019a4 <_IO_stdin_used+0x4>
  401674:	4d 8d ac 04 c1 00 00 	lea    0xc1(%r12,%rax,1),%r13
  40167b:	00 
  40167c:	0f 1f 40 00          	nopl   0x0(%rax)
  401680:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  401684:	31 c0                	xor    %eax,%eax
  401686:	48 89 de             	mov    %rbx,%rsi
  401689:	bf 01 00 00 00       	mov    $0x1,%edi
  40168e:	48 83 c5 01          	add    $0x1,%rbp
  401692:	e8 79 ef ff ff       	callq  400610 <__printf_chk@plt>
  401697:	49 39 ed             	cmp    %rbp,%r13
  40169a:	75 e4                	jne    401680 <GOST34112012Dump+0x140>
  40169c:	41 8b 94 24 00 01 00 	mov    0x100(%r12),%edx
  4016a3:	00 
  4016a4:	48 83 c4 08          	add    $0x8,%rsp
  4016a8:	48 8d 35 7d 47 00 00 	lea    0x477d(%rip),%rsi        # 405e2c <printf_i+0x36>
  4016af:	bf 01 00 00 00       	mov    $0x1,%edi
  4016b4:	5b                   	pop    %rbx
  4016b5:	5d                   	pop    %rbp
  4016b6:	41 5c                	pop    %r12
  4016b8:	41 5d                	pop    %r13
  4016ba:	31 c0                	xor    %eax,%eax
  4016bc:	e9 4f ef ff ff       	jmpq   400610 <__printf_chk@plt>
  4016c1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4016c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4016cd:	00 00 00 

00000000004016d0 <GOST34112012Init>:
  4016d0:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  4016d7:	48 c7 87 58 01 00 00 	movq   $0x0,0x158(%rdi)
  4016de:	00 00 00 00 
  4016e2:	48 89 fa             	mov    %rdi,%rdx
  4016e5:	48 8d 7f 08          	lea    0x8(%rdi),%rdi
  4016e9:	48 89 d1             	mov    %rdx,%rcx
  4016ec:	31 c0                	xor    %eax,%eax
  4016ee:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  4016f2:	48 29 f9             	sub    %rdi,%rcx
  4016f5:	81 c1 60 01 00 00    	add    $0x160,%ecx
  4016fb:	c1 e9 03             	shr    $0x3,%ecx
  4016fe:	81 fe 00 01 00 00    	cmp    $0x100,%esi
  401704:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401707:	89 b2 04 01 00 00    	mov    %esi,0x104(%rdx)
  40170d:	75 29                	jne    401738 <GOST34112012Init+0x68>
  40170f:	48 b8 01 01 01 01 01 	movabs $0x101010101010101,%rax
  401716:	01 01 01 
  401719:	48 89 02             	mov    %rax,(%rdx)
  40171c:	48 89 42 08          	mov    %rax,0x8(%rdx)
  401720:	48 89 42 10          	mov    %rax,0x10(%rdx)
  401724:	48 89 42 18          	mov    %rax,0x18(%rdx)
  401728:	48 89 42 20          	mov    %rax,0x20(%rdx)
  40172c:	48 89 42 28          	mov    %rax,0x28(%rdx)
  401730:	48 89 42 30          	mov    %rax,0x30(%rdx)
  401734:	48 89 42 38          	mov    %rax,0x38(%rdx)
  401738:	c5 f9 6f 05 00 47 00 	vmovdqa 0x4700(%rip),%xmm0        # 405e40 <printf_i+0x4a>
  40173f:	00 
  401740:	31 c0                	xor    %eax,%eax
  401742:	48 c7 82 18 01 00 00 	movq   $0x747865,0x118(%rdx)
  401749:	65 78 74 00 
  40174d:	48 c7 82 20 01 00 00 	movq   $0x0,0x120(%rdx)
  401754:	00 00 00 00 
  401758:	c5 f8 11 82 08 01 00 	vmovups %xmm0,0x108(%rdx)
  40175f:	00 
  401760:	c5 f9 ef c0          	vpxor  %xmm0,%xmm0,%xmm0
  401764:	48 c7 82 38 01 00 00 	movq   $0x0,0x138(%rdx)
  40176b:	00 00 00 00 
  40176f:	c5 f8 11 82 28 01 00 	vmovups %xmm0,0x128(%rdx)
  401776:	00 
  401777:	c7 82 40 01 00 00 00 	movl   $0x0,0x140(%rdx)
  40177e:	00 00 00 
  401781:	66 89 82 44 01 00 00 	mov    %ax,0x144(%rdx)
  401788:	c6 82 46 01 00 00 00 	movb   $0x0,0x146(%rdx)
  40178f:	c6 82 47 01 00 00 00 	movb   $0x0,0x147(%rdx)
  401796:	c3                   	retq   
  401797:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40179e:	00 00 

00000000004017a0 <GOST34112012Update>:
  4017a0:	41 55                	push   %r13
  4017a2:	41 54                	push   %r12
  4017a4:	49 89 d4             	mov    %rdx,%r12
  4017a7:	55                   	push   %rbp
  4017a8:	53                   	push   %rbx
  4017a9:	48 89 fd             	mov    %rdi,%rbp
  4017ac:	48 89 f3             	mov    %rsi,%rbx
  4017af:	48 83 ec 08          	sub    $0x8,%rsp
  4017b3:	8b 87 00 01 00 00    	mov    0x100(%rdi),%eax
  4017b9:	85 c0                	test   %eax,%eax
  4017bb:	74 3e                	je     4017fb <GOST34112012Update+0x5b>
  4017bd:	41 bd 40 00 00 00    	mov    $0x40,%r13d
  4017c3:	48 8d bc 07 c0 00 00 	lea    0xc0(%rdi,%rax,1),%rdi
  4017ca:	00 
  4017cb:	41 29 c5             	sub    %eax,%r13d
  4017ce:	4c 39 ea             	cmp    %r13,%rdx
  4017d1:	4c 0f 46 ea          	cmovbe %rdx,%r13
  4017d5:	4c 89 ea             	mov    %r13,%rdx
  4017d8:	4d 29 ec             	sub    %r13,%r12
  4017db:	4c 01 eb             	add    %r13,%rbx
  4017de:	e8 1d ee ff ff       	callq  400600 <memcpy@plt>
  4017e3:	8b 85 00 01 00 00    	mov    0x100(%rbp),%eax
  4017e9:	44 01 e8             	add    %r13d,%eax
  4017ec:	83 f8 40             	cmp    $0x40,%eax
  4017ef:	89 85 00 01 00 00    	mov    %eax,0x100(%rbp)
  4017f5:	0f 84 dd 00 00 00    	je     4018d8 <GOST34112012Update+0x138>
  4017fb:	49 83 fc 3f          	cmp    $0x3f,%r12
  4017ff:	76 27                	jbe    401828 <GOST34112012Update+0x88>
  401801:	49 8d 44 24 c0       	lea    -0x40(%r12),%rax
  401806:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
  40180a:	4c 8d 6c 03 40       	lea    0x40(%rbx,%rax,1),%r13
  40180f:	90                   	nop
  401810:	48 89 de             	mov    %rbx,%rsi
  401813:	48 89 ef             	mov    %rbp,%rdi
  401816:	48 83 c3 40          	add    $0x40,%rbx
  40181a:	e8 51 fa ff ff       	callq  401270 <stage2>
  40181f:	4c 39 eb             	cmp    %r13,%rbx
  401822:	75 ec                	jne    401810 <GOST34112012Update+0x70>
  401824:	41 83 e4 3f          	and    $0x3f,%r12d
  401828:	4d 85 e4             	test   %r12,%r12
  40182b:	75 13                	jne    401840 <GOST34112012Update+0xa0>
  40182d:	48 83 c4 08          	add    $0x8,%rsp
  401831:	5b                   	pop    %rbx
  401832:	5d                   	pop    %rbp
  401833:	41 5c                	pop    %r12
  401835:	41 5d                	pop    %r13
  401837:	c3                   	retq   
  401838:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40183f:	00 
  401840:	41 83 fc 08          	cmp    $0x8,%r12d
  401844:	48 8d 8d c0 00 00 00 	lea    0xc0(%rbp),%rcx
  40184b:	44 89 e0             	mov    %r12d,%eax
  40184e:	73 38                	jae    401888 <GOST34112012Update+0xe8>
  401850:	41 f6 c4 04          	test   $0x4,%r12b
  401854:	0f 85 9c 00 00 00    	jne    4018f6 <GOST34112012Update+0x156>
  40185a:	45 85 e4             	test   %r12d,%r12d
  40185d:	74 11                	je     401870 <GOST34112012Update+0xd0>
  40185f:	0f b6 13             	movzbl (%rbx),%edx
  401862:	a8 02                	test   $0x2,%al
  401864:	88 95 c0 00 00 00    	mov    %dl,0xc0(%rbp)
  40186a:	0f 85 9e 00 00 00    	jne    40190e <GOST34112012Update+0x16e>
  401870:	44 89 a5 00 01 00 00 	mov    %r12d,0x100(%rbp)
  401877:	48 83 c4 08          	add    $0x8,%rsp
  40187b:	5b                   	pop    %rbx
  40187c:	5d                   	pop    %rbp
  40187d:	41 5c                	pop    %r12
  40187f:	41 5d                	pop    %r13
  401881:	c3                   	retq   
  401882:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401888:	48 8b 03             	mov    (%rbx),%rax
  40188b:	48 89 85 c0 00 00 00 	mov    %rax,0xc0(%rbp)
  401892:	44 89 e0             	mov    %r12d,%eax
  401895:	48 8b 54 03 f8       	mov    -0x8(%rbx,%rax,1),%rdx
  40189a:	48 89 54 01 f8       	mov    %rdx,-0x8(%rcx,%rax,1)
  40189f:	48 8d 95 c8 00 00 00 	lea    0xc8(%rbp),%rdx
  4018a6:	48 83 e2 f8          	and    $0xfffffffffffffff8,%rdx
  4018aa:	48 29 d1             	sub    %rdx,%rcx
  4018ad:	41 8d 04 0c          	lea    (%r12,%rcx,1),%eax
  4018b1:	48 29 cb             	sub    %rcx,%rbx
  4018b4:	83 e0 f8             	and    $0xfffffff8,%eax
  4018b7:	83 f8 08             	cmp    $0x8,%eax
  4018ba:	72 b4                	jb     401870 <GOST34112012Update+0xd0>
  4018bc:	83 e0 f8             	and    $0xfffffff8,%eax
  4018bf:	31 c9                	xor    %ecx,%ecx
  4018c1:	89 ce                	mov    %ecx,%esi
  4018c3:	83 c1 08             	add    $0x8,%ecx
  4018c6:	48 8b 3c 33          	mov    (%rbx,%rsi,1),%rdi
  4018ca:	39 c1                	cmp    %eax,%ecx
  4018cc:	48 89 3c 32          	mov    %rdi,(%rdx,%rsi,1)
  4018d0:	72 ef                	jb     4018c1 <GOST34112012Update+0x121>
  4018d2:	eb 9c                	jmp    401870 <GOST34112012Update+0xd0>
  4018d4:	0f 1f 40 00          	nopl   0x0(%rax)
  4018d8:	48 8d b5 c0 00 00 00 	lea    0xc0(%rbp),%rsi
  4018df:	48 89 ef             	mov    %rbp,%rdi
  4018e2:	e8 89 f9 ff ff       	callq  401270 <stage2>
  4018e7:	c7 85 00 01 00 00 00 	movl   $0x0,0x100(%rbp)
  4018ee:	00 00 00 
  4018f1:	e9 05 ff ff ff       	jmpq   4017fb <GOST34112012Update+0x5b>
  4018f6:	8b 13                	mov    (%rbx),%edx
  4018f8:	89 95 c0 00 00 00    	mov    %edx,0xc0(%rbp)
  4018fe:	44 89 e2             	mov    %r12d,%edx
  401901:	8b 44 13 fc          	mov    -0x4(%rbx,%rdx,1),%eax
  401905:	89 44 11 fc          	mov    %eax,-0x4(%rcx,%rdx,1)
  401909:	e9 62 ff ff ff       	jmpq   401870 <GOST34112012Update+0xd0>
  40190e:	44 89 e2             	mov    %r12d,%edx
  401911:	0f b7 44 13 fe       	movzwl -0x2(%rbx,%rdx,1),%eax
  401916:	66 89 44 11 fe       	mov    %ax,-0x2(%rcx,%rdx,1)
  40191b:	e9 50 ff ff ff       	jmpq   401870 <GOST34112012Update+0xd0>

0000000000401920 <GOST34112012Final>:
  401920:	55                   	push   %rbp
  401921:	53                   	push   %rbx
  401922:	48 89 fb             	mov    %rdi,%rbx
  401925:	48 89 f5             	mov    %rsi,%rbp
  401928:	48 83 ec 08          	sub    $0x8,%rsp
  40192c:	e8 4f fa ff ff       	callq  401380 <stage3>
  401931:	83 bb 04 01 00 00 20 	cmpl   $0x20,0x104(%rbx)
  401938:	c7 83 00 01 00 00 00 	movl   $0x0,0x100(%rbx)
  40193f:	00 00 00 
  401942:	74 34                	je     401978 <GOST34112012Final+0x58>
  401944:	c5 fa 6f 03          	vmovdqu (%rbx),%xmm0
  401948:	c5 f8 11 45 00       	vmovups %xmm0,0x0(%rbp)
  40194d:	c5 fa 6f 43 10       	vmovdqu 0x10(%rbx),%xmm0
  401952:	c5 f8 11 45 10       	vmovups %xmm0,0x10(%rbp)
  401957:	c5 fa 6f 43 20       	vmovdqu 0x20(%rbx),%xmm0
  40195c:	c5 f8 11 45 20       	vmovups %xmm0,0x20(%rbp)
  401961:	c5 fa 6f 43 30       	vmovdqu 0x30(%rbx),%xmm0
  401966:	c5 f8 11 45 30       	vmovups %xmm0,0x30(%rbp)
  40196b:	48 83 c4 08          	add    $0x8,%rsp
  40196f:	5b                   	pop    %rbx
  401970:	5d                   	pop    %rbp
  401971:	c3                   	retq   
  401972:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401978:	c5 fa 6f 43 20       	vmovdqu 0x20(%rbx),%xmm0
  40197d:	c5 f8 11 45 00       	vmovups %xmm0,0x0(%rbp)
  401982:	c5 fa 6f 43 30       	vmovdqu 0x30(%rbx),%xmm0
  401987:	c5 f8 11 45 10       	vmovups %xmm0,0x10(%rbp)
  40198c:	48 83 c4 08          	add    $0x8,%rsp
  401990:	5b                   	pop    %rbx
  401991:	5d                   	pop    %rbp
  401992:	c3                   	retq   

Disassembly of section .fini:

0000000000401994 <_fini>:
  401994:	48 83 ec 08          	sub    $0x8,%rsp
  401998:	48 83 c4 08          	add    $0x8,%rsp
  40199c:	c3                   	retq   
