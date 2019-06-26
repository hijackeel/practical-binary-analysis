#!/usr/bin/env bash
set -x

grep --color -E '\+\+ |hello_world|hello_sun|hello_moon|' <( {

# Generate assembly file in Intel syntax:
gcc -S -masm=intel 1.1-locating-functions.c
file 1.1-locating-functions.s
cat 1.1-locating-functions.s

# Generate relocatable object file:
gcc -c 1.1-locating-functions.c
file 1.1-locating-functions.o
readelf --relocs 1.1-locating-functions.o
objdump -M intel -d 1.1-locating-functions.o

# Generate binary executable:
gcc 1.1-locating-functions.c -o 1.1-locating-functions
file 1.1-locating-functions
readelf --syms 1.1-locating-functions
objdump -M intel -d 1.1-locating-functions

# Generate stripped version of executable:
strip --strip-all 1.1-locating-functions -o 1.1-locating-functions.stripped
file 1.1-locating-functions.stripped
readelf --syms 1.1-locating-functions.stripped
objdump -M intel -d 1.1-locating-functions.stripped

# Run the program for fun:
./1.1-locating-functions.stripped

# Clean up:
rm 1.1-locating-functions.s
rm 1.1-locating-functions.o
rm 1.1-locating-functions
rm 1.1-locating-functions.stripped

} 2>&1 )
