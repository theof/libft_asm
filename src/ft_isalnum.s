; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:50:25 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:50:28 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

extern _ft_isalpha
extern _ft_isdigit

global _ft_isalnum
_ft_isalnum:
	enter 0, 0
	call _ft_isalpha
	cmp eax, 0
	jne _ft_isalnum_true
	call _ft_isdigit
	cmp eax, 0
	jne _ft_isalnum_true
	mov eax, 0
	leave
	ret
_ft_isalnum_true:
	mov eax, 1
	leave
	ret
