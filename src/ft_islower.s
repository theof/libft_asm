; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_islower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:51:09 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:51:14 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_islower
_ft_islower:
	enter 0, 0
	cmp edi, 'a'
	jl _ft_islower_false
	cmp edi, 'z'
	jg _ft_islower_false
	mov eax, 1
	leave
	ret
_ft_islower_false:
	mov eax, 0
	leave
	ret
