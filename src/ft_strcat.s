section .text

global _ft_strcat
_ft_strcat:
	enter 16, 0
	push rdi
	push rsi
	dec rdi
_ft_strcat_skip_dest:
	inc rdi
	cmp BYTE [rdi], 0
	jne _ft_strcat_skip_dest

_ft_strcat_copy:
	movsb
	cmp BYTE [rsi-1], 0
	jne _ft_strcat_copy

	pop rsi
	pop rdi
	leave
	mov rax, rdi
	ret
