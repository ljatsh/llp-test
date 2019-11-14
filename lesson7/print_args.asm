
; nasm -fmacho64 -I.. print_args.asm && ld -o print_args -lSystem print_args.o && ./print_args

%include "functions.asm"

global _main

; 直接从rsp解析，还没有找到官方说明
;(gdb) set args 1 2 3 4 5 6 7 8 9 10
;(gdb) x /20dg $rsp
;0x7ffeefbff658:	140735090225893	140735090225893
;0x7ffeefbff668:	0	11
;0x7ffeefbff678:	140732920756320	140732920756380
;0x7ffeefbff688:	140732920756382	140732920756384
;0x7ffeefbff698:	140732920756386	140732920756388
;0x7ffeefbff6a8:	140732920756390	140732920756392
;0x7ffeefbff6b8:	140732920756394	140732920756396
;0x7ffeefbff6c8:	140732920756398	0
;0x7ffeefbff6d8:	140732920756401	140732920756429
;0x7ffeefbff6e8:	140732920756449	140732920756465
;(gdb) x /s 140732920756320
;0x7ffeefbff860:	"/Users/longjun/Documents/GitHub/llp-test/lesson7/print_args"
;(gdb) x /s 140732920756380
;0x7ffeefbff89c:	"1"
;(gdb) x /s 140732920756382
;0x7ffeefbff89e:	"2"

; 从rdi, rsi解析 https://cs.lmu.edu/~ray/notes/nasmtutorial/
; (gdb) set args hello world
; (gdb) p $rdi
; $2 = 3
; (gdb) x /a $rsi
; 0x7ffeefbff6c0: 0x7ffeefbff868
; (gdb) p /s 0x7ffeefbff868
; 0x7ffeefbff868: "/Users/longjun/Documents/GitHub/llp-test/lesson7/print_args"
; (gdb) x /a $rsi + 8
; 0x7ffeefbff6c8: 0x7ffeefbff8a4
; (gdb) x /s 0x7ffeefbff8a4
; 0x7ffeefbff8a4: "hello"

section .text
_main:
  push  rdi
  push  rsi

_main.loop:
  cmp   rdi,        0
  jz    _quit
  mov   rax,        [rsi]
  add   rsi,        8
  call printLF
  dec   rdi
  jmp _main.loop

_quit:
  pop   rdi
  pop   rsi

  mov rax,          0
  call quit