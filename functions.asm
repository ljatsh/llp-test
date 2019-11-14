
; get the length of a string
; input rax
; output rax
; changed rax
slen:
  push rbx
  mov rbx,              rax

.loop:
  cmp byte[rax],        0
  jz slen.finish
  inc rax
  jmp slen.loop

.finish:
  sub rax,              rbx
  pop rbx
  ret

; print a string in console
; input rax
; output
; changed rax
print:
  push rdi
  push rsi
  push rdx

  mov rsi,              rax
  call slen
  mov rdx,              rax
  mov rax,              0x02000004;       sys_write
  mov rdi,              1
  syscall

  pop rdx
  pop rsi
  pop rdi
  ret

; input rdi
; changed rdi
quit:
  push rax

  mov rax,              0x02000001;        sys_exit
  syscall

  pop rax
