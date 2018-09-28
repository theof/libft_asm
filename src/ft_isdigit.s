section .text
global _ft_isdigit

_ft_isdigit:
	enter 0, 0
	cmp edi, '0'
	jl _ft_isdigit_false
	cmp edi, '9'
	jg _ft_isdigit_false
	mov eax, 1
	leave
	ret
_ft_isdigit_false:
	mov eax, 0
	leave
	ret
