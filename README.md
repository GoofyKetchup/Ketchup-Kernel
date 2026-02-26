# Ketchup-Kernel
Open-Source 32-Bits DOS Kernel.

# All Directory and Files Explained.

## \
The root is where all the kernel is.

everything is from root directory.

## \Boot
The boot directory contain every files for a correct boot of system

## \Bootloader
The Bootloader directory contain the bootloader.

### \Boot\Bootloader\bootloader.asm
The bootloader is the first file to get run by the BIOS, despite his limited size of

512 bytes, he execute 3 main function.

- print_string : Print the message in si
- load_gdt : Load a GDT
- load_next_boot : Load the second boot file

### \Boot\protected.asm
protected.asm is the second boot file
It run the Protected mode and 32-Bits system
After it print a string to broadcast he is loading Protected Mode

### \Boot\Boot.c
Boot.c is the first c file to get run
It load a Interruption Descriptor Table.
Write a string to broadcast the Interruption Descriptor Table got loaded sucefuly.
Then he run the Kernel.

## \Drivers
Drivers directory contain drivers.

## \Kernel
Kernel directory contain all essential files for the Operating System

## \Kernel\Kernel.c
Kernel.c is currently the only kernel file,
It currently do nothing.

# Information
CPU-Architectury : x86

Mode : Protected Mode/32-Bits

Firmware : BIOS

Type : Disk Operating System


# Contributor
@GoofyKetchup

# Owner
@GoofyKetchup
