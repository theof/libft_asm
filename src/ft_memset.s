; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 16:23:58 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 18:51:01 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_memset
_ft_memset:
	enter 0, 0

	mov rcx, rdx
	mov eax, esi
	mov rdx, rdi

	cld
	rep stosb
	mov rax, rdx

	leave
	ret
