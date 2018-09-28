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
