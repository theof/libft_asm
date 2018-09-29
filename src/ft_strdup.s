; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/29 19:52:36 by tvallee           #+#    #+#              ;
;    Updated: 2018/09/29 19:52:57 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

extern _malloc
extern _ft_strlen

global _ft_strdup
_ft_strdup:
	enter 0, 0
	push r12
	push r13

	mov r12, rdi
	call _ft_strlen
	inc rax
	mov r13, rax
	mov rdi, rax
	call _malloc
	cmp rax, 0
	je _ft_strdup_end

	mov rcx, r13
	mov rsi, r12
	mov rdi, rax
	mov rdx, rdi ; save the pointer returned by malloc
	cld
	rep movsb
	mov rax, rdx
	
_ft_strdup_end:
	pop r13
	pop r12
	leave
	ret
