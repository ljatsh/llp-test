
Table of Contents
=================

* [NASM]
  * [DB and Friends](#db-and-friends)
  * [Instructions](#instructions)
* [System Call](#system-call)
* [Registers](#registers)
* [Reference](#reference)

NASM
----

DB and Friends
--------------

注意整数和浮点数存在有内存对齐，用16进制仔细观察hello.o的数据部分

Instructions
------------

[Brief x86 instructions set reference](http://www.c-jump.com/CIS77/reference/ISA/index.html)

* [SHL](http://www.c-jump.com/CIS77/ASM/Flags/F77_0140_shl_sal_instructions.htm) shl destination, count
* [SHR](http://www.c-jump.com/CIS77/ASM/Flags/F77_0150_shr_instruction.htm) shr destination, count
* [SAR](http://www.c-jump.com/CIS77/ASM/Flags/F77_0160_sar_instruction.htm)

System Call
-----------

Mac的系统调用号参考syscall.h, 注意Mac需要[增加偏移量0x02000000](https://opensource.apple.com/source/xnu/xnu-1699.26.8/osfmk/mach/i386/syscall_sw.h)

Registers
---------

* [General Register](https://wiki.cdot.senecacollege.ca/wiki/X86_64_Register_and_Instruction_Quick_Start)
* [Status Flags](https://en.wikipedia.org/wiki/Status_register)
* [TODO](https://wiki.cdot.senecacollege.ca/wiki/Category:Assembly_Language)

register meaning:

* [rip](https://software.intel.com/en-us/articles/introduction-to-x64-assembly): The 64-bit instruction pointer RIP points to the next instruction to be executed

Reference
---------

* [nasm](https://www.nasm.us)
* [nasm tutorial1](https://cs.lmu.edu/~ray/notes/nasmtutorial/)
* [nasm tutorial2](https://asmtutor.com)
* http://sevanspowell.net/posts/learning-nasm-on-macos.html
