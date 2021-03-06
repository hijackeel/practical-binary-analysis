# practical-binary-analysis
Personal solutions to the exercises from [*Practical Binary Analysis* by Dennis Andriesse](https://practicalbinaryanalysis.com) (not me).

Paraphrased assignments and notes on implementation are below.

#### 1.1 Write a C program containing several functions. Generate assembly, object, executable, and stripped executable files. Locate the functions you wrote in each.

A shell script generates the files, and displays information and content with file, readelf, and objdump. Output is piped through grep to colorize function names.

#### 1.2 In binaries, why are data and code separated into different sections? How does the loading process differ for code and data sections? Is it necessary to copy all sections into memory when a binary is loaded for execution?

#### 2.1 Use a hex viewer (such as xxd) to view the bytes of an ELF binary (such as ls) in hexadecimal format. Try to find all of the ELF header fields and see whether they make sense to you.

A shell script uses xxd to examine itself.
