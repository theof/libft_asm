; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putnbr.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/10/02 15:44:13 by tvallee           #+#    #+#              ;
;    Updated: 2018/10/03 17:30:27 by tvallee          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .rodata

lookup: db `0123456789`
int_min: db `-2147483648\0`

section .text

extern _ft_putchar
extern _ft_putstr

_ft_putnbr_rec:
	mov rdx, rax
	cmp eax, 10
	jl _ft_putnbr_rec_char
	mov rdx, 0
	mov r11, 10
	div r11d
	push rdx
	call _ft_putnbr_rec
	pop rdx
_ft_putnbr_rec_char:
	lea rax, [rel lookup]
	add rax, rdx
	mov dil, [rax]
	call _ft_putchar
	ret

global _ft_putnbr
_ft_putnbr:
	enter 0, 0
	mov eax, edi
	cmp eax, 0
	jge _ft_putnbr_pos
	cmp eax, -2147483648
	jne _ft_putnbr_neg
	lea rdi, [rel int_min]
	call _ft_putstr
	jmp _ft_putnbr_end

_ft_putnbr_neg:
	mov r11, -1
	mul r11d
	mov rdi, '-'
	push rax
	call _ft_putchar
	pop rax
_ft_putnbr_pos:
	call _ft_putnbr_rec
_ft_putnbr_end:
	leave
	ret
