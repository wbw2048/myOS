all: os-image

os-image: boot/boot.bin kernel.bin
	cat $^ > os-image

boot/boot.bin: src/boot/boot.asm
	nasm $< -f bin -o $@

kernel.bin: src/kernel/kernel.c
	x86_64-elf-gcc -ffreestanding -m32 -c $< -o kernel.o
	x86_64-elf-ld -m elf_i386 -o $@ -T linker.ld kernel.o

clean:
	rm -f src/kernel/*.o src/boot/*.bin os-image
