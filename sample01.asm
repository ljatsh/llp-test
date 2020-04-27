
; Content
; 1) Hello, World!

global _main

section .text
_main:
  mov       rax, 0x02000004             ; id of write
  mov       rdi, 1                      ; stdout
  mov       rsi, m                      ; address of the content
  mov       rdx, 14                     ; length
  syscall                               ; invoke

  mov       rax, 0x02000001             ; id of exit 
  xor       rdi, rdi                    ; exit code 0 (TODO: vs move 0)
  syscall

section .data
m: db 'Hello, World!', 10               ; 10 -> \n
