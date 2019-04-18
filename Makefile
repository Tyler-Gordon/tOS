OBJECTS = loader.o kmain.o stdio.o fb.o io.o
CC = gcc
CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -Wall -Wextra -c
LDFLAGS = -T link.ld -melf_i386
AS = nasm
ASFLAGS= -f elf
all:kernel.elf

kernel.elf:$(OBJECTS) 
	ld $(LDFLAGS) $(OBJECTS) -o kernel.elf
	cp kernel.elf iso/boot/kernel.elf 
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o os.iso iso
	cp os.iso ../../../Desktop
	sudo rm -rf *.o 
	sudo rm kernel.elf
	sudo rm -rf iso/boot/kernel.elf
	sudo rm -rf os.iso
%.o: %.c
	$(CC) $(CFLAGS)  $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@
