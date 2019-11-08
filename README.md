
Table of Contents
=================

* [NASM]
  * [DB and Friends](#db-and-friends)
* [System Call](#system-call)
* [Registers](#registers)
* [Reference](#reference)

NASM
----

DB and Friends
--------------

注意整数和浮点数存在有内存对齐，用16进制仔细观察hello.o的数据部分

System Call
-----------

Mac的系统调用号参考syscall.h, 注意Mac需要[增加偏移量0x02000000](https://opensource.apple.com/source/xnu/xnu-1699.26.8/osfmk/mach/i386/syscall_sw.h)

Registers
---------

[TODO](https://wiki.cdot.senecacollege.ca/wiki/X86_64_Register_and_Instruction_Quick_Start)
[TODO](https://wiki.cdot.senecacollege.ca/wiki/Category:Assembly_Language)

Reference
---------

* [nasm](https://www.nasm.us)
* [nasm tutorial1](https://cs.lmu.edu/~ray/notes/nasmtutorial/)
* [nasm tutorial2](https://asmtutor.com)
* http://sevanspowell.net/posts/learning-nasm-on-macos.html
