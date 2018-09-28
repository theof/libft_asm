section .text
extern _ft_islower

global _ft_toupper
_ft_toupper:
	enter 0, 0
	call _ft_islower
	cmp eax, 0
	mov eax, edi
	je _ft_toupper_ret
	sub eax, 32
_ft_toupper_ret:
	leave
	ret
