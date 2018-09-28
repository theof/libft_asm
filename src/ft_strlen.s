global _ft_strlen
_ft_strlen:
	enter 8,0
	cld
	push rdi
	mov rcx, 0xFFFFFFFFFFFFFFFF
	mov al, 0
	repne scasb
	mov rax, rdi
	pop rdi
	sub rax, rdi
	dec rax
	leave
	ret
