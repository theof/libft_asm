; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putchar.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/10/02 15:58:21 by tvallee           #+#    #+#              ;
;    Updated: 2018/10/02 16:10:00 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(x) 0x2000000 | x
%define WRITE 0x4
%define STDOUT 1

section .text

global _ft_putchar
_ft_putchar:
	enter 1, 0
	mov BYTE [rbp - 1], dil
	mov rdi, STDOUT
	lea rsi, [rbp - 1]
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	leave
	ret
