; eax ecx edx 
%define MACH_SYSCALL(x) 0x2000000 | x
%define WRITE 0x4

section .data
hello:
	.string db "Hello World!", 10
	.len equ $ - hello.string
plop db "return: %zu", 10

section .text

extern _printf

strcat:
	ret
isalpha:
	ret
isdigit:
	ret
isalnum:
	ret
isascii:
	ret
isprint:
	ret
toupper:
	ret
tolower:
	ret

;_main:
;	enter 0, 0
;
;	mov rax, MACH_SYSCALL(WRITE)
;	mov rdi, 1
;	lea rsi, [rel hello.string]
;	mov rdx, hello.len
;	syscall
;
;	call strlen
;
;	lea rdi, [rel plop]
;	mov rsi, rax
;	call _printf
;	mov eax, 0
;	leave
;	ret 
