all:row_loop

row_loop.o: row_loop.asm
	nasm -f elf64 row_loop.asm
row_loop: row_loop.o
	ld -o row_loop row_loop.o
clean:
	rm -rf row_loop.o
	rm -rf row_loop
