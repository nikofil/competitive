global    _start
section   .text
_start:
mov rax, 0
mov rdi, 0
mov rsi, buf
mov rdx, 99999999
syscall

outer:
mov rdi,rsi
inc rsi
mov rdx, 14

medium:
dec rdx
jz found
mov al, [rdi]
inc rdi
mov rcx, 0

inner:
mov bl, [rdi+rcx]
_cmp:
cmp al, bl
jz outer
inc rcx
cmp rcx, rdx
jl inner

jmp medium

found:
lea rax, [rsi+13]
sub rax, buf
mov rsi, out+99

tostr:
xor rdx, rdx
mov rbx, 10
div rbx
add dl, 48
mov [rsi], dl
dec rsi
cmp rax, 0
jnz tostr

inc rsi
mov rax, 1
mov rdi, 1
;mov rsi, buf
;mov rdx, cnt
mov rdx, out+100
sub rdx, rsi
syscall

mov rax, 60
syscall

section .bss
buf: resb 99999999
out: resb 100
