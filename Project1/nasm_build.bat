cd Project1
nasm\nasm -f win32 -o hello.o hello.asm
nasm\ld --verbose -o hello.exe hello.o
dir