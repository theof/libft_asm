; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putstr.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:52:09 by tvallee           #+#    #+#              ;
;    Updated: 2018/10/03 14:07:40 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(x) 0x2000000 | x
%define WRITE 0x4

section .text

extern _ft_strlen

global _ft_putstr
_ft_putstr:
	enter 0, 0

	push rdi
	call _ft_strlen
	pop rdi
	mov rdx, rax

	mov rsi, rdi
	mov rdi, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall

	leave
	ret
