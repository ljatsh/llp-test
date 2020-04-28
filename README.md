
Table of Contents
=================

* [x86 instructions](#x86-instructions)
  * [syscall](#syscall)
* [NASM](#nasm)
  * [DB and Friends](#db-and-friends)
  * [Instructions1](#instructions1)
* [Registers](#registers)
* [Samples](#samples)
* [Reference](#reference)
* [TODO](#todo)

x86 instructions
----------------

syscall
-------

系统调用前的准备:

1. The rax register has to hold system call’s number;
2. The following registers should hold its arguments:rdi,rsi,rdx,r10,r8,andr9.
3. Execute syscall instruction.

注意点:

1. syscall instruction changes rcx and r11
2. The SYSCALL instruction does not save the stack pointer (RSP). If the OS system-call handler will change the stack pointer, it is the responsibility of software to save the previous value of the stack pointer.
3. Refer syscall.h to get system call's number
4. Mac的系统调用需要[增加偏移量0x02000000](https://opensource.apple.com/source/xnu/xnu-1699.26.8/osfmk/mach/i386/syscall_sw.h)

NASM
----

DB and Friends
--------------

注意整数和浮点数存在有内存对齐，用16进制仔细观察hello.o的数据部分

Instructions1
------------

[Brief x86 instructions set reference](http://www.c-jump.com/CIS77/reference/ISA/index.html)

* [SHL](http://www.c-jump.com/CIS77/ASM/Flags/F77_0140_shl_sal_instructions.htm) shl destination, count
* [SHR](http://www.c-jump.com/CIS77/ASM/Flags/F77_0150_shr_instruction.htm) shr destination, count
* [SAR](http://www.c-jump.com/CIS77/ASM/Flags/F77_0160_sar_instruction.htm)

Registers
---------

* [General Register](https://wiki.cdot.senecacollege.ca/wiki/X86_64_Register_and_Instruction_Quick_Start)
* [Status Flags](https://en.wikipedia.org/wiki/Status_register)
* [TODO](https://wiki.cdot.senecacollege.ca/wiki/Category:Assembly_Language)

register meaning:

* [rip](https://software.intel.com/en-us/articles/introduction-to-x64-assembly): The 64-bit instruction pointer RIP points to the next instruction to be executed

Samples
-------

01
--

* 系统调用

Reference
---------

* [GNU Make](https://www.gnu.org/software/make/manual/html_node/index.html)
* [x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/)
* [nasm](https://www.nasm.us)
* [nasm tutorial1](https://cs.lmu.edu/~ray/notes/nasmtutorial/)
* [nasm tutorial2](https://asmtutor.com)
* http://sevanspowell.net/posts/learning-nasm-on-macos.html

TODO
----

* System Call
* posix pettern
