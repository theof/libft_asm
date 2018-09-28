global _ft_memset
_ft_memset:
	enter 8, 0

	mov rcx, rdx
	mov eax, esi

	cld
	push rdi
	rep stosb
	pop rdi
_ft_memset_end:
	leave
	ret
