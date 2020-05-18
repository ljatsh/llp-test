
Table of Contents
=================

* [x86 instructions](#x86-instructions)
  * [syscall](#syscall)
  * [MOV](#mov)
  * [POP](#pop)
  * [ADD](#add)
  * [SUB](#sub)
  * [AND](#and)
  * [OR](#or)
  * [SHIFT](#shift)
* [NASM](#nasm)
  * [DB and Friends](#db-and-friends)
* [Registers](#registers)
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

[MOV](https://www.felixcloutier.com/x86/mov)
--------------------------------------------

Copies the second operand (source operand) to the first operand (destination operand). The source operand can be an immediate value, general-purpose register, segment register, or memory location; the destination register can be a general-purpose register, segment register, or memory location. Both operands must be the same size, which can be a byte, a word, a doubleword, or a quadword.

[POP](https://www.felixcloutier.com/x86/pop)
--------------------------------------------

Loads the value from the top of the stack to the location specified with the destination operand (or explicit opcode) and then increments the stack pointer. The destination operand can be a general-purpose register, memory location, or segment register.

[ADD](https://www.felixcloutier.com/x86/add)
--------------------------------------------

Adds the destination operand (first operand) and the source operand (second operand) and then stores the result in the destination operand. The destination operand can be a register or a memory location; the source operand can be an immediate, a register, or a memory location. (However, two memory operands cannot be used in one instruction.) When an immediate value is used as an operand, it is sign-extended to the length of the destination operand format.

[SUB](https://www.felixcloutier.com/x86/sub)
--------------------------------------------

Subtracts the second operand (source operand) from the first operand (destination operand) and stores the result in the destination operand. The destination operand can be a register or a memory location; the source operand can be an immediate, register, or memory location. (However, two memory operands cannot be used in one instruction.) When an immediate value is used as an operand, it is sign-extended to the length of the destination operand format.

[AND](https://www.felixcloutier.com/x86/and)
--------------------------------------------

Performs a bitwise AND operation on the destination (first) and source (second) operands and stores the result in the destination operand location. The source operand can be an immediate, a register, or a memory location; the destination operand can be a register or a memory location. (However, two memory operands cannot be used in one instruction.) Each bit of the result is set to 1 if both corresponding bits of the first and second operands are 1; otherwise, it is set to 0.

[OR](https://www.felixcloutier.com/x86/or)
------------------------------------------

Performs a bitwise inclusive OR operation between the destination (first) and source (second) operands and stores the result in the destination operand location. The source operand can be an immediate, a register, or a memory location; the destination operand can be a register or a memory location. (However, two memory operands cannot be used in one instruction.) Each bit of the result of the OR instruction is set to 0 if both corresponding bits of the first and second operands are 0; otherwise, each bit is set to 1.

[XOR](https://www.felixcloutier.com/x86/xor)
--------------------------------------------

Performs a bitwise exclusive OR (XOR) operation on the destination (first) and source (second) operands and stores the result in the destination operand location. The source operand can be an immediate, a register, or a memory location; the destination operand can be a register or a memory location. (However, two memory operands cannot be used in one instruction.) Each bit of the result is 1 if the corresponding bits of the operands are different; each bit is 0 if the corresponding bits are the same.

[SHIFT](https://www.felixcloutier.com/x86/sal:sar:shl:shr)
----------------------------------------------------------

Shifts the bits in the first operand (destination operand) to the left or right by the number of bits specified in the second operand (count operand). Bits shifted beyond the destination operand boundary are first shifted into the CF flag, then discarded. At the end of the shift operation, the CF flag contains the last bit shifted out of the destination operand.

The shift arithmetic left (SAL) and shift logical left (SHL) instructions perform the same operation; they shift the bits in the destination operand to the left (toward more significant bit locations). For each shift count, the most significant bit of the destination operand is shifted into the CF flag, and the least significant bit is cleared. SHL and SAL is very useful for computing powers of 2 and multiplication by 2, since each time binary number is shifted left, its numeric value doubles.

The shift arithmetic right (SAR) and shift logical right (SHR) instructions shift the bits of the destination operand to the right (toward less significant bit locations). For each shift count, the least significant bit of the destination operand is shifted into the CF flag, and the most significant bit is either set or cleared depending on the instruction type. The SHR instruction clears the most significant bit; the SAR instruction sets or clears the most significant bit to correspond to the sign of the original value in the destination operand. In effect, the SAR instruction fills the empty bit position’s shifted value with the sign of the unshifted value. The SAR and SHR instructions can be used to perform signed or unsigned division, respectively, of the destination operand by powers of 2. For example, using the SAR instruction to shift a signed integer 1 bit to the right divides the value by 2.

NASM
----

DB and Friends
--------------

注意整数和浮点数存在有内存对齐，用16进制仔细观察hello.o的数据部分

Registers
---------

* [General Register](https://wiki.cdot.senecacollege.ca/wiki/X86_64_Register_and_Instruction_Quick_Start)
* [Status Flags](https://en.wikipedia.org/wiki/Status_register)
* [TODO](https://wiki.cdot.senecacollege.ca/wiki/Category:Assembly_Language)

register meaning:

* [rip](https://software.intel.com/en-us/articles/introduction-to-x64-assembly): The 64-bit instruction pointer RIP points to the next instruction to be executed

* 系统调用

Reference
---------

* [GNU Make](https://www.gnu.org/software/make/manual/html_node/index.html)
* [x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/)
* [Brief x86 instructions set reference](http://www.c-jump.com/CIS77/reference/ISA/index.html)
* [nasm](https://www.nasm.us)
* [nasm tutorial1](https://cs.lmu.edu/~ray/notes/nasmtutorial/)
* [nasm tutorial2](https://asmtutor.com)
* http://sevanspowell.net/posts/learning-nasm-on-macos.html

TODO
----

* posix pattern
