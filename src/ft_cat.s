; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:48:29 by tvallee           #+#    #+#              ;
;    Updated: 2018/10/04 13:24:54 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(x) 0x2000000 | x
%define READ 0x3
%define WRITE 0x4
%define STDOUT 1

section .text

global _ft_cat
_ft_cat:
	enter 5004, 0
	push r12

	mov r12, rdi
_ft_cat_dump:
	mov rdi, r12
	lea rsi, [rbp - 8]
	mov rdx, 4096
	mov rax, MACH_SYSCALL(READ)
	syscall
	jc _ft_cat_cleanup
	cmp rax, 0
	jle _ft_cat_cleanup

	mov rdi, STDOUT
	lea rsi, [rbp - 8]
	mov rdx, rax
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	jc _ft_cat_cleanup
	jmp _ft_cat_dump

_ft_cat_cleanup:
	pop r12
	leave
	ret
