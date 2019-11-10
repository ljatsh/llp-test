
; nasm -fmacho64 test.asm && ld -o test -lSystem test.o && ./test

global _main

section .data
codes: db '0123456789ABCDEF'
newline: db 0xA
prefix: db '0x'

section .text

print_newline:
  mov rax,       0x02000004             ; sys_write
  mov rdi,       1
  mov rsi,       newline
  mov rdx,       1
  syscall
  ret

print_prefix:
  mov rax,       0x02000004             ; sys_write
  mov rdi,       1
  mov rsi,       prefix
  mov rdx,       2
  syscall
  ret

; print rdi content is hex format
print_hex:
  mov rax,      rdi
  mov rdi,      1
  mov rcx,      64
iterate:
  push rax                                ; save the initial rax value
  sub rcx,      4
  sar rax,      cl
  and rax,      0xf
  ;lea rsi,      [codes + rax] TODO not work on mac x64
  mov rsi,      codes
  add rsi,      rax

  mov rax,      0x02000004                ; sys_write
  mov rdx,      1                         ; rdx also breaks
  push rcx                                ; system call will break rcx
  syscall
  pop rcx

  pop rax
  test rcx, rcx
  jnz iterate

  ret

_main:
  ; test lea - load effective address
  ;mov rsi,       codes                   ; address
  ;mov rsi,       [codes]                 ; copy consecutive 8 bytes

  ;lea rsi,       [codes]                 ; = mov rsi, codes
  ;mov rsi,       [codes + rax]           ; contents at (codes + rax)
  ;lea rsi,       [codes + rax]           ; codes + rax = mov rsi, codes; add rsi, rax

  call print_prefix
  mov rdi,       0x1122334455667788
  call print_hex
  call print_newline

  mov rax,       0x02000001              ; sys_exit
  mov rdi,       0
  syscall
