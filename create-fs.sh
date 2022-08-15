#!/usr/bin/env sh

IMG_FILE_PATH="uefi.img"
EFI_FILE_PATH="hello.efi"

dd if=/dev/zero of=$IMG_FILE_PATH bs=512 count=93750

parted $IMG_FILE_PATH -s -a minimal mklabel gpt
parted $IMG_FILE_PATH -s -a minimal mkpart EFI FAT16 2048s 93716s
parted $IMG_FILE_PATH -s -a minimal toggle 1 boot

dd if=/dev/zero of=/tmp/part.img bs=512 count=91669
mformat -i /tmp/part.img -h 32 -t 32 -n 64 -c 1
mcopy -i /tmp/part.img $EFI_FILE_PATH ::

dd if=/tmp/part.img of=$IMG_FILE_PATH bs=512 count=91669 seek=2048 conv=notrunc
