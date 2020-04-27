; Content
; 1) TODO

global _main

section .text
_main:
  mov       rax, 0x02000004
  mov       rdi, 1
  mov       rsi, m
  mov       rdx, 6
  syscall

  mov       rax, 0x02000001
  xor       rdi, rdi
  syscall

section .data
m: db 'TODO!', 10                       ; 10 -> \n