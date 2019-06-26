# practical-binary-analysis
Personal solutions to the exercises from [*Practical Binary Analysis* by Dennis Andriesse](https://practicalbinaryanalysis.com) (not me).

Paraphrased assignments and notes on implementation are below.

#### 1.1 Write a C program containing several functions. Generate assembly, object, executable, and stripped executable files. Locate the functions you wrote in each.

A shell script generates the files, and displays information and content with file, readelf, and objdump. Output is piped through grep to colorize function names.
