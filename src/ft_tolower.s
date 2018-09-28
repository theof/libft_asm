section .text
extern _ft_isupper

global _ft_tolower
_ft_tolower:
	enter 0, 0
	call _ft_isupper
	cmp eax, 0
	mov eax, edi
	je _ft_tolower_ret
	add eax, 32
_ft_tolower_ret:
	leave
	ret
