; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:53:02 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:53:10 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_strlen
_ft_strlen:
	enter 0, 0
	cld
	mov r11, rdi
	mov rcx, 0xFFFFFFFFFFFFFFFF
	mov al, 0
	repne scasb
	mov rax, rdi
	sub rax, r11
	dec rax
	leave
	ret
