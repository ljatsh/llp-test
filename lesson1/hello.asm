
; nasm -fmacho64 hello.asm && ld -o hello -lSystem hello.o && ./hello

global    _main

section   .text

_main:
  mov       rax, 0x02000004             ; system call for write
  mov       rdi, 1                      ; file handle 1 is stdout
  mov       rsi, message                ; address of string to output
  mov       rdx, 13                     ; number of bytes
  syscall                               ; invoke operating system to do the write
  mov       rax, 0x02000001             ; system call for exit
  xor       rdi, rdi                    ; exit code 0
  syscall                               ; invoke operating system to exit

section   .data
message:  db        'Hello, World', 10                  ; 10 \n
example1: db        'p1', 0x55                          ; a single byte
example2: db        'p2', 0x55, 0x56, 0x57              ; successive bytes
example3: db        'p3', 'hello', 13, 10, '$'          ; character consts and decimal consts
example4: dw        'p4', 0x1234                        ; 0x34 0x12
example5: dw        'p5', 'a'                           ; 0x61 0x00 (just a number)
example6: dw        'p6', 'ab'                          ; 0x61 0x62 (character constant)
example7: dw        'p7', 'abc'                         ; 0x61 0x62 0x63 0x00 (string constant)
example8: dd        'p8', 0x12345678                    ; 0x78 0x56 0x34 0x12
example9: dd        'p9', 1.234567e20                   ; float                     (there exists alignment issue !!!)
example10:dq        'p10', 0x123456789abcdef0           ; 8byte constant            (there exists alignment issue !!!)
example11:dq        'p11', 1.234567e20                  ; double-precision float    
example12:dt        'p12', 1.234567e20                  ; extented-precision float

