; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:51:44 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:51:47 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_memcpy
_ft_memcpy:
	enter 0, 0
	mov rax, rdi
	mov rcx, rdx

	cld
	rep movsb

	leave
	ret
