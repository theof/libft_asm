; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:50:35 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:50:37 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

extern _ft_islower
extern _ft_isupper

global _ft_isalpha
_ft_isalpha:
	enter 0, 0
	call _ft_islower
	cmp eax, 0
	jne _ft_isalpha_true
	call _ft_isupper
	cmp eax, 0
	jne _ft_isalpha_true
	mov eax, 0
	leave
	ret
_ft_isalpha_true:
	mov eax, 1
	leave
	ret
