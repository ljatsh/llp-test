
; nasm -fmacho64 string_len.asm && ld -o string_len -lSystem string_len.o && ./string_len

global _main

section .data
nl:   db 0xA
msg:  db 'Hello, Awesome Assembler!', 0x0

section .text

print_line:
  mov rax,          0x02000004            ; sys_write
  mov rdi,          1
  mov rsi,          nl
  mov rdx,          1
  syscall

  ret

get_len:
  push rax
  mov rax,          rdi                   ;save the origin address
_loop:
  cmp byte[rax],    0
  jz  _finish
  inc rax
  jmp _loop
_finish:
  sub rax,          rdi
  mov rdi,          rax
  pop rax
  ret

_main:
  mov rdi,          msg
  call get_len
  mov rdx,          rdi
  mov rax,          0x02000004            ;sys_write
  mov rdi,          1
  mov rsi,          msg
  syscall

  call print_line
  mov rax,          0x02000001            ;sys_exit
  mov rdi,          0
  syscall
