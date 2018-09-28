section .text

global _ft_bzero
_ft_bzero:
	enter 0, 0
	mov rcx, rsi
	jrcxz _ft_bzero_quit
	cld
_ft_bzero_loop:
	mov BYTE [rdi+rcx-1], 0
	loop _ft_bzero_loop
_ft_bzero_quit:
	leave
	ret
