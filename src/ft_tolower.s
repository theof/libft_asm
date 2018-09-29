; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_tolower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:53:27 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:53:29 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

extern _ft_isupper

global _ft_tolower
_ft_tolower:
	enter 0, 0
	call _ft_isupper
	cmp eax, 0
	mov eax, edi
	je _ft_tolower_ret
	add eax, 32
_ft_tolower_ret:
	leave
	ret
