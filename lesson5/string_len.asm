
; nasm -fmacho64 -I.. string_len.asm && ld -o string_len -lSystem string_len.o && ./string_len

%include "functions.asm"

global _main

section .data
msg1: db "Hello, Awesome Assembler!", 0xA, 0x0
msg2: db "Oh, My God!", 0xA, 0x0

section .text

_main:
  mov rax,        msg1
  call print
  mov rax,        msg2
  call print

  mov rdi,        100
  call quit
