; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:51:34 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:51:38 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_isupper
_ft_isupper:
	enter 0, 0
	cmp edi, 'A'
	jl _ft_isupper_false
	cmp edi, 'Z'
	jg _ft_isupper_false
	mov eax, 1
	leave
	ret
_ft_isupper_false:
	mov eax, 0
	leave
	ret
