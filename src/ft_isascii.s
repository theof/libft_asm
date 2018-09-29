; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isascii.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:50:45 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:50:49 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_isascii
_ft_isascii:
	enter 0, 0
	cmp edi, 0
	jl _ft_isascii_false
	cmp edi, 127
	jg _ft_isascii_false
	mov eax, 1
	leave
	ret
_ft_isascii_false:
	mov eax, 0
	leave
	ret
