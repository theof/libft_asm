; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:50:10 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:50:11 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_bzero
_ft_bzero:
	enter 0, 0
	mov rcx, rsi
	jrcxz _ft_bzero_quit
	cld
_ft_bzero_loop:
	mov BYTE [rdi+rcx-1], 0
	loop _ft_bzero_loop
_ft_bzero_quit:
	leave
	ret
