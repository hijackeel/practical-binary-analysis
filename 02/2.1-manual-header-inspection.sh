#!/usr/bin/env bash

ELF=$(which xxd)
file $ELF
echo ''

# Structs can be found in /usr/include/elf.h

echo Elf64_Ehdr / Executable header:
xxd -l 64 $ELF
echo ''

echo e_ident / Magic number and other info:
xxd -l 16 $ELF
echo ''

echo e_ident[0-3] / EI_MAG0-3 / Magic number:
xxd -l 4 $ELF
echo ''

echo e_ident[4] / EI_CLASS / File class:
xxd -s 4 -l 1 $ELF
echo "2 == ELFCLASS64 (64-bit objects)"
echo ''

echo e_ident[5] / EI_DATA / Data encoding:
xxd -s 5 -l 1 $ELF
echo "1 == ELFDATA2LSB (2's complement, little endian)"
echo ''

echo e_ident[6] / EI_VERSION / File version:
xxd -s 6 -l 1 $ELF
echo "1 == EV_CURRENT"
echo ''

echo e_ident[7] / EI_OSABI / OS ABI identification:
xxd -s 7 -l 1 $ELF
echo "0 == ELFOSABI_NONE (UNIX System V ABI)"
echo ''

echo e_ident[8] / EI_ABIVERSION / ABI version:
xxd -s 8 -l 1 $ELF
echo "Not necessary to specify if EI_OSABI == ELFOSABI_NONE."
echo ''

echo e_ident[9-15] / EI_PAD / Padding bytes:
xxd -s 9 -l 7 $ELF
echo ''

echo e_type / Object file type:
xxd -s 16 -l 2 $ELF
echo "3 == ET_DYN (shared object file)"
echo "Note that not only libraries are shared object files.
Position-Independent Executables will also show up as ET_DYN.
PIE is a way of achieving Address Space Layout Randomization
(a security technique) for executables."
echo ''

echo e_machine / Architecture:
xxd -s 18 -l 2 $ELF
echo "62 == 0x3e == EM_X86_64 (AMD x86-64 architecture)"
echo ''

echo e_version / Object file version:
xxd -s 20 -l 4 $ELF
echo "1 == EV_CURRENT"
echo ''

echo e_entry / Entry point virtual address:
xxd -s 24 -l 8 $ELF
echo ''

echo e_phoff / Program header table file offset:
xxd -s 32 -l 8 $ELF
echo ''

echo e_shoff / Section header table file offset:
xxd -s 40 -l 8 $ELF
echo ''

echo e_flags / Processor-specific flags:
xxd -s 48 -l 4 $ELF
echo ''

echo e_ehsize / ELF header size in bytes:
xxd -s 52 -l 2 $ELF
echo ''

echo e_phentsize / Program header table entry size:
xxd -s 54 -l 2 $ELF
echo ''

echo e_phnum / Program header table entry count:
xxd -s 56 -l 2 $ELF
echo ''

echo e_shentsize / Section header table entry size:
xxd -s 58 -l 2 $ELF
echo ''

echo e_shnum / Section header table entry count:
xxd -s 60 -l 2 $ELF
echo ''

echo e_shtrndx / Section header string table index:
xxd -s 62 -l 2 $ELF
echo ''
