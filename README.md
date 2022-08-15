To create a bootable image, run the following commands:
1. `make`
2. `./create-fs.sh` (you might have to run `chmod +x create-fs.sh` first, to make it executable)

You should now have a file called `uefi.img` which contains the EFI program.
To run the program, mark `run.sh` as executable and execute it.

Prerequisites:
- 64-bit Linux
- `gcc`
- GNU-EFI
- `qemu-system-x86_64`
- OVMF UEFI image
- root access
