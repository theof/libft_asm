; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/10/03 17:38:11 by tvallee           #+#    #+#              ;
;    Updated: 2018/10/03 17:52:36 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_strcmp
_ft_strcmp:
	enter 0, 0

	mov rcx, 0xFFFFFFFFFFFFFFFF
_ft_strcmp_test:
	cmpsb
	jz _ft_strcmp_end
	loope _ft_strcmp_test
_ft_strcmp_end:
	leave
	ret
