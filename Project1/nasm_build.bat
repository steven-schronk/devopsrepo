cd Project1
nasm\nasm -f win32 -o hello.o hello.asm
nasm\ld -o hello.exe hello.o
dir