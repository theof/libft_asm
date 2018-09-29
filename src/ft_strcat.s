; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:52:27 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:52:30 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global _ft_strcat
_ft_strcat:
	enter 0, 0
	push rdi

	cld
	mov al, 0
	mov rcx, 0xFFFFFFFFFFFFFFFF
	repne scasb
	dec rdi
_ft_strcat_cp:
	movsb
	cmp BYTE [rdi - 1], 0
	jne _ft_strcat_cp
	
	pop rax
	leave
	ret
