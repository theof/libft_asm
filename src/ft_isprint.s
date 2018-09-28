section .text
global _ft_isprint

_ft_isprint:
	enter 0, 0
	cmp edi, ' '
	jl _ft_isprint_false
	cmp edi, '~'
	jg _ft_isprint_false
	mov eax, 1
	leave
	ret
_ft_isprint_false:
	mov eax, 0
	leave
	ret
