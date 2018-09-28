section .text
global _ft_isascii

_ft_isascii:
	enter 0, 0
	cmp edi, 0
	jl _ft_isascii_false
	cmp edi, 127
	jg _ft_isascii_false
	mov eax, 1
	leave
	ret
_ft_isascii_false:
	mov eax, 0
	leave
	ret
