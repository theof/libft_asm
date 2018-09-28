%define MACH_SYSCALL(x) 0x2000000 | x
%define WRITE 0x4

section .data

null:
	.str db "(null)", 10
	.len equ $ - null.str
nl:
	db 10

section .text

extern _ft_strlen

global _ft_puts
_ft_puts:
	cmp rdi, 0
	je _ft_puts_null

_ft_puts_str:
	enter 16, 0
	push rsi
	push rdi

	call _ft_strlen
	mov rdx, rax

	mov rsi, rdi
	mov rdi, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	
	lea rsi, [rel nl]
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall

	pop rsi
	pop rdi
	leave
	ret

_ft_puts_null:
	enter 16, 0
	push rdi
	push rsi

	mov rdi, 1
	lea rsi, [rel null.str]
	mov rdx, null.len
	mov rax, MACH_SYSCALL(WRITE)
	syscall

	pop rsi
	pop rdi
	leave
	ret
