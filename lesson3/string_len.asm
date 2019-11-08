
; nasm -fmacho64 string_len.asm && ld -o string_len -lSystem string_len.o && ./string_len

global _main

section .data
msg: db 'Hello, Awesome Assembler!', 0xA, 0

section .text
_main:
  mov rbx,     msg                ; it does not matter which register is selected
  mov rdx,     rbx

_next_char:
  cmp byte[rdx], 1
  jz  _finish
  inc rdx
  jmp _next_char

_finish:
  sub rdx,     rbx
  mov rax,     0x02000004          ; sys_write
  mov rdi,     1
  mov rsi,     msg
  syscall                          ;rdi, rsi, rdx, rcx, r8d, r9d; remaining arguments are on the stack

  mov rax,     0x02000001          ; sys_exit
  mov rdi,     1
  syscall
