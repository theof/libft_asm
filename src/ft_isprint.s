; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isprint.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:51:22 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:51:26 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_isprint
_ft_isprint:
	enter 0, 0
	cmp edi, ' '
	jl _ft_isprint_false
	cmp edi, '~'
	jg _ft_isprint_false
	mov eax, 1
	leave
	ret
_ft_isprint_false:
	mov eax, 0
	leave
	ret
