section .text

global _ft_bzero
_ft_bzero:
	enter 0, 0
	mov rcx, rsi
_ft_bzero_loop:
	jrcxz _ft_bzero_quit
	sub rcx, 1
	mov BYTE [rdi+rcx], 0
	jmp _ft_bzero_loop
_ft_bzero_quit:
	leave
	ret
