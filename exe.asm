; nasm -f elf64 -l exe.lst exe.asm && gcc -m64 -o exe exe.o && ./exe
extern printf, atoi, getchar, scanf

    SECTION .data		; data section
readint: db "%d%*c",0
msg: db "Case #%d: %d",10,0
len: equ $-msg
count: dq 0
curcount: dq 1

    SECTION .text ; code section
        global main	; make label available to linker 
nextint:
    push rsi
    push rdi
    sub rsp, 8
    mov rsi, rsp
    mov rdi, readint
    xor al, al
    call scanf
    pop rax
    pop rdi
    pop rsi
    ret
main:
    ; read number of cases
    call nextint
    mov [count], rax
countloop:
    ; print case result
    mov rdx, 1
    mov rsi, [curcount]
    mov rdi, msg
    xor rax, rax
    call printf
    ; inc case count
    mov rcx, [curcount]
    inc rcx
    cmp rcx, [count]
    mov [curcount], rcx
    jle countloop
exit:
